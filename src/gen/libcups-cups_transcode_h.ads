pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with libCUPS.cups_language_h;

package libCUPS.cups_transcode_h is

   CUPS_MAX_USTRING : constant := 8192;  --  cups/transcode.h:36

   subtype cups_utf8_t is unsigned_char;  -- cups/transcode.h:43

   subtype cups_utf32_t is unsigned_long;  -- cups/transcode.h:44

   subtype cups_ucs2_t is unsigned_short;  -- cups/transcode.h:45

   subtype cups_ucs4_t is unsigned_long;  -- cups/transcode.h:46

   subtype cups_sbcs_t is unsigned_char;  -- cups/transcode.h:47

   subtype cups_dbcs_t is unsigned_short;  -- cups/transcode.h:48

   subtype cups_vbcs_t is unsigned_long;  -- cups/transcode.h:49

   function cupsCharsetToUTF8
     (arg1 : access cups_utf8_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : libCUPS.cups_language_h.cups_encoding_t) return int;  -- cups/transcode.h:57
   pragma Import (C, cupsCharsetToUTF8, "cupsCharsetToUTF8");

   function cupsUTF8ToCharset
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : access cups_utf8_t;
      arg3 : int;
      arg4 : libCUPS.cups_language_h.cups_encoding_t) return int;  -- cups/transcode.h:61
   pragma Import (C, cupsUTF8ToCharset, "cupsUTF8ToCharset");

   function cupsUTF8ToUTF32
     (arg1 : access cups_utf32_t;
      arg2 : access cups_utf8_t;
      arg3 : int) return int;  -- cups/transcode.h:65
   pragma Import (C, cupsUTF8ToUTF32, "cupsUTF8ToUTF32");

   function cupsUTF32ToUTF8
     (arg1 : access cups_utf8_t;
      arg2 : access cups_utf32_t;
      arg3 : int) return int;  -- cups/transcode.h:68
   pragma Import (C, cupsUTF32ToUTF8, "cupsUTF32ToUTF8");

end libCUPS.cups_transcode_h;
