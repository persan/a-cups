pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with CUPS.cups_cups_h;
limited with CUPS.stdio_h;
with Interfaces.C_Streams;


package CUPS.cups_ppd_h is

   PPD_VERSION : constant := 4.3;  --  cups/ppd.h:67

   PPD_MAX_NAME : constant := 41;  --  cups/ppd.h:74
   PPD_MAX_TEXT : constant := 81;  --  cups/ppd.h:75
   PPD_MAX_LINE : constant := 256;  --  cups/ppd.h:76

  -- * "$Id: ppd.h 11056 2013-06-25 14:27:30Z msweet $"
  -- *
  -- *   PostScript Printer Description definitions for CUPS.
  -- *
  -- *   THESE APIS ARE DEPRECATED. TO COMPILE WITHOUT WARNINGS ADD
  -- *   -D_PPD_DEPRECATED="" TO YOUR COMPILE OPTIONS.  THIS HEADER AND THESE
  -- *   FUNCTIONS WILL BE REMOVED IN A FUTURE RELEASE OF CUPS.
  -- *
  -- *   Copyright 2007-2013 by Apple Inc.
  -- *   Copyright 1997-2007 by Easy Software Products, all rights reserved.
  -- *
  -- *   These coded instructions, statements, and computer programs are the
  -- *   property of Apple Inc. and are protected by Federal copyright
  -- *   law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- *   which should have been included with this file.  If this file is
  -- *   file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- *   PostScript is a trademark of Adobe Systems, Inc.
  -- *
  -- *   This code and any derivative of it may be used and distributed
  -- *   freely under the terms of the GNU General Public License when
  -- *   used with GNU Ghostscript or its derivatives.  Use of the code
  -- *   (or any derivative of it) with software other than GNU
  -- *   GhostScript (or its derivatives) is governed by the CUPS license
  -- *   agreement.
  -- *
  -- *   This file is subject to the Apple OS-Developed Software exception.
  --  

  -- * Include necessary headers...
  --  

  -- * C++ magic...
  --  

  -- * Define _PPD_DEPRECATED to silence the warnings about PPD functions being
  -- * deprecated...
  --  

  -- * PPD version...
  --  

  -- * PPD size limits (defined in Adobe spec)
  --  

  -- * Types and structures...
  --  

  --*** UI Types *** 
   type ppd_ui_e is 
     (PPD_UI_BOOLEAN,
      PPD_UI_PICKONE,
      PPD_UI_PICKMANY);
   pragma Convention (C, ppd_ui_e);  -- cups/ppd.h:83

  -- True or False option  
  -- Pick one from a list  
  -- Pick zero or more from a list  
   subtype ppd_ui_t is ppd_ui_e;

  --*** Order dependency sections *** 
   type ppd_section_e is 
     (PPD_ORDER_ANY,
      PPD_ORDER_DOCUMENT,
      PPD_ORDER_EXIT,
      PPD_ORDER_JCL,
      PPD_ORDER_PAGE,
      PPD_ORDER_PROLOG);
   pragma Convention (C, ppd_section_e);  -- cups/ppd.h:90

  -- Option code can be anywhere in the file  
  -- ... must be in the DocumentSetup section  
  -- ... must be sent prior to the document  
  -- ... must be sent as a JCL command  
  -- ... must be in the PageSetup section  
  -- ... must be in the Prolog section  
   subtype ppd_section_t is ppd_section_e;

  --*** Colorspaces *** 
   subtype ppd_cs_e is unsigned;
   PPD_CS_CMYK : constant ppd_cs_e := -4;
   PPD_CS_CMY : constant ppd_cs_e := -3;
   PPD_CS_GRAY : constant ppd_cs_e := 1;
   PPD_CS_RGB : constant ppd_cs_e := 3;
   PPD_CS_RGBK : constant ppd_cs_e := 4;
   PPD_CS_N : constant ppd_cs_e := 5;  -- cups/ppd.h:100

  -- CMYK colorspace  
  -- CMY colorspace  
  -- Grayscale colorspace  
  -- RGB colorspace  
  -- RGBK (K = gray) colorspace  
  -- DeviceN colorspace  
   subtype ppd_cs_t is ppd_cs_e;

  --*** Status Codes @since CUPS 1.1.19/OS X 10.3@ *** 
   type ppd_status_e is 
     (PPD_OK,
      PPD_FILE_OPEN_ERROR,
      PPD_NULL_FILE,
      PPD_ALLOC_ERROR,
      PPD_MISSING_PPDADOBE4,
      PPD_MISSING_VALUE,
      PPD_INTERNAL_ERROR,
      PPD_BAD_OPEN_GROUP,
      PPD_NESTED_OPEN_GROUP,
      PPD_BAD_OPEN_UI,
      PPD_NESTED_OPEN_UI,
      PPD_BAD_ORDER_DEPENDENCY,
      PPD_BAD_UI_CONSTRAINTS,
      PPD_MISSING_ASTERISK,
      PPD_LINE_TOO_LONG,
      PPD_ILLEGAL_CHARACTER,
      PPD_ILLEGAL_MAIN_KEYWORD,
      PPD_ILLEGAL_OPTION_KEYWORD,
      PPD_ILLEGAL_TRANSLATION,
      PPD_ILLEGAL_WHITESPACE,
      PPD_BAD_CUSTOM_PARAM,
      PPD_MISSING_OPTION_KEYWORD,
      PPD_BAD_VALUE,
      PPD_MISSING_CLOSE_GROUP,
      PPD_MAX_STATUS);
   pragma Convention (C, ppd_status_e);  -- cups/ppd.h:110

  -- OK  
  -- Unable to open PPD file  
  -- NULL PPD file pointer  
  -- Memory allocation error  
  -- Missing PPD-Adobe-4.x header  
  -- Missing value string  
  -- Internal error  
  -- Bad OpenGroup  
  -- OpenGroup without a CloseGroup first  
  -- Bad OpenUI/JCLOpenUI  
  -- OpenUI/JCLOpenUI without a CloseUI/JCLCloseUI first  
  -- Bad OrderDependency  
  -- Bad UIConstraints  
  -- Missing asterisk in column 0  
  -- Line longer than 255 chars  
  -- Illegal control character  
  -- Illegal main keyword string  
  -- Illegal option keyword string  
  -- Illegal translation string  
  -- Illegal whitespace character  
  -- Bad custom parameter  
  -- Missing option keyword  
  -- Bad value string  
  -- Missing CloseGroup  
  -- @private@  
   subtype ppd_status_t is ppd_status_e;

  --*** Conformance Levels @since CUPS 1.1.19/OS X 10.3@ *** 
   type ppd_conform_e is 
     (PPD_CONFORM_RELAXED,
      PPD_CONFORM_STRICT);
   pragma Convention (C, ppd_conform_e);  -- cups/ppd.h:139

  -- Relax whitespace and control char  
  -- Require strict conformance  
   subtype ppd_conform_t is ppd_conform_e;

  --*** Conformance Levels @since CUPS 1.1.19/OS X 10.3@ *** 
  --*** PPD Attribute Structure @since CUPS 1.1.19/OS X 10.3@ *** 
  -- Name of attribute (cupsXYZ)  
   subtype ppd_attr_s_name_array is Interfaces.C.char_array (0 .. 40);
   subtype ppd_attr_s_spec_array is Interfaces.C.char_array (0 .. 40);
   subtype ppd_attr_s_text_array is Interfaces.C.char_array (0 .. 80);
   type ppd_attr_s is record
      name : aliased ppd_attr_s_name_array;  -- cups/ppd.h:150
      spec : aliased ppd_attr_s_spec_array;  -- cups/ppd.h:151
      text : aliased ppd_attr_s_text_array;  -- cups/ppd.h:152
      value : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:153
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_attr_s);  -- cups/ppd.h:148

  -- Specifier string, if any  
  -- Human-readable text, if any  
  -- Value string  
   subtype ppd_attr_t is ppd_attr_s;

   type ppd_option_s;
   subtype ppd_option_s_keyword_array is Interfaces.C.char_array (0 .. 40);
   subtype ppd_option_s_defchoice_array is Interfaces.C.char_array (0 .. 40);
   subtype ppd_option_s_text_array is Interfaces.C.char_array (0 .. 80);
   subtype ppd_option_t is ppd_option_s;

  --*** Options *** 
  --*** Option choices *** 
  -- 0 if not selected, 1 otherwise  
   subtype ppd_choice_s_choice_array is Interfaces.C.char_array (0 .. 40);
   subtype ppd_choice_s_text_array is Interfaces.C.char_array (0 .. 80);
   type ppd_choice_s is record
      marked : aliased char;  -- cups/ppd.h:161
      choice : aliased ppd_choice_s_choice_array;  -- cups/ppd.h:162
      text : aliased ppd_choice_s_text_array;  -- cups/ppd.h:163
      code : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:164
      option : access ppd_option_t;  -- cups/ppd.h:165
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_choice_s);  -- cups/ppd.h:159

  -- Computer-readable option name  
  -- Human-readable option name  
  -- Code to send for this option  
  -- Pointer to parent option structure  
   subtype ppd_choice_t is ppd_choice_s;

  --*** Options *** 
  -- 0 if no conflicts exist, 1 otherwise  
   type ppd_option_s is record
      conflicted : aliased char;  -- cups/ppd.h:170
      keyword : aliased ppd_option_s_keyword_array;  -- cups/ppd.h:171
      defchoice : aliased ppd_option_s_defchoice_array;  -- cups/ppd.h:172
      text : aliased ppd_option_s_text_array;  -- cups/ppd.h:173
      ui : aliased ppd_ui_t;  -- cups/ppd.h:174
      section : aliased ppd_section_t;  -- cups/ppd.h:175
      order : aliased float;  -- cups/ppd.h:176
      num_choices : aliased int;  -- cups/ppd.h:177
      choices : access ppd_choice_t;  -- cups/ppd.h:178
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_option_s);  -- cups/ppd.h:168

  -- Option keyword name ("PageSize", etc.)  
  -- Default option choice  
  -- Human-readable text  
  -- Type of UI option  
  -- Section for command  
  -- Order number  
  -- Number of option choices  
  -- Option choices  
  --*** Groups *** 
  --*** Group text strings are limited to 39 chars + nul in order to
  --   **** preserve binary compatibility and allow applications to get
  --   **** the group's keyword name.
  --   *** 

   subtype ppd_group_s_text_array is Interfaces.C.char_array (0 .. 39);
   subtype ppd_group_s_name_array is Interfaces.C.char_array (0 .. 40);
   type ppd_group_s is record
      text : aliased ppd_group_s_text_array;  -- cups/ppd.h:187
      name : aliased ppd_group_s_name_array;  -- cups/ppd.h:189
      num_options : aliased int;  -- cups/ppd.h:190
      options : access ppd_option_t;  -- cups/ppd.h:191
      num_subgroups : aliased int;  -- cups/ppd.h:192
      subgroups : access ppd_group_s;  -- cups/ppd.h:193
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_group_s);  -- cups/ppd.h:181

  -- Human-readable group name  
  -- Group name @since CUPS 1.1.18/OS X 10.3@  
  -- Number of options  
  -- Options  
  -- Number of sub-groups  
  -- Sub-groups (max depth = 1)  
   subtype ppd_group_t is ppd_group_s;

  --*** Constraints *** 
  -- First keyword  
   subtype ppd_const_s_option1_array is Interfaces.C.char_array (0 .. 40);
   subtype ppd_const_s_choice1_array is Interfaces.C.char_array (0 .. 40);
   subtype ppd_const_s_option2_array is Interfaces.C.char_array (0 .. 40);
   subtype ppd_const_s_choice2_array is Interfaces.C.char_array (0 .. 40);
   type ppd_const_s is record
      option1 : aliased ppd_const_s_option1_array;  -- cups/ppd.h:198
      choice1 : aliased ppd_const_s_choice1_array;  -- cups/ppd.h:199
      option2 : aliased ppd_const_s_option2_array;  -- cups/ppd.h:200
      choice2 : aliased ppd_const_s_choice2_array;  -- cups/ppd.h:201
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_const_s);  -- cups/ppd.h:196

  -- First option/choice (blank for all)  
  -- Second keyword  
  -- Second option/choice (blank for all)  
   subtype ppd_const_t is ppd_const_s;

  --*** Page Sizes *** 
  -- Page size selected?  
   subtype ppd_size_s_name_array is Interfaces.C.char_array (0 .. 40);
   type ppd_size_s is record
      marked : aliased int;  -- cups/ppd.h:206
      name : aliased ppd_size_s_name_array;  -- cups/ppd.h:207
      width : aliased float;  -- cups/ppd.h:208
      length : aliased float;  -- cups/ppd.h:209
      left : aliased float;  -- cups/ppd.h:210
      bottom : aliased float;  -- cups/ppd.h:211
      right : aliased float;  -- cups/ppd.h:212
      top : aliased float;  -- cups/ppd.h:213
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_size_s);  -- cups/ppd.h:204

  -- Media size option  
  -- Width of media in points  
  -- Length of media in points  
  -- Left printable margin in points  
  -- Bottom printable margin in points  
  -- Right printable margin in points  
  -- Top printable margin in points  
   subtype ppd_size_t is ppd_size_s;

  --*** Emulators *** 
  -- Emulator name  
   subtype ppd_emul_s_name_array is Interfaces.C.char_array (0 .. 40);
   type ppd_emul_s is record
      name : aliased ppd_emul_s_name_array;  -- cups/ppd.h:218
      start : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:219
      stop : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:220
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_emul_s);  -- cups/ppd.h:216

  -- Code to switch to this emulation  
  -- Code to stop this emulation  
   subtype ppd_emul_t is ppd_emul_s;

  --*** sRGB Color Profiles *** 
   subtype ppd_profile_s_resolution_array is Interfaces.C.char_array (0 .. 40);
   subtype ppd_profile_s_media_type_array is Interfaces.C.char_array (0 .. 40);
   type ppd_profile_s_matrix_array is array (0 .. 2, 0 .. 2) of aliased float;
   type ppd_profile_s is record
      resolution : aliased ppd_profile_s_resolution_array;  -- cups/ppd.h:225
      media_type : aliased ppd_profile_s_media_type_array;  -- cups/ppd.h:227
      density : aliased float;  -- cups/ppd.h:229
      gamma : aliased float;  -- cups/ppd.h:230
      matrix : aliased ppd_profile_s_matrix_array;  -- cups/ppd.h:231
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_profile_s);  -- cups/ppd.h:223

  -- Resolution or "-"  
  -- Media type or "-"  
  -- Ink density to use  
  -- Gamma correction to use  
  -- Transform matrix  
   subtype ppd_profile_t is ppd_profile_s;

  --*** New in CUPS 1.2/OS X 10.5 *** 
  --*** Custom Parameter Type @since CUPS 1.2/OS X 10.5@ *** 
   type ppd_cptype_e is 
     (PPD_CUSTOM_CURVE,
      PPD_CUSTOM_INT,
      PPD_CUSTOM_INVCURVE,
      PPD_CUSTOM_PASSCODE,
      PPD_CUSTOM_PASSWORD,
      PPD_CUSTOM_POINTS,
      PPD_CUSTOM_REAL,
      PPD_CUSTOM_STRING);
   pragma Convention (C, ppd_cptype_e);  -- cups/ppd.h:235

  -- Curve value for f(x) = x^value  
  -- Integer number value  
  -- Curve value for f(x) = x^(1/value)  
  -- String of (hidden) numbers  
  -- String of (hidden) characters  
  -- Measurement value in points  
  -- Real number value  
  -- String of characters  
   subtype ppd_cptype_t is ppd_cptype_e;

  --*** Custom Parameter Limit @since CUPS 1.2/OS X 10.5@ *** 
  -- Gamma value  
   type ppd_cplimit_u (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            custom_curve : aliased float;  -- cups/ppd.h:249
         when 1 =>
            custom_int : aliased int;  -- cups/ppd.h:250
         when 2 =>
            custom_invcurve : aliased float;  -- cups/ppd.h:251
         when 3 =>
            custom_passcode : aliased int;  -- cups/ppd.h:252
         when 4 =>
            custom_password : aliased int;  -- cups/ppd.h:253
         when 5 =>
            custom_points : aliased float;  -- cups/ppd.h:254
         when 6 =>
            custom_real : aliased float;  -- cups/ppd.h:255
         when others =>
            custom_string : aliased int;  -- cups/ppd.h:256
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_cplimit_u);
   pragma Unchecked_Union (ppd_cplimit_u);  -- cups/ppd.h:247

  -- Integer value  
  -- Gamma value  
  -- Passcode length  
  -- Password length  
  -- Measurement value  
  -- Real value  
  -- String length  
   subtype ppd_cplimit_t is ppd_cplimit_u;

  --*** Custom Parameter Value @since CUPS 1.2/OS X 10.5@ *** 
  -- Gamma value  
   type ppd_cpvalue_u (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            custom_curve : aliased float;  -- cups/ppd.h:261
         when 1 =>
            custom_int : aliased int;  -- cups/ppd.h:262
         when 2 =>
            custom_invcurve : aliased float;  -- cups/ppd.h:263
         when 3 =>
            custom_passcode : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:264
         when 4 =>
            custom_password : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:265
         when 5 =>
            custom_points : aliased float;  -- cups/ppd.h:266
         when 6 =>
            custom_real : aliased float;  -- cups/ppd.h:267
         when others =>
            custom_string : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:268
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_cpvalue_u);
   pragma Unchecked_Union (ppd_cpvalue_u);  -- cups/ppd.h:259

  -- Integer value  
  -- Gamma value  
  -- Passcode value  
  -- Password value  
  -- Measurement value  
  -- Real value  
  -- String value  
   subtype ppd_cpvalue_t is ppd_cpvalue_u;

  --*** Custom Parameter @since CUPS 1.2/OS X 10.5@ *** 
  -- Parameter name  
   subtype ppd_cparam_s_name_array is Interfaces.C.char_array (0 .. 40);
   subtype ppd_cparam_s_text_array is Interfaces.C.char_array (0 .. 80);
   type ppd_cparam_s is record
      name : aliased ppd_cparam_s_name_array;  -- cups/ppd.h:273
      text : aliased ppd_cparam_s_text_array;  -- cups/ppd.h:274
      order : aliased int;  -- cups/ppd.h:275
      c_type : aliased ppd_cptype_t;  -- cups/ppd.h:276
      minimum : aliased ppd_cplimit_t;  -- cups/ppd.h:277
      maximum : aliased ppd_cplimit_t;  -- cups/ppd.h:278
      current : aliased ppd_cpvalue_t;  -- cups/ppd.h:279
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_cparam_s);  -- cups/ppd.h:271

  -- Human-readable text  
  -- Order (0 to N)  
  -- Parameter type  
  -- Minimum value  
  -- Maximum value  
  -- Current value  
   subtype ppd_cparam_t is ppd_cparam_s;

  --*** Custom Option @since CUPS 1.2/OS X 10.5@ *** 
  -- Name of option that is being extended...  
   subtype ppd_coption_s_keyword_array is Interfaces.C.char_array (0 .. 40);
   type ppd_coption_s is record
      keyword : aliased ppd_coption_s_keyword_array;  -- cups/ppd.h:284
      option : access ppd_option_t;  -- cups/ppd.h:285
      marked : aliased int;  -- cups/ppd.h:286
      params : System.Address;  -- cups/ppd.h:287
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_coption_s);  -- cups/ppd.h:282

  -- Option that is being extended...  
  -- Extended option is marked  
  -- Parameters  
   subtype ppd_coption_t is ppd_coption_s;

   --  skipped empty struct u_ppd_cache_s

   --  skipped empty struct u_ppd_cache_t

  --*** PPD cache and mapping data @since CUPS 1.5/OS X 10.7@ @private@ *** 
  --*** PPD File *** 
  -- Language level of device  
   type ppd_file_s_custom_min_array is array (0 .. 1) of aliased float;
   type ppd_file_s_custom_max_array is array (0 .. 1) of aliased float;
   type ppd_file_s_custom_margins_array is array (0 .. 3) of aliased float;
   type ppd_file_s is record
      language_level : aliased int;  -- cups/ppd.h:295
      color_device : aliased int;  -- cups/ppd.h:296
      variable_sizes : aliased int;  -- cups/ppd.h:297
      accurate_screens : aliased int;  -- cups/ppd.h:298
      contone_only : aliased int;  -- cups/ppd.h:299
      landscape : aliased int;  -- cups/ppd.h:300
      model_number : aliased int;  -- cups/ppd.h:301
      manual_copies : aliased int;  -- cups/ppd.h:302
      throughput : aliased int;  -- cups/ppd.h:303
      colorspace : aliased ppd_cs_t;  -- cups/ppd.h:304
      patches : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:305
      num_emulations : aliased int;  -- cups/ppd.h:306
      emulations : access ppd_emul_t;  -- cups/ppd.h:307
      jcl_begin : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:308
      jcl_ps : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:309
      jcl_end : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:310
      lang_encoding : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:311
      lang_version : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:312
      modelname : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:313
      ttrasterizer : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:314
      manufacturer : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:315
      product : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:316
      nickname : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:317
      shortnickname : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:318
      num_groups : aliased int;  -- cups/ppd.h:319
      groups : access ppd_group_t;  -- cups/ppd.h:320
      num_sizes : aliased int;  -- cups/ppd.h:321
      sizes : access ppd_size_t;  -- cups/ppd.h:322
      custom_min : aliased ppd_file_s_custom_min_array;  -- cups/ppd.h:323
      custom_max : aliased ppd_file_s_custom_max_array;  -- cups/ppd.h:324
      custom_margins : aliased ppd_file_s_custom_margins_array;  -- cups/ppd.h:325
      num_consts : aliased int;  -- cups/ppd.h:326
      consts : access ppd_const_t;  -- cups/ppd.h:327
      num_fonts : aliased int;  -- cups/ppd.h:328
      fonts : System.Address;  -- cups/ppd.h:329
      num_profiles : aliased int;  -- cups/ppd.h:330
      profiles : access ppd_profile_t;  -- cups/ppd.h:331
      num_filters : aliased int;  -- cups/ppd.h:332
      filters : System.Address;  -- cups/ppd.h:333
      flip_duplex : aliased int;  -- cups/ppd.h:336
      protocols : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:339
      pcfilename : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:340
      num_attrs : aliased int;  -- cups/ppd.h:341
      cur_attr : aliased int;  -- cups/ppd.h:342
      attrs : System.Address;  -- cups/ppd.h:343
      sorted_attrs : System.Address;  -- cups/ppd.h:346
      options : System.Address;  -- cups/ppd.h:347
      coptions : System.Address;  -- cups/ppd.h:348
      marked : System.Address;  -- cups/ppd.h:351
      cups_uiconstraints : System.Address;  -- cups/ppd.h:354
      cache : System.Address;  -- cups/ppd.h:357
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_file_s);  -- cups/ppd.h:293

  -- 1 = color device, 0 = grayscale  
  -- 1 = supports variable sizes, 0 = doesn't  
  -- 1 = supports accurate screens, 0 = not  
  -- 1 = continuous tone only, 0 = not  
  -- -90 or 90  
  -- Device-specific model number  
  -- 1 = Copies done manually, 0 = hardware  
  -- Pages per minute  
  -- Default colorspace  
  -- Patch commands to be sent to printer  
  -- Number of emulations supported  
  -- Emulations and the code to invoke them  
  -- Start JCL commands  
  -- Enter PostScript interpreter  
  -- End JCL commands  
  -- Language encoding  
  -- Language version (English, Spanish, etc.)  
  -- Model name (general)  
  -- Truetype rasterizer  
  -- Manufacturer name  
  -- Product name (from PS RIP/interpreter)  
  -- Nickname (specific)  
  -- Short version of nickname  
  -- Number of UI groups  
  -- UI groups  
  -- Number of page sizes  
  -- Page sizes  
  -- Minimum variable page size  
  -- Maximum variable page size  
  -- Margins around page  
  -- Number of UI/Non-UI constraints  
  -- UI/Non-UI constraints  
  -- Number of pre-loaded fonts  
  -- Pre-loaded fonts  
  -- Number of sRGB color profiles @deprecated@  
  -- sRGB color profiles @deprecated@  
  -- Number of filters  
  -- Filter strings...  
  --*** New in CUPS 1.1 *** 
  -- 1 = Flip page for back sides @deprecated@  
  --*** New in CUPS 1.1.19 *** 
  -- Protocols (BCP, TBCP) string @since CUPS 1.1.19/OS X 10.3@  
  -- PCFileName string @since CUPS 1.1.19/OS X 10.3@  
  -- Number of attributes @since CUPS 1.1.19/OS X 10.3@ @private@  
  -- Current attribute @since CUPS 1.1.19/OS X 10.3@ @private@  
  -- Attributes @since CUPS 1.1.19/OS X 10.3@ @private@  
  --*** New in CUPS 1.2/OS X 10.5 *** 
  -- Attribute lookup array @since CUPS 1.2/OS X 10.5@ @private@  
  -- Option lookup array @since CUPS 1.2/OS X 10.5@ @private@  
  -- Custom options array @since CUPS 1.2/OS X 10.5@ @private@  
  --*** New in CUPS 1.3/OS X 10.5 *** 
  -- Marked choices @since CUPS 1.3/OS X 10.5@ @private@  
  --*** New in CUPS 1.4/OS X 10.6 *** 
  -- cupsUIConstraints @since CUPS 1.4/OS X 10.6@ @private@  
  --*** New in CUPS 1.5 *** 
  -- PPD cache and mapping data @since CUPS 1.5/OS X 10.7@ @private@  
   subtype ppd_file_t is ppd_file_s;

  -- * Prototypes...
  --  

   function cupsMarkOptions
     (ppd : access ppd_file_t;
      num_options : int;
      options : access CUPS.cups_cups_h.cups_option_t) return int;  -- cups/ppd.h:365
   pragma Import (C, cupsMarkOptions, "cupsMarkOptions");

   procedure ppdClose (ppd : access ppd_file_t);  -- cups/ppd.h:367
   pragma Import (C, ppdClose, "ppdClose");

   function ppdCollect
     (ppd : access ppd_file_t;
      section : ppd_section_t;
      choices : System.Address) return int;  -- cups/ppd.h:368
   pragma Import (C, ppdCollect, "ppdCollect");

   function ppdConflicts (ppd : access ppd_file_t) return int;  -- cups/ppd.h:370
   pragma Import (C, ppdConflicts, "ppdConflicts");

   function ppdEmit
     (ppd : access ppd_file_t;
      fp : access Interfaces.C_Streams.FILEs;
      section : ppd_section_t) return int;  -- cups/ppd.h:371
   pragma Import (C, ppdEmit, "ppdEmit");

   function ppdEmitFd
     (ppd : access ppd_file_t;
      fd : int;
      section : ppd_section_t) return int;  -- cups/ppd.h:373
   pragma Import (C, ppdEmitFd, "ppdEmitFd");

   function ppdEmitJCL
     (ppd : access ppd_file_t;
      fp : access Interfaces.C_Streams.FILEs;
      job_id : int;
      user : Interfaces.C.Strings.chars_ptr;
      title : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ppd.h:375
   pragma Import (C, ppdEmitJCL, "ppdEmitJCL");

   function ppdFindChoice (o : access ppd_option_t; option : Interfaces.C.Strings.chars_ptr) return access ppd_choice_t;  -- cups/ppd.h:378
   pragma Import (C, ppdFindChoice, "ppdFindChoice");

   function ppdFindMarkedChoice (ppd : access ppd_file_t; keyword : Interfaces.C.Strings.chars_ptr) return access ppd_choice_t;  -- cups/ppd.h:380
   pragma Import (C, ppdFindMarkedChoice, "ppdFindMarkedChoice");

   function ppdFindOption (ppd : access ppd_file_t; keyword : Interfaces.C.Strings.chars_ptr) return access ppd_option_t;  -- cups/ppd.h:383
   pragma Import (C, ppdFindOption, "ppdFindOption");

   function ppdIsMarked
     (ppd : access ppd_file_t;
      keyword : Interfaces.C.Strings.chars_ptr;
      option : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ppd.h:385
   pragma Import (C, ppdIsMarked, "ppdIsMarked");

   procedure ppdMarkDefaults (ppd : access ppd_file_t);  -- cups/ppd.h:387
   pragma Import (C, ppdMarkDefaults, "ppdMarkDefaults");

   function ppdMarkOption
     (ppd : access ppd_file_t;
      keyword : Interfaces.C.Strings.chars_ptr;
      option : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ppd.h:388
   pragma Import (C, ppdMarkOption, "ppdMarkOption");

   function ppdOpen (fp : access Interfaces.C_Streams.FILEs) return access ppd_file_t;  -- cups/ppd.h:390
   pragma Import (C, ppdOpen, "ppdOpen");

   function ppdOpenFd (fd : int) return access ppd_file_t;  -- cups/ppd.h:391
   pragma Import (C, ppdOpenFd, "ppdOpenFd");

   function ppdOpenFile (filename : Interfaces.C.Strings.chars_ptr) return access ppd_file_t;  -- cups/ppd.h:392
   pragma Import (C, ppdOpenFile, "ppdOpenFile");

   function ppdPageLength (ppd : access ppd_file_t; name : Interfaces.C.Strings.chars_ptr) return float;  -- cups/ppd.h:393
   pragma Import (C, ppdPageLength, "ppdPageLength");

   function ppdPageSize (ppd : access ppd_file_t; name : Interfaces.C.Strings.chars_ptr) return access ppd_size_t;  -- cups/ppd.h:395
   pragma Import (C, ppdPageSize, "ppdPageSize");

   function ppdPageWidth (ppd : access ppd_file_t; name : Interfaces.C.Strings.chars_ptr) return float;  -- cups/ppd.h:397
   pragma Import (C, ppdPageWidth, "ppdPageWidth");

  --*** New in CUPS 1.1.19 *** 
   function ppdErrorString (status : ppd_status_t) return Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:401
   pragma Import (C, ppdErrorString, "ppdErrorString");

   function ppdFindAttr
     (ppd : access ppd_file_t;
      name : Interfaces.C.Strings.chars_ptr;
      spec : Interfaces.C.Strings.chars_ptr) return access ppd_attr_t;  -- cups/ppd.h:402
   pragma Import (C, ppdFindAttr, "ppdFindAttr");

   function ppdFindNextAttr
     (ppd : access ppd_file_t;
      name : Interfaces.C.Strings.chars_ptr;
      spec : Interfaces.C.Strings.chars_ptr) return access ppd_attr_t;  -- cups/ppd.h:404
   pragma Import (C, ppdFindNextAttr, "ppdFindNextAttr");

   function ppdLastError (line : access int) return ppd_status_t;  -- cups/ppd.h:406
   pragma Import (C, ppdLastError, "ppdLastError");

  --*** New in CUPS 1.1.20 *** 
   procedure ppdSetConformance (c : ppd_conform_t);  -- cups/ppd.h:409
   pragma Import (C, ppdSetConformance, "ppdSetConformance");

  --*** New in CUPS 1.2 *** 
   function ppdCollect2
     (ppd : access ppd_file_t;
      section : ppd_section_t;
      min_order : float;
      choices : System.Address) return int;  -- cups/ppd.h:412
   pragma Import (C, ppdCollect2, "ppdCollect2");

   function ppdEmitAfterOrder
     (ppd : access ppd_file_t;
      fp : access Interfaces.C_Streams.FILEs;
      section : ppd_section_t;
      limit : int;
      min_order : float) return int;  -- cups/ppd.h:415
   pragma Import (C, ppdEmitAfterOrder, "ppdEmitAfterOrder");

   function ppdEmitJCLEnd (ppd : access ppd_file_t; fp : access Interfaces.C_Streams.FILEs) return int;  -- cups/ppd.h:418
   pragma Import (C, ppdEmitJCLEnd, "ppdEmitJCLEnd");

   function ppdEmitString
     (ppd : access ppd_file_t;
      section : ppd_section_t;
      min_order : float) return Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:420
   pragma Import (C, ppdEmitString, "ppdEmitString");

   function ppdFindCustomOption (ppd : access ppd_file_t; keyword : Interfaces.C.Strings.chars_ptr) return access ppd_coption_t;  -- cups/ppd.h:422
   pragma Import (C, ppdFindCustomOption, "ppdFindCustomOption");

   function ppdFindCustomParam (opt : access ppd_coption_t; name : Interfaces.C.Strings.chars_ptr) return access ppd_cparam_t;  -- cups/ppd.h:425
   pragma Import (C, ppdFindCustomParam, "ppdFindCustomParam");

   function ppdFirstCustomParam (opt : access ppd_coption_t) return access ppd_cparam_t;  -- cups/ppd.h:427
   pragma Import (C, ppdFirstCustomParam, "ppdFirstCustomParam");

   function ppdFirstOption (ppd : access ppd_file_t) return access ppd_option_t;  -- cups/ppd.h:429
   pragma Import (C, ppdFirstOption, "ppdFirstOption");

   function ppdNextCustomParam (opt : access ppd_coption_t) return access ppd_cparam_t;  -- cups/ppd.h:430
   pragma Import (C, ppdNextCustomParam, "ppdNextCustomParam");

   function ppdNextOption (ppd : access ppd_file_t) return access ppd_option_t;  -- cups/ppd.h:431
   pragma Import (C, ppdNextOption, "ppdNextOption");

   function ppdLocalize (ppd : access ppd_file_t) return int;  -- cups/ppd.h:432
   pragma Import (C, ppdLocalize, "ppdLocalize");

   function ppdOpen2 (fp : System.Address) return access ppd_file_t;  -- cups/ppd.h:433
   pragma Import (C, ppdOpen2, "ppdOpen2");

  --*** New in CUPS 1.3/OS X 10.5 *** 
   function ppdLocalizeIPPReason
     (ppd : access ppd_file_t;
      reason : Interfaces.C.Strings.chars_ptr;
      scheme : Interfaces.C.Strings.chars_ptr;
      buffer : Interfaces.C.Strings.chars_ptr;
      bufsize : size_t) return Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:436
   pragma Import (C, ppdLocalizeIPPReason, "ppdLocalizeIPPReason");

  --*** New in CUPS 1.4/OS X 10.6 *** 
   function cupsGetConflicts
     (ppd : access ppd_file_t;
      option : Interfaces.C.Strings.chars_ptr;
      choice : Interfaces.C.Strings.chars_ptr;
      options : System.Address) return int;  -- cups/ppd.h:443
   pragma Import (C, cupsGetConflicts, "cupsGetConflicts");

   function cupsResolveConflicts
     (ppd : access ppd_file_t;
      option : Interfaces.C.Strings.chars_ptr;
      choice : Interfaces.C.Strings.chars_ptr;
      num_options : access int;
      options : System.Address) return int;  -- cups/ppd.h:447
   pragma Import (C, cupsResolveConflicts, "cupsResolveConflicts");

   function ppdInstallableConflict
     (ppd : access ppd_file_t;
      option : Interfaces.C.Strings.chars_ptr;
      choice : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ppd.h:453
   pragma Import (C, ppdInstallableConflict, "ppdInstallableConflict");

   function ppdLocalizeAttr
     (ppd : access ppd_file_t;
      keyword : Interfaces.C.Strings.chars_ptr;
      spec : Interfaces.C.Strings.chars_ptr) return access ppd_attr_t;  -- cups/ppd.h:457
   pragma Import (C, ppdLocalizeAttr, "ppdLocalizeAttr");

   function ppdLocalizeMarkerName (ppd : access ppd_file_t; name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:459
   pragma Import (C, ppdLocalizeMarkerName, "ppdLocalizeMarkerName");

   function ppdPageSizeLimits
     (ppd : access ppd_file_t;
      minimum : access ppd_size_t;
      maximum : access ppd_size_t) return int;  -- cups/ppd.h:462
   pragma Import (C, ppdPageSizeLimits, "ppdPageSizeLimits");

  -- * C++ magic...
  --  

  -- * "$Id: ppd.h 11056 2013-06-25 14:27:30Z msweet $"
  -- *
  -- *   PostScript Printer Description definitions for CUPS.
  -- *
  -- *   THESE APIS ARE DEPRECATED. TO COMPILE WITHOUT WARNINGS ADD
  -- *   -D_PPD_DEPRECATED="" TO YOUR COMPILE OPTIONS.  THIS HEADER AND THESE
  -- *   FUNCTIONS WILL BE REMOVED IN A FUTURE RELEASE OF CUPS.
  -- *
  -- *   Copyright 2007-2013 by Apple Inc.
  -- *   Copyright 1997-2007 by Easy Software Products, all rights reserved.
  -- *
  -- *   These coded instructions, statements, and computer programs are the
  -- *   property of Apple Inc. and are protected by Federal copyright
  -- *   law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- *   which should have been included with this file.  If this file is
  -- *   file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- *   PostScript is a trademark of Adobe Systems, Inc.
  -- *
  -- *   This code and any derivative of it may be used and distributed
  -- *   freely under the terms of the GNU General Public License when
  -- *   used with GNU Ghostscript or its derivatives.  Use of the code
  -- *   (or any derivative of it) with software other than GNU
  -- *   GhostScript (or its derivatives) is governed by the CUPS license
  -- *   agreement.
  -- *
  -- *   This file is subject to the Apple OS-Developed Software exception.
  --  

end CUPS.cups_ppd_h;
