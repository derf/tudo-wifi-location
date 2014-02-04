PREFIX ?= /usr/local
bin_dir = ${DESTDIR}${PREFIX}/bin
man_dir = ${DESTDIR}${PREFIX}/man/man1

PROGRAMS = bin/tudo-wifi-location

all: $(PROGRAMS)

bin/tudo-wifi-location: share/locations src/genscript.sh
	sh src/genscript.sh < share/locations > bin/tudo-wifi-location

clean:
	rm -f $(PROGRAMS)

install:
	install -m 755 $(PROGRAMS) $(bin_dir)

uninstall:
	rm -f $(bin_dir)/tudo-wifi-location

.PHONY: all clean install uninstall
