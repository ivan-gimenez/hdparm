
# Makefile for hdparm
#
# heres a makefile for hdparm 3.5 that allows a non-root install (for
# network root machines and such).    Ytiddo <ytiddo@dicksonstreet.com>

all: hdparm

hdparm: hdparm.c /usr/include/linux/hdreg.h
	gcc -Wall -Wstrict-prototypes -O2 -s -o hdparm hdparm.c
 
install: all hdparm.8
	install -m 755 -o root -g root hdparm $(DESTDIR)/sbin
	install -m 644 -o root -g root hdparm.8 $(DESTDIR)/usr/share/man/man8

clean:
	rm -f hdparm *.o core
