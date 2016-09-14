pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package CUPS.cups_backend_h is

  -- * "$Id: backend.h 10996 2013-05-29 11:51:34Z msweet $"
  -- *
  -- *   Backend definitions for CUPS.
  -- *
  -- *   Copyright 2007-2011 by Apple Inc.
  -- *   Copyright 1997-2005 by Easy Software Products.
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

  --*** Backend exit codes *** 
   type cups_backend_e is 
     (CUPS_BACKEND_OK,
      CUPS_BACKEND_FAILED,
      CUPS_BACKEND_AUTH_REQUIRED,
      CUPS_BACKEND_HOLD,
      CUPS_BACKEND_STOP,
      CUPS_BACKEND_CANCEL,
      CUPS_BACKEND_RETRY,
      CUPS_BACKEND_RETRY_CURRENT);
   pragma Convention (C, cups_backend_e);  -- cups/backend.h:41

  -- Job completed successfully  
  -- Job failed, use error-policy  
  -- Job failed, authentication required  
  -- Job failed, hold job  
  -- Job failed, stop queue  
  -- Job failed, cancel job  
  -- Job failed, retry this job later  
  -- Job failed, retry this job immediately  
   subtype cups_backend_t is cups_backend_e;

  --*** Backend exit codes *** 
  -- * Prototypes...
  --  

   function cupsBackendDeviceURI (argv : System.Address) return Interfaces.C.Strings.chars_ptr;  -- cups/backend.h:60
   pragma Import (C, cupsBackendDeviceURI, "cupsBackendDeviceURI");

   procedure cupsBackendReport
     (device_scheme : Interfaces.C.Strings.chars_ptr;
      device_uri : Interfaces.C.Strings.chars_ptr;
      device_make_and_model : Interfaces.C.Strings.chars_ptr;
      device_info : Interfaces.C.Strings.chars_ptr;
      device_id : Interfaces.C.Strings.chars_ptr;
      device_location : Interfaces.C.Strings.chars_ptr);  -- cups/backend.h:61
   pragma Import (C, cupsBackendReport, "cupsBackendReport");

  -- * End of "$Id: backend.h 10996 2013-05-29 11:51:34Z msweet $".
  --  

end CUPS.cups_backend_h;
