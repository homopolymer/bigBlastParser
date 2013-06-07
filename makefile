# a compiler with c++11 support is needed
# tested with gcc-4.8

CXX 		= g++
RM 			= rm -f
CXXFLAGS	= -std=c++11
CPPFLAGS	= -s -pthread -Wall
LDFLAGS		= -s
LDLIBS		= -lxerces-c -lsqlite3

SRCS		= bigBlastParser.cpp Blast.cpp BlastSAXHandler.cpp SQLite.cpp
OBJS		= $(subst .cpp,.o,$(SRCS))

all: bigBlastParser

blastParser: $(OBJS)
	g++ $(LDFLAGS) -o bigBlastParser $(OBJS) $(LDLIBS)

depend: .depend

.depend: $(SRCS)
	rm -f ./.depend
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -MM $^>>./.depend;

clean:
	$(RM) $(OBJS)

dist-clean: clean
	$(RM) *~ .depend bigBlastParser

include .depend