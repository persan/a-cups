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

  -- * "$Id: adminutil.h 10996 2013-05-29 11:51:34Z msweet $"
  -- *
  -- *   Administration utility API definitions for CUPS.
  -- *
  -- *   Copyright 2007-2012 by Apple Inc.
  -- *   Copyright 2001-2007 by Easy Software Products.
  -- *
  -- *   These coded instructions, statements, and computer programs are the
  -- *   property of Apple Inc. and are protected by Federal copyright
  -- *   law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- *   which should have been included with this file.  If this file is
  -- *   file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- *   This file is subject to the Apple OS-Developed Software exception.
  --  

  -- * Include necessary headers...
  --  

  -- * C++ magic...
  --  

  -- * Constants...
  --  

  --#  define CUPS_SERVER_REMOTE_PRINTERS	"_remote_printers" 
  -- * Functions...
  --  

   function cupsAdminExportSamba
     (dest : Interfaces.C.Strings.chars_ptr;
      ppd : Interfaces.C.Strings.chars_ptr;
      samba_server : Interfaces.C.Strings.chars_ptr;
      samba_user : Interfaces.C.Strings.chars_ptr;
      samba_password : Interfaces.C.Strings.chars_ptr;
      logfile : access Interfaces.C_Streams.FILEs) return int;  -- cups/adminutil.h:54
   pragma Import (C, cupsAdminExportSamba, "cupsAdminExportSamba");

   function cupsAdminCreateWindowsPPD
     (http : System.Address;
      dest : Interfaces.C.Strings.chars_ptr;
      buffer : Interfaces.C.Strings.chars_ptr;
      bufsize : int) return Interfaces.C.Strings.chars_ptr;  -- cups/adminutil.h:59
   pragma Import (C, cupsAdminCreateWindowsPPD, "cupsAdminCreateWindowsPPD");

   function cupsAdminGetServerSettings
     (http : System.Address;
      num_settings : access int;
      settings : System.Address) return int;  -- cups/adminutil.h:63
   pragma Import (C, cupsAdminGetServerSettings, "cupsAdminGetServerSettings");

   function cupsAdminSetServerSettings
     (http : System.Address;
      num_settings : int;
      settings : access libCUPS.cups_cups_h.cups_option_t) return int;  -- cups/adminutil.h:67
   pragma Import (C, cupsAdminSetServerSettings, "cupsAdminSetServerSettings");

  -- * End of "$Id: adminutil.h 10996 2013-05-29 11:51:34Z msweet $".
  --  

end libCUPS.cups_adminutil_h;
