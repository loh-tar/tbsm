DESTDIR=
MyName=tbsm

POT_FILE="locale/tbsm.pot"
LANGS=$(notdir $(wildcard locale/*.po))

all: none

none:
	@echo "Nothing to be done, just run 'make install'"

install:
	install -pDm755 -t ${DESTDIR}/usr/bin src/${MyName}
	install -pDm644 -t ${DESTDIR}/etc/xdg/${MyName} src/${MyName}.conf
	install -pDm644 -t ${DESTDIR}/etc/xdg/${MyName}/themes themes/*
	install -pDm644 -t ${DESTDIR}/usr/share/doc/${MyName} doc/*
	ln -srf -T ${DESTDIR}/usr/bin/${MyName} ${DESTDIR}/usr/share/doc/${MyName}/"70_SourceCode"
	@for lang in ${LANGS}; do \
		mkdir -p ${DESTDIR}/usr/share/locale/$${lang%\.po}/; \
		echo "msgfmt locale/$${lang} -o ${DESTDIR}/usr/share/locale/$${lang%\.po}/LC_MESSAGES/${MyName}.mo"; \
		msgfmt locale/$${lang} -o ${DESTDIR}/usr/share/locale/$${lang%\.po}/LC_MESSAGES/${MyName}.mo; \
	done

uninstall:
	rm -f  ${DESTDIR}/usr/bin/${MyName}
	rm -rf ${DESTDIR}/etc/xdg/${MyName}
	rm -rf ${DESTDIR}/usr/share/doc/${MyName}
	@for lang in ${LANGS}; do \
		echo rm -f "${DESTDIR}/usr/share/locale/$${lang%\.po}/LC_MESSAGES/${MyName}.mo"; \
		rm -f ${DESTDIR}/usr/share/locale/$${lang%\.po}/LC_MESSAGES/${MyName}.mo; \
	done

update-po:
	@./update-po

.PHONY: all none install uninstall update-po
