pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with CUPS.bits_types_h;

private package CUPS.sys_types_h is

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

  -- *	POSIX Standard: 2.6 Primitive System Data Types	<sys/types.h>
  --  

   subtype u_char is CUPS.bits_types_h.uu_u_char;  -- sys/types.h:33

   subtype u_short is CUPS.bits_types_h.uu_u_short;  -- sys/types.h:34

   subtype u_int is CUPS.bits_types_h.uu_u_int;  -- sys/types.h:35

   subtype u_long is CUPS.bits_types_h.uu_u_long;  -- sys/types.h:36

   subtype quad_t is CUPS.bits_types_h.uu_quad_t;  -- sys/types.h:37

   subtype u_quad_t is CUPS.bits_types_h.uu_u_quad_t;  -- sys/types.h:38

   subtype fsid_t is CUPS.bits_types_h.uu_fsid_t;

   subtype loff_t is CUPS.bits_types_h.uu_loff_t;  -- sys/types.h:44

   subtype ino_t is CUPS.bits_types_h.uu_ino_t;  -- sys/types.h:48

   subtype ino64_t is CUPS.bits_types_h.uu_ino64_t;  -- sys/types.h:55

   subtype dev_t is CUPS.bits_types_h.uu_dev_t;  -- sys/types.h:60

   subtype gid_t is CUPS.bits_types_h.uu_gid_t;  -- sys/types.h:65

   subtype mode_t is CUPS.bits_types_h.uu_mode_t;  -- sys/types.h:70

   subtype nlink_t is CUPS.bits_types_h.uu_nlink_t;  -- sys/types.h:75

   subtype uid_t is CUPS.bits_types_h.uu_uid_t;  -- sys/types.h:80

   subtype pid_t is CUPS.bits_types_h.uu_pid_t;  -- sys/types.h:98

   subtype id_t is CUPS.bits_types_h.uu_id_t;  -- sys/types.h:104

   subtype daddr_t is CUPS.bits_types_h.uu_daddr_t;  -- sys/types.h:115

   subtype caddr_t is CUPS.bits_types_h.uu_caddr_t;  -- sys/types.h:116

   subtype key_t is CUPS.bits_types_h.uu_key_t;  -- sys/types.h:122

   subtype useconds_t is CUPS.bits_types_h.uu_useconds_t;  -- sys/types.h:136

   subtype suseconds_t is CUPS.bits_types_h.uu_suseconds_t;  -- sys/types.h:140

  -- Old compatibility names for C types.   
   subtype ulong is unsigned_long;  -- sys/types.h:150

   subtype ushort is unsigned_short;  -- sys/types.h:151

   subtype uint is unsigned;  -- sys/types.h:152

  -- These size-specific names are used by some of the inet code.   
  -- These types are defined by the ISO C99 header <inttypes.h>.  
  -- But these were defined by ISO C without the first `_'.   
  -- For GCC 2.7 and later, we can use specific type-size attributes.   
   subtype int8_t is signed_char;  -- sys/types.h:194

   subtype int16_t is short;  -- sys/types.h:195

   subtype int32_t is int;  -- sys/types.h:196

   subtype int64_t is long;  -- sys/types.h:197

   subtype u_int8_t is unsigned_char;  -- sys/types.h:200

   subtype u_int16_t is unsigned_short;  -- sys/types.h:201

   subtype u_int32_t is unsigned;  -- sys/types.h:202

   subtype u_int64_t is unsigned_long;  -- sys/types.h:203

   subtype register_t is long;  -- sys/types.h:205

  -- Some code from BIND tests this macro to see if the types above are
  --   defined.   

  -- In BSD <sys/types.h> is expected to define BYTE_ORDER.   
  -- It also defines `fd_set' and the FD_* macros for `select'.   
  -- BSD defines these symbols, so we follow.   
   subtype blksize_t is CUPS.bits_types_h.uu_blksize_t;  -- sys/types.h:228

  -- Types from the Large File Support interface.   
  -- Type to count number of disk blocks.   
   subtype blkcnt_t is CUPS.bits_types_h.uu_blkcnt_t;  -- sys/types.h:235

  -- Type to count file system blocks.   
   subtype fsblkcnt_t is CUPS.bits_types_h.uu_fsblkcnt_t;  -- sys/types.h:239

  -- Type to count file system inodes.   
   subtype fsfilcnt_t is CUPS.bits_types_h.uu_fsfilcnt_t;  -- sys/types.h:243

  -- Type to count number of disk blocks.   
  -- Type to count file system blocks.   
  -- Type to count file system inodes.   
  -- Type to count number of disk blocks.  
   subtype blkcnt64_t is CUPS.bits_types_h.uu_blkcnt64_t;  -- sys/types.h:262

  -- Type to count file system blocks.   
   subtype fsblkcnt64_t is CUPS.bits_types_h.uu_fsblkcnt64_t;  -- sys/types.h:263

  -- Type to count file system inodes.   
   subtype fsfilcnt64_t is CUPS.bits_types_h.uu_fsfilcnt64_t;  -- sys/types.h:264

  -- Now add the thread types.   
end CUPS.sys_types_h;
