pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package libCUPS.xlocale_h is

   --  skipped empty struct uu_locale_data

   type anon1977_uu_locales_array is array (0 .. 12) of System.Address;
   type anon1977_uu_names_array is array (0 .. 12) of Interfaces.C.Strings.chars_ptr;
   type uu_locale_struct is record
      uu_locales : anon1977_uu_locales_array;  -- xlocale.h:30
      uu_ctype_b : access unsigned_short;  -- xlocale.h:33
      uu_ctype_tolower : access int;  -- xlocale.h:34
      uu_ctype_toupper : access int;  -- xlocale.h:35
      uu_names : anon1977_uu_names_array;  -- xlocale.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, uu_locale_struct);  -- xlocale.h:27

   type uu_locale_t is access all uu_locale_struct;  -- xlocale.h:39

   subtype locale_t is uu_locale_t;  -- xlocale.h:42

end libCUPS.xlocale_h;
