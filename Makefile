
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
	cd .gen; gcc -C -c -fdump-ada-spec gen.c -fada-spec-parent=libCUPS
	rm .gen/gen.*
	sed/patch.sh
	cp .gen/libcups-cups_*.ads src/gen
	cp .gen/libcups-netdb_h.ads src/gen
	cp .gen/libcups-netdb_h.ads src/gen
	cp .gen/libcups-bits_socket_h.ads src/gen
	cp .gen/libcups-netinet_in_h.ads src/gen
	cp .gen/libcups-sys_un_h.ads src/gen
	cp .gen/libcups-netdb_h.ads src/gen
	cp .gen/libcups-bits_stat_h.ads src/gen
	cp .gen/libcups-bits_sockaddr_h.ads src/gen
	cp .gen/libcups-bits_types_h.ads src/gen
	cp .gen/libcups-bits_netdb_h.ads src/gen
	cp .gen/libcups-stdint_h.ads src/gen
	cp .gen/libcups-unistd_h.ads src/gen
	cp .gen/libcups-bits_socket_h.ads src/gen
	cp .gen/libcups-time_h.ads src/gen
	cp .gen/libcups-xlocale_h.ads src/gen
	cp .gen/libcups-bits_uio_h.ads src/gen
	cp .gen/libcups-sys_types_h.ads src/gen
	cp .gen/libcups-stdio_h.ads src/gen
	cp .gen/libcups-libio_h.ads src/gen
	cp .gen/libcups-stdarg_h.ads src/gen
	cp .gen/libcups-ug_config_h.ads src/gen
	cp .gen/libcups-wchar_h.ads src/gen
	gprbuild -j0 -p -P libcups.gpr
