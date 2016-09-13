pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

with System;

package libCUPS.cups_pwg_h is

   --  arg-macro: function PWG_FROM_POINTS (int)(((n) * 2540 + 36) / 72
   --    return int)(((n) * 2540 + 36) / 72;
   --  arg-macro: function PWG_TO_POINTS ((n) * 72.0 / 2540.0
   --    return (n) * 72.0 / 2540.0;
  -- * "$Id: pwg.h 4274 2013-04-09 20:10:23Z msweet $"
  -- *
  -- *   PWG media API definitions for CUPS.
  -- *
  -- *   Copyright 2009-2013 by Apple Inc.
  -- *
  -- *   These coded instructions, statements, and computer programs are the
  -- *   property of Apple Inc. and are protected by Federal copyright
  -- *   law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- *   which should have been included with this file.  If this file is
  -- *   file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- *   This file is subject to the Apple OS-Developed Software exception.
  --  

  -- * C++ magic...
  --  

  -- * Macros...
  --  

  -- Convert from points to hundredths of millimeters  
  -- Convert from hundredths of millimeters to points  
  -- * Types and structures...
  --  

  --*** Map element - PPD to/from PWG  
  -- PWG media keyword  
   type pwg_map_s is record
      pwg : Interfaces.C.Strings.chars_ptr;  -- cups/pwg.h:46
      ppd : Interfaces.C.Strings.chars_ptr;  -- cups/pwg.h:47
   end record;
   pragma Convention (C_Pass_By_Copy, pwg_map_s);  -- cups/pwg.h:44

  -- PPD option keyword  
   subtype pwg_map_t is pwg_map_s;

  --*** Common media size data *** 
  -- PWG 5101.1 "self describing" name  
   type pwg_media_s is record
      pwg : Interfaces.C.Strings.chars_ptr;  -- cups/pwg.h:52
      legacy : Interfaces.C.Strings.chars_ptr;  -- cups/pwg.h:53
      ppd : Interfaces.C.Strings.chars_ptr;  -- cups/pwg.h:54
      width : aliased int;  -- cups/pwg.h:55
      length : aliased int;  -- cups/pwg.h:56
   end record;
   pragma Convention (C_Pass_By_Copy, pwg_media_s);  -- cups/pwg.h:50

  -- IPP/ISO legacy name  
  -- Standard Adobe PPD name  
  -- Width in 2540ths  
  -- Length in 2540ths  
   subtype pwg_media_t is pwg_media_s;

  --*** Size element - PPD to/from PWG  
  -- Map element  
   type pwg_size_s is record
      map : aliased pwg_map_t;  -- cups/pwg.h:61
      width : aliased int;  -- cups/pwg.h:62
      length : aliased int;  -- cups/pwg.h:63
      left : aliased int;  -- cups/pwg.h:64
      bottom : aliased int;  -- cups/pwg.h:65
      right : aliased int;  -- cups/pwg.h:66
      top : aliased int;  -- cups/pwg.h:67
   end record;
   pragma Convention (C_Pass_By_Copy, pwg_size_s);  -- cups/pwg.h:59

  -- Width in 2540ths  
  -- Length in 2540ths  
  -- Left margin in 2540ths  
  -- Bottom margin in 2540ths  
  -- Right margin in 2540ths  
  -- Top margin in 2540ths  
   subtype pwg_size_t is pwg_size_s;

  -- * Functions...
  --  

  -- * "$Id: pwg.h 4274 2013-04-09 20:10:23Z msweet $"
  -- *
  -- *   PWG media API definitions for CUPS.
  -- *
  -- *   Copyright 2009-2013 by Apple Inc.
  -- *
  -- *   These coded instructions, statements, and computer programs are the
  -- *   property of Apple Inc. and are protected by Federal copyright
  -- *   law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- *   which should have been included with this file.  If this file is
  -- *   file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- *   This file is subject to the Apple OS-Developed Software exception.
  --  

   function pwgFormatSizeName
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : size_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : int;
      arg6 : int;
      arg7 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/pwg.h:75
   pragma Import (C, pwgFormatSizeName, "pwgFormatSizeName");

   function pwgInitSize
     (arg1 : access pwg_size_t;
      arg2 : System.Address;
      arg3 : access int) return int;  -- cups/pwg.h:79
   pragma Import (C, pwgInitSize, "pwgInitSize");

   function pwgMediaForLegacy (arg1 : Interfaces.C.Strings.chars_ptr) return access pwg_media_t;  -- cups/pwg.h:81
   pragma Import (C, pwgMediaForLegacy, "pwgMediaForLegacy");

   function pwgMediaForPPD (arg1 : Interfaces.C.Strings.chars_ptr) return access pwg_media_t;  -- cups/pwg.h:82
   pragma Import (C, pwgMediaForPPD, "pwgMediaForPPD");

   function pwgMediaForPWG (arg1 : Interfaces.C.Strings.chars_ptr) return access pwg_media_t;  -- cups/pwg.h:83
   pragma Import (C, pwgMediaForPWG, "pwgMediaForPWG");

   function pwgMediaForSize (arg1 : int; arg2 : int) return access pwg_media_t;  -- cups/pwg.h:84
   pragma Import (C, pwgMediaForSize, "pwgMediaForSize");

end libCUPS.cups_pwg_h;
