pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

with CUPS.stdio_h;
with Interfaces.C_Streams;
with CUPS.cups_ppd_h;
with CUPS.cups_cups_h;
with Interfaces.C.Strings;

package CUPS.cups_raster_h is

   CUPS_RASTER_SYNC : constant := 16#52615333#;  --  cups/raster.h:49
   CUPS_RASTER_REVSYNC : constant := 16#33536152#;  --  cups/raster.h:50

   CUPS_RASTER_SYNCv1 : constant := 16#52615374#;  --  cups/raster.h:52
   CUPS_RASTER_REVSYNCv1 : constant := 16#74536152#;  --  cups/raster.h:53

   CUPS_RASTER_SYNCv2 : constant := 16#52615332#;  --  cups/raster.h:55
   CUPS_RASTER_REVSYNCv2 : constant := 16#32536152#;  --  cups/raster.h:56
   --  unsupported macro: CUPS_RASTER_SYNC_PWG CUPS_RASTER_SYNCv2

   CUPS_RASTER_HAVE_COLORIMETRIC : constant := 1;  --  cups/raster.h:67

   CUPS_RASTER_HAVE_DEVICE : constant := 1;  --  cups/raster.h:74

   CUPS_RASTER_HAVE_PWGRASTER : constant := 1;  --  cups/raster.h:80

  -- * "$Id: raster.h 4027 2012-11-16 01:00:05Z msweet $"
  -- *
  -- *   Raster file definitions for CUPS.
  -- *
  -- *   Copyright 2007-2012 by Apple Inc.
  -- *   Copyright 1997-2006 by Easy Software Products.
  -- *
  -- *   This file is part of the CUPS Imaging library.
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

  -- * Every non-PostScript printer driver that supports raster images
  -- * should use the application/vnd.cups-raster image file format.
  -- * Since both the PostScript RIP (pstoraster, based on GNU/GPL
  -- * Ghostscript) and Image RIP (imagetoraster, located in the filter
  -- * directory) use it, using this format saves you a lot of work.
  -- * Also, the PostScript RIP passes any printer options that are in
  -- * a PS file to your driver this way as well...
  --  

  -- * Constants...
  --  

  -- * The following definition can be used to determine if the
  -- * colorimetric colorspaces (CIEXYZ, CIELAB, and ICCn) are
  -- * defined...
  --  

  -- * The following definition can be used to determine if the
  -- * device colorspaces (DEVICEn) are defined...
  --  

  -- * The following definition can be used to determine if PWG Raster is supported.
  --  

  -- * Types...
  --  

  --*** AdvanceMedia attribute values *** 
   type cups_adv_e is 
     (CUPS_ADVANCE_NONE,
      CUPS_ADVANCE_FILE,
      CUPS_ADVANCE_JOB,
      CUPS_ADVANCE_SET,
      CUPS_ADVANCE_PAGE);
   pragma Convention (C, cups_adv_e);  -- cups/raster.h:87

  -- Never advance the roll  
  -- Advance the roll after this file  
  -- Advance the roll after this job  
  -- Advance the roll after this set  
  -- Advance the roll after this page  
   subtype cups_adv_t is cups_adv_e;

  --*** Boolean type *** 
   type cups_bool_e is 
     (CUPS_FALSE,
      CUPS_TRUE);
   pragma Convention (C, cups_bool_e);  -- cups/raster.h:96

  -- Logical false  
  -- Logical true  
   subtype cups_bool_t is cups_bool_e;

  --*** cupsColorSpace attribute values *** 
   subtype cups_cspace_e is unsigned;
   CUPS_CSPACE_W : constant cups_cspace_e := 0;
   CUPS_CSPACE_RGB : constant cups_cspace_e := 1;
   CUPS_CSPACE_RGBA : constant cups_cspace_e := 2;
   CUPS_CSPACE_K : constant cups_cspace_e := 3;
   CUPS_CSPACE_CMY : constant cups_cspace_e := 4;
   CUPS_CSPACE_YMC : constant cups_cspace_e := 5;
   CUPS_CSPACE_CMYK : constant cups_cspace_e := 6;
   CUPS_CSPACE_YMCK : constant cups_cspace_e := 7;
   CUPS_CSPACE_KCMY : constant cups_cspace_e := 8;
   CUPS_CSPACE_KCMYcm : constant cups_cspace_e := 9;
   CUPS_CSPACE_GMCK : constant cups_cspace_e := 10;
   CUPS_CSPACE_GMCS : constant cups_cspace_e := 11;
   CUPS_CSPACE_WHITE : constant cups_cspace_e := 12;
   CUPS_CSPACE_GOLD : constant cups_cspace_e := 13;
   CUPS_CSPACE_SILVER : constant cups_cspace_e := 14;
   CUPS_CSPACE_CIEXYZ : constant cups_cspace_e := 15;
   CUPS_CSPACE_CIELab : constant cups_cspace_e := 16;
   CUPS_CSPACE_RGBW : constant cups_cspace_e := 17;
   CUPS_CSPACE_SW : constant cups_cspace_e := 18;
   CUPS_CSPACE_SRGB : constant cups_cspace_e := 19;
   CUPS_CSPACE_ADOBERGB : constant cups_cspace_e := 20;
   CUPS_CSPACE_ICC1 : constant cups_cspace_e := 32;
   CUPS_CSPACE_ICC2 : constant cups_cspace_e := 33;
   CUPS_CSPACE_ICC3 : constant cups_cspace_e := 34;
   CUPS_CSPACE_ICC4 : constant cups_cspace_e := 35;
   CUPS_CSPACE_ICC5 : constant cups_cspace_e := 36;
   CUPS_CSPACE_ICC6 : constant cups_cspace_e := 37;
   CUPS_CSPACE_ICC7 : constant cups_cspace_e := 38;
   CUPS_CSPACE_ICC8 : constant cups_cspace_e := 39;
   CUPS_CSPACE_ICC9 : constant cups_cspace_e := 40;
   CUPS_CSPACE_ICCA : constant cups_cspace_e := 41;
   CUPS_CSPACE_ICCB : constant cups_cspace_e := 42;
   CUPS_CSPACE_ICCC : constant cups_cspace_e := 43;
   CUPS_CSPACE_ICCD : constant cups_cspace_e := 44;
   CUPS_CSPACE_ICCE : constant cups_cspace_e := 45;
   CUPS_CSPACE_ICCF : constant cups_cspace_e := 46;
   CUPS_CSPACE_DEVICE1 : constant cups_cspace_e := 48;
   CUPS_CSPACE_DEVICE2 : constant cups_cspace_e := 49;
   CUPS_CSPACE_DEVICE3 : constant cups_cspace_e := 50;
   CUPS_CSPACE_DEVICE4 : constant cups_cspace_e := 51;
   CUPS_CSPACE_DEVICE5 : constant cups_cspace_e := 52;
   CUPS_CSPACE_DEVICE6 : constant cups_cspace_e := 53;
   CUPS_CSPACE_DEVICE7 : constant cups_cspace_e := 54;
   CUPS_CSPACE_DEVICE8 : constant cups_cspace_e := 55;
   CUPS_CSPACE_DEVICE9 : constant cups_cspace_e := 56;
   CUPS_CSPACE_DEVICEA : constant cups_cspace_e := 57;
   CUPS_CSPACE_DEVICEB : constant cups_cspace_e := 58;
   CUPS_CSPACE_DEVICEC : constant cups_cspace_e := 59;
   CUPS_CSPACE_DEVICED : constant cups_cspace_e := 60;
   CUPS_CSPACE_DEVICEE : constant cups_cspace_e := 61;
   CUPS_CSPACE_DEVICEF : constant cups_cspace_e := 62;  -- cups/raster.h:102

  -- Luminance (DeviceGray, gamma 2.2 by default)  
  -- Red, green, blue (DeviceRGB, sRGB by default)  
  -- Red, green, blue, alpha (DeviceRGB, sRGB by default)  
  -- Black (DeviceK)  
  -- Cyan, magenta, yellow (DeviceCMY)  
  -- Yellow, magenta, cyan @deprecated@  
  -- Cyan, magenta, yellow, black (DeviceCMYK)  
  -- Yellow, magenta, cyan, black @deprecated@  
  -- Black, cyan, magenta, yellow @deprecated@  
  -- Black, cyan, magenta, yellow, light-cyan, light-magenta @deprecated@  
  -- Gold, magenta, yellow, black @deprecated@  
  -- Gold, magenta, yellow, silver @deprecated@  
  -- White ink (as black) @deprecated@  
  -- Gold foil @deprecated@  
  -- Silver foil @deprecated@  
  -- CIE XYZ @since CUPS 1.1.19/OS X 10.3@  
  -- CIE Lab @since CUPS 1.1.19/OS X 10.3@  
  -- Red, green, blue, white (DeviceRGB, sRGB by default) @since CUPS 1.2/OS X 10.5@  
  -- Luminance (gamma 2.2) @since CUPS 1.4.5@  
  -- Red, green, blue (sRGB) @since CUPS 1.4.5@  
  -- Red, green, blue (Adobe RGB) @since CUPS 1.4.5@  
  -- ICC-based, 1 color @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 2 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 3 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 4 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 5 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 6 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 7 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 8 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 9 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 10 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 11 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 12 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 13 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 14 colors @since CUPS 1.1.19/OS X 10.3@  
  -- ICC-based, 15 colors @since CUPS 1.1.19/OS X 10.3@  
  -- DeviceN, 1 color @since CUPS 1.4.5@  
  -- DeviceN, 2 colors @since CUPS 1.4.5@  
  -- DeviceN, 3 colors @since CUPS 1.4.5@  
  -- DeviceN, 4 colors @since CUPS 1.4.5@  
  -- DeviceN, 5 colors @since CUPS 1.4.5@  
  -- DeviceN, 6 colors @since CUPS 1.4.5@  
  -- DeviceN, 7 colors @since CUPS 1.4.5@  
  -- DeviceN, 8 colors @since CUPS 1.4.5@  
  -- DeviceN, 9 colors @since CUPS 1.4.5@  
  -- DeviceN, 10 colors @since CUPS 1.4.5@  
  -- DeviceN, 11 colors @since CUPS 1.4.5@  
  -- DeviceN, 12 colors @since CUPS 1.4.5@  
  -- DeviceN, 13 colors @since CUPS 1.4.5@  
  -- DeviceN, 14 colors @since CUPS 1.4.5@  
  -- DeviceN, 15 colors @since CUPS 1.4.5@  
   subtype cups_cspace_t is cups_cspace_e;

  --*** CutMedia attribute values *** 
   type cups_cut_e is 
     (CUPS_CUT_NONE,
      CUPS_CUT_FILE,
      CUPS_CUT_JOB,
      CUPS_CUT_SET,
      CUPS_CUT_PAGE);
   pragma Convention (C, cups_cut_e);  -- cups/raster.h:160

  -- Never cut the roll  
  -- Cut the roll after this file  
  -- Cut the roll after this job  
  -- Cut the roll after this set  
  -- Cut the roll after this page  
   subtype cups_cut_t is cups_cut_e;

  --*** LeadingEdge attribute values *** 
   type cups_edge_e is 
     (CUPS_EDGE_TOP,
      CUPS_EDGE_RIGHT,
      CUPS_EDGE_BOTTOM,
      CUPS_EDGE_LEFT);
   pragma Convention (C, cups_edge_e);  -- cups/raster.h:169

  -- Leading edge is the top of the page  
  -- Leading edge is the right of the page  
  -- Leading edge is the bottom of the page  
  -- Leading edge is the left of the page  
   subtype cups_edge_t is cups_edge_e;

  --*** Jog attribute values *** 
   type cups_jog_e is 
     (CUPS_JOG_NONE,
      CUPS_JOG_FILE,
      CUPS_JOG_JOB,
      CUPS_JOG_SET);
   pragma Convention (C, cups_jog_e);  -- cups/raster.h:177

  -- Never move pages  
  -- Move pages after this file  
  -- Move pages after this job  
  -- Move pages after this set  
   subtype cups_jog_t is cups_jog_e;

  --*** cupsRasterOpen modes *** 
   type cups_mode_e is 
     (CUPS_RASTER_READ,
      CUPS_RASTER_WRITE,
      CUPS_RASTER_WRITE_COMPRESSED,
      CUPS_RASTER_WRITE_PWG);
   pragma Convention (C, cups_mode_e);  -- cups/raster.h:185

  -- Open stream for reading  
  -- Open stream for writing  
  -- Open stream for compressed writing @since CUPS 1.3/OS X 10.5@  
  -- Open stream for compressed writing in PWG mode @since CUPS 1.5/OS X 10.7@  
  --*** cupsRasterOpen modes *** 
   subtype cups_mode_t is cups_mode_e;

  --*** cupsColorOrder attribute values *** 
   type cups_order_e is 
     (CUPS_ORDER_CHUNKED,
      CUPS_ORDER_BANDED,
      CUPS_ORDER_PLANAR);
   pragma Convention (C, cups_order_e);  -- cups/raster.h:195

  -- CMYK CMYK CMYK ...  
  -- CCC MMM YYY KKK ...  
  -- CCC ... MMM ... YYY ... KKK ...  
   subtype cups_order_t is cups_order_e;

  --*** Orientation attribute values *** 
   type cups_orient_e is 
     (CUPS_ORIENT_0,
      CUPS_ORIENT_90,
      CUPS_ORIENT_180,
      CUPS_ORIENT_270);
   pragma Convention (C, cups_orient_e);  -- cups/raster.h:202

  -- Don't rotate the page  
  -- Rotate the page counter-clockwise  
  -- Turn the page upside down  
  -- Rotate the page clockwise  
   subtype cups_orient_t is cups_orient_e;

  -- * The page header structure contains the standard PostScript page device
  -- * dictionary, along with some CUPS-specific parameters that are provided
  -- * by the RIPs...
  -- *
  -- * The API supports a "version 1" (from CUPS 1.0 and 1.1) and a "version 2"
  -- * (from CUPS 1.2 and higher) page header, for binary compatibility.
  --  

  --*** Version 1 page header @deprecated@ *** 
  --*** Standard Page Device Dictionary String Values *** 
  -- MediaClass string  
   subtype cups_page_header_s_MediaClass_array is Interfaces.C.char_array (0 .. 63);
   subtype cups_page_header_s_MediaColor_array is Interfaces.C.char_array (0 .. 63);
   subtype cups_page_header_s_MediaType_array is Interfaces.C.char_array (0 .. 63);
   subtype cups_page_header_s_OutputType_array is Interfaces.C.char_array (0 .. 63);
   type cups_page_header_s_HWResolution_array is array (0 .. 1) of aliased unsigned;
   type cups_page_header_s_ImagingBoundingBox_array is array (0 .. 3) of aliased unsigned;
   type cups_page_header_s_Margins_array is array (0 .. 1) of aliased unsigned;
   type cups_page_header_s_PageSize_array is array (0 .. 1) of aliased unsigned;
   type cups_page_header_s is record
      MediaClass : aliased cups_page_header_s_MediaClass_array;  -- cups/raster.h:223
      MediaColor : aliased cups_page_header_s_MediaColor_array;  -- cups/raster.h:224
      MediaType : aliased cups_page_header_s_MediaType_array;  -- cups/raster.h:225
      OutputType : aliased cups_page_header_s_OutputType_array;  -- cups/raster.h:226
      AdvanceDistance : aliased unsigned;  -- cups/raster.h:229
      AdvanceMedia : aliased cups_adv_t;  -- cups/raster.h:230
      Collate : aliased cups_bool_t;  -- cups/raster.h:231
      CutMedia : aliased cups_cut_t;  -- cups/raster.h:232
      Duplex : aliased cups_bool_t;  -- cups/raster.h:233
      HWResolution : aliased cups_page_header_s_HWResolution_array;  -- cups/raster.h:234
      ImagingBoundingBox : aliased cups_page_header_s_ImagingBoundingBox_array;  -- cups/raster.h:235
      InsertSheet : aliased cups_bool_t;  -- cups/raster.h:236
      Jog : aliased cups_jog_t;  -- cups/raster.h:237
      LeadingEdge : aliased cups_edge_t;  -- cups/raster.h:238
      Margins : aliased cups_page_header_s_Margins_array;  -- cups/raster.h:239
      ManualFeed : aliased cups_bool_t;  -- cups/raster.h:240
      MediaPosition : aliased unsigned;  -- cups/raster.h:241
      MediaWeight : aliased unsigned;  -- cups/raster.h:242
      MirrorPrint : aliased cups_bool_t;  -- cups/raster.h:243
      NegativePrint : aliased cups_bool_t;  -- cups/raster.h:244
      NumCopies : aliased unsigned;  -- cups/raster.h:245
      Orientation : aliased cups_orient_t;  -- cups/raster.h:246
      OutputFaceUp : aliased cups_bool_t;  -- cups/raster.h:247
      PageSize : aliased cups_page_header_s_PageSize_array;  -- cups/raster.h:248
      Separations : aliased cups_bool_t;  -- cups/raster.h:249
      TraySwitch : aliased cups_bool_t;  -- cups/raster.h:250
      Tumble : aliased cups_bool_t;  -- cups/raster.h:251
      cupsWidth : aliased unsigned;  -- cups/raster.h:254
      cupsHeight : aliased unsigned;  -- cups/raster.h:255
      cupsMediaType : aliased unsigned;  -- cups/raster.h:256
      cupsBitsPerColor : aliased unsigned;  -- cups/raster.h:257
      cupsBitsPerPixel : aliased unsigned;  -- cups/raster.h:258
      cupsBytesPerLine : aliased unsigned;  -- cups/raster.h:259
      cupsColorOrder : aliased cups_order_t;  -- cups/raster.h:260
      cupsColorSpace : aliased cups_cspace_t;  -- cups/raster.h:261
      cupsCompression : aliased unsigned;  -- cups/raster.h:262
      cupsRowCount : aliased unsigned;  -- cups/raster.h:263
      cupsRowFeed : aliased unsigned;  -- cups/raster.h:264
      cupsRowStep : aliased unsigned;  -- cups/raster.h:265
   end record;
   pragma Convention (C_Pass_By_Copy, cups_page_header_s);  -- cups/raster.h:220

  -- MediaColor string  
  -- MediaType string  
  -- OutputType string  
  --*** Standard Page Device Dictionary Integer Values *** 
  -- AdvanceDistance value in points  
  -- AdvanceMedia value (@link cups_adv_t@)  
  -- Collated copies value  
  -- CutMedia value (@link cups_cut_t@)  
  -- Duplexed (double-sided) value  
  -- Resolution in dots-per-inch  
  -- Pixel region that is painted (points, left, bottom, right, top)  
  -- InsertSheet value  
  -- Jog value (@link cups_jog_t@)  
  -- LeadingEdge value (@link cups_edge_t@)  
  -- Lower-lefthand margins in points  
  -- ManualFeed value  
  -- MediaPosition value  
  -- MediaWeight value in grams/m^2  
  -- MirrorPrint value  
  -- NegativePrint value  
  -- Number of copies to produce  
  -- Orientation value (@link cups_orient_t@)  
  -- OutputFaceUp value  
  -- Width and length of page in points  
  -- Separations value  
  -- TraySwitch value  
  -- Tumble value  
  --*** CUPS Page Device Dictionary Values *** 
  -- Width of page image in pixels  
  -- Height of page image in pixels  
  -- Media type code  
  -- Number of bits for each color  
  -- Number of bits for each pixel  
  -- Number of bytes per line  
  -- Order of colors  
  -- True colorspace  
  -- Device compression to use  
  -- Rows per band  
  -- Feed between bands  
  -- Spacing between lines  
   subtype cups_page_header_t is cups_page_header_s;

  --*** New in CUPS 1.2 *** 
  --*** Version 2 page header @since CUPS 1.2/OS X 10.5@ *** 
  --*** Standard Page Device Dictionary String Values *** 
  -- MediaClass string  
   subtype cups_page_header2_s_MediaClass_array is Interfaces.C.char_array (0 .. 63);
   subtype cups_page_header2_s_MediaColor_array is Interfaces.C.char_array (0 .. 63);
   subtype cups_page_header2_s_MediaType_array is Interfaces.C.char_array (0 .. 63);
   subtype cups_page_header2_s_OutputType_array is Interfaces.C.char_array (0 .. 63);
   type cups_page_header2_s_HWResolution_array is array (0 .. 1) of aliased unsigned;
   type cups_page_header2_s_ImagingBoundingBox_array is array (0 .. 3) of aliased unsigned;
   type cups_page_header2_s_Margins_array is array (0 .. 1) of aliased unsigned;
   type cups_page_header2_s_PageSize_array is array (0 .. 1) of aliased unsigned;
   type cups_page_header2_s_cupsPageSize_array is array (0 .. 1) of aliased float;
   type cups_page_header2_s_cupsImagingBBox_array is array (0 .. 3) of aliased float;
   type cups_page_header2_s_cupsInteger_array is array (0 .. 15) of aliased unsigned;
   type cups_page_header2_s_cupsReal_array is array (0 .. 15) of aliased float;
   type cups_page_header2_s_cupsString_array is array (0 .. 15, 0 .. 63) of aliased char;
   subtype cups_page_header2_s_cupsMarkerType_array is Interfaces.C.char_array (0 .. 63);
   subtype cups_page_header2_s_cupsRenderingIntent_array is Interfaces.C.char_array (0 .. 63);
   subtype cups_page_header2_s_cupsPageSizeName_array is Interfaces.C.char_array (0 .. 63);
   type cups_page_header2_s is record
      MediaClass : aliased cups_page_header2_s_MediaClass_array;  -- cups/raster.h:272
      MediaColor : aliased cups_page_header2_s_MediaColor_array;  -- cups/raster.h:273
      MediaType : aliased cups_page_header2_s_MediaType_array;  -- cups/raster.h:274
      OutputType : aliased cups_page_header2_s_OutputType_array;  -- cups/raster.h:275
      AdvanceDistance : aliased unsigned;  -- cups/raster.h:278
      AdvanceMedia : aliased cups_adv_t;  -- cups/raster.h:279
      Collate : aliased cups_bool_t;  -- cups/raster.h:280
      CutMedia : aliased cups_cut_t;  -- cups/raster.h:281
      Duplex : aliased cups_bool_t;  -- cups/raster.h:282
      HWResolution : aliased cups_page_header2_s_HWResolution_array;  -- cups/raster.h:283
      ImagingBoundingBox : aliased cups_page_header2_s_ImagingBoundingBox_array;  -- cups/raster.h:284
      InsertSheet : aliased cups_bool_t;  -- cups/raster.h:285
      Jog : aliased cups_jog_t;  -- cups/raster.h:286
      LeadingEdge : aliased cups_edge_t;  -- cups/raster.h:287
      Margins : aliased cups_page_header2_s_Margins_array;  -- cups/raster.h:288
      ManualFeed : aliased cups_bool_t;  -- cups/raster.h:289
      MediaPosition : aliased unsigned;  -- cups/raster.h:290
      MediaWeight : aliased unsigned;  -- cups/raster.h:291
      MirrorPrint : aliased cups_bool_t;  -- cups/raster.h:292
      NegativePrint : aliased cups_bool_t;  -- cups/raster.h:293
      NumCopies : aliased unsigned;  -- cups/raster.h:294
      Orientation : aliased cups_orient_t;  -- cups/raster.h:295
      OutputFaceUp : aliased cups_bool_t;  -- cups/raster.h:296
      PageSize : aliased cups_page_header2_s_PageSize_array;  -- cups/raster.h:297
      Separations : aliased cups_bool_t;  -- cups/raster.h:298
      TraySwitch : aliased cups_bool_t;  -- cups/raster.h:299
      Tumble : aliased cups_bool_t;  -- cups/raster.h:300
      cupsWidth : aliased unsigned;  -- cups/raster.h:303
      cupsHeight : aliased unsigned;  -- cups/raster.h:304
      cupsMediaType : aliased unsigned;  -- cups/raster.h:305
      cupsBitsPerColor : aliased unsigned;  -- cups/raster.h:306
      cupsBitsPerPixel : aliased unsigned;  -- cups/raster.h:307
      cupsBytesPerLine : aliased unsigned;  -- cups/raster.h:308
      cupsColorOrder : aliased cups_order_t;  -- cups/raster.h:309
      cupsColorSpace : aliased cups_cspace_t;  -- cups/raster.h:310
      cupsCompression : aliased unsigned;  -- cups/raster.h:311
      cupsRowCount : aliased unsigned;  -- cups/raster.h:312
      cupsRowFeed : aliased unsigned;  -- cups/raster.h:313
      cupsRowStep : aliased unsigned;  -- cups/raster.h:314
      cupsNumColors : aliased unsigned;  -- cups/raster.h:317
      cupsBorderlessScalingFactor : aliased float;  -- cups/raster.h:318
      cupsPageSize : aliased cups_page_header2_s_cupsPageSize_array;  -- cups/raster.h:320
      cupsImagingBBox : aliased cups_page_header2_s_cupsImagingBBox_array;  -- cups/raster.h:322
      cupsInteger : aliased cups_page_header2_s_cupsInteger_array;  -- cups/raster.h:325
      cupsReal : aliased cups_page_header2_s_cupsReal_array;  -- cups/raster.h:326
      cupsString : aliased cups_page_header2_s_cupsString_array;  -- cups/raster.h:327
      cupsMarkerType : aliased cups_page_header2_s_cupsMarkerType_array;  -- cups/raster.h:328
      cupsRenderingIntent : aliased cups_page_header2_s_cupsRenderingIntent_array;  -- cups/raster.h:329
      cupsPageSizeName : aliased cups_page_header2_s_cupsPageSizeName_array;  -- cups/raster.h:330
   end record;
   pragma Convention (C_Pass_By_Copy, cups_page_header2_s);  -- cups/raster.h:269

  -- MediaColor string  
  -- MediaType string  
  -- OutputType string  
  --*** Standard Page Device Dictionary Integer Values *** 
  -- AdvanceDistance value in points  
  -- AdvanceMedia value (@link cups_adv_t@)  
  -- Collated copies value  
  -- CutMedia value (@link cups_cut_t@)  
  -- Duplexed (double-sided) value  
  -- Resolution in dots-per-inch  
  -- Pixel region that is painted (points, left, bottom, right, top)  
  -- InsertSheet value  
  -- Jog value (@link cups_jog_t@)  
  -- LeadingEdge value (@link cups_edge_t@)  
  -- Lower-lefthand margins in points  
  -- ManualFeed value  
  -- MediaPosition value  
  -- MediaWeight value in grams/m^2  
  -- MirrorPrint value  
  -- NegativePrint value  
  -- Number of copies to produce  
  -- Orientation value (@link cups_orient_t@)  
  -- OutputFaceUp value  
  -- Width and length of page in points  
  -- Separations value  
  -- TraySwitch value  
  -- Tumble value  
  --*** CUPS Page Device Dictionary Values *** 
  -- Width of page image in pixels  
  -- Height of page image in pixels  
  -- Media type code  
  -- Number of bits for each color  
  -- Number of bits for each pixel  
  -- Number of bytes per line  
  -- Order of colors  
  -- True colorspace  
  -- Device compression to use  
  -- Rows per band  
  -- Feed between bands  
  -- Spacing between lines  
  --*** Version 2 Dictionary Values *** 
  -- Number of color compoents @since CUPS 1.2/OS X 10.5@  
  -- Scaling that was applied to page data @since CUPS 1.2/OS X 10.5@  
  -- Floating point PageSize (scaling *
  --  					 * factor not applied) @since CUPS 1.2/OS X 10.5@  

  -- Floating point ImagingBoundingBox
  --					 * (scaling factor not applied, left,
  --					 * bottom, right, top) @since CUPS 1.2/OS X 10.5@  

  -- User-defined integer values @since CUPS 1.2/OS X 10.5@  
  -- User-defined floating-point values @since CUPS 1.2/OS X 10.5@  
  -- User-defined string values @since CUPS 1.2/OS X 10.5@  
  -- Ink/toner type @since CUPS 1.2/OS X 10.5@  
  -- Color rendering intent @since CUPS 1.2/OS X 10.5@  
  -- PageSize name @since CUPS 1.2/OS X 10.5@  
   subtype cups_page_header2_t is cups_page_header2_s;

   --  skipped empty struct u_cups_raster_s

   --  skipped empty struct cups_raster_t

  --*** Raster stream data *** 
   type cups_interpret_cb_t is access function (arg1 : access cups_page_header2_t; arg2 : int) return int;
   pragma Convention (C, cups_interpret_cb_t);  -- cups/raster.h:336

  --*** cupsRasterInterpretPPD callback function
  --					 *
  --					 * This function is called by
  --					 * @link cupsRasterInterpretPPD@ to
  --					 * validate (and update, as needed)
  --					 * the page header attributes. The
  --					 * "preferred_bits" argument provides
  --					 * the value of the
  --					 * @code cupsPreferredBitsPerColor@
  --					 * key from the PostScript page device
  --					 * dictionary and is 0 if undefined.
  --					 *** 

  --*** New in CUPS 1.5 *** 
   type cups_raster_iocb_t is access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : size_t) return size_t;
   pragma Convention (C, cups_raster_iocb_t);  -- cups/raster.h:351

  --*** cupsRasterOpenIO callback function
  --					 *
  --					 * This function is specified when
  --					 * creating a raster stream with
  --					 * @link cupsRasterOpenIO@ and handles
  --					 * generic reading and writing of raster
  --					 * data. It must return -1 on error or
  --					 * the number of bytes specified by
  --					 * "length" on success.
  --					 *** 

  -- * Prototypes...
  --  

   procedure cupsRasterClose (r : System.Address);  -- cups/raster.h:368
   pragma Import (C, cupsRasterClose, "cupsRasterClose");

   function cupsRasterOpen (fd : int; mode : cups_mode_t) return System.Address;  -- cups/raster.h:369
   pragma Import (C, cupsRasterOpen, "cupsRasterOpen");

   function cupsRasterReadHeader (r : System.Address; h : access cups_page_header_t) return unsigned;  -- cups/raster.h:370
   pragma Import (C, cupsRasterReadHeader, "cupsRasterReadHeader");

   function cupsRasterReadPixels
     (r : System.Address;
      p : access unsigned_char;
      len : unsigned) return unsigned;  -- cups/raster.h:372
   pragma Import (C, cupsRasterReadPixels, "cupsRasterReadPixels");

   function cupsRasterWriteHeader (r : System.Address; h : access cups_page_header_t) return unsigned;  -- cups/raster.h:374
   pragma Import (C, cupsRasterWriteHeader, "cupsRasterWriteHeader");

   function cupsRasterWritePixels
     (r : System.Address;
      p : access unsigned_char;
      len : unsigned) return unsigned;  -- cups/raster.h:376
   pragma Import (C, cupsRasterWritePixels, "cupsRasterWritePixels");

  --*** New in CUPS 1.2 *** 
   function cupsRasterInterpretPPD
     (h : access cups_page_header2_t;
      ppd : access CUPS.cups_ppd_h.ppd_file_t;
      num_options : int;
      options : access CUPS.cups_cups_h.cups_option_t;
      func : cups_interpret_cb_t) return int;  -- cups/raster.h:380
   pragma Import (C, cupsRasterInterpretPPD, "cupsRasterInterpretPPD");

   function cupsRasterReadHeader2 (r : System.Address; h : access cups_page_header2_t) return unsigned;  -- cups/raster.h:385
   pragma Import (C, cupsRasterReadHeader2, "cupsRasterReadHeader2");

   function cupsRasterWriteHeader2 (r : System.Address; h : access cups_page_header2_t) return unsigned;  -- cups/raster.h:387
   pragma Import (C, cupsRasterWriteHeader2, "cupsRasterWriteHeader2");

  --*** New in CUPS 1.3 *** 
   function cupsRasterErrorString return Interfaces.C.Strings.chars_ptr;  -- cups/raster.h:391
   pragma Import (C, cupsRasterErrorString, "cupsRasterErrorString");

  --*** New in CUPS 1.5 *** 
   function cupsRasterOpenIO
     (iocb : cups_raster_iocb_t;
      ctx : System.Address;
      mode : cups_mode_t) return System.Address;  -- cups/raster.h:394
   pragma Import (C, cupsRasterOpenIO, "cupsRasterOpenIO");

  -- * End of "$Id: raster.h 4027 2012-11-16 01:00:05Z msweet $".
  --  

end CUPS.cups_raster_h;
