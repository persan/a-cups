pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with libCUPS.bits_types_h;
with libCUPS.wchar_h;

package libCUPS.uG_config_h is

   type u_G_fpos_t is record
      uu_pos : aliased libCUPS.bits_types_h.uu_off_t;  -- _G_config.h:23
      uu_state : aliased libCUPS.wchar_h.uu_mbstate_t;  -- _G_config.h:24
   end record;
   pragma Convention (C_Pass_By_Copy, u_G_fpos_t);  -- _G_config.h:25

   type u_G_fpos64_t is record
      uu_pos : aliased libCUPS.bits_types_h.uu_off64_t;  -- _G_config.h:28
      uu_state : aliased libCUPS.wchar_h.uu_mbstate_t;  -- _G_config.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, u_G_fpos64_t);  -- _G_config.h:30

end libCUPS.uG_config_h;
