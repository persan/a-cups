pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with libCUPS.stdio_h;
with Interfaces.C_Streams;
with System;
with libCUPS.cups_cups_h;

package libCUPS.cups_adminutil_h is

   CUPS_SERVER_DEBUG_LOGGING : aliased constant String := "_debug_logging" & ASCII.NUL;  --  cups/adminutil.h:42
   CUPS_SERVER_REMOTE_ADMIN : aliased constant String := "_remote_admin" & ASCII.NUL;  --  cups/adminutil.h:43
   CUPS_SERVER_REMOTE_ANY : aliased constant String := "_remote_any" & ASCII.NUL;  --  cups/adminutil.h:44

   CUPS_SERVER_SHARE_PRINTERS : aliased constant String := "_share_printers" & ASCII.NUL;  --  cups/adminutil.h:46
   CUPS_SERVER_USER_CANCEL_ANY : aliased constant String := "_user_cancel_any" & ASCII.NUL;  --  cups/adminutil.h:47

   function cupsAdminExportSamba
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : access Interfaces.C_Streams.FILEs) return int;  -- cups/adminutil.h:54
   pragma Import (C, cupsAdminExportSamba, "cupsAdminExportSamba");

   function cupsAdminCreateWindowsPPD
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int) return Interfaces.C.Strings.chars_ptr;  -- cups/adminutil.h:59
   pragma Import (C, cupsAdminCreateWindowsPPD, "cupsAdminCreateWindowsPPD");

   function cupsAdminGetServerSettings
     (arg1 : System.Address;
      arg2 : access int;
      arg3 : System.Address) return int;  -- cups/adminutil.h:63
   pragma Import (C, cupsAdminGetServerSettings, "cupsAdminGetServerSettings");

   function cupsAdminSetServerSettings
     (arg1 : System.Address;
      arg2 : int;
      arg3 : access libCUPS.cups_cups_h.cups_option_t) return int;  -- cups/adminutil.h:67
   pragma Import (C, cupsAdminSetServerSettings, "cupsAdminSetServerSettings");

end libCUPS.cups_adminutil_h;
