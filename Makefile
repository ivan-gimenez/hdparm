
# Makefile for hdparm
#
# heres a makefile for hdparm 3.5 that allows a non-root install (for
# network root machines and such).    Ytiddo <ytiddo@dicksonstreet.com>

destdir =

all: hdparm

hdparm: hdparm.c /usr/include/linux/hdreg.h
	gcc -Wall -Wstrict-prototypes -O2 -s -o hdparm hdparm.c
 
install: all hdparm.8
	if [ -f $(destdir)/usr/sbin/hdparm ]; then rm -f $(destdir)/usr/sbin/hdparm ; fi 
	if [ -f $(destdir)/usr/local/bin/hdparm ]; then rm -f $(destdir)/usr/local/bin/hdparm ; fi 
	if [ -f $(destdir)/usr/local/sbin/hdparm ]; then rm -f $(destdir)/usr/local/sbin/hdparm ; fi 
	if [ -f $(destdir)/usr/man/man8/hdparm.8 ]; then rm -f $(destdir)/usr/man/man8/hdparm.8 ; fi
	if [ -f $(destdir)/usr/local/man/man8/hdparm.8 ]; then rm -f $(destdir)/usr/local/man/man8/hdparm.8 ; fi 
	install -m 755 -o root -g root hdparm $(destdir)/usr/local/sbin
	install -m 644 -o root -g root hdparm.8 $(destdir)/usr/local/man/man8

clean:
	rm -f hdparm *.o core
