pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with libCUPS.bits_types_h;

limited with libCUPS.bits_netdb_h;
with libCUPS.stdint_h;
with libCUPS.bits_sockaddr_h;
with libCUPS.unistd_h;
limited with libCUPS.bits_socket_h;

package libCUPS.netdb_h is

   --  unsupported macro: h_errno (*__h_errno_location ())
   HOST_NOT_FOUND : constant := 1;  --  netdb.h:65
   TRY_AGAIN : constant := 2;  --  netdb.h:66

   NO_RECOVERY : constant := 3;  --  netdb.h:68

   NO_DATA : constant := 4;  --  netdb.h:70

   NETDB_INTERNAL : constant := -1;  --  netdb.h:74
   NETDB_SUCCESS : constant := 0;  --  netdb.h:75
   --  unsupported macro: NO_ADDRESS NO_DATA

   IPPORT_RESERVED : constant := 1024;  --  netdb.h:81
   --  unsupported macro: h_addr h_addr_list[0]

   AI_PASSIVE : constant := 16#0001#;  --  netdb.h:598
   AI_CANONNAME : constant := 16#0002#;  --  netdb.h:599
   AI_NUMERICHOST : constant := 16#0004#;  --  netdb.h:600
   AI_V4MAPPED : constant := 16#0008#;  --  netdb.h:601
   AI_ALL : constant := 16#0010#;  --  netdb.h:602
   AI_ADDRCONFIG : constant := 16#0020#;  --  netdb.h:603

   AI_NUMERICSERV : constant := 16#0400#;  --  netdb.h:615

   EAI_BADFLAGS : constant := -1;  --  netdb.h:618
   EAI_NONAME : constant := -2;  --  netdb.h:619
   EAI_AGAIN : constant := -3;  --  netdb.h:620
   EAI_FAIL : constant := -4;  --  netdb.h:621
   EAI_FAMILY : constant := -6;  --  netdb.h:622
   EAI_SOCKTYPE : constant := -7;  --  netdb.h:623
   EAI_SERVICE : constant := -8;  --  netdb.h:624
   EAI_MEMORY : constant := -10;  --  netdb.h:625
   EAI_SYSTEM : constant := -11;  --  netdb.h:626
   EAI_OVERFLOW : constant := -12;  --  netdb.h:627

   NI_MAXHOST : constant := 1025;  --  netdb.h:640
   NI_MAXSERV : constant := 32;  --  netdb.h:641

   NI_NUMERICHOST : constant := 1;  --  netdb.h:644
   NI_NUMERICSERV : constant := 2;  --  netdb.h:645
   NI_NOFQDN : constant := 4;  --  netdb.h:646
   NI_NAMEREQD : constant := 8;  --  netdb.h:647
   NI_DGRAM : constant := 16;  --  netdb.h:648

   --  skipped func __h_errno_location

   procedure herror (arg1 : Interfaces.C.Strings.chars_ptr);  -- netdb.h:92
   pragma Import (C, herror, "herror");

   function hstrerror (arg1 : int) return Interfaces.C.Strings.chars_ptr;  -- netdb.h:95
   pragma Import (C, hstrerror, "hstrerror");

   type hostent is record
      h_name : Interfaces.C.Strings.chars_ptr;  -- netdb.h:102
      h_aliases : System.Address;  -- netdb.h:103
      h_addrtype : aliased int;  -- netdb.h:104
      h_length : aliased int;  -- netdb.h:105
      h_addr_list : System.Address;  -- netdb.h:106
   end record;
   pragma Convention (C_Pass_By_Copy, hostent);  -- netdb.h:100

   procedure sethostent (arg1 : int);  -- netdb.h:117
   pragma Import (C, sethostent, "sethostent");

   procedure endhostent;  -- netdb.h:123
   pragma Import (C, endhostent, "endhostent");

   function gethostent return access hostent;  -- netdb.h:130
   pragma Import (C, gethostent, "gethostent");

   function gethostbyaddr
     (arg1 : System.Address;
      arg2 : libCUPS.bits_types_h.uu_socklen_t;
      arg3 : int) return access hostent;  -- netdb.h:137
   pragma Import (C, gethostbyaddr, "gethostbyaddr");

   function gethostbyname (arg1 : Interfaces.C.Strings.chars_ptr) return access hostent;  -- netdb.h:144
   pragma Import (C, gethostbyname, "gethostbyname");

   function gethostbyname2 (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return access hostent;  -- netdb.h:155
   pragma Import (C, gethostbyname2, "gethostbyname2");

   function gethostent_r
     (arg1 : access hostent;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t;
      arg4 : System.Address;
      arg5 : access int) return int;  -- netdb.h:167
   pragma Import (C, gethostent_r, "gethostent_r");

   function gethostbyaddr_r
     (arg1 : System.Address;
      arg2 : libCUPS.bits_types_h.uu_socklen_t;
      arg3 : int;
      arg4 : access hostent;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : size_t;
      arg7 : System.Address;
      arg8 : access int) return int;  -- netdb.h:172
   pragma Import (C, gethostbyaddr_r, "gethostbyaddr_r");

   function gethostbyname_r
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : access hostent;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : size_t;
      arg5 : System.Address;
      arg6 : access int) return int;  -- netdb.h:179
   pragma Import (C, gethostbyname_r, "gethostbyname_r");

   function gethostbyname2_r
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : access hostent;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : size_t;
      arg6 : System.Address;
      arg7 : access int) return int;  -- netdb.h:185
   pragma Import (C, gethostbyname2_r, "gethostbyname2_r");

   procedure setnetent (arg1 : int);  -- netdb.h:198
   pragma Import (C, setnetent, "setnetent");

   procedure endnetent;  -- netdb.h:204
   pragma Import (C, endnetent, "endnetent");

   function getnetent return access libCUPS.bits_netdb_h.netent;  -- netdb.h:211
   pragma Import (C, getnetent, "getnetent");

   function getnetbyaddr (arg1 : libCUPS.stdint_h.uint32_t; arg2 : int) return access libCUPS.bits_netdb_h.netent;  -- netdb.h:218
   pragma Import (C, getnetbyaddr, "getnetbyaddr");

   function getnetbyname (arg1 : Interfaces.C.Strings.chars_ptr) return access libCUPS.bits_netdb_h.netent;  -- netdb.h:224
   pragma Import (C, getnetbyname, "getnetbyname");

   function getnetent_r
     (arg1 : access libCUPS.bits_netdb_h.netent;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t;
      arg4 : System.Address;
      arg5 : access int) return int;  -- netdb.h:237
   pragma Import (C, getnetent_r, "getnetent_r");

   function getnetbyaddr_r
     (arg1 : libCUPS.stdint_h.uint32_t;
      arg2 : int;
      arg3 : access libCUPS.bits_netdb_h.netent;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : size_t;
      arg6 : System.Address;
      arg7 : access int) return int;  -- netdb.h:242
   pragma Import (C, getnetbyaddr_r, "getnetbyaddr_r");

   function getnetbyname_r
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : access libCUPS.bits_netdb_h.netent;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : size_t;
      arg5 : System.Address;
      arg6 : access int) return int;  -- netdb.h:248
   pragma Import (C, getnetbyname_r, "getnetbyname_r");

   type servent is record
      s_name : Interfaces.C.Strings.chars_ptr;  -- netdb.h:259
      s_aliases : System.Address;  -- netdb.h:260
      s_port : aliased int;  -- netdb.h:261
      s_proto : Interfaces.C.Strings.chars_ptr;  -- netdb.h:262
   end record;
   pragma Convention (C_Pass_By_Copy, servent);  -- netdb.h:257

   procedure setservent (arg1 : int);  -- netdb.h:270
   pragma Import (C, setservent, "setservent");

   procedure endservent;  -- netdb.h:276
   pragma Import (C, endservent, "endservent");

   function getservent return access servent;  -- netdb.h:283
   pragma Import (C, getservent, "getservent");

   function getservbyname (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return access servent;  -- netdb.h:290
   pragma Import (C, getservbyname, "getservbyname");

   function getservbyport (arg1 : int; arg2 : Interfaces.C.Strings.chars_ptr) return access servent;  -- netdb.h:297
   pragma Import (C, getservbyport, "getservbyport");

   function getservent_r
     (arg1 : access servent;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t;
      arg4 : System.Address) return int;  -- netdb.h:308
   pragma Import (C, getservent_r, "getservent_r");

   function getservbyname_r
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access servent;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : size_t;
      arg6 : System.Address) return int;  -- netdb.h:312
   pragma Import (C, getservbyname_r, "getservbyname_r");

   function getservbyport_r
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access servent;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : size_t;
      arg6 : System.Address) return int;  -- netdb.h:318
   pragma Import (C, getservbyport_r, "getservbyport_r");

   type protoent is record
      p_name : Interfaces.C.Strings.chars_ptr;  -- netdb.h:328
      p_aliases : System.Address;  -- netdb.h:329
      p_proto : aliased int;  -- netdb.h:330
   end record;
   pragma Convention (C_Pass_By_Copy, protoent);  -- netdb.h:326

   procedure setprotoent (arg1 : int);  -- netdb.h:338
   pragma Import (C, setprotoent, "setprotoent");

   procedure endprotoent;  -- netdb.h:344
   pragma Import (C, endprotoent, "endprotoent");

   function getprotoent return access protoent;  -- netdb.h:351
   pragma Import (C, getprotoent, "getprotoent");

   function getprotobyname (arg1 : Interfaces.C.Strings.chars_ptr) return access protoent;  -- netdb.h:357
   pragma Import (C, getprotobyname, "getprotobyname");

   function getprotobynumber (arg1 : int) return access protoent;  -- netdb.h:363
   pragma Import (C, getprotobynumber, "getprotobynumber");

   function getprotoent_r
     (arg1 : access protoent;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t;
      arg4 : System.Address) return int;  -- netdb.h:374
   pragma Import (C, getprotoent_r, "getprotoent_r");

   function getprotobyname_r
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : access protoent;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : size_t;
      arg5 : System.Address) return int;  -- netdb.h:378
   pragma Import (C, getprotobyname_r, "getprotobyname_r");

   function getprotobynumber_r
     (arg1 : int;
      arg2 : access protoent;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : size_t;
      arg5 : System.Address) return int;  -- netdb.h:383
   pragma Import (C, getprotobynumber_r, "getprotobynumber_r");

   function setnetgrent (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- netdb.h:395
   pragma Import (C, setnetgrent, "setnetgrent");

   procedure endnetgrent;  -- netdb.h:403
   pragma Import (C, endnetgrent, "endnetgrent");

   function getnetgrent
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : System.Address) return int;  -- netdb.h:412
   pragma Import (C, getnetgrent, "getnetgrent");

   function innetgr
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr) return int;  -- netdb.h:423
   pragma Import (C, innetgr, "innetgr");

   function getnetgrent_r
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : size_t) return int;  -- netdb.h:432
   pragma Import (C, getnetgrent_r, "getnetgrent_r");

   function rcmd
     (arg1 : System.Address;
      arg2 : unsigned_short;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : access int) return int;  -- netdb.h:451
   pragma Import (C, rcmd, "rcmd");

   function rcmd_af
     (arg1 : System.Address;
      arg2 : unsigned_short;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : access int;
      arg7 : libCUPS.bits_sockaddr_h.sa_family_t) return int;  -- netdb.h:463
   pragma Import (C, rcmd_af, "rcmd_af");

   function rexec
     (arg1 : System.Address;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : access int) return int;  -- netdb.h:479
   pragma Import (C, rexec, "rexec");

   function rexec_af
     (arg1 : System.Address;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : access int;
      arg7 : libCUPS.bits_sockaddr_h.sa_family_t) return int;  -- netdb.h:491
   pragma Import (C, rexec_af, "rexec_af");

   function ruserok
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr) return int;  -- netdb.h:505
   pragma Import (C, ruserok, "ruserok");

   function ruserok_af
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : libCUPS.bits_sockaddr_h.sa_family_t) return int;  -- netdb.h:515
   pragma Import (C, ruserok_af, "ruserok_af");

   function iruserok
     (arg1 : libCUPS.stdint_h.uint32_t;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr) return int;  -- netdb.h:528
   pragma Import (C, iruserok, "iruserok");

   function iruserok_af
     (arg1 : System.Address;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : libCUPS.bits_sockaddr_h.sa_family_t) return int;  -- netdb.h:539
   pragma Import (C, iruserok_af, "iruserok_af");

   function rresvport (arg1 : access int) return int;  -- netdb.h:551
   pragma Import (C, rresvport, "rresvport");

   function rresvport_af (arg1 : access int; arg2 : libCUPS.bits_sockaddr_h.sa_family_t) return int;  -- netdb.h:560
   pragma Import (C, rresvport_af, "rresvport_af");

   type addrinfo is record
      ai_flags : aliased int;  -- netdb.h:569
      ai_family : aliased int;  -- netdb.h:570
      ai_socktype : aliased int;  -- netdb.h:571
      ai_protocol : aliased int;  -- netdb.h:572
      ai_addrlen : aliased libCUPS.unistd_h.socklen_t;  -- netdb.h:573
      ai_addr : access libCUPS.bits_socket_h.sockaddr;  -- netdb.h:574
      ai_canonname : Interfaces.C.Strings.chars_ptr;  -- netdb.h:575
      ai_next : access addrinfo;  -- netdb.h:576
   end record;
   pragma Convention (C_Pass_By_Copy, addrinfo);  -- netdb.h:567

   function getaddrinfo
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : System.Address;
      arg4 : System.Address) return int;  -- netdb.h:662
   pragma Import (C, getaddrinfo, "getaddrinfo");

   procedure freeaddrinfo (arg1 : access addrinfo);  -- netdb.h:668
   pragma Import (C, freeaddrinfo, "freeaddrinfo");

   function gai_strerror (arg1 : int) return Interfaces.C.Strings.chars_ptr;  -- netdb.h:671
   pragma Import (C, gai_strerror, "gai_strerror");

   function getnameinfo
     (arg1 : System.Address;
      arg2 : libCUPS.unistd_h.socklen_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : libCUPS.unistd_h.socklen_t;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : libCUPS.unistd_h.socklen_t;
      arg7 : int) return int;  -- netdb.h:677
   pragma Import (C, getnameinfo, "getnameinfo");

end libCUPS.netdb_h;
