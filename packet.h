#ifndef PACKET_H
#define PACKET_H

#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include "typedefs.h"

namespace akr
{
    class Packet
    {
        public:

            static const int REQ_TYPE_GET      = 0b00000000;
            static const int REQ_TYPE_SET      = 0b00000001;
            static const int REQ_TYPE_DEL      = 0b00000010;
            static const int REQ_TYPE_CMD      = 0b00000011;

            //Set multipart bit
            static const int REQ_TYPE_SINGL    = 0b00000000;
            static const int REQ_TYPE_MULTI    = 0b00000100;

            //Unused
            static const int REQ_TYPE_MINDX    = 0b00111000;

            //No result
            static const int REQ_TYPE_NORES    = 0b00000000;
            //Expect confirmation
            static const int REQ_TYPE_EXCNF    = 0b01000000;
            //Requires confirmation
            static const int REQ_TYPE_RQCNF    = 0b10000000;

            Packet(int MODE);
            virtual ~Packet();
            
            Packet * create_packet();
            
            Packet * load_packet(Packet * packet);
            Packet * load_packet(vyter * raw_packet);
            
            Packet * clear_packet();
            
            int      get_flags ();
            Packet * set_flags (int FLAGS);
            
            int      get_segmentation ();
            Packet * set_segmentation (int MODE);
            
            int      get_index ();
            Packet * set_index (int INDEX);
            
            int      get_response_directive ();
            Packet * set_response_directive ();
            
            int      get_size();
            Packet * set_size(int size);
            
            vyter  * get_payload();
            Packet * set_payload(vyter * payload);
            
            Packet * get_decoded();
            vyter  * get_enconded();
            
            std::string to_string();
            int length();
        private:
            int MODE = 0;
            int DATA_SIZE = 0;
            vyter * PAYLOAD;
            vyter * RAWDATA;
            
            Packet(const Packet &originalPacket) = delete;
            
            vyter  * get_rawdata();
            Packet * set_rawdata(vyter * rawdata);
            
            void decode();
            void encode();
    };
};

#endif /* PACKET_H */

