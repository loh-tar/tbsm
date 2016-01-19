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
	# Don't waste expensive disk space
	mkdir -p ${DESTDIR}/usr/share/licenses/${MyName}
	ln -srf -T ${DESTDIR}/usr/share/doc/${MyName}/99_License.txt ${DESTDIR}/usr/share/licenses/${MyName}/LICENSE
	[[ -a /usr/share/licenses/common/GPL2/license.txt ]] && ln -sf -T /usr/share/licenses/common/GPL2/license.txt ${DESTDIR}/usr/share/doc/${MyName}/99_License.txt

uninstall:
	rm -f  ${DESTDIR}/usr/bin/${MyName}
	rm -rf ${DESTDIR}/etc/xdg/${MyName}
	rm -rf ${DESTDIR}/usr/share/licenses/${MyName}
	rm -rf ${DESTDIR}/usr/share/doc/${MyName}

.PHONY: all none install uninstall
