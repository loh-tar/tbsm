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
	@cp ${POT_FILE} /tmp/tbsm.pot
	@sed -i '/^$$/Q' /tmp/tbsm.pot
	@bash --dump-po-strings src/tbsm >> /tmp/tbsm.pot
	@msguniq --output-file=/tmp/tbsm.pot /tmp/tbsm.pot
	@if ! bash -c "diff -u -B -q <(grep -o '^[^#]*' /tmp/tbsm.pot) <(grep -o '^[^#]*' ${POT_FILE})" &> /dev/null; then \
		cp /tmp/tbsm.pot ${POT_FILE} && \
		echo "Updated ${POT_FILE}"; \
		for lang in ${LANGS}; do \
			msgmerge --quiet --update --backup=off locale/$${lang} ${POT_FILE} && \
			echo "Merged changes into locale/$${lang}"; \
		done; \
	else \
		echo "No string changes. Skipping update."; \
	fi
	@rm /tmp/tbsm.pot

.PHONY: all none install uninstall update-po
