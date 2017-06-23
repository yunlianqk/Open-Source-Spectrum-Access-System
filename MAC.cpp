#include "MAC.hpp"
#include <cstdio>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <string>
#include <array>

#define DEBUG 1
#if DEBUG == 1
#define dprintf(...) printf(__VA_ARGS__)
#else
#define dprintf(...) /*__VA_ARGS__*/
#endif

MAC::MAC()
{
  dprintf("Creating tun interface\n");
  // Create TUN interface
  dprintf("Creating tun interface\n");
  strcpy(tun_name, "mac_interface");

  sprintf(systemCMD, "sudo ip tuntap add dev %s mode tap", tun_name);
  system(systemCMD);
  dprintf("Bringing up tun interface\n");
  dprintf("Connecting to tun interface\n");
  sprintf(systemCMD, "sudo ip link set dev %s up", tun_name);
  system(systemCMD);

  // Get reference to TUN interface
  tunfd = tun_alloc(tun_name, IFF_TAP);

  struct mq_attr attr_tx;
  attr_tx.mq_maxmsg = 10;
  attr_tx.mq_msgsize = MAX_BUF;

  struct mq_attr attr_rx;
  attr_rx.mq_maxmsg = 10;
  attr_rx.mq_msgsize = MAX_BUF;

  phy_tx_queue = mq_open("/mac2phy", O_WRONLY | O_CREAT, PMODE, &attr_tx);
  phy_rx_queue = mq_open("/phy2mac", O_RDONLY | O_CREAT, PMODE, &attr_rx);

  if (phy_tx_queue == -1 || phy_rx_queue == -1)
  {
    perror("Failed to open message queue");
    exit(0);
  }

  // set any banned mac addresses
  set_banned_addresses();

  pthread_mutex_init(&tx_mutex, NULL); // transmitter mutex
  pthread_create(&tx_process, NULL, MAC_tx_worker, (void *)this);
  pthread_mutex_init(&rx_mutex, NULL); // receiver mutex
  pthread_create(&rx_process, NULL, MAC_rx_worker, (void *)this);
  //  pthread_exit(NULL);
}

MAC::~MAC()
{
  printf("Closing MAC\n");
  stop_rx = true;
  stop_tx = true;
  mq_close(phy_tx_queue);
  mq_close(phy_rx_queue);
  //mq_unlink("/mac2phy");
  //mq_unlink("/phy2mac");
  // close the TUN interface file descriptor
  dprintf("destructor closing the TUN interface file descriptor\n");
  close(tunfd);

  dprintf("destructor bringing down TUN interface\n");
  sprintf(systemCMD, "sudo ip link set dev %s down", tun_name);
  system(systemCMD);

  dprintf("destructor deleting TUN interface\n");
  sprintf(systemCMD, "sudo ip tuntap del dev %s mode tap", tun_name);
  system(systemCMD);
}

void MAC::set_ip(const char *ip)
{
  sprintf(systemCMD, "sudo ifconfig %s %s netmask 255.255.0.0", tun_name, ip);
  system(systemCMD);
  std::string mac_str = exec("ifconfig mac_interface | grep HWaddr | awk '{print $5}'");
  for (uint idx = 0; idx < 6; ++idx)
  {
    mac_address[idx] = hex_digit(mac_str[3 * idx]) << 4;
    mac_address[idx] |= hex_digit(mac_str[1 + 3 * idx]);
  }
  tx_channel_state = FREE;
  frames_received = 0;
  memset(broadcast_address, 255, 6);
}

