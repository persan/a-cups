pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package libCUPS.cups_backend_h is

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

   subtype cups_backend_t is cups_backend_e;

   function cupsBackendDeviceURI (arg1 : System.Address) return Interfaces.C.Strings.chars_ptr;  -- cups/backend.h:60
   pragma Import (C, cupsBackendDeviceURI, "cupsBackendDeviceURI");

   procedure cupsBackendReport
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : Interfaces.C.Strings.chars_ptr);  -- cups/backend.h:61
   pragma Import (C, cupsBackendReport, "cupsBackendReport");

end libCUPS.cups_backend_h;
