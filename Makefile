# Makefile for hdparm

# DESTDIR is for non root installs (eg packages, NFS) only!
DESTDIR =

binprefix = /
manprefix = /usr
exec_prefix = $(binprefix)
sbindir = $(exec_prefix)/sbin
mandir = $(manprefix)/share/man
oldmandir = $(manprefix)/man

CC = gcc
CFLAGS = -O2 -Wall -Wstrict-prototypes -s
LDFLAGS =
INSTALL = install
INSTALL_DATA = $(INSTALL) -m 644
INSTALL_PROGRAM = $(INSTALL)

all: hdparm

hdparm: hdparm.o identify.o
	$(CC) $(LDFLAGS) -o hdparm hdparm.o identify.o
 
install: all hdparm.8
	if [ -f $(DESTDIR)$(sbindir)/hdparm ]; then rm -f $(DESTDIR)$(sbindir)/hdparm ; fi 
	if [ -f $(DESTDIR)$(mandir)/man8/hdparm.8 ]; then rm -f $(DESTDIR)$(mandir)/man8/hdparm.8 ;\
	elif [ -f $(DESTDIR)$(oldmandir)/man8/hdparm.8 ]; then rm -f $(DESTDIR)$(oldmandir)/man8/hdparm.8 ; fi
	$(INSTALL_PROGRAM) hdparm $(DESTDIR)$(sbindir)/hdparm
	if [ -d $(DESTDIR)$(mandir) ]; then $(INSTALL_DATA) hdparm.8 $(DESTDIR)$(mandir)/man8/hdparm.8 ;\
	elif [ -d $(DESTDIR)$(oldmandir) ]; then $(INSTALL_DATA) hdparm.8 $(DESTDIR)$(oldmandir)/man8/hdparm.8 ; fi

clean:
	rm -f hdparm *.o core

