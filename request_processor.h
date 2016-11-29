/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   RequestProcessor.h
 * Author: alexander
 *
 * Created on November 14, 2016, 12:27 PM
 */
#define __DEBUG
#ifdef __DEBUG
#define DBG_P(arg) std::cout << arg << std::endl;
#else
#define DBP_P(arg) 
#endif
#ifndef REQUESTPROCESSOR_H

#include <queue>
#include <map>
#include <string>
#include <iterator>
#include "boost/thread.hpp"
#include "boost/thread/mutex.hpp"
#include "typedefs.h"
#include "packet.h"

#define REQUESTPROCESS_H

namespace akr
{
    typedef std::pair<int,Packet*> StackRow;
    typedef std::map<int,Packet*> StackMap;
    
    class RequestProcessor
    {                
    public:
        static const int CONNECTION_NOTSTARTED = 0;
        static const int CONNECTION_CONNECTED  = 0b00000001;
        static const int CONNECTION_IDLE       = 0b00000000;
        static const int CONNECTION_BUSY       = 0b00000010;
        
        static const int CONNECTION_NOTFOUND   = 0b00010000;
        static const int CONNECTION_ERROR      = 0b00100000;
        static const int CONNECTION_FATALERROR = 0b01110000;
        
        int CONNECTION_STATUS;
        
        //Constructors and deconstructors
        RequestProcessor();
        RequestProcessor(const RequestProcessor& orig);
        virtual ~RequestProcessor();

        //Inicialization and config loader
        void initialize();
        
        //REQUEST queue managment
        int addToQueue(Packet * packet);
        int addToQueue(Packet * packet, int ticket);
        StackRow * popFrQueue();
        StackRow * getFrQueue(int ticket); /* <-- Should not be used, breaks thread
                                        * logic if so, and that's a "nono" :D */
        //RESULTS queue managment
        int addToResultQueue(Packet * packet, int ticket);
        StackRow * popFrResultQueue();     /* I can't find a reason why you'd use
                                        * this. Have you read the documentation?
                                        * Cos seems like you didn't.
                                        * Good luck with that! :D :D :D :D :D */
        StackRow * getFrResultQueue(int ticket);
        void run();
        void operator ()(bool is_thread);
        int CPS = 15;
                
        StackMap *requestQueue;
        StackMap *resultQueue;
        
        static RequestProcessor * get_instance();
        static boost::thread * get_instance_thread();
        
        static RequestProcessor *instance;
        static boost::shared_ptr<boost::thread> *instanceThread;
    private:
        bool running;
        boost::mutex mtx_;
        static boost::thread instance_launcher(RequestProcessor *ref);
        
        void tick();
        void _initialize_internal();
    };
};
#endif /* REQUESTPROCESSOR_H */