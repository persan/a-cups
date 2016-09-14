PREFIX?=${CURDIR}/_
all:compile

gen:
	rm -rf .gen/* src/gen
	mkdir -p .gen src/gen
	@echo "#include <cups/adminutil.h>" >>.gen/gen.c
	@echo "#include <cups/array.h>" >>.gen/gen.c
	@echo "#include <cups/backend.h>" >>.gen/gen.c
	@echo "#include <cups/cups.h>" >>.gen/gen.c
	@echo "#include <cups/dir.h>" >>.gen/gen.c
	@echo "#include <cups/file.h>" >>.gen/gen.c
	@echo "#include <cups/http.h>" >>.gen/gen.c
#	@echo "#include <cups/i18n.h>" >>.gen/gen.c
	@echo "#include <cups/ipp.h>" >>.gen/gen.c
	@echo "#include <cups/language.h>" >>.gen/gen.c
	@echo "#include <cups/ppd.h>" >>.gen/gen.c
	@echo "#include <cups/pwg.h>" >>.gen/gen.c
	@echo "#include <cups/raster.h>" >>.gen/gen.c
	@echo "#include <cups/sidechannel.h>" >>.gen/gen.c
	@echo "#include <cups/transcode.h>" >>.gen/gen.c
	@echo "#include <cups/versioning.h>" >>.gen/gen.c
	cd .gen; g++ -C -c -fdump-ada-spec gen.c -fada-spec-parent=CUPS
	rm .gen/gen.*
	sed/patch.sh
	cp .gen/cups-cups_*.ads src/gen
	cp .gen/cups-netdb_h.ads src/gen
	cp .gen/cups-netdb_h.ads src/gen
	cp .gen/cups-bits_socket_h.ads src/gen
	cp .gen/cups-netinet_in_h.ads src/gen
	cp .gen/cups-sys_un_h.ads src/gen
	cp .gen/cups-netdb_h.ads src/gen
	cp .gen/cups-bits_stat_h.ads src/gen
	cp .gen/cups-bits_sockaddr_h.ads src/gen
	cp .gen/cups-bits_types_h.ads src/gen
	cp .gen/cups-bits_netdb_h.ads src/gen
	cp .gen/cups-stdint_h.ads src/gen
	cp .gen/cups-unistd_h.ads src/gen
	cp .gen/cups-bits_socket_h.ads src/gen
	cp .gen/cups-time_h.ads src/gen
	cp .gen/cups-xlocale_h.ads src/gen
	cp .gen/cups-bits_uio_h.ads src/gen
	cp .gen/cups-sys_types_h.ads src/gen
	cp .gen/cups-stdio_h.ads src/gen
	cp .gen/cups-libio_h.ads src/gen
	cp .gen/cups-stdarg_h.ads src/gen
	cp .gen/cups-ug_config_h.ads src/gen
	cp .gen/cups-wchar_h.ads src/gen
	cp .gen/cups-bits_siginfo_h.ads src/gen
	cp .gen/cups-bits_pthreadtypes_h.ads src/gen
	${MAKE} compile
compile:
	gprbuild -j0 -p -P cups.gpr

test:
	gprbuild -k -j0 -p -P cups-tests.gpr

install:
	gprinstall -p -P cups.gpr --mode=dev --prefix=${PREFIX}
clean:
	git clean -fdx
