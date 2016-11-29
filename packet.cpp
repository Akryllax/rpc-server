#include <algorithm>

#include "packet.h"

namespace akr
{
    Packet::Packet(int MODE)
    {
        clear_packet();
        this->MODE = MODE;
    };

    Packet::~Packet()
    {
        delete PAYLOAD;
        delete RAWDATA;
    };
    
    Packet * Packet::create_packet()
    {
        return new Packet(0);
    };

    Packet * Packet::load_packet(Packet * packet)
    {
        this->MODE = packet->get_flags();
        
        return this;
    };
    
    Packet * Packet::load_packet(vyter * raw_packet)
    {
        delete RAWDATA;
        RAWDATA = new vyter(raw_packet->begin(), raw_packet->end());
        this->decode();
        
        return this;
    };

    Packet * Packet::clear_packet()
    {
        DATA_SIZE = -1;
        MODE = 0;
        delete RAWDATA;
        RAWDATA = new vyter;
        delete PAYLOAD;
        PAYLOAD = new vyter;
        
        return this;
    };

    int Packet::get_flags ()
    {
        return this->MODE;
    };
    
    Packet * Packet::set_flags (int FLAGS)
    {
        this->MODE = FLAGS;
        return this;
    };

    int Packet::get_segmentation ()
    {
        return MODE & REQ_TYPE_MULTI;
    };
    
    Packet * Packet::set_segmentation (int MODE)
    {
        MODE |= MODE;
        return this;
    };
    
    int Packet::get_index ()
    {
        return ((MODE >> 3) & REQ_TYPE_MINDX);
    };
    
    Packet * Packet::set_index (int INDEX)
    {
        MODE &= ~(1 << 4);
        MODE &= ~(1 << 5);
        MODE &= ~(1 << 6);
        
        MODE |= (INDEX << 3);
        
        return this;
    };

    int Packet::get_response_directive ()
    {
        return MODE | 0b11000000;
    };
    
    Packet * Packet::set_response_directive ()
    {
        
    };
    
    int Packet::get_size()
    {
        if(DATA_SIZE >= 0)
            return DATA_SIZE;
        else {
            encode();
            return DATA_SIZE;
        }
    };
    
    Packet * Packet::set_size(int size)
    {
        DATA_SIZE = size;
        
        return this;
    };
    
    vyter  * Packet::get_payload()
    {
        if(PAYLOAD)
            return PAYLOAD;
        else
            return NULL;
    };
    
    Packet * Packet::set_payload(vyter * payload)
    {
        if(PAYLOAD)
            delete PAYLOAD;
        
        PAYLOAD = new vyter(payload->begin(),payload->end());
        this->DATA_SIZE = PAYLOAD->size();
        
        std::cout << "payload added (size:" << std::to_string(payload->size()) << ")" << std::endl;
        
        return this;
    };

    Packet * Packet::get_decoded()
    {
        decode();
        delete RAWDATA;
        return this;
    };
    
    vyter  * Packet::get_enconded()
    {
        encode();
        return RAWDATA;
    };
    
    Packet * Packet::set_rawdata(vyter * rawdata)
    {
        delete RAWDATA;
        RAWDATA = rawdata;
        
        return this;
    }
    
    void Packet::decode()
    {
        if(RAWDATA)
        {
            this->MODE = (int) RAWDATA->at(0);
            this->DATA_SIZE = (*RAWDATA)[1] << 8 | (*RAWDATA)[2];
            if(PAYLOAD)
                delete PAYLOAD;
            
            PAYLOAD = new vyter(RAWDATA->begin()+3, RAWDATA->end());
        }
    };
    
    void Packet::encode()
    {
        vyter *result = new vyter(3);
        (*result)[0] = MODE;
        if(PAYLOAD)
        {
            std::cout << "DATA SIZE: " << std::to_string(DATA_SIZE) << std::endl;
            int ll = DATA_SIZE;
            byte l2 = (ll >> 8) & 0b11111111;
            byte l1 = ll & 0b11111111;
            (*result)[1] = (byte) l2;
            (*result)[2] = (byte) l1;
            result->insert(result->begin()+3, PAYLOAD->begin(), PAYLOAD->end());
            //std::copy(PAYLOAD->begin(), PAYLOAD->end(), &(*result)[3]);
            std::cout << "*RESULT SIZE: " << std::to_string(result->size()) << std::endl;
        } else {
            result->assign(1,0);
            result->assign(2,0);
        }
        
        this->set_rawdata(result);
    }
    
    std::string Packet::to_string()
    {
        this->encode();
        std::stringstream ss;
        vyter::iterator it;
        
        std::cout << "RAWDATASIZE: " << std::to_string(RAWDATA->size()) << std::endl;
        for(it = RAWDATA->begin();it < RAWDATA->end()-1; it++)
        {
            ss << std::to_string(int (*it)) << ',';
        }
        ss << std::to_string(*(it++));
        
        return ss.str();
    }
    
    int Packet::length()
    {
        int res = 0;
        res += sizeof(int)*3;
        if(PAYLOAD)
        {
            res += sizeof(*PAYLOAD);
        }
        
        return res;
    }
};