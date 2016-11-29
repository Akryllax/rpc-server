#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/NetworkEntity.o \
	${OBJECTDIR}/PacketInterpreter.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lapi.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lauxlib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lbaselib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lbitlib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lcode.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lcorolib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lctype.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/ldblib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/ldebug.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/ldo.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/ldump.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lfunc.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lgc.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/linit.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/liolib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/llex.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lmathlib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lmem.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/loadlib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lobject.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lopcodes.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/loslib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lparser.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lstate.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lstring.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lstrlib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/ltable.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/ltablib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/ltm.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lua.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/luac.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lundump.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lutf8lib.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lvm.o \
	${OBJECTDIR}/lib/lua-5.3.3/src/lzio.o \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/packet.o \
	${OBJECTDIR}/request_processor.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=-Wno-deprecated-declarations
CXXFLAGS=-Wno-deprecated-declarations

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-Llib/boost_1_62_0/stage/lib

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/rpc-arma3

${CND_DISTDIR}/rpc-arma3: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}
	${LINK.cc} -o ${CND_DISTDIR}/rpc-arma3 ${OBJECTFILES} ${LDLIBSOPTIONS} -lboost_thread -lboost_filesystem -lboost_system

${OBJECTDIR}/NetworkEntity.o: NetworkEntity.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Ilib/lua-5.3.3/src -Ilib/boost_1_62_0 -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/NetworkEntity.o NetworkEntity.cpp

${OBJECTDIR}/PacketInterpreter.o: PacketInterpreter.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Ilib/lua-5.3.3/src -Ilib/boost_1_62_0 -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/PacketInterpreter.o PacketInterpreter.cpp

${OBJECTDIR}/lib/lua-5.3.3/src/lapi.o: lib/lua-5.3.3/src/lapi.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lapi.o lib/lua-5.3.3/src/lapi.c

${OBJECTDIR}/lib/lua-5.3.3/src/lauxlib.o: lib/lua-5.3.3/src/lauxlib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lauxlib.o lib/lua-5.3.3/src/lauxlib.c

${OBJECTDIR}/lib/lua-5.3.3/src/lbaselib.o: lib/lua-5.3.3/src/lbaselib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lbaselib.o lib/lua-5.3.3/src/lbaselib.c

${OBJECTDIR}/lib/lua-5.3.3/src/lbitlib.o: lib/lua-5.3.3/src/lbitlib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lbitlib.o lib/lua-5.3.3/src/lbitlib.c

${OBJECTDIR}/lib/lua-5.3.3/src/lcode.o: lib/lua-5.3.3/src/lcode.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lcode.o lib/lua-5.3.3/src/lcode.c

${OBJECTDIR}/lib/lua-5.3.3/src/lcorolib.o: lib/lua-5.3.3/src/lcorolib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lcorolib.o lib/lua-5.3.3/src/lcorolib.c

${OBJECTDIR}/lib/lua-5.3.3/src/lctype.o: lib/lua-5.3.3/src/lctype.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lctype.o lib/lua-5.3.3/src/lctype.c

${OBJECTDIR}/lib/lua-5.3.3/src/ldblib.o: lib/lua-5.3.3/src/ldblib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/ldblib.o lib/lua-5.3.3/src/ldblib.c

${OBJECTDIR}/lib/lua-5.3.3/src/ldebug.o: lib/lua-5.3.3/src/ldebug.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/ldebug.o lib/lua-5.3.3/src/ldebug.c

${OBJECTDIR}/lib/lua-5.3.3/src/ldo.o: lib/lua-5.3.3/src/ldo.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/ldo.o lib/lua-5.3.3/src/ldo.c

${OBJECTDIR}/lib/lua-5.3.3/src/ldump.o: lib/lua-5.3.3/src/ldump.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/ldump.o lib/lua-5.3.3/src/ldump.c

${OBJECTDIR}/lib/lua-5.3.3/src/lfunc.o: lib/lua-5.3.3/src/lfunc.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lfunc.o lib/lua-5.3.3/src/lfunc.c

${OBJECTDIR}/lib/lua-5.3.3/src/lgc.o: lib/lua-5.3.3/src/lgc.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lgc.o lib/lua-5.3.3/src/lgc.c

${OBJECTDIR}/lib/lua-5.3.3/src/linit.o: lib/lua-5.3.3/src/linit.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/linit.o lib/lua-5.3.3/src/linit.c

${OBJECTDIR}/lib/lua-5.3.3/src/liolib.o: lib/lua-5.3.3/src/liolib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/liolib.o lib/lua-5.3.3/src/liolib.c

