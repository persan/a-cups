pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with libCUPS.bits_sockaddr_h;

package libCUPS.sys_un_h is

   --  arg-macro: function SUN_LEN ((size_t) (((struct sockaddr_un *) 0).sun_path) + strlen ((ptr).sun_path)
   --    return (size_t) (((struct sockaddr_un *) 0).sun_path) + strlen ((ptr).sun_path);
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

  -- Get the definition of the macro to define the common sockaddr members.   
  -- Structure describing the address of an AF_LOCAL (aka AF_UNIX) socket.   
   subtype anon2821_sun_path_array is Interfaces.C.char_array (0 .. 107);
   type sockaddr_un is record
      sun_family : aliased libCUPS.bits_sockaddr_h.sa_family_t;  -- sys/un.h:31
      sun_path : aliased anon2821_sun_path_array;  -- sys/un.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, sockaddr_un);  -- sys/un.h:29

  -- Path name.   
  -- For prototype of `strlen'.   
  -- Evaluate to actual length of the `sockaddr_un' structure.   
end libCUPS.sys_un_h;
