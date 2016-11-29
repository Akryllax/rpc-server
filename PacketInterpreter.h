/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   PacketInterpreter.h
 * Author: alexander
 *
 * Created on November 21, 2016, 1:53 PM
 */

#ifndef PACKETINTERPRETER_H
#define PACKETINTERPRETER_H

#include "packet.h"

using namespace akr;

class PacketInterpreter
{
    public:
        PacketInterpreter();
        virtual ~PacketInterpreter() = delete;
        void load_packet(Packet * packet);
        void process_packet();
    private:
        Packet * packet;
};
#endif /* PACKETINTERPRETER_H */

