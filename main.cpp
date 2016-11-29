#include <iostream>
#include <string>

#ifdef __cplusplus
#include "lua.hpp"
#include "request_processor.h"
#else
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
#endif
using namespace std;

/*
void print_error(lua_State *state)
{
    //The error msg should be on the top of the stack
    //Grab it and post it!!
    
    const char* message = lua_tostring(state, -1);
    std::cout << message << std::endl;
    lua_pop(state, 1);
};

int howdy(lua_State* state)
{
    int args = lua_gettop(state);
    
    printf("howdy() was called with %d arguments\n", args);
    
    for(int i = 0; i < args; i++) 
    {
        printf("argument %d: '%s'\n", i, lua_tostring(state, i));
    }
    
    lua_pushnumber(state,123);
    
    //Let lua know how many things we've returned
    return 1;
};

void execute(const char* filename)
{
    lua_State *state = luaL_newstate();
    
    luaL_openlibs(state);
    int result;
    
    //Add function howdy :D
    lua_register(state, "howdy", howdy);
    
    result = luaL_loadfile(state, filename);
    
    if (result != LUA_OK)
    {
        print_error(state);
        return;
    }
    
    result = lua_pcall(state, 0, LUA_MULTRET, 0);
    
    if (result != LUA_OK)
    {
        print_error(state);
        return;
    }
}

int protomain(int argc, char** argv)
{
  if ( argc <= 1 ) {
    puts("Usage: runlua file(s)");
    puts("Loads and executes Lua programs.");
    return 1;
  }

  // Execute all programs on the command line
  for ( int n=1; n<argc; ++n ) {
    execute(argv[n]);
  }

  return 0;
}
 */

akr::RequestProcessor *requestProcessor;

void delayed_test_function(akr::RequestProcessor *ref)
{
    while (true) 
    {
        boost::this_thread::sleep_for(boost::chrono::milliseconds(110));
        akr::Packet *packet = new akr::Packet(akr::Packet::REQ_TYPE_DEL | akr::Packet::REQ_TYPE_SINGL);
        std::cout << "-->TICKET: " << to_string(ref->addToQueue(packet)) << std::endl;
    }
};

void launcher(akr::RequestProcessor *wrapper)
{
    (*wrapper)(true);
}

int main(int argc, char ** argv)
{
    /*requestProcessor = new akr::RequestProcessor();
    
    //boost::thread reqThread = boost::thread(launcher, boost::ref(requestProcessor));
    //boost::thread delayData = boost::thread(delayed_test_function, boost::ref(requestProcessor));
    
    requestProcessor->initialize();    
    boost::this_thread::sleep_for(boost::chrono::milliseconds(150));

    boost::thread delayData = boost::thread(delayed_test_function, boost::ref(requestProcessor));
    
    requestProcessor->get_instance_thread()->join();
    std::cout << "He skipped the join..." << std::endl;*/
    
    akr::Packet *pak = new akr::Packet(akr::Packet::REQ_TYPE_CMD | akr::Packet::REQ_TYPE_MULTI | akr::Packet::REQ_TYPE_RQCNF);
    vyter *data = new vyter;
    
    data->push_back(1);
    data->push_back(1);
    data->push_back(4);
    data->push_back(1);
    data->push_back(7);
    data->push_back(4);
    
    std::cout << "sizeof(data): " << std::to_string(data->size()) << std::endl;
    
    pak->set_payload(data);
    pak->set_index(5);
    
    std::cout << "sizeof(pak):  " <<std::to_string(pak->length()) << std::endl;
    std::cout << "contents: '" << (pak)->to_string() << "'" << std::endl;
    
    delete pak;
    
    return 0;
}