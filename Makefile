CC = g++

PROG = FORCEBRUTE 
OBJS = forcebrute.o
TRGTS = $(OBJS) runner 


TESTDIR = tests

CFLAGS  = -g -O2  -I/usr/local/include/SDL2 -D_GNU_SOURCE=1 -D_REENTRANT -DHAVE_OPENGL 

INCLUDE =  -I ../proto/wallaroo -I /home/larry/devel/boost_1_55_0/boost -I . 
LIBS  =  -L/usr/lib/i386-linux-gnu -L/usr/local/lib -lSDL2 -lSDL2_image -lSDL_gfx -lSDL2_ttf -lfreetype -lboost_system -lboost_filesystem -L/usr/local/lib -lcpptest

$(PROG): $(TRGTS)

.c.o:
	$(CC) $(INCLUDE) $(CFLAGS) -c $*.c $(LIBS)


runner: forcebrute.o Timer.o
	$(CC) $(INCLUDE) -o $@ $? $(CFLAGS) $(LIBS)


all: $(TRGTS)


TESTS:
	cd ../proto/tests ; make TESTS 



clean:
	rm -f *.o *~