/*
//  Transmission worker thread
//  TODO:: Get signals on when to transmit or not
//  TODO:: Check with the receiver first before Transmission
//  TODO:: Get
*/
void *MAC_tx_worker(void *_arg)
{
  MAC *mac = (MAC *)_arg;
  std::string message = "";
  char buffer[MAX_BUF];
  int buffer_len = MAX_BUF;
  char *frame = new char[MAX_BUF];
  int frame_num = 0;
  int nread = 0;
  while (!mac->stop_tx)
  {

    fd_set fds;
    struct timeval timeout;
    timeout.tv_sec = 0;
    timeout.tv_usec = 1000;

    FD_ZERO(&fds);
    FD_SET(mac->tunfd, &fds);
    if (nread == 0)
    {
      // check if anything is available on the TUN interface
      if (select(mac->tunfd + 1, &fds, NULL, NULL, &timeout) > 0)
      {
        //    printf("Reading Data from tun interface\n");
        // grab data from TUN interface
        nread += cread(mac->tunfd, (char *)(&frame[nread]), MAX_BUF);
        if (nread < 0)
        {
          dprintf("Error reading from TUN interface\n");
          close(mac->tunfd);
          exit(EXIT_FAILURE);
        }
        else
        {
          /*
          dprintf("%d bytes ready for transmission\n", nread);
          for (int i = 0; i < nread; i++)
          {
            //dprintf("%x ", frame[i]);
          }
          dprintf("\n");
          */
          uint16 ether_type = -1;
          memcpy(&ether_type, frame + 2, sizeof(ether_type));
          ether_type = htons(ether_type);
          switch (ether_type)
          {
          case ETH_P_ARP:
            dprintf("ARP Packet\n");
            mac->transmit_frame(frame, nread, UDP_PACKET, frame_num);
            break;
          case ETH_P_IP:
            if (!mac->isAddressBanned(mac->extractDestinationMAC(frame)))
            {
              dprintf("IP Packet\n");
              mac->transmit_frame(frame, nread, mac->getProtocol(frame), frame_num);
            }
            break;
          default:
            dprintf("Unknown Packet\n");
            break;
          }
          nread = 0;
        }
      }
    }
  }

  pthread_exit(NULL);
}

void MAC::transmit_frame(char *frame, int segment_len, char ip_protocol, int &frame_num)
{
  // Check for invalid payload with unknown protocol
  if (ip_protocol != UDP_PACKET && ip_protocol != TCP_PACKET)
  {
    dprintf("Unknown Protocol: %02x\n", ip_protocol);
    return;
  }
  if (tx_channel_state == FREE && segment_len > 0)
  {
    dprintf("\n----------------Transmitting-------------------\n");
    int tmp_len = MTU;
    bool last_segment = false;
    // check ip flags set
    if (isLastsegment(frame) || ip_protocol == UDP_PACKET)
    {
      last_segment = true;
    }
    else
    {
      last_segment = false;
    }

    int frame_len = segment_len + CONTROL_FRAME_LEN;

    create_frame(frame, segment_len, DATA, RTS);
    pthread_mutex_lock(&tx_mutex);

    unsigned int conv_frame_num = htonl(frame_num);
    memcpy(frame + FRAME_NUM_POS, &conv_frame_num, 4);

    // FIXME:: Need to look into what state the MAC should be in
    // if only one segment is received
    if (last_segment)
    {
      memset(frame + 1, 1, 1);
      dprintf("Last Frame: %d\n", frame[1]);
      if (new_transmission)
      {
        start_time = time(NULL);
        dprintf("New Transmission - No more frames\n");
        myState = BACKING_OFF;
        backOff();
        // mac->myState = mac->TRANSMITTING;
      }
      else
      {
        dprintf("Transmission Continuation - Last Frame\n");
        new_transmission = true;
        myState = IDLE;
      }
    }
    else
    {
      if (new_transmission)
      {
        start_time = time(NULL);
        dprintf("New Transmission - More frames to follow\n");
        myState = BACKING_OFF;
        backOff();
        myState = TRANSMITTING;
      }
      else
      {
        dprintf("Transmission Continuation - More frames to follow\n");
      }
      new_transmission = false;
    }
    addCRC(frame, frame_len);
    dprintf("Frame Len: %d\n", frame_len);
    int status = mq_send(phy_tx_queue, frame, frame_len, 5);
    if (status == -1)
    {
      perror("mq_send failure\n");
    }
    else
    {
      dprintf("mq_send successful with frame_num: %d\n", frame_num);
      frame_num++;
      frames_sent++;
      dprintf("Frames Sent: %d\n", frames_sent);
    }
    pthread_mutex_unlock(&tx_mutex);
    memset(frame, 0, MAX_BUF);
    return;
  }
  else
  {
    dprintf("TX Channel Busy: %d\n", tx_channel_state);
    dprintf("TX MAC State: %d\n", myState);
    return transmit_frame(frame, segment_len, ip_protocol, frame_num);
  }
  // usleep(1000);
}

