pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with CUPS.cups_ipp_h;
with CUPS.time_h;
with System;
with CUPS.cups_http_h;

with CUPS.stdio_h;
with Interfaces.C_Streams;
with CUPS.cups_language_h;

package CUPS.cups_cups_h is

   CUPS_VERSION : constant := 2.0104;  --  cups/cups.h:61
   CUPS_VERSION_MAJOR : constant := 2;  --  cups/cups.h:62
   CUPS_VERSION_MINOR : constant := 1;  --  cups/cups.h:63
   CUPS_VERSION_PATCH : constant := 4;  --  cups/cups.h:64

   CUPS_BC_FD : constant := 3;  --  cups/cups.h:66
   --  unsupported macro: CUPS_DATE_ANY (time_t)-1
   --  unsupported macro: CUPS_EXCLUDE_NONE (const char *)0

   CUPS_FORMAT_AUTO : aliased constant String := "application/octet-stream" & ASCII.NUL;  --  cups/cups.h:71
   CUPS_FORMAT_COMMAND : aliased constant String := "application/vnd.cups-command" & ASCII.NUL;  --  cups/cups.h:72
   CUPS_FORMAT_JPEG : aliased constant String := "image/jpeg" & ASCII.NUL;  --  cups/cups.h:73
   CUPS_FORMAT_PDF : aliased constant String := "application/pdf" & ASCII.NUL;  --  cups/cups.h:74
   CUPS_FORMAT_POSTSCRIPT : aliased constant String := "application/postscript" & ASCII.NUL;  --  cups/cups.h:75
   CUPS_FORMAT_RAW : aliased constant String := "application/vnd.cups-raw" & ASCII.NUL;  --  cups/cups.h:76
   CUPS_FORMAT_TEXT : aliased constant String := "text/plain" & ASCII.NUL;  --  cups/cups.h:77
   --  unsupported macro: CUPS_HTTP_DEFAULT (http_t *)0
   --  unsupported macro: CUPS_INCLUDE_ALL (const char *)0

   CUPS_JOBID_ALL : constant := -1;  --  cups/cups.h:80
   CUPS_JOBID_CURRENT : constant := 0;  --  cups/cups.h:81
   --  unsupported macro: CUPS_LENGTH_VARIABLE (ssize_t)0

   CUPS_TIMEOUT_DEFAULT : constant := 0;  --  cups/cups.h:83
   CUPS_WHICHJOBS_ALL : constant := -1;  --  cups/cups.h:84
   CUPS_WHICHJOBS_ACTIVE : constant := 0;  --  cups/cups.h:85
   CUPS_WHICHJOBS_COMPLETED : constant := 1;  --  cups/cups.h:86

   CUPS_DEST_FLAGS_NONE : constant := 16#00#;  --  cups/cups.h:89

   CUPS_DEST_FLAGS_UNCONNECTED : constant := 16#01#;  --  cups/cups.h:91

   CUPS_DEST_FLAGS_MORE : constant := 16#02#;  --  cups/cups.h:93

   CUPS_DEST_FLAGS_REMOVED : constant := 16#04#;  --  cups/cups.h:95

   CUPS_DEST_FLAGS_ERROR : constant := 16#08#;  --  cups/cups.h:97

   CUPS_DEST_FLAGS_RESOLVING : constant := 16#10#;  --  cups/cups.h:99

   CUPS_DEST_FLAGS_CONNECTING : constant := 16#20#;  --  cups/cups.h:102

   CUPS_DEST_FLAGS_CANCELED : constant := 16#40#;  --  cups/cups.h:104

   CUPS_MEDIA_FLAGS_DEFAULT : constant := 16#00#;  --  cups/cups.h:108

   CUPS_MEDIA_FLAGS_BORDERLESS : constant := 16#01#;  --  cups/cups.h:111

   CUPS_MEDIA_FLAGS_DUPLEX : constant := 16#02#;  --  cups/cups.h:113

   CUPS_MEDIA_FLAGS_EXACT : constant := 16#04#;  --  cups/cups.h:116

   CUPS_MEDIA_FLAGS_READY : constant := 16#08#;  --  cups/cups.h:118

   CUPS_COPIES : aliased constant String := "copies" & ASCII.NUL;  --  cups/cups.h:124
   CUPS_COPIES_SUPPORTED : aliased constant String := "copies-supported" & ASCII.NUL;  --  cups/cups.h:125

   CUPS_FINISHINGS : aliased constant String := "finishings" & ASCII.NUL;  --  cups/cups.h:127
   CUPS_FINISHINGS_SUPPORTED : aliased constant String := "finishings-supported" & ASCII.NUL;  --  cups/cups.h:128

   CUPS_FINISHINGS_BIND : aliased constant String := "7" & ASCII.NUL;  --  cups/cups.h:130
   CUPS_FINISHINGS_COVER : aliased constant String := "6" & ASCII.NUL;  --  cups/cups.h:131
   CUPS_FINISHINGS_FOLD : aliased constant String := "10" & ASCII.NUL;  --  cups/cups.h:132
   CUPS_FINISHINGS_NONE : aliased constant String := "3" & ASCII.NUL;  --  cups/cups.h:133
   CUPS_FINISHINGS_PUNCH : aliased constant String := "5" & ASCII.NUL;  --  cups/cups.h:134
   CUPS_FINISHINGS_STAPLE : aliased constant String := "4" & ASCII.NUL;  --  cups/cups.h:135
   CUPS_FINISHINGS_TRIM : aliased constant String := "11" & ASCII.NUL;  --  cups/cups.h:136

   CUPS_MEDIA : aliased constant String := "media" & ASCII.NUL;  --  cups/cups.h:138
   CUPS_MEDIA_READY : aliased constant String := "media-ready" & ASCII.NUL;  --  cups/cups.h:139
   CUPS_MEDIA_SUPPORTED : aliased constant String := "media-supported" & ASCII.NUL;  --  cups/cups.h:140

   CUPS_MEDIA_3X5 : aliased constant String := "na_index-3x5_3x5in" & ASCII.NUL;  --  cups/cups.h:142
   CUPS_MEDIA_4X6 : aliased constant String := "na_index-4x6_4x6in" & ASCII.NUL;  --  cups/cups.h:143
   CUPS_MEDIA_5X7 : aliased constant String := "na_5x7_5x7in" & ASCII.NUL;  --  cups/cups.h:144
   CUPS_MEDIA_8X10 : aliased constant String := "na_govt-letter_8x10in" & ASCII.NUL;  --  cups/cups.h:145
   CUPS_MEDIA_A3 : aliased constant String := "iso_a3_297x420mm" & ASCII.NUL;  --  cups/cups.h:146
   CUPS_MEDIA_A4 : aliased constant String := "iso_a4_210x297mm" & ASCII.NUL;  --  cups/cups.h:147
   CUPS_MEDIA_A5 : aliased constant String := "iso_a5_148x210mm" & ASCII.NUL;  --  cups/cups.h:148
   CUPS_MEDIA_A6 : aliased constant String := "iso_a6_105x148mm" & ASCII.NUL;  --  cups/cups.h:149
   CUPS_MEDIA_ENV10 : aliased constant String := "na_number-10_4.125x9.5in" & ASCII.NUL;  --  cups/cups.h:150
   CUPS_MEDIA_ENVDL : aliased constant String := "iso_dl_110x220mm" & ASCII.NUL;  --  cups/cups.h:151
   CUPS_MEDIA_LEGAL : aliased constant String := "na_legal_8.5x14in" & ASCII.NUL;  --  cups/cups.h:152
   CUPS_MEDIA_LETTER : aliased constant String := "na_letter_8.5x11in" & ASCII.NUL;  --  cups/cups.h:153
   CUPS_MEDIA_PHOTO_L : aliased constant String := "oe_photo-l_3.5x5in" & ASCII.NUL;  --  cups/cups.h:154
   CUPS_MEDIA_SUPERBA3 : aliased constant String := "na_super-b_13x19in" & ASCII.NUL;  --  cups/cups.h:155
   CUPS_MEDIA_TABLOID : aliased constant String := "na_ledger_11x17in" & ASCII.NUL;  --  cups/cups.h:156

   CUPS_MEDIA_SOURCE : aliased constant String := "media-source" & ASCII.NUL;  --  cups/cups.h:158
   CUPS_MEDIA_SOURCE_SUPPORTED : aliased constant String := "media-source-supported" & ASCII.NUL;  --  cups/cups.h:159

   CUPS_MEDIA_SOURCE_AUTO : aliased constant String := "auto" & ASCII.NUL;  --  cups/cups.h:161
   CUPS_MEDIA_SOURCE_MANUAL : aliased constant String := "manual" & ASCII.NUL;  --  cups/cups.h:162

   CUPS_MEDIA_TYPE : aliased constant String := "media-type" & ASCII.NUL;  --  cups/cups.h:164
   CUPS_MEDIA_TYPE_SUPPORTED : aliased constant String := "media-type-supported" & ASCII.NUL;  --  cups/cups.h:165

   CUPS_MEDIA_TYPE_AUTO : aliased constant String := "auto" & ASCII.NUL;  --  cups/cups.h:167
   CUPS_MEDIA_TYPE_ENVELOPE : aliased constant String := "envelope" & ASCII.NUL;  --  cups/cups.h:168
   CUPS_MEDIA_TYPE_LABELS : aliased constant String := "labels" & ASCII.NUL;  --  cups/cups.h:169
   CUPS_MEDIA_TYPE_LETTERHEAD : aliased constant String := "stationery-letterhead" & ASCII.NUL;  --  cups/cups.h:170
   CUPS_MEDIA_TYPE_PHOTO : aliased constant String := "photographic" & ASCII.NUL;  --  cups/cups.h:171
   CUPS_MEDIA_TYPE_PHOTO_GLOSSY : aliased constant String := "photographic-glossy" & ASCII.NUL;  --  cups/cups.h:172
   CUPS_MEDIA_TYPE_PHOTO_MATTE : aliased constant String := "photographic-matte" & ASCII.NUL;  --  cups/cups.h:173
   CUPS_MEDIA_TYPE_PLAIN : aliased constant String := "stationery" & ASCII.NUL;  --  cups/cups.h:174
   CUPS_MEDIA_TYPE_TRANSPARENCY : aliased constant String := "transparency" & ASCII.NUL;  --  cups/cups.h:175

   CUPS_NUMBER_UP : aliased constant String := "number-up" & ASCII.NUL;  --  cups/cups.h:177
   CUPS_NUMBER_UP_SUPPORTED : aliased constant String := "number-up-supported" & ASCII.NUL;  --  cups/cups.h:178

   CUPS_ORIENTATION : aliased constant String := "orientation-requested" & ASCII.NUL;  --  cups/cups.h:180
   CUPS_ORIENTATION_SUPPORTED : aliased constant String := "orientation-requested-supported" & ASCII.NUL;  --  cups/cups.h:181

   CUPS_ORIENTATION_PORTRAIT : aliased constant String := "3" & ASCII.NUL;  --  cups/cups.h:183
   CUPS_ORIENTATION_LANDSCAPE : aliased constant String := "4" & ASCII.NUL;  --  cups/cups.h:184

   CUPS_PRINT_COLOR_MODE : aliased constant String := "print-color-mode" & ASCII.NUL;  --  cups/cups.h:186
   CUPS_PRINT_COLOR_MODE_SUPPORTED : aliased constant String := "print-color-mode-supported" & ASCII.NUL;  --  cups/cups.h:187

   CUPS_PRINT_COLOR_MODE_AUTO : aliased constant String := "auto" & ASCII.NUL;  --  cups/cups.h:189
   CUPS_PRINT_COLOR_MODE_MONOCHROME : aliased constant String := "monochrome" & ASCII.NUL;  --  cups/cups.h:190
   CUPS_PRINT_COLOR_MODE_COLOR : aliased constant String := "color" & ASCII.NUL;  --  cups/cups.h:191

   CUPS_PRINT_QUALITY : aliased constant String := "print-quality" & ASCII.NUL;  --  cups/cups.h:193
   CUPS_PRINT_QUALITY_SUPPORTED : aliased constant String := "print-quality-supported" & ASCII.NUL;  --  cups/cups.h:194

   CUPS_PRINT_QUALITY_DRAFT : aliased constant String := "3" & ASCII.NUL;  --  cups/cups.h:196
   CUPS_PRINT_QUALITY_NORMAL : aliased constant String := "4" & ASCII.NUL;  --  cups/cups.h:197
   CUPS_PRINT_QUALITY_HIGH : aliased constant String := "5" & ASCII.NUL;  --  cups/cups.h:198

   CUPS_SIDES : aliased constant String := "sides" & ASCII.NUL;  --  cups/cups.h:200
   CUPS_SIDES_SUPPORTED : aliased constant String := "sides-supported" & ASCII.NUL;  --  cups/cups.h:201

   CUPS_SIDES_ONE_SIDED : aliased constant String := "one-sided" & ASCII.NUL;  --  cups/cups.h:203
   CUPS_SIDES_TWO_SIDED_PORTRAIT : aliased constant String := "two-sided-long-edge" & ASCII.NUL;  --  cups/cups.h:204
   CUPS_SIDES_TWO_SIDED_LANDSCAPE : aliased constant String := "two-sided-short-edge" & ASCII.NUL;  --  cups/cups.h:205

  -- * "$Id: cups.h 13087 2016-02-12 18:53:24Z msweet $"
  -- *
  -- * API definitions for CUPS.
  -- *
  -- * Copyright 2007-2016 by Apple Inc.
  -- * Copyright 1997-2007 by Easy Software Products.
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
  -- * Define _PPD_DEPRECATED to silence the warnings about PPD functions being
  -- * deprecated...
  --  

  -- * C++ magic...
  --  

  -- * Constants...
  --  

  -- Back-channel file descriptor for
  --					 * select/poll  

  -- Flags for cupsConnectDest and cupsEnumDests  
  -- No flags are set  
  -- There is not connection  
  -- There are more destinations  
  -- The destination has gone away  
  -- An error occurred  
  -- The destination address is being
  --					 * resolved  

  -- A connection is being established  
  -- Operation was canceled  
  -- Flags for cupsGetDestMediaByName/Size  
  -- Find the closest size supported by
  --					 * the printer  

  -- Find a borderless size  
  -- Find a size compatible with 2-sided
  --					 * printing  

  -- Find an exact match for the size  
  -- If the printer supports media
  --					 * sensing, find the size amongst the
  --					 * "ready" media.  

  -- Options and values  
  -- * Types and structures...
  --  

  -- Printer type/capability bits  
   subtype cups_ptype_t is unsigned;  -- cups/cups.h:212

  -- Printer type/capability bit
  --					 * constants  

   subtype cups_ptype_e is unsigned;
   CUPS_PRINTER_LOCAL : constant cups_ptype_e := 0;
   CUPS_PRINTER_CLASS : constant cups_ptype_e := 1;
   CUPS_PRINTER_REMOTE : constant cups_ptype_e := 2;
   CUPS_PRINTER_BW : constant cups_ptype_e := 4;
   CUPS_PRINTER_COLOR : constant cups_ptype_e := 8;
   CUPS_PRINTER_DUPLEX : constant cups_ptype_e := 16;
   CUPS_PRINTER_STAPLE : constant cups_ptype_e := 32;
   CUPS_PRINTER_COPIES : constant cups_ptype_e := 64;
   CUPS_PRINTER_COLLATE : constant cups_ptype_e := 128;
   CUPS_PRINTER_PUNCH : constant cups_ptype_e := 256;
   CUPS_PRINTER_COVER : constant cups_ptype_e := 512;
   CUPS_PRINTER_BIND : constant cups_ptype_e := 1024;
   CUPS_PRINTER_SORT : constant cups_ptype_e := 2048;
   CUPS_PRINTER_SMALL : constant cups_ptype_e := 4096;
   CUPS_PRINTER_MEDIUM : constant cups_ptype_e := 8192;
   CUPS_PRINTER_LARGE : constant cups_ptype_e := 16384;
   CUPS_PRINTER_VARIABLE : constant cups_ptype_e := 32768;
   CUPS_PRINTER_IMPLICIT : constant cups_ptype_e := 65536;
   CUPS_PRINTER_DEFAULT : constant cups_ptype_e := 131072;
   CUPS_PRINTER_FAX : constant cups_ptype_e := 262144;
   CUPS_PRINTER_REJECTING : constant cups_ptype_e := 524288;
   CUPS_PRINTER_DELETE : constant cups_ptype_e := 1048576;
   CUPS_PRINTER_NOT_SHARED : constant cups_ptype_e := 2097152;
   CUPS_PRINTER_AUTHENTICATED : constant cups_ptype_e := 4194304;
   CUPS_PRINTER_COMMANDS : constant cups_ptype_e := 8388608;
   CUPS_PRINTER_DISCOVERED : constant cups_ptype_e := 16777216;
   CUPS_PRINTER_SCANNER : constant cups_ptype_e := 33554432;
   CUPS_PRINTER_MFP : constant cups_ptype_e := 67108864;
   CUPS_PRINTER_3D : constant cups_ptype_e := 134217728;
   CUPS_PRINTER_OPTIONS : constant cups_ptype_e := 458748;  -- cups/cups.h:213

  -- Not a typedef'd enum so we can OR  
  -- Local printer or class  
  -- Printer class  
  -- Remote printer or class  
  -- Can do B&W printing  
  -- Can do color printing  
  -- Can do duplexing  
  -- Can staple output  
  -- Can do copies  
  -- Can collage copies  
  -- Can punch output  
  -- Can cover output  
  -- Can bind output  
  -- Can sort output  
  -- Can do Letter/Legal/A4  
  -- Can do Tabloid/B/C/A3/A2  
  -- Can do D/E/A1/A0  
  -- Can do variable sizes  
  -- Implicit class @private@
  --					 * @since Deprecated@  

  -- Default printer on network  
  -- Fax queue  
  -- Printer is rejecting jobs  
  -- Delete printer
  --					 * @since CUPS 1.2/OS X 10.5@  

  -- Printer is not shared
  --					 * @since CUPS 1.2/OS X 10.5@  

  -- Printer requires authentication
  --					 * @since CUPS 1.2/OS X 10.5@  

  -- Printer supports maintenance commands
  --					 * @since CUPS 1.2/OS X 10.5@  

  -- Printer was automatically discovered
  --					 * and added @private@
  --					 * @since Deprecated@  

  -- Scanner-only device
  --					 * @since CUPS 1.4/OS X 10.6@  

  -- Printer with scanning capabilities
  --					 * @since CUPS 1.4/OS X 10.6@  

  -- 3D Printing @since CUPS 2.1@  
  -- ~(CLASS | REMOTE | IMPLICIT |
  --					 * DEFAULT | FAX | REJECTING | DELETE |
  --					 * NOT_SHARED | AUTHENTICATED |
  --					 * COMMANDS | DISCOVERED) @private@  

  --*** Printer Options *** 
  -- Name of option  
   type cups_option_s is record
      name : Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:262
      value : Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:263
   end record;
   pragma Convention (C_Pass_By_Copy, cups_option_s);  -- cups/cups.h:260

  -- Value of option  
   subtype cups_option_t is cups_option_s;

  --*** Destination *** 
  -- Printer or class name  
   type cups_dest_s is record
      name : Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:268
      instance : Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:269
      is_default : aliased int;  -- cups/cups.h:270
      num_options : aliased int;  -- cups/cups.h:271
      options : access cups_option_t;  -- cups/cups.h:272
   end record;
   pragma Convention (C_Pass_By_Copy, cups_dest_s);  -- cups/cups.h:266

  -- Local instance name or NULL  
  -- Is this printer the default?  
  -- Number of options  
  -- Options  
   subtype cups_dest_t is cups_dest_s;

   --  skipped empty struct u_cups_dinfo_s

   --  skipped empty struct cups_dinfo_t

  -- Destination capability and status
  --					 * information @since CUPS 1.6/OS X 10.8@  

  --*** Job *** 
  -- The job ID  
   type cups_job_s is record
      id : aliased int;  -- cups/cups.h:281
      dest : Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:282
      title : Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:283
      user : Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:284
      format : Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:285
      state : aliased CUPS.cups_ipp_h.ipp_jstate_t;  -- cups/cups.h:286
      size : aliased int;  -- cups/cups.h:287
      priority : aliased int;  -- cups/cups.h:288
      completed_time : aliased CUPS.time_h.time_t;  -- cups/cups.h:289
      creation_time : aliased CUPS.time_h.time_t;  -- cups/cups.h:290
      processing_time : aliased CUPS.time_h.time_t;  -- cups/cups.h:291
   end record;
   pragma Convention (C_Pass_By_Copy, cups_job_s);  -- cups/cups.h:279

  -- Printer or class name  
  -- Title/job name  
  -- User the submitted the job  
  -- Document format  
  -- Job state  
  -- Size in kilobytes  
  -- Priority (1-100)  
  -- Time the job was completed  
  -- Time the job was created  
  -- Time the job was processed  
   subtype cups_job_t is cups_job_s;

  --*** Media Size @since CUPS 1.6/OS X 10.8@ *** 
  -- Media name to use  
   subtype cups_size_s_media_array is Interfaces.C.char_array (0 .. 127);
   type cups_size_s is record
      media : aliased cups_size_s_media_array;  -- cups/cups.h:296
      width : aliased int;  -- cups/cups.h:297
      length : aliased int;  -- cups/cups.h:298
      bottom : aliased int;  -- cups/cups.h:300
      left : aliased int;  -- cups/cups.h:302
      right : aliased int;  -- cups/cups.h:304
      top : aliased int;  -- cups/cups.h:306
   end record;
   pragma Convention (C_Pass_By_Copy, cups_size_s);  -- cups/cups.h:294

  -- Width in hundredths of millimeters  
  -- Length in hundredths of
  --					 * millimeters  

  -- Bottom margin in hundredths of
  --					 * millimeters  

  -- Left margin in hundredths of
  --					 * millimeters  

  -- Right margin in hundredths of
  --					 * millimeters  

  -- Top margin in hundredths of
  --					 * millimeters  

   subtype cups_size_t is cups_size_s;

   type cups_client_cert_cb_t is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : System.Address) return int;
   pragma Convention (C, cups_client_cert_cb_t);  -- cups/cups.h:310

  -- Client credentials callback
  --					 * @since CUPS 1.5/OS X 10.7@  

   type cups_dest_cb_t is access function
        (arg1 : System.Address;
         arg2 : unsigned;
         arg3 : access cups_dest_t) return int;
   pragma Convention (C, cups_dest_cb_t);  -- cups/cups.h:316

  -- Destination enumeration callback
  --					 * @since CUPS 1.6/OS X 10.8@  

  -- Destination enumeration block
  --					 * @since CUPS 1.6/OS X 10.8@  

   type cups_device_cb_t is access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : Interfaces.C.Strings.chars_ptr;
         arg5 : Interfaces.C.Strings.chars_ptr;
         arg6 : Interfaces.C.Strings.chars_ptr;
         arg7 : System.Address);
   pragma Convention (C, cups_device_cb_t);  -- cups/cups.h:327

  -- Device callback
  --					 * @since CUPS 1.4/OS X 10.6@  

   type cups_password_cb_t is access function (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;
   pragma Convention (C, cups_password_cb_t);  -- cups/cups.h:335

  -- Password callback  
   type cups_password_cb2_t is access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : System.Address;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : Interfaces.C.Strings.chars_ptr;
         arg5 : System.Address) return Interfaces.C.Strings.chars_ptr;
   pragma Convention (C, cups_password_cb2_t);  -- cups/cups.h:338

  -- New password callback
  --					 * @since CUPS 1.4/OS X 10.6@  

   type cups_server_cert_cb_t is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : System.Address) return int;
   pragma Convention (C, cups_server_cert_cb_t);  -- cups/cups.h:345

  -- Server credentials callback
  --					 * @since CUPS 1.5/OS X 10.7@  

  -- * Functions...
  --  

   function cupsCancelJob (name : Interfaces.C.Strings.chars_ptr; job_id : int) return int;  -- cups/cups.h:355
   pragma Import (C, cupsCancelJob, "cupsCancelJob");

   function cupsDoFileRequest
     (http : System.Address;
      request : System.Address;
      resource : Interfaces.C.Strings.chars_ptr;
      filename : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/cups.h:356
   pragma Import (C, cupsDoFileRequest, "cupsDoFileRequest");

   function cupsDoRequest
     (http : System.Address;
      request : System.Address;
      resource : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/cups.h:359
   pragma Import (C, cupsDoRequest, "cupsDoRequest");

   function cupsEncryption return CUPS.cups_http_h.http_encryption_t;  -- cups/cups.h:361
   pragma Import (C, cupsEncryption, "cupsEncryption");

   procedure cupsFreeJobs (num_jobs : int; jobs : access cups_job_t);  -- cups/cups.h:362
   pragma Import (C, cupsFreeJobs, "cupsFreeJobs");

   function cupsGetClasses (classes : System.Address) return int;  -- cups/cups.h:363
   pragma Import (C, cupsGetClasses, "cupsGetClasses");

   function cupsGetDefault return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:364
   pragma Import (C, cupsGetDefault, "cupsGetDefault");

   function cupsGetJobs
     (jobs : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      myjobs : int;
      whichjobs : int) return int;  -- cups/cups.h:365
   pragma Import (C, cupsGetJobs, "cupsGetJobs");

   function cupsGetPPD (name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:367
   pragma Import (C, cupsGetPPD, "cupsGetPPD");

   function cupsGetPrinters (printers : System.Address) return int;  -- cups/cups.h:368
   pragma Import (C, cupsGetPrinters, "cupsGetPrinters");

   function cupsLastError return CUPS.cups_ipp_h.ipp_status_t;  -- cups/cups.h:369
   pragma Import (C, cupsLastError, "cupsLastError");

   function cupsPrintFile
     (name : Interfaces.C.Strings.chars_ptr;
      filename : Interfaces.C.Strings.chars_ptr;
      title : Interfaces.C.Strings.chars_ptr;
      num_options : int;
      options : access cups_option_t) return int;  -- cups/cups.h:370
   pragma Import (C, cupsPrintFile, "cupsPrintFile");

   function cupsPrintFiles
     (name : Interfaces.C.Strings.chars_ptr;
      num_files : int;
      files : System.Address;
      title : Interfaces.C.Strings.chars_ptr;
      num_options : int;
      options : access cups_option_t) return int;  -- cups/cups.h:373
   pragma Import (C, cupsPrintFiles, "cupsPrintFiles");

   function cupsTempFile (filename : Interfaces.C.Strings.chars_ptr; len : int) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:376
   pragma Import (C, cupsTempFile, "cupsTempFile");

   function cupsTempFd (filename : Interfaces.C.Strings.chars_ptr; len : int) return int;  -- cups/cups.h:377
   pragma Import (C, cupsTempFd, "cupsTempFd");

   function cupsAddDest
     (name : Interfaces.C.Strings.chars_ptr;
      instance : Interfaces.C.Strings.chars_ptr;
      num_dests : int;
      dests : System.Address) return int;  -- cups/cups.h:379
   pragma Import (C, cupsAddDest, "cupsAddDest");

   procedure cupsFreeDests (num_dests : int; dests : access cups_dest_t);  -- cups/cups.h:381
   pragma Import (C, cupsFreeDests, "cupsFreeDests");

   function cupsGetDest
     (name : Interfaces.C.Strings.chars_ptr;
      instance : Interfaces.C.Strings.chars_ptr;
      num_dests : int;
      dests : access cups_dest_t) return access cups_dest_t;  -- cups/cups.h:382
   pragma Import (C, cupsGetDest, "cupsGetDest");

   function cupsGetDests (dests : System.Address) return int;  -- cups/cups.h:384
   pragma Import (C, cupsGetDests, "cupsGetDests");

   procedure cupsSetDests (num_dests : int; dests : access cups_dest_t);  -- cups/cups.h:385
   pragma Import (C, cupsSetDests, "cupsSetDests");

   function cupsAddOption
     (name : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr;
      num_options : int;
      options : System.Address) return int;  -- cups/cups.h:387
   pragma Import (C, cupsAddOption, "cupsAddOption");

   procedure cupsEncodeOptions
     (ipp : System.Address;
      num_options : int;
      options : access cups_option_t);  -- cups/cups.h:389
   pragma Import (C, cupsEncodeOptions, "cupsEncodeOptions");

   procedure cupsFreeOptions (num_options : int; options : access cups_option_t);  -- cups/cups.h:391
   pragma Import (C, cupsFreeOptions, "cupsFreeOptions");

   function cupsGetOption
     (name : Interfaces.C.Strings.chars_ptr;
      num_options : int;
      options : access cups_option_t) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:393
   pragma Import (C, cupsGetOption, "cupsGetOption");

   function cupsParseOptions
     (arg : Interfaces.C.Strings.chars_ptr;
      num_options : int;
      options : System.Address) return int;  -- cups/cups.h:395
   pragma Import (C, cupsParseOptions, "cupsParseOptions");

   function cupsGetPassword (prompt : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:398
   pragma Import (C, cupsGetPassword, "cupsGetPassword");

   function cupsServer return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:399
   pragma Import (C, cupsServer, "cupsServer");

   procedure cupsSetEncryption (e : CUPS.cups_http_h.http_encryption_t);  -- cups/cups.h:400
   pragma Import (C, cupsSetEncryption, "cupsSetEncryption");

   procedure cupsSetPasswordCB (cb : cups_password_cb_t);  -- cups/cups.h:401
   pragma Import (C, cupsSetPasswordCB, "cupsSetPasswordCB");

   procedure cupsSetServer (server : Interfaces.C.Strings.chars_ptr);  -- cups/cups.h:402
   pragma Import (C, cupsSetServer, "cupsSetServer");

   procedure cupsSetUser (user : Interfaces.C.Strings.chars_ptr);  -- cups/cups.h:403
   pragma Import (C, cupsSetUser, "cupsSetUser");

   function cupsUser return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:404
   pragma Import (C, cupsUser, "cupsUser");

  --*** New in CUPS 1.1.20 *** 
   function cupsDoAuthentication
     (http : System.Address;
      method : Interfaces.C.Strings.chars_ptr;
      resource : Interfaces.C.Strings.chars_ptr) return int;  -- cups/cups.h:407
   pragma Import (C, cupsDoAuthentication, "cupsDoAuthentication");

   function cupsGetFile
     (http : System.Address;
      resource : Interfaces.C.Strings.chars_ptr;
      filename : Interfaces.C.Strings.chars_ptr) return CUPS.cups_http_h.http_status_t;  -- cups/cups.h:410
   pragma Import (C, cupsGetFile, "cupsGetFile");

   function cupsGetFd
     (http : System.Address;
      resource : Interfaces.C.Strings.chars_ptr;
      fd : int) return CUPS.cups_http_h.http_status_t;  -- cups/cups.h:412
   pragma Import (C, cupsGetFd, "cupsGetFd");

   function cupsPutFile
     (http : System.Address;
      resource : Interfaces.C.Strings.chars_ptr;
      filename : Interfaces.C.Strings.chars_ptr) return CUPS.cups_http_h.http_status_t;  -- cups/cups.h:413
   pragma Import (C, cupsPutFile, "cupsPutFile");

   function cupsPutFd
     (http : System.Address;
      resource : Interfaces.C.Strings.chars_ptr;
      fd : int) return CUPS.cups_http_h.http_status_t;  -- cups/cups.h:415
   pragma Import (C, cupsPutFd, "cupsPutFd");

  --*** New in CUPS 1.1.21 *** 
   function cupsGetDefault2 (http : System.Address) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:419
   pragma Import (C, cupsGetDefault2, "cupsGetDefault2");

   function cupsGetDests2 (http : System.Address; dests : System.Address) return int;  -- cups/cups.h:420
   pragma Import (C, cupsGetDests2, "cupsGetDests2");

   function cupsGetJobs2
     (http : System.Address;
      jobs : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      myjobs : int;
      whichjobs : int) return int;  -- cups/cups.h:422
   pragma Import (C, cupsGetJobs2, "cupsGetJobs2");

   function cupsGetPPD2 (http : System.Address; name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:425
   pragma Import (C, cupsGetPPD2, "cupsGetPPD2");

   function cupsPrintFile2
     (http : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      filename : Interfaces.C.Strings.chars_ptr;
      title : Interfaces.C.Strings.chars_ptr;
      num_options : int;
      options : access cups_option_t) return int;  -- cups/cups.h:426
   pragma Import (C, cupsPrintFile2, "cupsPrintFile2");

   function cupsPrintFiles2
     (http : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      num_files : int;
      files : System.Address;
      title : Interfaces.C.Strings.chars_ptr;
      num_options : int;
      options : access cups_option_t) return int;  -- cups/cups.h:430
   pragma Import (C, cupsPrintFiles2, "cupsPrintFiles2");

   function cupsSetDests2
     (http : System.Address;
      num_dests : int;
      dests : access cups_dest_t) return int;  -- cups/cups.h:435
   pragma Import (C, cupsSetDests2, "cupsSetDests2");

  --*** New in CUPS 1.2/OS X 10.5 *** 
   function cupsBackChannelRead
     (buffer : Interfaces.C.Strings.chars_ptr;
      bytes : size_t;
      timeout : double) return size_t;  -- cups/cups.h:439
   pragma Import (C, cupsBackChannelRead, "cupsBackChannelRead");

   function cupsBackChannelWrite
     (buffer : Interfaces.C.Strings.chars_ptr;
      bytes : size_t;
      timeout : double) return size_t;  -- cups/cups.h:441
   pragma Import (C, cupsBackChannelWrite, "cupsBackChannelWrite");

   procedure cupsEncodeOptions2
     (ipp : System.Address;
      num_options : int;
      options : access cups_option_t;
      group_tag : CUPS.cups_ipp_h.ipp_tag_t);  -- cups/cups.h:443
   pragma Import (C, cupsEncodeOptions2, "cupsEncodeOptions2");

   function cupsLastErrorString return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:446
   pragma Import (C, cupsLastErrorString, "cupsLastErrorString");

   function cupsNotifySubject (lang : access CUPS.cups_language_h.cups_lang_t; event : System.Address) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:447
   pragma Import (C, cupsNotifySubject, "cupsNotifySubject");

   function cupsNotifyText (lang : access CUPS.cups_language_h.cups_lang_t; event : System.Address) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:449
   pragma Import (C, cupsNotifyText, "cupsNotifyText");

   function cupsRemoveOption
     (name : Interfaces.C.Strings.chars_ptr;
      num_options : int;
      options : System.Address) return int;  -- cups/cups.h:451
   pragma Import (C, cupsRemoveOption, "cupsRemoveOption");

   function cupsTempFile2 (filename : Interfaces.C.Strings.chars_ptr; len : int) return System.Address;  -- cups/cups.h:453
   pragma Import (C, cupsTempFile2, "cupsTempFile2");

  --*** New in CUPS 1.3/OS X 10.5 *** 
   function cupsDoIORequest
     (http : System.Address;
      request : System.Address;
      resource : Interfaces.C.Strings.chars_ptr;
      infile : int;
      outfile : int) return System.Address;  -- cups/cups.h:456
   pragma Import (C, cupsDoIORequest, "cupsDoIORequest");

   function cupsGetServerPPD (http : System.Address; name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:459
   pragma Import (C, cupsGetServerPPD, "cupsGetServerPPD");

   function cupsRemoveDest
     (name : Interfaces.C.Strings.chars_ptr;
      instance : Interfaces.C.Strings.chars_ptr;
      num_dests : int;
      dests : System.Address) return int;  -- cups/cups.h:461
   pragma Import (C, cupsRemoveDest, "cupsRemoveDest");

   procedure cupsSetDefaultDest
     (name : Interfaces.C.Strings.chars_ptr;
      instance : Interfaces.C.Strings.chars_ptr;
      num_dests : int;
      dests : access cups_dest_t);  -- cups/cups.h:465
   pragma Import (C, cupsSetDefaultDest, "cupsSetDefaultDest");

  --*** New in CUPS 1.4/OS X 10.6 *** 
   function cupsCancelJob2
     (http : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      job_id : int;
      purge : int) return CUPS.cups_ipp_h.ipp_status_t;  -- cups/cups.h:471
   pragma Import (C, cupsCancelJob2, "cupsCancelJob2");

   function cupsCreateJob
     (http : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      title : Interfaces.C.Strings.chars_ptr;
      num_options : int;
      options : access cups_option_t) return int;  -- cups/cups.h:473
   pragma Import (C, cupsCreateJob, "cupsCreateJob");

   function cupsFinishDocument (http : System.Address; name : Interfaces.C.Strings.chars_ptr) return CUPS.cups_ipp_h.ipp_status_t;  -- cups/cups.h:476
   pragma Import (C, cupsFinishDocument, "cupsFinishDocument");

   function cupsGetDevices
     (http : System.Address;
      timeout : int;
      include_schemes : Interfaces.C.Strings.chars_ptr;
      exclude_schemes : Interfaces.C.Strings.chars_ptr;
      callback : cups_device_cb_t;
      user_data : System.Address) return CUPS.cups_ipp_h.ipp_status_t;  -- cups/cups.h:478
   pragma Import (C, cupsGetDevices, "cupsGetDevices");

   function cupsGetNamedDest
     (http : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      instance : Interfaces.C.Strings.chars_ptr) return access cups_dest_t;  -- cups/cups.h:483
   pragma Import (C, cupsGetNamedDest, "cupsGetNamedDest");

   function cupsGetPassword2
     (prompt : Interfaces.C.Strings.chars_ptr;
      http : System.Address;
      method : Interfaces.C.Strings.chars_ptr;
      resource : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:485
   pragma Import (C, cupsGetPassword2, "cupsGetPassword2");

   function cupsGetPPD3
     (http : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      modtime : access CUPS.time_h.time_t;
      buffer : Interfaces.C.Strings.chars_ptr;
      bufsize : size_t) return CUPS.cups_http_h.http_status_t;  -- cups/cups.h:488
   pragma Import (C, cupsGetPPD3, "cupsGetPPD3");

   function cupsGetResponse (http : System.Address; resource : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/cups.h:491
   pragma Import (C, cupsGetResponse, "cupsGetResponse");

   function cupsReadResponseData
     (http : System.Address;
      buffer : Interfaces.C.Strings.chars_ptr;
      length : size_t) return size_t;  -- cups/cups.h:493
   pragma Import (C, cupsReadResponseData, "cupsReadResponseData");

   function cupsSendRequest
     (http : System.Address;
      request : System.Address;
      resource : Interfaces.C.Strings.chars_ptr;
      length : size_t) return CUPS.cups_http_h.http_status_t;  -- cups/cups.h:495
   pragma Import (C, cupsSendRequest, "cupsSendRequest");

   procedure cupsSetPasswordCB2 (cb : cups_password_cb2_t; user_data : System.Address);  -- cups/cups.h:498
   pragma Import (C, cupsSetPasswordCB2, "cupsSetPasswordCB2");

   function cupsStartDocument
     (http : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      job_id : int;
      docname : Interfaces.C.Strings.chars_ptr;
      format : Interfaces.C.Strings.chars_ptr;
      last_document : int) return CUPS.cups_http_h.http_status_t;  -- cups/cups.h:500
   pragma Import (C, cupsStartDocument, "cupsStartDocument");

   function cupsWriteRequestData
     (http : System.Address;
      buffer : Interfaces.C.Strings.chars_ptr;
      length : size_t) return CUPS.cups_http_h.http_status_t;  -- cups/cups.h:504
   pragma Import (C, cupsWriteRequestData, "cupsWriteRequestData");

  --*** New in CUPS 1.5/OS X 10.7 *** 
   procedure cupsSetClientCertCB (cb : cups_client_cert_cb_t; user_data : System.Address);  -- cups/cups.h:508
   pragma Import (C, cupsSetClientCertCB, "cupsSetClientCertCB");

   function cupsSetCredentials (certs : System.Address) return int;  -- cups/cups.h:510
   pragma Import (C, cupsSetCredentials, "cupsSetCredentials");

   procedure cupsSetServerCertCB (cb : cups_server_cert_cb_t; user_data : System.Address);  -- cups/cups.h:511
   pragma Import (C, cupsSetServerCertCB, "cupsSetServerCertCB");

  --*** New in CUPS 1.6/OS X 10.8 *** 
   function cupsCancelDestJob
     (http : System.Address;
      dest : access cups_dest_t;
      job_id : int) return CUPS.cups_ipp_h.ipp_status_t;  -- cups/cups.h:515
   pragma Import (C, cupsCancelDestJob, "cupsCancelDestJob");

   function cupsCheckDestSupported
     (http : System.Address;
      dest : access cups_dest_t;
      info : System.Address;
      option : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr) return int;  -- cups/cups.h:517
   pragma Import (C, cupsCheckDestSupported, "cupsCheckDestSupported");

   function cupsCloseDestJob
     (http : System.Address;
      dest : access cups_dest_t;
      info : System.Address;
      job_id : int) return CUPS.cups_ipp_h.ipp_status_t;  -- cups/cups.h:521
   pragma Import (C, cupsCloseDestJob, "cupsCloseDestJob");

   function cupsConnectDest
     (dest : access cups_dest_t;
      flags : unsigned;
      msec : int;
      cancel : access int;
      resource : Interfaces.C.Strings.chars_ptr;
      resourcesize : size_t;
      cb : cups_dest_cb_t;
      user_data : System.Address) return System.Address;  -- cups/cups.h:524
   pragma Import (C, cupsConnectDest, "cupsConnectDest");

   function cupsCopyDest
     (dest : access cups_dest_t;
      num_dests : int;
      dests : System.Address) return int;  -- cups/cups.h:537
   pragma Import (C, cupsCopyDest, "cupsCopyDest");

   function cupsCopyDestInfo (http : System.Address; dest : access cups_dest_t) return System.Address;  -- cups/cups.h:539
   pragma Import (C, cupsCopyDestInfo, "cupsCopyDestInfo");

   function cupsCopyDestConflicts
     (http : System.Address;
      dest : access cups_dest_t;
      info : System.Address;
      num_options : int;
      options : access cups_option_t;
      new_option : Interfaces.C.Strings.chars_ptr;
      new_value : Interfaces.C.Strings.chars_ptr;
      num_conflicts : access int;
      conflicts : System.Address;
      num_resolved : access int;
      resolved : System.Address) return int;  -- cups/cups.h:541
   pragma Import (C, cupsCopyDestConflicts, "cupsCopyDestConflicts");

   function cupsCreateDestJob
     (http : System.Address;
      dest : access cups_dest_t;
      info : System.Address;
      job_id : access int;
      title : Interfaces.C.Strings.chars_ptr;
      num_options : int;
      options : access cups_option_t) return CUPS.cups_ipp_h.ipp_status_t;  -- cups/cups.h:552
   pragma Import (C, cupsCreateDestJob, "cupsCreateDestJob");

   function cupsEnumDests
     (flags : unsigned;
      msec : int;
      cancel : access int;
      c_type : cups_ptype_t;
      mask : cups_ptype_t;
      cb : cups_dest_cb_t;
      user_data : System.Address) return int;  -- cups/cups.h:556
   pragma Import (C, cupsEnumDests, "cupsEnumDests");

   function cupsFinishDestDocument
     (http : System.Address;
      dest : access cups_dest_t;
      info : System.Address) return CUPS.cups_ipp_h.ipp_status_t;  -- cups/cups.h:567
   pragma Import (C, cupsFinishDestDocument, "cupsFinishDestDocument");

   procedure cupsFreeDestInfo (dinfo : System.Address);  -- cups/cups.h:571
   pragma Import (C, cupsFreeDestInfo, "cupsFreeDestInfo");

   function cupsGetDestMediaByName
     (http : System.Address;
      dest : access cups_dest_t;
      dinfo : System.Address;
      media : Interfaces.C.Strings.chars_ptr;
      flags : unsigned;
      size : access cups_size_t) return int;  -- cups/cups.h:572
   pragma Import (C, cupsGetDestMediaByName, "cupsGetDestMediaByName");

   function cupsGetDestMediaBySize
     (http : System.Address;
      dest : access cups_dest_t;
      dinfo : System.Address;
      width : int;
      length : int;
      flags : unsigned;
      size : access cups_size_t) return int;  -- cups/cups.h:577
   pragma Import (C, cupsGetDestMediaBySize, "cupsGetDestMediaBySize");

   function cupsLocalizeDestOption
     (http : System.Address;
      dest : access cups_dest_t;
      info : System.Address;
      option : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:582
   pragma Import (C, cupsLocalizeDestOption, "cupsLocalizeDestOption");

   function cupsLocalizeDestValue
     (http : System.Address;
      dest : access cups_dest_t;
      info : System.Address;
      option : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:586
   pragma Import (C, cupsLocalizeDestValue, "cupsLocalizeDestValue");

   function cupsStartDestDocument
     (http : System.Address;
      dest : access cups_dest_t;
      info : System.Address;
      job_id : int;
      docname : Interfaces.C.Strings.chars_ptr;
      format : Interfaces.C.Strings.chars_ptr;
      num_options : int;
      options : access cups_option_t;
      last_document : int) return CUPS.cups_http_h.http_status_t;  -- cups/cups.h:591
   pragma Import (C, cupsStartDestDocument, "cupsStartDestDocument");

  -- New in CUPS 1.7  
   function cupsFindDestDefault
     (http : System.Address;
      dest : access cups_dest_t;
      dinfo : System.Address;
      option : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/cups.h:600
   pragma Import (C, cupsFindDestDefault, "cupsFindDestDefault");

   function cupsFindDestReady
     (http : System.Address;
      dest : access cups_dest_t;
      dinfo : System.Address;
      option : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/cups.h:603
   pragma Import (C, cupsFindDestReady, "cupsFindDestReady");

   function cupsFindDestSupported
     (http : System.Address;
      dest : access cups_dest_t;
      dinfo : System.Address;
      option : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/cups.h:606
   pragma Import (C, cupsFindDestSupported, "cupsFindDestSupported");

   function cupsGetDestMediaByIndex
     (http : System.Address;
      dest : access cups_dest_t;
      dinfo : System.Address;
      n : int;
      flags : unsigned;
      size : access cups_size_t) return int;  -- cups/cups.h:610
   pragma Import (C, cupsGetDestMediaByIndex, "cupsGetDestMediaByIndex");

   function cupsGetDestMediaCount
     (http : System.Address;
      dest : access cups_dest_t;
      dinfo : System.Address;
      flags : unsigned) return int;  -- cups/cups.h:615
   pragma Import (C, cupsGetDestMediaCount, "cupsGetDestMediaCount");

   function cupsGetDestMediaDefault
     (http : System.Address;
      dest : access cups_dest_t;
      dinfo : System.Address;
      flags : unsigned;
      size : access cups_size_t) return int;  -- cups/cups.h:618
   pragma Import (C, cupsGetDestMediaDefault, "cupsGetDestMediaDefault");

   procedure cupsSetUserAgent (user_agent : Interfaces.C.Strings.chars_ptr);  -- cups/cups.h:623
   pragma Import (C, cupsSetUserAgent, "cupsSetUserAgent");

   function cupsUserAgent return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:624
   pragma Import (C, cupsUserAgent, "cupsUserAgent");

  -- New in CUPS 2.0/OS X 10.10  
  -- * "$Id: cups.h 13087 2016-02-12 18:53:24Z msweet $"
  -- *
  -- * API definitions for CUPS.
  -- *
  -- * Copyright 2007-2016 by Apple Inc.
  -- * Copyright 1997-2007 by Easy Software Products.
  -- *
  -- * These coded instructions, statements, and computer programs are the
  -- * property of Apple Inc. and are protected by Federal copyright
  -- * law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- * which should have been included with this file.  If this file is
  -- * file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- * This file is subject to the Apple OS-Developed Software exception.
  --  

   function cupsGetDestWithURI (name : Interfaces.C.Strings.chars_ptr; uri : Interfaces.C.Strings.chars_ptr) return access cups_dest_t;  -- cups/cups.h:627
   pragma Import (C, cupsGetDestWithURI, "cupsGetDestWithURI");

   function cupsLocalizeDestMedia
     (http : System.Address;
      dest : access cups_dest_t;
      info : System.Address;
      flags : unsigned;
      size : access cups_size_t) return Interfaces.C.Strings.chars_ptr;  -- cups/cups.h:628
   pragma Import (C, cupsLocalizeDestMedia, "cupsLocalizeDestMedia");

   function cupsMakeServerCredentials
     (path : Interfaces.C.Strings.chars_ptr;
      common_name : Interfaces.C.Strings.chars_ptr;
      num_alt_names : int;
      alt_names : System.Address;
      expiration_date : CUPS.time_h.time_t) return int;  -- cups/cups.h:629
   pragma Import (C, cupsMakeServerCredentials, "cupsMakeServerCredentials");

   function cupsSetServerCredentials
     (path : Interfaces.C.Strings.chars_ptr;
      common_name : Interfaces.C.Strings.chars_ptr;
      auto_create : int) return int;  -- cups/cups.h:630
   pragma Import (C, cupsSetServerCredentials, "cupsSetServerCredentials");

  -- * End of "$Id: cups.h 13087 2016-02-12 18:53:24Z msweet $".
  --  

end CUPS.cups_cups_h;
