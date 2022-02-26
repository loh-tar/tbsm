DESTDIR=
MyName=tbsm

# Thanks to https://stackoverflow.com/a/27132934
THIS_FILE := $(lastword $(MAKEFILE_LIST))

all: none

none:
	@echo "To update of a new version of ${MyName} run 'make update'"
	@echo "  => That will keep user created files in /etc untouched"
	@echo "To install, run 'make install'"
	@echo "To remove every thing, REALLY!?...well, run 'make uninstall' "

install:
	install -pDm755 -t ${DESTDIR}/usr/bin src/${MyName}
	install -pDm644 -t ${DESTDIR}/etc/xdg/${MyName}/themes themes/*
	install -pDm644 -t ${DESTDIR}/usr/share/doc/${MyName} doc/*
	ln -srf -T ${DESTDIR}/usr/bin/${MyName} ${DESTDIR}/usr/share/doc/${MyName}/"70_SourceCode"

update:
	rm -f  ${DESTDIR}/usr/bin/${MyName}
	rm -rf ${DESTDIR}/usr/share/doc/${MyName}
	@# Only remove what we had installed, don't touch user created files
	-rm -f ${DESTDIR}/etc/xdg/${MyName}/themes/{austere,gently,riddler}
	@# Remove careful none empty directories
	-rm -d ${DESTDIR}/etc/xdg/${MyName}/themes
	-rm -d ${DESTDIR}/etc/xdg/${MyName}
	@echo
	@echo "Hint: If there is some 'error' printed, don't care! Ignore it as done by make"
	@echo
	@$(MAKE) -f $(THIS_FILE) install

uninstall:
	rm -f  ${DESTDIR}/usr/bin/${MyName}
	rm -rf ${DESTDIR}/etc/xdg/${MyName}
	rm -rf ${DESTDIR}/usr/share/doc/${MyName}

.PHONY: all none install uninstall update