/*
//  Combines the control_frame(header) with the payload
//  TODO:: Type of frames to be used
*/

void MAC::create_frame(char *&data, int data_len, ProtocolType newType,
                       ProtocolSubtype newSubType)
{
  char *temp_frame = new char[data_len + CONTROL_FRAME_LEN];
  FrameControl temp;
  temp.frame_protocol_type = newType;
  temp.frame_protocol_subtype = newSubType;
  char *temp_control_frame = getControlFrame(temp);
  memcpy(temp_frame, temp_control_frame, CONTROL_FRAME_LEN);
  memcpy(temp_frame + CONTROL_FRAME_LEN, data, data_len);
  if (newType == MANAGEMENT)
  {
  }
  else if (newType == CONTROL)
  {
  }
  else if (newType == DATA)
  {
  }
  memcpy(data, temp_frame, data_len + CONTROL_FRAME_LEN);
}
/*  Creates a control frame header for any payload to be transmitted
  **  TODO:: Need to improve on which type of information is needed in
  **         the control frame
  */

char *MAC::getControlFrame(FrameControl temp)
{
  char *control_frame = new char[CONTROL_FRAME_LEN];
  memset(control_frame, 0, sizeof(control_frame));
  char *offset = control_frame;
  int temp_frame_control = htons(((temp.frame_protocol_type << 12) | (temp.frame_protocol_subtype << 8)));
  char *temp_offset = (char *)&temp_frame_control;
  memcpy(offset, temp_offset, 2); // TODO:: test by removing temp_offset. temp_offset provides a frame_protocol_type
  return control_frame;
}

// extracts control_frame(mac header) from any given payload
// control_frame size will always remain constant as specified by CONTROL_FRAME_LEN
char *MAC::getMACHeader(char *frame)
{
  char *temp = new char[CONTROL_FRAME_LEN];
  memcpy(temp, frame, CONTROL_FRAME_LEN);
  return temp;
}

// Assumes that the MAC address of the source of the payload is 2 bytes
// from the start of the header
// TODO:: need to create a variable for the position of the mac header

char *MAC::extractSourceMAC(char *payload)
{
  char *temp = new char[6];
  memset(temp, 0, 6);
  memcpy(temp, payload + TAP_EXTRA_LOAD + 6, 6);
  return temp;
}

char *MAC::extractDestinationMAC(char *payload)
{
  char *temp = new char[6];
  memset(temp, 0, 6);
  memcpy(temp, payload + TAP_EXTRA_LOAD, 6);
  return temp;
}
//
//  Extracts payload at position right after the control frame length
//
char *MAC::getPayLoad(char *frame, int payload_len)
{
  return frame + CONTROL_FRAME_LEN;
}

// The worker for the receiver thread
void *MAC_rx_worker(void *_arg)
{
  int frames_received = 0;
  MAC *mac = (MAC *)_arg;
  char buf[MAX_BUF];
  while (!mac->stop_rx)
  {
    //mac->tx_channel_state = mac->FREE;
    struct timespec timeout;
    timeout.tv_sec = time(NULL) + 1;
    timeout.tv_nsec = 0;

    int status = mq_timedreceive(mac->phy_rx_queue, buf, MAX_BUF, 0, &timeout);

    if (status == -1)
    {
      if (errno == ETIMEDOUT)
      {
        if (mac->tx_channel_state != mac->UNAVAILABLE)
        {
          if (mac->myState == mac->IDLE)
          {
            mac->tx_channel_state = mac->FREE;
          }
          //printf("Channel Free\n");
        }
      }
      else
      {
        if (!mac->stop_rx)
        {
          perror("Failed to read queue");
          exit(0);
        }
      }
    }
    else
    {
      dprintf("\n----------------Receiving-------------------\n");
      if (mac->isCorrectCRC(buf, status))
      {
        // pthread_mutex_lock(&mac->rx_mutex);
        dprintf("Correct CRC Received \n");
        mac->analyzeReceivedFrame(buf, status);
        // pthread_mutex_unlock(&mac->rx_mutex);
      }
      else
      {
        dprintf("Wrong Packet due to wrong CRC\n");
        mac->tx_channel_state = mac->BUSY;
      }
      memset(buf, 0, MAX_BUF);
    }
  }
  pthread_exit(NULL);
}

