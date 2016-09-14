pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

with CUPS.stdio_h;
with Interfaces.C_Streams;

package CUPS.cups_file_h is

   CUPS_FILE_NONE : constant := 0;  --  cups/file.h:54
   CUPS_FILE_GZIP : constant := 1;  --  cups/file.h:55

  -- * "$Id: file.h 11627 2014-02-20 16:15:09Z msweet $"
  -- *
  -- * Public file definitions for CUPS.
  -- *
  -- * Since stdio files max out at 256 files on many systems, we have to
  -- * write similar functions without this limit.  At the same time, using
  -- * our own file functions allows us to provide transparent support of
  -- * gzip'd print files, PPD files, etc.
  -- *
  -- * Copyright 2007-2014 by Apple Inc.
  -- * Copyright 1997-2007 by Easy Software Products, all rights reserved.
  -- *
  -- * These coded instructions, statements, and computer programs are the
  -- * property of Apple Inc. and are protected by Federal copyright
  -- * law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- * which should have been included with this file.  If this file is
  -- * file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- * This file is subject to the Apple OS-Developed Software exception.
  --  

  -- * Include necessary headers...
  --  

  -- Windows does not support the ssize_t type, so map it to off_t...  
  -- @private@  
  -- * C++ magic...
  --  

  -- * CUPS file definitions...
  --  

  -- * Types and structures...
  --  

  --*** CUPS file type *** 
   --  skipped empty struct u_cups_file_s

   --  skipped empty struct cups_file_t

  -- * Prototypes...
  --  

  -- * "$Id: file.h 11627 2014-02-20 16:15:09Z msweet $"
  -- *
  -- * Public file definitions for CUPS.
  -- *
  -- * Since stdio files max out at 256 files on many systems, we have to
  -- * write similar functions without this limit.  At the same time, using
  -- * our own file functions allows us to provide transparent support of
  -- * gzip'd print files, PPD files, etc.
  -- *
  -- * Copyright 2007-2014 by Apple Inc.
  -- * Copyright 1997-2007 by Easy Software Products, all rights reserved.
  -- *
  -- * These coded instructions, statements, and computer programs are the
  -- * property of Apple Inc. and are protected by Federal copyright
  -- * law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- * which should have been included with this file.  If this file is
  -- * file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- * This file is subject to the Apple OS-Developed Software exception.
  --  

  -- * "$Id: file.h 11627 2014-02-20 16:15:09Z msweet $"
  -- *
  -- * Public file definitions for CUPS.
  -- *
  -- * Since stdio files max out at 256 files on many systems, we have to
  -- * write similar functions without this limit.  At the same time, using
  -- * our own file functions allows us to provide transparent support of
  -- * gzip'd print files, PPD files, etc.
  -- *
  -- * Copyright 2007-2014 by Apple Inc.
  -- * Copyright 1997-2007 by Easy Software Products, all rights reserved.
  -- *
  -- * These coded instructions, statements, and computer programs are the
  -- * property of Apple Inc. and are protected by Federal copyright
  -- * law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- * which should have been included with this file.  If this file is
  -- * file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- * This file is subject to the Apple OS-Developed Software exception.
  --  

   function cupsFileClose (fp : System.Address) return int;  -- cups/file.h:69
   pragma Import (C, cupsFileClose, "cupsFileClose");

   function cupsFileCompression (fp : System.Address) return int;  -- cups/file.h:70
   pragma Import (C, cupsFileCompression, "cupsFileCompression");

   function cupsFileEOF (fp : System.Address) return int;  -- cups/file.h:71
   pragma Import (C, cupsFileEOF, "cupsFileEOF");

   function cupsFileFind
     (filename : Interfaces.C.Strings.chars_ptr;
      path : Interfaces.C.Strings.chars_ptr;
      executable : int;
      buffer : Interfaces.C.Strings.chars_ptr;
      bufsize : int) return Interfaces.C.Strings.chars_ptr;  -- cups/file.h:72
   pragma Import (C, cupsFileFind, "cupsFileFind");

   function cupsFileFlush (fp : System.Address) return int;  -- cups/file.h:75
   pragma Import (C, cupsFileFlush, "cupsFileFlush");

   function cupsFileGetChar (fp : System.Address) return int;  -- cups/file.h:76
   pragma Import (C, cupsFileGetChar, "cupsFileGetChar");

   function cupsFileGetConf
     (fp : System.Address;
      buf : Interfaces.C.Strings.chars_ptr;
      buflen : size_t;
      value : System.Address;
      linenum : access int) return Interfaces.C.Strings.chars_ptr;  -- cups/file.h:77
   pragma Import (C, cupsFileGetConf, "cupsFileGetConf");

   function cupsFileGetLine
     (fp : System.Address;
      buf : Interfaces.C.Strings.chars_ptr;
      buflen : size_t) return size_t;  -- cups/file.h:80
   pragma Import (C, cupsFileGetLine, "cupsFileGetLine");

   function cupsFileGets
     (fp : System.Address;
      buf : Interfaces.C.Strings.chars_ptr;
      buflen : size_t) return Interfaces.C.Strings.chars_ptr;  -- cups/file.h:82
   pragma Import (C, cupsFileGets, "cupsFileGets");

   function cupsFileLock (fp : System.Address; block : int) return int;  -- cups/file.h:84
   pragma Import (C, cupsFileLock, "cupsFileLock");

   function cupsFileNumber (fp : System.Address) return int;  -- cups/file.h:85
   pragma Import (C, cupsFileNumber, "cupsFileNumber");

   function cupsFileOpen (filename : Interfaces.C.Strings.chars_ptr; mode : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/file.h:86
   pragma Import (C, cupsFileOpen, "cupsFileOpen");

   function cupsFileOpenFd (fd : int; mode : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/file.h:88
   pragma Import (C, cupsFileOpenFd, "cupsFileOpenFd");

   function cupsFilePeekChar (fp : System.Address) return int;  -- cups/file.h:89
   pragma Import (C, cupsFilePeekChar, "cupsFilePeekChar");

   function cupsFilePrintf (fp : System.Address; format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- cups/file.h:90
   pragma Import (C, cupsFilePrintf, "cupsFilePrintf");

   function cupsFilePutChar (fp : System.Address; c : int) return int;  -- cups/file.h:93
   pragma Import (C, cupsFilePutChar, "cupsFilePutChar");

   function cupsFilePutConf
     (fp : System.Address;
      directive : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr) return size_t;  -- cups/file.h:94
   pragma Import (C, cupsFilePutConf, "cupsFilePutConf");

   function cupsFilePuts (fp : System.Address; s : Interfaces.C.Strings.chars_ptr) return int;  -- cups/file.h:96
   pragma Import (C, cupsFilePuts, "cupsFilePuts");

   function cupsFileRead
     (fp : System.Address;
      buf : Interfaces.C.Strings.chars_ptr;
      bytes : size_t) return size_t;  -- cups/file.h:98
   pragma Import (C, cupsFileRead, "cupsFileRead");

   function cupsFileRewind (fp : System.Address) return CUPS.stdio_h.off_t;  -- cups/file.h:100
   pragma Import (C, cupsFileRewind, "cupsFileRewind");

   function cupsFileSeek (fp : System.Address; pos : CUPS.stdio_h.off_t) return CUPS.stdio_h.off_t;  -- cups/file.h:101
   pragma Import (C, cupsFileSeek, "cupsFileSeek");

   function cupsFileStderr return System.Address;  -- cups/file.h:102
   pragma Import (C, cupsFileStderr, "cupsFileStderr");

   function cupsFileStdin return System.Address;  -- cups/file.h:103
   pragma Import (C, cupsFileStdin, "cupsFileStdin");

   function cupsFileStdout return System.Address;  -- cups/file.h:104
   pragma Import (C, cupsFileStdout, "cupsFileStdout");

   function cupsFileTell (fp : System.Address) return CUPS.stdio_h.off_t;  -- cups/file.h:105
   pragma Import (C, cupsFileTell, "cupsFileTell");

   function cupsFileUnlock (fp : System.Address) return int;  -- cups/file.h:106
   pragma Import (C, cupsFileUnlock, "cupsFileUnlock");

   function cupsFileWrite
     (fp : System.Address;
      buf : Interfaces.C.Strings.chars_ptr;
      bytes : size_t) return size_t;  -- cups/file.h:107
   pragma Import (C, cupsFileWrite, "cupsFileWrite");

  -- * End of "$Id: file.h 11627 2014-02-20 16:15:09Z msweet $".
  --  

end CUPS.cups_file_h;
