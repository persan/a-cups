pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with libCUPS.cups_language_h;

package libCUPS.cups_transcode_h is

   CUPS_MAX_USTRING : constant := 8192;  --  cups/transcode.h:36

  -- * "$Id: transcode.h 10996 2013-05-29 11:51:34Z msweet $"
  -- *
  -- *   Transcoding definitions for CUPS.
  -- *
  -- *   Copyright 2007-2011 by Apple Inc.
  -- *   Copyright 1997-2006 by Easy Software Products.
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

  -- * Constants...
  --  

  -- * Types...
  --  

  -- UTF-8 Unicode/ISO-10646 unit  
   subtype cups_utf8_t is unsigned_char;  -- cups/transcode.h:43

  -- UTF-32 Unicode/ISO-10646 unit  
   subtype cups_utf32_t is unsigned_long;  -- cups/transcode.h:44

  -- UCS-2 Unicode/ISO-10646 unit  
   subtype cups_ucs2_t is unsigned_short;  -- cups/transcode.h:45

  -- UCS-4 Unicode/ISO-10646 unit  
   subtype cups_ucs4_t is unsigned_long;  -- cups/transcode.h:46

  -- SBCS Legacy 8-bit unit  
   subtype cups_sbcs_t is unsigned_char;  -- cups/transcode.h:47

  -- DBCS Legacy 16-bit unit  
   subtype cups_dbcs_t is unsigned_short;  -- cups/transcode.h:48

  -- VBCS Legacy 32-bit unit  
   subtype cups_vbcs_t is unsigned_long;  -- cups/transcode.h:49

  -- EUC uses 8, 16, 24, 32-bit  
  -- * Prototypes...
  --  

   function cupsCharsetToUTF8
     (dest : access cups_utf8_t;
      src : Interfaces.C.Strings.chars_ptr;
      maxout : int;
      encoding : libCUPS.cups_language_h.cups_encoding_t) return int;  -- cups/transcode.h:57
   pragma Import (C, cupsCharsetToUTF8, "cupsCharsetToUTF8");

   function cupsUTF8ToCharset
     (dest : Interfaces.C.Strings.chars_ptr;
      src : access cups_utf8_t;
      maxout : int;
      encoding : libCUPS.cups_language_h.cups_encoding_t) return int;  -- cups/transcode.h:61
   pragma Import (C, cupsUTF8ToCharset, "cupsUTF8ToCharset");

   function cupsUTF8ToUTF32
     (dest : access cups_utf32_t;
      src : access cups_utf8_t;
      maxout : int) return int;  -- cups/transcode.h:65
   pragma Import (C, cupsUTF8ToUTF32, "cupsUTF8ToUTF32");

   function cupsUTF32ToUTF8
     (dest : access cups_utf8_t;
      src : access cups_utf32_t;
      maxout : int) return int;  -- cups/transcode.h:68
   pragma Import (C, cupsUTF32ToUTF8, "cupsUTF32ToUTF8");

  -- * End of "$Id: transcode.h 10996 2013-05-29 11:51:34Z msweet $"
  --  

end libCUPS.cups_transcode_h;
