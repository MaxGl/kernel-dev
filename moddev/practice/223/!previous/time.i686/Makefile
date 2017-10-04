CC = gcc
CURRENT = $(shell uname -r)
KDIR = /lib/modules/$(CURRENT)/build
PWD = $(shell pwd)

all: mod lib prog clean

TARGET1 = tick
TARGET2 = htick
TARGET3 = interv
obj-m      := $(TARGET1).o $(TARGET2).o $(TARGET3).o 

mod:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

PROGLIST = clock pdelay rtcr rtprd 
prog:	$(PROGLIST)

LIBTITLE = diag
LIBRARY = lib$(LIBTITLE).a

clock:  clock.c
	$(CC) $< -Bstatic -L./ -l$(LIBTITLE) -o $@

pdelay:  pdelay.c
	$(CC) $< -Bstatic -L./ -l$(LIBTITLE) -o $@

rtprd:	rtprd.c
	$(CC) $< -Bstatic -L./ -l$(LIBTITLE) -o $@

OBJLIST = calibr.o rdtsc.o proc_hz.o set_rt.o tick2us.o
lib:	$(OBJLIST)
	ar -t $(LIBRARY)

LIBHEAD = lib$(LIBTITLE).h
%.o: %.c $(LIBHEAD)
	$(CC) -c $< -o $@ 
	ar -r $(LIBRARY) $@        
	rm $@

clean:
	@rm -f *.o .*.cmd .*.flags *.mod.c *.order
	@rm -f .*.*.cmd *.symvers *~ *.*~ TODO.*
	@rm -fR .tmp*
	@rm -rf .tmp_versions

disclean: clean
	@rm -f *.ko $(PROGLIST) $(LIBRARY)
