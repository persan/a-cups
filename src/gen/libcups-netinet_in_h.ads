pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with libCUPS.stdint_h;
with libCUPS.bits_sockaddr_h;
with libCUPS.bits_socket_h;

package libCUPS.netinet_in_h is

   --  unsupported macro: IPPROTO_IP IPPROTO_IP
   --  unsupported macro: IPPROTO_ICMP IPPROTO_ICMP
   --  unsupported macro: IPPROTO_IGMP IPPROTO_IGMP
   --  unsupported macro: IPPROTO_IPIP IPPROTO_IPIP
   --  unsupported macro: IPPROTO_TCP IPPROTO_TCP
   --  unsupported macro: IPPROTO_EGP IPPROTO_EGP
   --  unsupported macro: IPPROTO_PUP IPPROTO_PUP
   --  unsupported macro: IPPROTO_UDP IPPROTO_UDP
   --  unsupported macro: IPPROTO_IDP IPPROTO_IDP
   --  unsupported macro: IPPROTO_TP IPPROTO_TP
   --  unsupported macro: IPPROTO_DCCP IPPROTO_DCCP
   --  unsupported macro: IPPROTO_IPV6 IPPROTO_IPV6
   --  unsupported macro: IPPROTO_RSVP IPPROTO_RSVP
   --  unsupported macro: IPPROTO_GRE IPPROTO_GRE
   --  unsupported macro: IPPROTO_ESP IPPROTO_ESP
   --  unsupported macro: IPPROTO_AH IPPROTO_AH
   --  unsupported macro: IPPROTO_MTP IPPROTO_MTP
   --  unsupported macro: IPPROTO_BEETPH IPPROTO_BEETPH
   --  unsupported macro: IPPROTO_ENCAP IPPROTO_ENCAP
   --  unsupported macro: IPPROTO_PIM IPPROTO_PIM
   --  unsupported macro: IPPROTO_COMP IPPROTO_COMP
   --  unsupported macro: IPPROTO_SCTP IPPROTO_SCTP
   --  unsupported macro: IPPROTO_UDPLITE IPPROTO_UDPLITE
   --  unsupported macro: IPPROTO_MPLS IPPROTO_MPLS
   --  unsupported macro: IPPROTO_RAW IPPROTO_RAW
   --  unsupported macro: IPPROTO_HOPOPTS IPPROTO_HOPOPTS
   --  unsupported macro: IPPROTO_ROUTING IPPROTO_ROUTING
   --  unsupported macro: IPPROTO_FRAGMENT IPPROTO_FRAGMENT
   --  unsupported macro: IPPROTO_ICMPV6 IPPROTO_ICMPV6
   --  unsupported macro: IPPROTO_NONE IPPROTO_NONE
   --  unsupported macro: IPPROTO_DSTOPTS IPPROTO_DSTOPTS
   --  unsupported macro: IPPROTO_MH IPPROTO_MH
   --  arg-macro: function IN_CLASSA ((((in_addr_t)(a)) and 16#80000000#) = 0
   --    return (((in_addr_t)(a)) and 16#80000000#) = 0;
   IN_CLASSA_NET : constant := 16#ff000000#;  --  netinet/in.h:167
   IN_CLASSA_NSHIFT : constant := 24;  --  netinet/in.h:168
   --  unsupported macro: IN_CLASSA_HOST (0xffffffff & ~IN_CLASSA_NET)

   IN_CLASSA_MAX : constant := 128;  --  netinet/in.h:170
   --  arg-macro: function IN_CLASSB ((((in_addr_t)(a)) and 16#c0000000#) = 16#80000000#
   --    return (((in_addr_t)(a)) and 16#c0000000#) = 16#80000000#;

   IN_CLASSB_NET : constant := 16#ffff0000#;  --  netinet/in.h:173
   IN_CLASSB_NSHIFT : constant := 16;  --  netinet/in.h:174
   --  unsupported macro: IN_CLASSB_HOST (0xffffffff & ~IN_CLASSB_NET)

   IN_CLASSB_MAX : constant := 65536;  --  netinet/in.h:176
   --  arg-macro: function IN_CLASSC ((((in_addr_t)(a)) and 16#e0000000#) = 16#c0000000#
   --    return (((in_addr_t)(a)) and 16#e0000000#) = 16#c0000000#;

   IN_CLASSC_NET : constant := 16#ffffff00#;  --  netinet/in.h:179
   IN_CLASSC_NSHIFT : constant := 8;  --  netinet/in.h:180
   --  unsupported macro: IN_CLASSC_HOST (0xffffffff & ~IN_CLASSC_NET)
   --  arg-macro: function IN_CLASSD ((((in_addr_t)(a)) and 16#f0000000#) = 16#e0000000#
   --    return (((in_addr_t)(a)) and 16#f0000000#) = 16#e0000000#;
   --  arg-macro: procedure IN_MULTICAST IN_CLASSD(a)
   --    IN_CLASSD(a)
   --  arg-macro: function IN_EXPERIMENTAL ((((in_addr_t)(a)) and 16#e0000000#) = 16#e0000000#
   --    return (((in_addr_t)(a)) and 16#e0000000#) = 16#e0000000#;
   --  arg-macro: function IN_BADCLASS ((((in_addr_t)(a)) and 16#f0000000#) = 16#f0000000#
   --    return (((in_addr_t)(a)) and 16#f0000000#) = 16#f0000000#;
   --  unsupported macro: INADDR_ANY ((in_addr_t) 0x00000000)
   --  unsupported macro: INADDR_BROADCAST ((in_addr_t) 0xffffffff)
   --  unsupported macro: INADDR_NONE ((in_addr_t) 0xffffffff)

   IN_LOOPBACKNET : constant := 127;  --  netinet/in.h:197
   --  unsupported macro: INADDR_LOOPBACK ((in_addr_t) 0x7f000001)
   --  unsupported macro: INADDR_UNSPEC_GROUP ((in_addr_t) 0xe0000000)
   --  unsupported macro: INADDR_ALLHOSTS_GROUP ((in_addr_t) 0xe0000001)
   --  unsupported macro: INADDR_ALLRTRS_GROUP ((in_addr_t) 0xe0000002)
   --  unsupported macro: INADDR_MAX_LOCAL_GROUP ((in_addr_t) 0xe00000ff)
   --  unsupported macro: s6_addr __in6_u.__u6_addr8
   --  unsupported macro: s6_addr16 __in6_u.__u6_addr16
   --  unsupported macro: s6_addr32 __in6_u.__u6_addr32
   --  unsupported macro: IN6ADDR_ANY_INIT { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 } } }
   --  unsupported macro: IN6ADDR_LOOPBACK_INIT { { { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1 } } }

   INET_ADDRSTRLEN : constant := 16;  --  netinet/in.h:234
   INET6_ADDRSTRLEN : constant := 46;  --  netinet/in.h:235
   --  arg-macro: function IP_MSFILTER_SIZE (sizeof (struct ip_msfilter) - sizeof (struct in_addr) + (numsrc) * sizeof (struct in_addr)
   --    return sizeof (struct ip_msfilter) - sizeof (struct in_addr) + (numsrc) * sizeof (struct in_addr);
   --  arg-macro: function GROUP_FILTER_SIZE (sizeof (struct group_filter) - sizeof (struct sockaddr_storage) + ((numsrc) * sizeof (struct sockaddr_storage))
   --    return sizeof (struct group_filter) - sizeof (struct sockaddr_storage) + ((numsrc) * sizeof (struct sockaddr_storage));
   --  arg-macro: function IN6_IS_ADDR_UNSPECIFIED (__extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); __a.s6_addr32(0) = 0  and then  __a.s6_addr32(1) = 0  and then  __a.s6_addr32(2) = 0  and then  __a.s6_addr32(3) = 0; })
   --    return __extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); __a.s6_addr32(0) = 0  and then  __a.s6_addr32(1) = 0  and then  __a.s6_addr32(2) = 0  and then  __a.s6_addr32(3) = 0; });
   --  arg-macro: function IN6_IS_ADDR_LOOPBACK (__extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); __a.s6_addr32(0) = 0  and then  __a.s6_addr32(1) = 0  and then  __a.s6_addr32(2) = 0  and then  __a.s6_addr32(3) = htonl (1); })
   --    return __extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); __a.s6_addr32(0) = 0  and then  __a.s6_addr32(1) = 0  and then  __a.s6_addr32(2) = 0  and then  __a.s6_addr32(3) = htonl (1); });
   --  arg-macro: function IN6_IS_ADDR_LINKLOCAL (__extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); (__a.s6_addr32(0) and htonl (16#ffc00000#)) = htonl (16#fe800000#); })
   --    return __extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); (__a.s6_addr32(0) and htonl (16#ffc00000#)) = htonl (16#fe800000#); });
   --  arg-macro: function IN6_IS_ADDR_SITELOCAL (__extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); (__a.s6_addr32(0) and htonl (16#ffc00000#)) = htonl (16#fec00000#); })
   --    return __extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); (__a.s6_addr32(0) and htonl (16#ffc00000#)) = htonl (16#fec00000#); });
   --  arg-macro: function IN6_IS_ADDR_V4MAPPED (__extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); __a.s6_addr32(0) = 0  and then  __a.s6_addr32(1) = 0  and then  __a.s6_addr32(2) = htonl (16#ffff#); })
   --    return __extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); __a.s6_addr32(0) = 0  and then  __a.s6_addr32(1) = 0  and then  __a.s6_addr32(2) = htonl (16#ffff#); });
   --  arg-macro: function IN6_IS_ADDR_V4COMPAT (__extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); __a.s6_addr32(0) = 0  and then  __a.s6_addr32(1) = 0  and then  __a.s6_addr32(2) = 0  and then  ntohl (__a.s6_addr32(3)) > 1; })
   --    return __extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); __a.s6_addr32(0) = 0  and then  __a.s6_addr32(1) = 0  and then  __a.s6_addr32(2) = 0  and then  ntohl (__a.s6_addr32(3)) > 1; });
   --  arg-macro: function IN6_ARE_ADDR_EQUAL (__extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); const struct in6_addr *__b := (const struct in6_addr *) (b); __a.s6_addr32(0) = __b.s6_addr32(0)  and then  __a.s6_addr32(1) = __b.s6_addr32(1)  and then  __a.s6_addr32(2) = __b.s6_addr32(2)  and then  __a.s6_addr32(3) = __b.s6_addr32(3); })
   --    return __extension__ ({ const struct in6_addr *__a := (const struct in6_addr *) (a); const struct in6_addr *__b := (const struct in6_addr *) (b); __a.s6_addr32(0) = __b.s6_addr32(0)  and then  __a.s6_addr32(1) = __b.s6_addr32(1)  and then  __a.s6_addr32(2) = __b.s6_addr32(2)  and then  __a.s6_addr32(3) = __b.s6_addr32(3); });
   --  arg-macro: function IN6_IS_ADDR_MULTICAST (((const uint8_t *) (a))(0) = 16#ff#
   --    return ((const uint8_t *) (a))(0) = 16#ff#;
   --  arg-macro: function IN6_IS_ADDR_MC_NODELOCAL (IN6_IS_ADDR_MULTICAST(a)  and then  ((((const uint8_t *) (a))(1) and 16#f#) = 16#1#)
   --    return IN6_IS_ADDR_MULTICAST(a)  and then  ((((const uint8_t *) (a))(1) and 16#f#) = 16#1#);
   --  arg-macro: function IN6_IS_ADDR_MC_LINKLOCAL (IN6_IS_ADDR_MULTICAST(a)  and then  ((((const uint8_t *) (a))(1) and 16#f#) = 16#2#)
   --    return IN6_IS_ADDR_MULTICAST(a)  and then  ((((const uint8_t *) (a))(1) and 16#f#) = 16#2#);
   --  arg-macro: function IN6_IS_ADDR_MC_SITELOCAL (IN6_IS_ADDR_MULTICAST(a)  and then  ((((const uint8_t *) (a))(1) and 16#f#) = 16#5#)
   --    return IN6_IS_ADDR_MULTICAST(a)  and then  ((((const uint8_t *) (a))(1) and 16#f#) = 16#5#);
   --  arg-macro: function IN6_IS_ADDR_MC_ORGLOCAL (IN6_IS_ADDR_MULTICAST(a)  and then  ((((const uint8_t *) (a))(1) and 16#f#) = 16#8#)
   --    return IN6_IS_ADDR_MULTICAST(a)  and then  ((((const uint8_t *) (a))(1) and 16#f#) = 16#8#);
   --  arg-macro: function IN6_IS_ADDR_MC_GLOBAL (IN6_IS_ADDR_MULTICAST(a)  and then  ((((const uint8_t *) (a))(1) and 16#f#) = 16#e#)
   --    return IN6_IS_ADDR_MULTICAST(a)  and then  ((((const uint8_t *) (a))(1) and 16#f#) = 16#e#);

  -- Copyright (C) 1991-2016 Free Software Foundation, Inc.
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

  -- Internet address.
   subtype in_addr_t is libCUPS.stdint_h.uint32_t;  -- netinet/in.h:30

   type in_addr is record
      s_addr : aliased in_addr_t;  -- netinet/in.h:33
   end record;
   pragma Convention (C_Pass_By_Copy, in_addr);  -- netinet/in.h:31

  -- Get system-specific definitions.
  -- Standard well-defined IP protocols.
  -- Dummy protocol for TCP.
  -- Internet Control Message Protocol.
  -- Internet Group Management Protocol.
  -- IPIP tunnels (older KA9Q tunnels use 94).
  -- Transmission Control Protocol.
  -- Exterior Gateway Protocol.
  -- PUP protocol.
  -- User Datagram Protocol.
  -- XNS IDP protocol.
  -- SO Transport Protocol Class 4.
  -- Datagram Congestion Control Protocol.
  -- IPv6 header.
  -- Reservation Protocol.
  -- General Routing Encapsulation.
  -- encapsulating security payload.
  -- authentication header.
  -- Multicast Transport Protocol.
  -- IP option pseudo header for BEET.
  -- Encapsulation Header.
  -- Protocol Independent Multicast.
  -- Compression Header Protocol.
  -- Stream Control Transmission Protocol.
  -- UDP-Lite protocol.
  -- MPLS in IP.
  -- Raw IP packets.
  -- If __USE_KERNEL_IPV6_DEFS is defined then the user has included the kernel
  --   network headers first and we should use those ABI-identical definitions
  --   instead of our own.

  -- IPv6 Hop-by-Hop options.
  -- IPv6 routing header.
  -- IPv6 fragmentation header.
  -- ICMPv6.
  -- IPv6 no next header.
  -- IPv6 destination options.
  -- IPv6 mobility header.
  -- Type to represent a port.
   subtype in_port_t is libCUPS.stdint_h.uint16_t;  -- netinet/in.h:119

  -- Standard well-known ports.
  -- Echo service.
  -- Discard transmissions service.
  -- System status service.
  -- Time of day service.
  -- Network status service.
  -- File Transfer Protocol.
  -- Telnet protocol.
  -- Simple Mail Transfer Protocol.
  -- Timeserver service.
  -- Domain Name Service.
  -- Internet Whois service.
  -- Trivial File Transfer Protocol.
  -- Finger service.
  -- SUPDUP protocol.
  -- execd service.
  -- rlogind service.
  -- UDP ports.
  -- Ports less than this value are reserved for privileged processes.
  -- Ports greater this value are reserved for (non-privileged) servers.
  -- Definitions of the bits in an Internet address integer.
  --   On subnets, host and network parts are found according to
  --   the subnet mask, not these masks.

  -- Address to accept any incoming messages.
  -- Address to send to all hosts.
  -- Address indicating an error return.
  -- Network number for local host loopback.
  -- Address to loopback in software to local host.
  -- Defines for Multicast INADDR.
  -- IPv6 address
   type in6_addr;
   type anon2597_uu_u6_addr8_array is array (0 .. 15) of aliased libCUPS.stdint_h.uint8_t;
   type anon2597_uu_u6_addr16_array is array (0 .. 7) of aliased libCUPS.stdint_h.uint16_t;
   type anon2597_uu_u6_addr32_array is array (0 .. 3) of aliased libCUPS.stdint_h.uint32_t;
   type anon2597_uu_in6_u_union (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_u6_addr8 : aliased anon2597_uu_u6_addr8_array;  -- netinet/in.h:215
         when 1 =>
            uu_u6_addr16 : aliased anon2597_uu_u6_addr16_array;  -- netinet/in.h:217
         when others =>
            uu_u6_addr32 : aliased anon2597_uu_u6_addr32_array;  -- netinet/in.h:218
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon2597_uu_in6_u_union);
   pragma Unchecked_Union (anon2597_uu_in6_u_union);type in6_addr is record
      uu_in6_u : aliased anon2597_uu_in6_u_union;  -- netinet/in.h:220
   end record;
   pragma Convention (C_Pass_By_Copy, in6_addr);  -- netinet/in.h:211

  -- ::
   in6addr_any : aliased in6_addr;  -- netinet/in.h:229
   pragma Import (C, in6addr_any, "in6addr_any");

  -- ::1
   in6addr_loopback : aliased in6_addr;  -- netinet/in.h:230
   pragma Import (C, in6addr_loopback, "in6addr_loopback");

  -- Structure describing an Internet socket address.
   type anon2612_sin_zero_array is array (0 .. 7) of aliased unsigned_char;
   type sockaddr_in is record
      sin_family : aliased libCUPS.bits_sockaddr_h.sa_family_t;  -- netinet/in.h:241
      sin_port : aliased in_port_t;  -- netinet/in.h:242
      sin_addr : aliased in_addr;  -- netinet/in.h:243
      sin_zero : aliased anon2612_sin_zero_array;  -- netinet/in.h:246
   end record;
   pragma Convention (C_Pass_By_Copy, sockaddr_in);  -- netinet/in.h:239

  -- Port number.
  -- Internet address.
  -- Pad to size of `struct sockaddr'.
  -- Ditto, for IPv6.
   type sockaddr_in6 is record
      sin6_family : aliased libCUPS.bits_sockaddr_h.sa_family_t;  -- netinet/in.h:256
      sin6_port : aliased in_port_t;  -- netinet/in.h:257
      sin6_flowinfo : aliased libCUPS.stdint_h.uint32_t;  -- netinet/in.h:258
      sin6_addr : aliased in6_addr;  -- netinet/in.h:259
      sin6_scope_id : aliased libCUPS.stdint_h.uint32_t;  -- netinet/in.h:260
   end record;
   pragma Convention (C_Pass_By_Copy, sockaddr_in6);  -- netinet/in.h:254

  -- Transport layer port #
  -- IPv6 flow information
  -- IPv6 address
  -- IPv6 scope-id
  -- IPv4 multicast request.
  -- IP multicast address of group.
   type ip_mreq is record
      imr_multiaddr : aliased in_addr;  -- netinet/in.h:269
      imr_interface : aliased in_addr;  -- netinet/in.h:272
   end record;
   pragma Convention (C_Pass_By_Copy, ip_mreq);  -- netinet/in.h:266

  -- Local IP address of interface.
  -- IP multicast address of group.
   type ip_mreq_source is record
      imr_multiaddr : aliased in_addr;  -- netinet/in.h:278
      imr_interface : aliased in_addr;  -- netinet/in.h:281
      imr_sourceaddr : aliased in_addr;  -- netinet/in.h:284
   end record;
   pragma Convention (C_Pass_By_Copy, ip_mreq_source);  -- netinet/in.h:275

  -- IP address of source.
  -- IP address of interface.
  -- Likewise, for IPv6.
  -- IPv6 multicast address of group
   type ipv6_mreq is record
      ipv6mr_multiaddr : aliased in6_addr;  -- netinet/in.h:293
      ipv6mr_interface : aliased unsigned;  -- netinet/in.h:296
   end record;
   pragma Convention (C_Pass_By_Copy, ipv6_mreq);  -- netinet/in.h:290

   subtype anon2625_uu_ss_padding_array is Interfaces.C.char_array (0 .. 117);
   type sockaddr_storage is record
      ss_family : aliased libCUPS.bits_sockaddr_h.sa_family_t;  -- bits/socket.h:168
      uu_ss_padding : aliased anon2625_uu_ss_padding_array;  -- bits/socket.h:169
      uu_ss_align : aliased unsigned_long;  -- bits/socket.h:170
   end record;
   pragma Convention (C_Pass_By_Copy, sockaddr_storage);

   -- local interface
  -- Multicast group request.
  -- Interface index.
   type group_req is record
      gr_interface : aliased libCUPS.stdint_h.uint32_t;  -- netinet/in.h:305
      gr_group : aliased sockaddr_storage;  -- netinet/in.h:308
   end record;
   pragma Convention (C_Pass_By_Copy, group_req);  -- netinet/in.h:302

  -- Group address.
  -- Interface index.
   type group_source_req is record
      gsr_interface : aliased libCUPS.stdint_h.uint32_t;  -- netinet/in.h:314
      gsr_group : aliased sockaddr_storage;  -- netinet/in.h:317
      gsr_source : aliased sockaddr_storage;  -- netinet/in.h:320
   end record;
   pragma Convention (C_Pass_By_Copy, group_source_req);  -- netinet/in.h:311

  -- Group address.
  -- Source address.
  -- Full-state filter operations.
  -- IP multicast address of group.
   type anon2621_imsf_slist_array is array (0 .. 0) of aliased in_addr;
   type ip_msfilter is record
      imsf_multiaddr : aliased in_addr;  -- netinet/in.h:328
      imsf_interface : aliased in_addr;  -- netinet/in.h:331
      imsf_fmode : aliased libCUPS.stdint_h.uint32_t;  -- netinet/in.h:334
      imsf_numsrc : aliased libCUPS.stdint_h.uint32_t;  -- netinet/in.h:337
      imsf_slist : aliased anon2621_imsf_slist_array;  -- netinet/in.h:339
   end record;
   pragma Convention (C_Pass_By_Copy, ip_msfilter);  -- netinet/in.h:325

  -- Local IP address of interface.
  -- Filter mode.
  -- Number of source addresses.
  -- Source addresses.
  -- Interface index.
   type group_filter;
   type anon2625_gf_slist_array is array (0 .. 0) of aliased sockaddr_storage;
   type group_filter is record
      gf_interface : aliased libCUPS.stdint_h.uint32_t;  -- netinet/in.h:349
      gf_group : aliased sockaddr_storage;  -- netinet/in.h:352
      gf_fmode : aliased libCUPS.stdint_h.uint32_t;  -- netinet/in.h:355
      gf_numsrc : aliased libCUPS.stdint_h.uint32_t;  -- netinet/in.h:358
      gf_slist : aliased anon2625_gf_slist_array;  -- netinet/in.h:360
   end record;
   pragma Convention (C_Pass_By_Copy, group_filter);  -- netinet/in.h:346

  -- Group address.
  -- Filter mode.
  -- Number of source addresses.
  -- Source addresses.
  -- Functions to convert between host and network byte order.
  --   Please note that these functions normally take `unsigned long int' or
  --   `unsigned short int' values as arguments and also return them.  But
  --   this was a short-sighted decision since on different systems the types
  --   may have different representations but the values are always the same.

   function ntohl (arg1 : libCUPS.stdint_h.uint32_t) return libCUPS.stdint_h.uint32_t;  -- netinet/in.h:376
   pragma Import (C, ntohl, "ntohl");

   function ntohs (arg1 : libCUPS.stdint_h.uint16_t) return libCUPS.stdint_h.uint16_t;  -- netinet/in.h:377
   pragma Import (C, ntohs, "ntohs");

   function htonl (arg1 : libCUPS.stdint_h.uint32_t) return libCUPS.stdint_h.uint32_t;  -- netinet/in.h:379
   pragma Import (C, htonl, "htonl");

   function htons (arg1 : libCUPS.stdint_h.uint16_t) return libCUPS.stdint_h.uint16_t;  -- netinet/in.h:381
   pragma Import (C, htons, "htons");

  -- Get machine dependent optimized versions of byte swapping functions.
  -- We can optimize calls to the conversion functions.  Either nothing has
  --   to be done or we are using directly the byte-swapping functions which
  --   often can be inlined.

  -- The host byte order is the same as network byte order,
  --   so these functions are all just identity.

  -- Bind socket to a privileged IP port.
   function bindresvport (arg1 : int; arg2 : access sockaddr_in) return int;  -- netinet/in.h:503
   pragma Import (C, bindresvport, "bindresvport");

  -- The IPv6 version of this function.
   function bindresvport6 (arg1 : int; arg2 : access sockaddr_in6) return int;  -- netinet/in.h:506
   pragma Import (C, bindresvport6, "bindresvport6");

  -- Forward declaration.
  -- IPv6 packet information.
  -- src/dst IPv6 address
  -- send/recv interface index
  -- IPv6 MTU information.
  -- dst address including zone ID
  -- path MTU in host byte order
  -- Obsolete hop-by-hop and Destination Options Processing (RFC 2292).
  -- Hop-by-Hop and Destination Options Processing (RFC 3542).
  -- Routing Header Option (RFC 3542).
  -- Multicast source filter support.
  -- Get IPv4 source filter.
  -- Set IPv4 source filter.
  -- Get source filter.
  -- Set source filter.
end libCUPS.netinet_in_h;
