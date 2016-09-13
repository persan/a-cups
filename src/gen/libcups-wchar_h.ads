pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package libCUPS.wchar_h is

   type uu_mbstate_t;
   subtype uu_mbstate_t_uu_wchb_array is Interfaces.C.char_array (0 .. 3);
   type uu_mbstate_t_uu_value_union (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_wch : aliased unsigned;  -- wchar.h:88
         when others =>
            uu_wchb : aliased uu_mbstate_t_uu_wchb_array;  -- wchar.h:92
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, uu_mbstate_t_uu_value_union);
   pragma Unchecked_Union (uu_mbstate_t_uu_value_union);type uu_mbstate_t is record
      uu_count : aliased int;  -- wchar.h:84
      uu_value : aliased uu_mbstate_t_uu_value_union;  -- wchar.h:93
   end record;
   pragma Convention (C_Pass_By_Copy, uu_mbstate_t);  -- wchar.h:94

end libCUPS.wchar_h;
