pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with libCUPS.stdint_h;

package libCUPS.bits_netdb_h is

   type netent is record
      n_name : Interfaces.C.Strings.chars_ptr;  -- bits/netdb.h:28
      n_aliases : System.Address;  -- bits/netdb.h:29
      n_addrtype : aliased int;  -- bits/netdb.h:30
      n_net : aliased libCUPS.stdint_h.uint32_t;  -- bits/netdb.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, netent);  -- bits/netdb.h:26

end libCUPS.bits_netdb_h;
