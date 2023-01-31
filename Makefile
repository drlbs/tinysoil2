
# Attempt to Build a single static soil library from the 
# SOIL2-master distribution for 64 bit Linux Distrox
# using the Gnu Compiler Suite

CC = gcc 
CPP = g++
OPT = -O2
CFLAGS = $(OPT) -m64
SYSLIBS = -lGL -lGLEW -lglfw

# Build SOIL targets and make object files for library

all: lib

SOIL.o : SOIL2.c
	$(CC) $(CFLAGS) -c SOIL2.c

image_DXT.o : image_DXT.c
	$(CC) $(CFLAGS) -c image_DXT.c

image_helper.o : image_helper.c
	$(CC) $(CFLAGS) -c image_helper.c

wfETC.o : wfETC.c
	$(CC) $(CFLAGS) -c wfETC.c

lib: SOIL.o image_DXT.o image_helper.o wfETC.o
	ar -rc libSOIL2.a SOIL2.o image_DXT.o image_helper.o wfETC.o
	ranlib libSOIL2.a
	mkdir SOIL2
	cp libSOIL2.a ./SOIL2/libsoil2.a
	cp SOIL2.h ./SOIL2/soil2.h

# Commands to clean up the directory

clean:
	rm *.o
	rm *.a
	rm -rf SOIL2