// Analyze any received frame to make decisions on the state of the channel
void MAC::analyzeReceivedFrame(char *buf, int buf_len)
{
  dprintf("Message Received\n");
  recv_header = getMACHeader(buf);
  recv_payload = getPayLoad(buf, buf_len);
  int recv_payload_len = buf_len - CONTROL_FRAME_LEN;
  char *sourceMAC = extractSourceMAC(recv_payload);
  char *destinationMAC = extractDestinationMAC(recv_payload);
  double frame_error_rate = 0;

  if (strncmp(mac_address, sourceMAC, 6) != 0)
  {
    dprintf("Source MAC Address: ");
    for (int i = 0; i < 6; i++)
    {
      dprintf("%02x:", (unsigned char)sourceMAC[i]);
    }
    dprintf("\n");

    dprintf("Destination MAC Address: ");
    for (int i = 0; i < 6; i++)
    {
      dprintf("%02x:", (unsigned char)destinationMAC[i]);
    }
    dprintf("\n");

    if (!isLastAlienFrame(recv_header))
    {
      tx_channel_state = BUSY;
      dprintf("Channel Busy %u\n", strncmp(mac_address, sourceMAC, 6));
    }
    else
    {
      tx_channel_state = FREE;
      dprintf("Channel free %u\n", strncmp(mac_address, sourceMAC, 6));
    }

    if (memcmp(destinationMAC, mac_address, 6) == 0)
    {
      dprintf("Received Payload Sent to Me\n");
      sendToIPLayer(recv_payload, recv_payload_len);
    }

    if (memcmp(destinationMAC, broadcast_address, 6) == 0)
    {
      dprintf("This is a broadcast message\n");
      sendToIPLayer(recv_payload, recv_payload_len);
    }
  }
  else
  {
    dprintf("---------Current TX statistics-----------------\n");
    if (myState == TRANSMITTING)
    {
      tx_channel_state = FREE;
    }
    int frame_num = buffToInteger(recv_header + 8);
    frames_received++;
    frame_error_rate = (frame_num + 1 - (float)frames_received) / ((float)frame_num + 1);
    int time_dif = (time(NULL) - start_time);
    int bitrate = 0;
    if (time_dif > 0)
    {
      bitrate = (buf_len * 8) * frames_received / time_dif;
    }

    dprintf("Frame_num received: %d\n", frame_num);
    dprintf("Frames received: %d\n", frames_received);
    // std::cout << std::fixed;
    // std::cout << "Frame Error Rate: " << std::setprecision(5) << frame_error_rate << '\n';
    dprintf("Bitrate: %d\n", bitrate);
    //  printf("%s\n", recv_payload);
    dprintf("------------------------------------\n");
  }
}

void MAC::sendToIPLayer(char *payload, int payload_len)
{
  int nwrite = 0;
  for (unsigned int i = 0; i < payload_len; i++)
  {
    nwrite = cwrite(tunfd, (char *)&payload[i], payload_len);
  }
  if (nwrite < 0)
  {
    perror("Error writing to TAP interface\n");
  }
}

/*
  // check if the tcp segment is the last segment
  */

bool MAC::isLastsegment(char *segment)
{
  unsigned char flag;
  memcpy(&flag, segment + ETH_HEADER_LEN + IP_HEADER_LEN + IP_FLAG_POS, 1);
  return (isBitSet(flag, 0) | isBitSet(flag, 1) | isBitSet(flag, 2) | isBitSet(flag, 3));
}

