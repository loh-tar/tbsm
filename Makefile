DESTDIR=
MyName=tbsm

all: none

none:
	@echo "Nothing to be done, just run 'make install'"

install:
	install -pDm755 -t ${DESTDIR}/usr/bin src/${MyName}
	install -pDm644 -t ${DESTDIR}/etc/xdg/${MyName} src/${MyName}.conf
	install -pDm644 -t ${DESTDIR}/etc/xdg/${MyName}/themes themes/*
	install -pDm644 -t ${DESTDIR}/usr/share/doc/${MyName} doc/*
	ln -srf -T ${DESTDIR}/usr/bin/${MyName} ${DESTDIR}/usr/share/doc/${MyName}/"70_SourceCode"

uninstall:
	rm -f  ${DESTDIR}/usr/bin/${MyName}
	rm -rf ${DESTDIR}/etc/xdg/${MyName}
	rm -rf ${DESTDIR}/usr/share/doc/${MyName}

.PHONY: all none install uninstall
