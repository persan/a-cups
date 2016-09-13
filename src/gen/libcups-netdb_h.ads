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

  -- Copyright (C) 1996-2016 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <http://www.gnu.org/licenses/>.   

  -- All data returned by the network data base library are supplied in
  --   host order and returned in network order (suitable for use in
  --   system calls).   

  -- This is necessary to make this include file properly replace the
  --   Sun version.   

  -- Absolute file name for network data base files.   
  -- Error status for non-reentrant lookup functions.
  --   We use a macro to access always the thread-specific `h_errno' variable.   

  -- Function to get address of global `h_errno' variable.   
   --  skipped func __h_errno_location

  -- Possible values left in `h_errno'.   
  -- Highest reserved Internet port number.   
  -- Scope delimiter for getaddrinfo(), getnameinfo().   
  -- Print error indicated by `h_errno' variable on standard error.  STR
  --   if non-null is printed before the error string.   

   procedure herror (arg1 : Interfaces.C.Strings.chars_ptr);  -- netdb.h:92
   pragma Import (C, herror, "herror");

  -- Return string associated with error ERR_NUM.   
   function hstrerror (arg1 : int) return Interfaces.C.Strings.chars_ptr;  -- netdb.h:95
   pragma Import (C, hstrerror, "hstrerror");

  -- Description of data base entry for a single host.   
  -- Official name of host.   
   type hostent is record
      h_name : Interfaces.C.Strings.chars_ptr;  -- netdb.h:102
      h_aliases : System.Address;  -- netdb.h:103
      h_addrtype : aliased int;  -- netdb.h:104
      h_length : aliased int;  -- netdb.h:105
      h_addr_list : System.Address;  -- netdb.h:106
   end record;
   pragma Convention (C_Pass_By_Copy, hostent);  -- netdb.h:100

  -- Alias list.   
  -- Host address type.   
  -- Length of address.   
  -- List of addresses from name server.   
  -- Open host data base files and mark them as staying open even after
  --   a later search if STAY_OPEN is non-zero.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure sethostent (arg1 : int);  -- netdb.h:117
   pragma Import (C, sethostent, "sethostent");

  -- Close host data base files and clear `stay open' flag.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure endhostent;  -- netdb.h:123
   pragma Import (C, endhostent, "endhostent");

  -- Get next entry from host data base file.  Open data base if
  --   necessary.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function gethostent return access hostent;  -- netdb.h:130
   pragma Import (C, gethostent, "gethostent");

  -- Return entry from host data base which address match ADDR with
  --   length LEN and type TYPE.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function gethostbyaddr
     (arg1 : System.Address;
      arg2 : libCUPS.bits_types_h.uu_socklen_t;
      arg3 : int) return access hostent;  -- netdb.h:137
   pragma Import (C, gethostbyaddr, "gethostbyaddr");

  -- Return entry from host data base for host with NAME.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function gethostbyname (arg1 : Interfaces.C.Strings.chars_ptr) return access hostent;  -- netdb.h:144
   pragma Import (C, gethostbyname, "gethostbyname");

  -- Return entry from host data base for host with NAME.  AF must be
  --   set to the address type which is `AF_INET' for IPv4 or `AF_INET6'
  --   for IPv6.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function gethostbyname2 (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return access hostent;  -- netdb.h:155
   pragma Import (C, gethostbyname2, "gethostbyname2");

  -- Reentrant versions of the functions above.  The additional
  --   arguments specify a buffer of BUFLEN starting at BUF.  The last
  --   argument is a pointer to a variable which gets the value which
  --   would be stored in the global variable `herrno' by the
  --   non-reentrant functions.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

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

  -- Open network data base files and mark them as staying open even
  --   after a later search if STAY_OPEN is non-zero.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure setnetent (arg1 : int);  -- netdb.h:198
   pragma Import (C, setnetent, "setnetent");

  -- Close network data base files and clear `stay open' flag.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure endnetent;  -- netdb.h:204
   pragma Import (C, endnetent, "endnetent");

  -- Get next entry from network data base file.  Open data base if
  --   necessary.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getnetent return access libCUPS.bits_netdb_h.netent;  -- netdb.h:211
   pragma Import (C, getnetent, "getnetent");

  -- Return entry from network data base which address match NET and
  --   type TYPE.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getnetbyaddr (arg1 : libCUPS.stdint_h.uint32_t; arg2 : int) return access libCUPS.bits_netdb_h.netent;  -- netdb.h:218
   pragma Import (C, getnetbyaddr, "getnetbyaddr");

  -- Return entry from network data base for network with NAME.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getnetbyname (arg1 : Interfaces.C.Strings.chars_ptr) return access libCUPS.bits_netdb_h.netent;  -- netdb.h:224
   pragma Import (C, getnetbyname, "getnetbyname");

  -- Reentrant versions of the functions above.  The additional
  --   arguments specify a buffer of BUFLEN starting at BUF.  The last
  --   argument is a pointer to a variable which gets the value which
  --   would be stored in the global variable `herrno' by the
  --   non-reentrant functions.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

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

  -- Description of data base entry for a single service.   
  -- Official service name.   
   type servent is record
      s_name : Interfaces.C.Strings.chars_ptr;  -- netdb.h:259
      s_aliases : System.Address;  -- netdb.h:260
      s_port : aliased int;  -- netdb.h:261
      s_proto : Interfaces.C.Strings.chars_ptr;  -- netdb.h:262
   end record;
   pragma Convention (C_Pass_By_Copy, servent);  -- netdb.h:257

  -- Alias list.   
  -- Port number.   
  -- Protocol to use.   
  -- Open service data base files and mark them as staying open even
  --   after a later search if STAY_OPEN is non-zero.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure setservent (arg1 : int);  -- netdb.h:270
   pragma Import (C, setservent, "setservent");

  -- Close service data base files and clear `stay open' flag.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure endservent;  -- netdb.h:276
   pragma Import (C, endservent, "endservent");

  -- Get next entry from service data base file.  Open data base if
  --   necessary.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getservent return access servent;  -- netdb.h:283
   pragma Import (C, getservent, "getservent");

  -- Return entry from network data base for network with NAME and
  --   protocol PROTO.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getservbyname (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return access servent;  -- netdb.h:290
   pragma Import (C, getservbyname, "getservbyname");

  -- Return entry from service data base which matches port PORT and
  --   protocol PROTO.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getservbyport (arg1 : int; arg2 : Interfaces.C.Strings.chars_ptr) return access servent;  -- netdb.h:297
   pragma Import (C, getservbyport, "getservbyport");

  -- Reentrant versions of the functions above.  The additional
  --   arguments specify a buffer of BUFLEN starting at BUF.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

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

  -- Description of data base entry for a single service.   
  -- Official protocol name.   
   type protoent is record
      p_name : Interfaces.C.Strings.chars_ptr;  -- netdb.h:328
      p_aliases : System.Address;  -- netdb.h:329
      p_proto : aliased int;  -- netdb.h:330
   end record;
   pragma Convention (C_Pass_By_Copy, protoent);  -- netdb.h:326

  -- Alias list.   
  -- Protocol number.   
  -- Open protocol data base files and mark them as staying open even
  --   after a later search if STAY_OPEN is non-zero.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure setprotoent (arg1 : int);  -- netdb.h:338
   pragma Import (C, setprotoent, "setprotoent");

  -- Close protocol data base files and clear `stay open' flag.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   procedure endprotoent;  -- netdb.h:344
   pragma Import (C, endprotoent, "endprotoent");

  -- Get next entry from protocol data base file.  Open data base if
  --   necessary.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getprotoent return access protoent;  -- netdb.h:351
   pragma Import (C, getprotoent, "getprotoent");

  -- Return entry from protocol data base for network with NAME.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getprotobyname (arg1 : Interfaces.C.Strings.chars_ptr) return access protoent;  -- netdb.h:357
   pragma Import (C, getprotobyname, "getprotobyname");

  -- Return entry from protocol data base which number is PROTO.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getprotobynumber (arg1 : int) return access protoent;  -- netdb.h:363
   pragma Import (C, getprotobynumber, "getprotobynumber");

  -- Reentrant versions of the functions above.  The additional
  --   arguments specify a buffer of BUFLEN starting at BUF.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

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

  -- Establish network group NETGROUP for enumeration.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function setnetgrent (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- netdb.h:395
   pragma Import (C, setnetgrent, "setnetgrent");

  -- Free all space allocated by previous `setnetgrent' call.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   procedure endnetgrent;  -- netdb.h:403
   pragma Import (C, endnetgrent, "endnetgrent");

  -- Get next member of netgroup established by last `setnetgrent' call
  --   and return pointers to elements in HOSTP, USERP, and DOMAINP.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function getnetgrent
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : System.Address) return int;  -- netdb.h:412
   pragma Import (C, getnetgrent, "getnetgrent");

  -- Test whether NETGROUP contains the triple (HOST,USER,DOMAIN).
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function innetgr
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr) return int;  -- netdb.h:423
   pragma Import (C, innetgr, "innetgr");

  -- Reentrant version of `getnetgrent' where result is placed in BUFFER.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function getnetgrent_r
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : System.Address;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : size_t) return int;  -- netdb.h:432
   pragma Import (C, getnetgrent_r, "getnetgrent_r");

  -- Call `rshd' at port RPORT on remote machine *AHOST to execute CMD.
  --   The local user is LOCUSER, on the remote machine the command is
  --   executed as REMUSER.  In *FD2P the descriptor to the socket for the
  --   connection is returned.  The caller must have the right to use a
  --   reserved port.  When the function returns *AHOST contains the
  --   official host name.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rcmd
     (arg1 : System.Address;
      arg2 : unsigned_short;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : access int) return int;  -- netdb.h:451
   pragma Import (C, rcmd, "rcmd");

  -- This is the equivalent function where the protocol can be selected
  --   and which therefore can be used for IPv6.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rcmd_af
     (arg1 : System.Address;
      arg2 : unsigned_short;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : access int;
      arg7 : libCUPS.bits_sockaddr_h.sa_family_t) return int;  -- netdb.h:463
   pragma Import (C, rcmd_af, "rcmd_af");

  -- Call `rexecd' at port RPORT on remote machine *AHOST to execute
  --   CMD.  The process runs at the remote machine using the ID of user
  --   NAME whose cleartext password is PASSWD.  In *FD2P the descriptor
  --   to the socket for the connection is returned.  When the function
  --   returns *AHOST contains the official host name.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rexec
     (arg1 : System.Address;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : access int) return int;  -- netdb.h:479
   pragma Import (C, rexec, "rexec");

  -- This is the equivalent function where the protocol can be selected
  --   and which therefore can be used for IPv6.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rexec_af
     (arg1 : System.Address;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : access int;
      arg7 : libCUPS.bits_sockaddr_h.sa_family_t) return int;  -- netdb.h:491
   pragma Import (C, rexec_af, "rexec_af");

  -- Check whether user REMUSER on system RHOST is allowed to login as LOCUSER.
  --   If SUSER is not zero the user tries to become superuser.  Return 0 if
  --   it is possible.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function ruserok
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr) return int;  -- netdb.h:505
   pragma Import (C, ruserok, "ruserok");

  -- This is the equivalent function where the protocol can be selected
  --   and which therefore can be used for IPv6.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function ruserok_af
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : libCUPS.bits_sockaddr_h.sa_family_t) return int;  -- netdb.h:515
   pragma Import (C, ruserok_af, "ruserok_af");

  -- Check whether user REMUSER on system indicated by IPv4 address
  --   RADDR is allowed to login as LOCUSER.  Non-IPv4 (e.g., IPv6) are
  --   not supported.  If SUSER is not zero the user tries to become
  --   superuser.  Return 0 if it is possible.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function iruserok
     (arg1 : libCUPS.stdint_h.uint32_t;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr) return int;  -- netdb.h:528
   pragma Import (C, iruserok, "iruserok");

  -- This is the equivalent function where the pfamiliy if the address
  --   pointed to by RADDR is determined by the value of AF.  It therefore
  --   can be used for IPv6
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function iruserok_af
     (arg1 : System.Address;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : libCUPS.bits_sockaddr_h.sa_family_t) return int;  -- netdb.h:539
   pragma Import (C, iruserok_af, "iruserok_af");

  -- Try to allocate reserved port, returning a descriptor for a socket opened
  --   at this port or -1 if unsuccessful.  The search for an available port
  --   will start at ALPORT and continues with lower numbers.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rresvport (arg1 : access int) return int;  -- netdb.h:551
   pragma Import (C, rresvport, "rresvport");

  -- This is the equivalent function where the protocol can be selected
  --   and which therefore can be used for IPv6.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

   function rresvport_af (arg1 : access int; arg2 : libCUPS.bits_sockaddr_h.sa_family_t) return int;  -- netdb.h:560
   pragma Import (C, rresvport_af, "rresvport_af");

  -- Extension from POSIX.1:2001.   
  -- Structure to contain information about address of a service provider.   
  -- Input flags.   
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

  -- Protocol family for socket.   
  -- Socket type.   
  -- Protocol for socket.   
  -- Length of socket address.   
  -- Socket address for socket.   
  -- Canonical name for service location.   
  -- Pointer to next in list.   
  -- Structure used as control block for asynchronous lookup.   
  -- Name to look up.   
  -- Service name.   
  -- Additional request specification.   
  -- Pointer to result.   
  -- The following are internal elements.   
  -- Lookup mode.   
  -- Possible values for `ai_flags' field in `addrinfo' structure.   
  -- Error values for `getaddrinfo' function.   
  -- Translate name of a service location and/or a service name to set of
  --   socket addresses.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getaddrinfo
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : System.Address;
      arg4 : System.Address) return int;  -- netdb.h:662
   pragma Import (C, getaddrinfo, "getaddrinfo");

  -- Free `addrinfo' structure AI including associated storage.   
   procedure freeaddrinfo (arg1 : access addrinfo);  -- netdb.h:668
   pragma Import (C, freeaddrinfo, "freeaddrinfo");

  -- Convert error return from getaddrinfo() to a string.   
   function gai_strerror (arg1 : int) return Interfaces.C.Strings.chars_ptr;  -- netdb.h:671
   pragma Import (C, gai_strerror, "gai_strerror");

  -- Translate a socket address to a location and service name.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getnameinfo
     (arg1 : System.Address;
      arg2 : libCUPS.unistd_h.socklen_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : libCUPS.unistd_h.socklen_t;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : libCUPS.unistd_h.socklen_t;
      arg7 : int) return int;  -- netdb.h:677
   pragma Import (C, getnameinfo, "getnameinfo");

  -- Enqueue ENT requests from the LIST.  If MODE is GAI_WAIT wait until all
  --   requests are handled.  If WAIT is GAI_NOWAIT return immediately after
  --   queueing the requests and signal completion according to SIG.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

  -- Suspend execution of the thread until at least one of the ENT requests
  --   in LIST is handled.  If TIMEOUT is not a null pointer it specifies the
  --   longest time the function keeps waiting before returning with an error.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

  -- Get the error status of the request REQ.   
  -- Cancel the requests associated with GAICBP.   
end libCUPS.netdb_h;
