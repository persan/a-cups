pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

with libCUPS.stdio_h;
with Interfaces.C_Streams;
limited with libCUPS.cups_ppd_h;
limited with libCUPS.cups_cups_h;
with Interfaces.C.Strings;

package libCUPS.cups_raster_h is

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

   type cups_adv_e is 
     (CUPS_ADVANCE_NONE,
      CUPS_ADVANCE_FILE,
      CUPS_ADVANCE_JOB,
      CUPS_ADVANCE_SET,
      CUPS_ADVANCE_PAGE);
   pragma Convention (C, cups_adv_e);  -- cups/raster.h:87

   subtype cups_adv_t is cups_adv_e;

   type cups_bool_e is 
     (CUPS_FALSE,
      CUPS_TRUE);
   pragma Convention (C, cups_bool_e);  -- cups/raster.h:96

   subtype cups_bool_t is cups_bool_e;

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

   subtype cups_cspace_t is cups_cspace_e;

   type cups_cut_e is 
     (CUPS_CUT_NONE,
      CUPS_CUT_FILE,
      CUPS_CUT_JOB,
      CUPS_CUT_SET,
      CUPS_CUT_PAGE);
   pragma Convention (C, cups_cut_e);  -- cups/raster.h:160

   subtype cups_cut_t is cups_cut_e;

   type cups_edge_e is 
     (CUPS_EDGE_TOP,
      CUPS_EDGE_RIGHT,
      CUPS_EDGE_BOTTOM,
      CUPS_EDGE_LEFT);
   pragma Convention (C, cups_edge_e);  -- cups/raster.h:169

   subtype cups_edge_t is cups_edge_e;

   type cups_jog_e is 
     (CUPS_JOG_NONE,
      CUPS_JOG_FILE,
      CUPS_JOG_JOB,
      CUPS_JOG_SET);
   pragma Convention (C, cups_jog_e);  -- cups/raster.h:177

   subtype cups_jog_t is cups_jog_e;

   type cups_mode_e is 
     (CUPS_RASTER_READ,
      CUPS_RASTER_WRITE,
      CUPS_RASTER_WRITE_COMPRESSED,
      CUPS_RASTER_WRITE_PWG);
   pragma Convention (C, cups_mode_e);  -- cups/raster.h:185

   subtype cups_mode_t is cups_mode_e;

   type cups_order_e is 
     (CUPS_ORDER_CHUNKED,
      CUPS_ORDER_BANDED,
      CUPS_ORDER_PLANAR);
   pragma Convention (C, cups_order_e);  -- cups/raster.h:195

   subtype cups_order_t is cups_order_e;

   type cups_orient_e is 
     (CUPS_ORIENT_0,
      CUPS_ORIENT_90,
      CUPS_ORIENT_180,
      CUPS_ORIENT_270);
   pragma Convention (C, cups_orient_e);  -- cups/raster.h:202

   subtype cups_orient_t is cups_orient_e;

   subtype anon3970_MediaClass_array is Interfaces.C.char_array (0 .. 63);
   subtype anon3970_MediaColor_array is Interfaces.C.char_array (0 .. 63);
   subtype anon3970_MediaType_array is Interfaces.C.char_array (0 .. 63);
   subtype anon3970_OutputType_array is Interfaces.C.char_array (0 .. 63);
   type anon3970_HWResolution_array is array (0 .. 1) of aliased unsigned;
   type anon3970_ImagingBoundingBox_array is array (0 .. 3) of aliased unsigned;
   type anon3970_Margins_array is array (0 .. 1) of aliased unsigned;
   type anon3970_PageSize_array is array (0 .. 1) of aliased unsigned;
   type cups_page_header_s is record
      MediaClass : aliased anon3970_MediaClass_array;  -- cups/raster.h:223
      MediaColor : aliased anon3970_MediaColor_array;  -- cups/raster.h:224
      MediaType : aliased anon3970_MediaType_array;  -- cups/raster.h:225
      OutputType : aliased anon3970_OutputType_array;  -- cups/raster.h:226
      AdvanceDistance : aliased unsigned;  -- cups/raster.h:229
      AdvanceMedia : aliased cups_adv_t;  -- cups/raster.h:230
      Collate : aliased cups_bool_t;  -- cups/raster.h:231
      CutMedia : aliased cups_cut_t;  -- cups/raster.h:232
      Duplex : aliased cups_bool_t;  -- cups/raster.h:233
      HWResolution : aliased anon3970_HWResolution_array;  -- cups/raster.h:234
      ImagingBoundingBox : aliased anon3970_ImagingBoundingBox_array;  -- cups/raster.h:235
      InsertSheet : aliased cups_bool_t;  -- cups/raster.h:236
      Jog : aliased cups_jog_t;  -- cups/raster.h:237
      LeadingEdge : aliased cups_edge_t;  -- cups/raster.h:238
      Margins : aliased anon3970_Margins_array;  -- cups/raster.h:239
      ManualFeed : aliased cups_bool_t;  -- cups/raster.h:240
      MediaPosition : aliased unsigned;  -- cups/raster.h:241
      MediaWeight : aliased unsigned;  -- cups/raster.h:242
      MirrorPrint : aliased cups_bool_t;  -- cups/raster.h:243
      NegativePrint : aliased cups_bool_t;  -- cups/raster.h:244
      NumCopies : aliased unsigned;  -- cups/raster.h:245
      Orientation : aliased cups_orient_t;  -- cups/raster.h:246
      OutputFaceUp : aliased cups_bool_t;  -- cups/raster.h:247
      PageSize : aliased anon3970_PageSize_array;  -- cups/raster.h:248
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

   subtype cups_page_header_t is cups_page_header_s;

   subtype anon3988_MediaClass_array is Interfaces.C.char_array (0 .. 63);
   subtype anon3988_MediaColor_array is Interfaces.C.char_array (0 .. 63);
   subtype anon3988_MediaType_array is Interfaces.C.char_array (0 .. 63);
   subtype anon3988_OutputType_array is Interfaces.C.char_array (0 .. 63);
   type anon3988_HWResolution_array is array (0 .. 1) of aliased unsigned;
   type anon3988_ImagingBoundingBox_array is array (0 .. 3) of aliased unsigned;
   type anon3988_Margins_array is array (0 .. 1) of aliased unsigned;
   type anon3988_PageSize_array is array (0 .. 1) of aliased unsigned;
   type anon3988_cupsPageSize_array is array (0 .. 1) of aliased float;
   type anon3988_cupsImagingBBox_array is array (0 .. 3) of aliased float;
   type anon3988_cupsInteger_array is array (0 .. 15) of aliased unsigned;
   type anon3988_cupsReal_array is array (0 .. 15) of aliased float;
   type anon3988_cupsString_array is array (0 .. 15, 0 .. 63) of aliased char;
   subtype anon3988_cupsMarkerType_array is Interfaces.C.char_array (0 .. 63);
   subtype anon3988_cupsRenderingIntent_array is Interfaces.C.char_array (0 .. 63);
   subtype anon3988_cupsPageSizeName_array is Interfaces.C.char_array (0 .. 63);
   type cups_page_header2_s is record
      MediaClass : aliased anon3988_MediaClass_array;  -- cups/raster.h:272
      MediaColor : aliased anon3988_MediaColor_array;  -- cups/raster.h:273
      MediaType : aliased anon3988_MediaType_array;  -- cups/raster.h:274
      OutputType : aliased anon3988_OutputType_array;  -- cups/raster.h:275
      AdvanceDistance : aliased unsigned;  -- cups/raster.h:278
      AdvanceMedia : aliased cups_adv_t;  -- cups/raster.h:279
      Collate : aliased cups_bool_t;  -- cups/raster.h:280
      CutMedia : aliased cups_cut_t;  -- cups/raster.h:281
      Duplex : aliased cups_bool_t;  -- cups/raster.h:282
      HWResolution : aliased anon3988_HWResolution_array;  -- cups/raster.h:283
      ImagingBoundingBox : aliased anon3988_ImagingBoundingBox_array;  -- cups/raster.h:284
      InsertSheet : aliased cups_bool_t;  -- cups/raster.h:285
      Jog : aliased cups_jog_t;  -- cups/raster.h:286
      LeadingEdge : aliased cups_edge_t;  -- cups/raster.h:287
      Margins : aliased anon3988_Margins_array;  -- cups/raster.h:288
      ManualFeed : aliased cups_bool_t;  -- cups/raster.h:289
      MediaPosition : aliased unsigned;  -- cups/raster.h:290
      MediaWeight : aliased unsigned;  -- cups/raster.h:291
      MirrorPrint : aliased cups_bool_t;  -- cups/raster.h:292
      NegativePrint : aliased cups_bool_t;  -- cups/raster.h:293
      NumCopies : aliased unsigned;  -- cups/raster.h:294
      Orientation : aliased cups_orient_t;  -- cups/raster.h:295
      OutputFaceUp : aliased cups_bool_t;  -- cups/raster.h:296
      PageSize : aliased anon3988_PageSize_array;  -- cups/raster.h:297
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
      cupsPageSize : aliased anon3988_cupsPageSize_array;  -- cups/raster.h:320
      cupsImagingBBox : aliased anon3988_cupsImagingBBox_array;  -- cups/raster.h:322
      cupsInteger : aliased anon3988_cupsInteger_array;  -- cups/raster.h:325
      cupsReal : aliased anon3988_cupsReal_array;  -- cups/raster.h:326
      cupsString : aliased anon3988_cupsString_array;  -- cups/raster.h:327
      cupsMarkerType : aliased anon3988_cupsMarkerType_array;  -- cups/raster.h:328
      cupsRenderingIntent : aliased anon3988_cupsRenderingIntent_array;  -- cups/raster.h:329
      cupsPageSizeName : aliased anon3988_cupsPageSizeName_array;  -- cups/raster.h:330
   end record;
   pragma Convention (C_Pass_By_Copy, cups_page_header2_s);  -- cups/raster.h:269

   subtype cups_page_header2_t is cups_page_header2_s;

   --  skipped empty struct u_cups_raster_s

   --  skipped empty struct cups_raster_t

   type cups_interpret_cb_t is access function (arg1 : access cups_page_header2_t; arg2 : int) return int;
   pragma Convention (C, cups_interpret_cb_t);  -- cups/raster.h:336

   type cups_raster_iocb_t is access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : size_t) return size_t;
   pragma Convention (C, cups_raster_iocb_t);  -- cups/raster.h:351

   procedure cupsRasterClose (arg1 : System.Address);  -- cups/raster.h:368
   pragma Import (C, cupsRasterClose, "cupsRasterClose");

   function cupsRasterOpen (arg1 : int; arg2 : cups_mode_t) return System.Address;  -- cups/raster.h:369
   pragma Import (C, cupsRasterOpen, "cupsRasterOpen");

   function cupsRasterReadHeader (arg1 : System.Address; arg2 : access cups_page_header_t) return unsigned;  -- cups/raster.h:370
   pragma Import (C, cupsRasterReadHeader, "cupsRasterReadHeader");

   function cupsRasterReadPixels
     (arg1 : System.Address;
      arg2 : access unsigned_char;
      arg3 : unsigned) return unsigned;  -- cups/raster.h:372
   pragma Import (C, cupsRasterReadPixels, "cupsRasterReadPixels");

   function cupsRasterWriteHeader (arg1 : System.Address; arg2 : access cups_page_header_t) return unsigned;  -- cups/raster.h:374
   pragma Import (C, cupsRasterWriteHeader, "cupsRasterWriteHeader");

   function cupsRasterWritePixels
     (arg1 : System.Address;
      arg2 : access unsigned_char;
      arg3 : unsigned) return unsigned;  -- cups/raster.h:376
   pragma Import (C, cupsRasterWritePixels, "cupsRasterWritePixels");

   function cupsRasterInterpretPPD
     (arg1 : access cups_page_header2_t;
      arg2 : access libCUPS.cups_ppd_h.ppd_file_t;
      arg3 : int;
      arg4 : access libCUPS.cups_cups_h.cups_option_t;
      arg5 : cups_interpret_cb_t) return int;  -- cups/raster.h:380
   pragma Import (C, cupsRasterInterpretPPD, "cupsRasterInterpretPPD");

   function cupsRasterReadHeader2 (arg1 : System.Address; arg2 : access cups_page_header2_t) return unsigned;  -- cups/raster.h:385
   pragma Import (C, cupsRasterReadHeader2, "cupsRasterReadHeader2");

   function cupsRasterWriteHeader2 (arg1 : System.Address; arg2 : access cups_page_header2_t) return unsigned;  -- cups/raster.h:387
   pragma Import (C, cupsRasterWriteHeader2, "cupsRasterWriteHeader2");

   function cupsRasterErrorString return Interfaces.C.Strings.chars_ptr;  -- cups/raster.h:391
   pragma Import (C, cupsRasterErrorString, "cupsRasterErrorString");

   function cupsRasterOpenIO
     (arg1 : cups_raster_iocb_t;
      arg2 : System.Address;
      arg3 : cups_mode_t) return System.Address;  -- cups/raster.h:394
   pragma Import (C, cupsRasterOpenIO, "cupsRasterOpenIO");

end libCUPS.cups_raster_h;