${OBJECTDIR}/lib/lua-5.3.3/src/llex.o: lib/lua-5.3.3/src/llex.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/llex.o lib/lua-5.3.3/src/llex.c

${OBJECTDIR}/lib/lua-5.3.3/src/lmathlib.o: lib/lua-5.3.3/src/lmathlib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lmathlib.o lib/lua-5.3.3/src/lmathlib.c

${OBJECTDIR}/lib/lua-5.3.3/src/lmem.o: lib/lua-5.3.3/src/lmem.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lmem.o lib/lua-5.3.3/src/lmem.c

${OBJECTDIR}/lib/lua-5.3.3/src/loadlib.o: lib/lua-5.3.3/src/loadlib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/loadlib.o lib/lua-5.3.3/src/loadlib.c

${OBJECTDIR}/lib/lua-5.3.3/src/lobject.o: lib/lua-5.3.3/src/lobject.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lobject.o lib/lua-5.3.3/src/lobject.c

${OBJECTDIR}/lib/lua-5.3.3/src/lopcodes.o: lib/lua-5.3.3/src/lopcodes.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lopcodes.o lib/lua-5.3.3/src/lopcodes.c

${OBJECTDIR}/lib/lua-5.3.3/src/loslib.o: lib/lua-5.3.3/src/loslib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/loslib.o lib/lua-5.3.3/src/loslib.c

${OBJECTDIR}/lib/lua-5.3.3/src/lparser.o: lib/lua-5.3.3/src/lparser.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lparser.o lib/lua-5.3.3/src/lparser.c

${OBJECTDIR}/lib/lua-5.3.3/src/lstate.o: lib/lua-5.3.3/src/lstate.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lstate.o lib/lua-5.3.3/src/lstate.c

${OBJECTDIR}/lib/lua-5.3.3/src/lstring.o: lib/lua-5.3.3/src/lstring.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lstring.o lib/lua-5.3.3/src/lstring.c

${OBJECTDIR}/lib/lua-5.3.3/src/lstrlib.o: lib/lua-5.3.3/src/lstrlib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lstrlib.o lib/lua-5.3.3/src/lstrlib.c

${OBJECTDIR}/lib/lua-5.3.3/src/ltable.o: lib/lua-5.3.3/src/ltable.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/ltable.o lib/lua-5.3.3/src/ltable.c

${OBJECTDIR}/lib/lua-5.3.3/src/ltablib.o: lib/lua-5.3.3/src/ltablib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/ltablib.o lib/lua-5.3.3/src/ltablib.c

${OBJECTDIR}/lib/lua-5.3.3/src/ltm.o: lib/lua-5.3.3/src/ltm.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/ltm.o lib/lua-5.3.3/src/ltm.c

${OBJECTDIR}/lib/lua-5.3.3/src/lua.o: lib/lua-5.3.3/src/lua.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lua.o lib/lua-5.3.3/src/lua.c

${OBJECTDIR}/lib/lua-5.3.3/src/luac.o: lib/lua-5.3.3/src/luac.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/luac.o lib/lua-5.3.3/src/luac.c

${OBJECTDIR}/lib/lua-5.3.3/src/lundump.o: lib/lua-5.3.3/src/lundump.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lundump.o lib/lua-5.3.3/src/lundump.c

${OBJECTDIR}/lib/lua-5.3.3/src/lutf8lib.o: lib/lua-5.3.3/src/lutf8lib.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lutf8lib.o lib/lua-5.3.3/src/lutf8lib.c

${OBJECTDIR}/lib/lua-5.3.3/src/lvm.o: lib/lua-5.3.3/src/lvm.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lvm.o lib/lua-5.3.3/src/lvm.c

${OBJECTDIR}/lib/lua-5.3.3/src/lzio.o: lib/lua-5.3.3/src/lzio.c 
	${MKDIR} -p ${OBJECTDIR}/lib/lua-5.3.3/src
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/lib/lua-5.3.3/src/lzio.o lib/lua-5.3.3/src/lzio.c

${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Ilib/lua-5.3.3/src -Ilib/boost_1_62_0 -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

${OBJECTDIR}/packet.o: packet.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Ilib/lua-5.3.3/src -Ilib/boost_1_62_0 -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/packet.o packet.cpp

${OBJECTDIR}/request_processor.o: request_processor.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -Ilib/lua-5.3.3/src -Ilib/boost_1_62_0 -std=c++11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/request_processor.o request_processor.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/rpc-arma3

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