bool MAC::isLastAlienFrame(char *frame)
{
  if (frame[1] == 1)
  {
    return true;
  }
  else
  {
    return false;
  }
}

void MAC::backOff()
{
  for (int i = 0; i < cw; i++)
  {
    if (tx_channel_state == BUSY)
    {
      if (i > 0)
      {
        i--;
        //   printf("BACK OFF PAUSED \n");
      }
    }
    else
    {
      // printf("BACK OFF RESUMED \n");
      usleep(SLOT_TIME);
    }
  }
  myState = IDLE;
}

// HACK:: Little Endian and Big Endian issues with CRC
void MAC::addCRC(char *frame, int &frame_len)
{
  unsigned long crc = 0; //crc32(0L,Z_NULL,0);
  crc = crc32(crc, (const unsigned char *)frame, frame_len);
  memcpy(frame + frame_len, &crc, 4);
  //  dprintf("CRC sent: %lu\n", crc);
  frame_len = frame_len + 4;
}

bool MAC::isCorrectCRC(char *buf, int buf_len)
{
  unsigned long crc = 0; //crc32(0L,Z_NULL,0);
  crc = crc32(crc, (const unsigned char *)buf, buf_len - 4);
  // printf("CRC Received: %lu\n",crc);
  unsigned long received_crc = htonl((unsigned long)buffToInteger(buf + buf_len - 4));
  //printf("CRC Received 2: %lu\n",received_crc);
  if (crc == received_crc)
  {
    return true;
  }
  else
  {
    return false;
  }
}

void MAC::set_banned_addresses()
{
  std::string mac_str = "01:00:5e:00:00:fb";
  for (uint idx = 0; idx < 6; ++idx)
  {
    mdns[idx] = hex_digit(mac_str[3 * idx]) << 4;
    mdns[idx] |= hex_digit(mac_str[1 + 3 * idx]);
  }
}

bool MAC::isAddressBanned(const char *add_check)
{
  if (memcmp(mdns, add_check, 3) == 0)
  {
    return true;
  }
  else
  {
    return false;
  }
}

char MAC::getProtocol(char *frame)
{
  return *(frame + ETH_HEADER_LEN + 9);
}
//
// Generate random_bytes for the MAC. Probability of using the same value = (1/256)^6
//
char *random_byte_generator()
{
  char *random_bytes = new char[6];
  time_t currentTime = time(NULL);
  srand((unsigned)currentTime);
  for (int i = 0; i < 6; i++)
  {
    *(random_bytes + i) = rand() % 256;
  }
  return random_bytes;
}

//
//  converts the received interger values in the frame
//
int buffToInteger(char *buffer)
{
  // from https://stackoverflow.com/questions/34943835/convert-four-bytes-to-integer-using-c
  int a = static_cast<int>(static_cast<unsigned char>(buffer[0]) << 24 |
                           static_cast<unsigned char>(buffer[1]) << 16 |
                           static_cast<unsigned char>(buffer[2]) << 8 |
                           static_cast<unsigned char>(buffer[3]));
  return a;
}
//
bool isBitSet(unsigned char c, int n)
{
  return (1 & (c >> n));
}

std::string exec(const char *cmd)
{
  std::array<char, 128> buffer;
  std::string result;
  std::shared_ptr<FILE> pipe(popen(cmd, "r"), pclose);
  if (!pipe)
    throw std::runtime_error("popen() failed!");
  while (!feof(pipe.get()))
  {
    if (fgets(buffer.data(), 128, pipe.get()) != NULL)
      result += buffer.data();
  }
  return result;
}

unsigned char hex_digit(char ch)
{
  if (('0' <= ch) && (ch <= '9'))
  {
    ch -= '0';
  }
  else
  {
    if (('a' <= ch) && (ch <= 'f'))
    {
      ch += 10 - 'a';
    }
    else
    {
      if (('A' <= ch) && (ch <= 'F'))
      {
        ch += 10 - 'A';
      }
      else
      {
        ch = 16;
      }
    }
  }
  return ch;
}
