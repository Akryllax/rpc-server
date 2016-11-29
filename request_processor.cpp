#include "request_processor.h"

using namespace akr;

RequestProcessor* RequestProcessor::instance;
boost::shared_ptr<boost::thread>* RequestProcessor::instanceThread;

RequestProcessor::RequestProcessor() {
    DBG_P("NEW COPY");
    requestQueue = new StackMap;
    resultQueue  = new StackMap;
    
    CONNECTION_STATUS = RequestProcessor::CONNECTION_NOTSTARTED;
}

RequestProcessor::RequestProcessor(const RequestProcessor& orig) {
}

RequestProcessor::~RequestProcessor() {
}

void RequestProcessor::initialize()
{
    CONNECTION_STATUS = RequestProcessor::CONNECTION_NOTSTARTED;
    akr::RequestProcessor *tempptr = this;
    
    _initialize_internal();
    
    RequestProcessor::instanceThread = new boost::shared_ptr<boost::thread> 
            (new boost::thread(instance_launcher, boost::ref(tempptr)));
};

void RequestProcessor::_initialize_internal()
{
    requestQueue = new StackMap;
    resultQueue  = new StackMap;
    
    running = true;
}

void RequestProcessor::tick()
{
    std::cout << "Called run" << std::endl;
    CONNECTION_STATUS = CONNECTION_IDLE;
    while(running)
    {
        try{
            CONNECTION_STATUS = CONNECTION_BUSY;
            run();  
            CONNECTION_STATUS = CONNECTION_IDLE;
        } catch (int e) {
            std::cout << "Error: thread crashed!" << std::endl;
        } 
        boost::this_thread::sleep_for(boost::chrono::milliseconds(1000/CPS));
    };
};

void RequestProcessor::run()
{
    StackRow *row = popFrQueue();
    if(row)
    {
        std::cout << "Found packet!!! NEW SIZE: " << std::to_string(requestQueue->size()) << std::endl;
    } else {
        std::cout << "Thread RequestProcessor awaiting input..." << std::endl;
    }
};

int RequestProcessor::addToQueue(Packet *packet)
{
    return addToQueue(packet,0);
};

int RequestProcessor::addToQueue(Packet *packet, int ticket)
{
    //boost::lock_guard<boost::mutex> guard(mtx_);
    mtx_.lock();
    if(ticket == 0)
    {
        ticket = requestQueue->end()->first + 1;   
    }
    
    StackRow row = StackRow(ticket, packet);
    
    requestQueue->insert(row);
    mtx_.unlock();
    return ticket;
}

StackRow * RequestProcessor::popFrQueue()
{
    //boost::lock_guard<boost::mutex> guard(mtx_);
    mtx_.lock();
    StackRow *row;
    std::cout << std::to_string((long) this) << "#QUEUE_SIZE: " << this->requestQueue->size() << std::endl;
    if(requestQueue->begin() != requestQueue->end()) 
    {
        row = new StackRow(*(requestQueue->begin()));
        requestQueue->erase(row->first);
    } else {
        row = NULL;
    }
    mtx_.unlock();
    return row;
}

int RequestProcessor::addToResultQueue(Packet *packet, int ticket)
{
    if (!(ticket > 0))
    {
        std::cout << "WOW! You messed up way badly!!!!!!" << std::endl;
        return -999;
    }
    boost::lock_guard<boost::mutex> guard(mtx_);
    
    resultQueue->insert(StackRow(ticket, packet));
    return ticket;
}

StackRow * RequestProcessor::getFrResultQueue(int ticket)
{
    boost::lock_guard<boost::mutex> guard(mtx_);
    StackRow *out;
    try
    {
        out = new StackRow(*resultQueue->find(ticket));
    } catch (int E) {
        out = NULL;
    }
    
    return out;
};

void RequestProcessor::operator ()(bool is_thread)
{
    /*std::cout << "Called operator ()" << std::endl;
    this->_initialize_internal();
    this->run();*/
};

RequestProcessor * RequestProcessor::get_instance()
{
    if(!RequestProcessor::instance)
    {
        RequestProcessor::instance = new RequestProcessor();
    }
    
    return RequestProcessor::instance;
};

boost::thread * RequestProcessor::get_instance_thread()
{
    if(RequestProcessor::instanceThread)
        return RequestProcessor::instanceThread->get();
    else 
        return NULL;
}

boost::thread RequestProcessor::instance_launcher(RequestProcessor *ref)
{
    ref->tick();
};
