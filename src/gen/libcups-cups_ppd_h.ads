pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with libCUPS.cups_cups_h;
limited with libCUPS.stdio_h;
with Interfaces.C_Streams;


package libCUPS.cups_ppd_h is

   PPD_VERSION : constant := 4.3;  --  cups/ppd.h:67

   PPD_MAX_NAME : constant := 41;  --  cups/ppd.h:74
   PPD_MAX_TEXT : constant := 81;  --  cups/ppd.h:75
   PPD_MAX_LINE : constant := 256;  --  cups/ppd.h:76

   type ppd_ui_e is 
     (PPD_UI_BOOLEAN,
      PPD_UI_PICKONE,
      PPD_UI_PICKMANY);
   pragma Convention (C, ppd_ui_e);  -- cups/ppd.h:83

   subtype ppd_ui_t is ppd_ui_e;

   type ppd_section_e is 
     (PPD_ORDER_ANY,
      PPD_ORDER_DOCUMENT,
      PPD_ORDER_EXIT,
      PPD_ORDER_JCL,
      PPD_ORDER_PAGE,
      PPD_ORDER_PROLOG);
   pragma Convention (C, ppd_section_e);  -- cups/ppd.h:90

   subtype ppd_section_t is ppd_section_e;

   subtype ppd_cs_e is unsigned;
   PPD_CS_CMYK : constant ppd_cs_e := -4;
   PPD_CS_CMY : constant ppd_cs_e := -3;
   PPD_CS_GRAY : constant ppd_cs_e := 1;
   PPD_CS_RGB : constant ppd_cs_e := 3;
   PPD_CS_RGBK : constant ppd_cs_e := 4;
   PPD_CS_N : constant ppd_cs_e := 5;  -- cups/ppd.h:100

   subtype ppd_cs_t is ppd_cs_e;

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

   subtype ppd_status_t is ppd_status_e;

   type ppd_conform_e is 
     (PPD_CONFORM_RELAXED,
      PPD_CONFORM_STRICT);
   pragma Convention (C, ppd_conform_e);  -- cups/ppd.h:139

   subtype ppd_conform_t is ppd_conform_e;

   subtype anon3753_name_array is Interfaces.C.char_array (0 .. 40);
   subtype anon3753_spec_array is Interfaces.C.char_array (0 .. 40);
   subtype anon3753_text_array is Interfaces.C.char_array (0 .. 80);
   type ppd_attr_s is record
      name : aliased anon3753_name_array;  -- cups/ppd.h:150
      spec : aliased anon3753_spec_array;  -- cups/ppd.h:151
      text : aliased anon3753_text_array;  -- cups/ppd.h:152
      value : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:153
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_attr_s);  -- cups/ppd.h:148

   subtype ppd_attr_t is ppd_attr_s;

   type ppd_option_s;
   subtype anon3761_keyword_array is Interfaces.C.char_array (0 .. 40);
   subtype anon3761_defchoice_array is Interfaces.C.char_array (0 .. 40);
   subtype anon3761_text_array is Interfaces.C.char_array (0 .. 80);
   subtype ppd_option_t is ppd_option_s;

   subtype anon3763_choice_array is Interfaces.C.char_array (0 .. 40);
   subtype anon3763_text_array is Interfaces.C.char_array (0 .. 80);
   type ppd_choice_s is record
      marked : aliased char;  -- cups/ppd.h:161
      choice : aliased anon3763_choice_array;  -- cups/ppd.h:162
      text : aliased anon3763_text_array;  -- cups/ppd.h:163
      code : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:164
      option : access ppd_option_t;  -- cups/ppd.h:165
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_choice_s);  -- cups/ppd.h:159

   subtype ppd_choice_t is ppd_choice_s;

   type ppd_option_s is record
      conflicted : aliased char;  -- cups/ppd.h:170
      keyword : aliased anon3761_keyword_array;  -- cups/ppd.h:171
      defchoice : aliased anon3761_defchoice_array;  -- cups/ppd.h:172
      text : aliased anon3761_text_array;  -- cups/ppd.h:173
      ui : aliased ppd_ui_t;  -- cups/ppd.h:174
      section : aliased ppd_section_t;  -- cups/ppd.h:175
      order : aliased float;  -- cups/ppd.h:176
      num_choices : aliased int;  -- cups/ppd.h:177
      choices : access ppd_choice_t;  -- cups/ppd.h:178
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_option_s);  -- cups/ppd.h:168

   subtype anon3779_text_array is Interfaces.C.char_array (0 .. 39);
   subtype anon3779_name_array is Interfaces.C.char_array (0 .. 40);
   type ppd_group_s is record
      text : aliased anon3779_text_array;  -- cups/ppd.h:187
      name : aliased anon3779_name_array;  -- cups/ppd.h:189
      num_options : aliased int;  -- cups/ppd.h:190
      options : access ppd_option_t;  -- cups/ppd.h:191
      num_subgroups : aliased int;  -- cups/ppd.h:192
      subgroups : access ppd_group_s;  -- cups/ppd.h:193
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_group_s);  -- cups/ppd.h:181

   subtype ppd_group_t is ppd_group_s;

   subtype anon3786_option1_array is Interfaces.C.char_array (0 .. 40);
   subtype anon3786_choice1_array is Interfaces.C.char_array (0 .. 40);
   subtype anon3786_option2_array is Interfaces.C.char_array (0 .. 40);
   subtype anon3786_choice2_array is Interfaces.C.char_array (0 .. 40);
   type ppd_const_s is record
      option1 : aliased anon3786_option1_array;  -- cups/ppd.h:198
      choice1 : aliased anon3786_choice1_array;  -- cups/ppd.h:199
      option2 : aliased anon3786_option2_array;  -- cups/ppd.h:200
      choice2 : aliased anon3786_choice2_array;  -- cups/ppd.h:201
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_const_s);  -- cups/ppd.h:196

   subtype ppd_const_t is ppd_const_s;

   subtype anon3796_name_array is Interfaces.C.char_array (0 .. 40);
   type ppd_size_s is record
      marked : aliased int;  -- cups/ppd.h:206
      name : aliased anon3796_name_array;  -- cups/ppd.h:207
      width : aliased float;  -- cups/ppd.h:208
      length : aliased float;  -- cups/ppd.h:209
      left : aliased float;  -- cups/ppd.h:210
      bottom : aliased float;  -- cups/ppd.h:211
      right : aliased float;  -- cups/ppd.h:212
      top : aliased float;  -- cups/ppd.h:213
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_size_s);  -- cups/ppd.h:204

   subtype ppd_size_t is ppd_size_s;

   subtype anon3800_name_array is Interfaces.C.char_array (0 .. 40);
   type ppd_emul_s is record
      name : aliased anon3800_name_array;  -- cups/ppd.h:218
      start : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:219
      stop : Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:220
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_emul_s);  -- cups/ppd.h:216

   subtype ppd_emul_t is ppd_emul_s;

   subtype anon3804_resolution_array is Interfaces.C.char_array (0 .. 40);
   subtype anon3804_media_type_array is Interfaces.C.char_array (0 .. 40);
   type anon3804_matrix_array is array (0 .. 2, 0 .. 2) of aliased float;
   type ppd_profile_s is record
      resolution : aliased anon3804_resolution_array;  -- cups/ppd.h:225
      media_type : aliased anon3804_media_type_array;  -- cups/ppd.h:227
      density : aliased float;  -- cups/ppd.h:229
      gamma : aliased float;  -- cups/ppd.h:230
      matrix : aliased anon3804_matrix_array;  -- cups/ppd.h:231
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_profile_s);  -- cups/ppd.h:223

   subtype ppd_profile_t is ppd_profile_s;

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

   subtype ppd_cptype_t is ppd_cptype_e;

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

   subtype ppd_cplimit_t is ppd_cplimit_u;

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

   subtype ppd_cpvalue_t is ppd_cpvalue_u;

   subtype anon3821_name_array is Interfaces.C.char_array (0 .. 40);
   subtype anon3821_text_array is Interfaces.C.char_array (0 .. 80);
   type ppd_cparam_s is record
      name : aliased anon3821_name_array;  -- cups/ppd.h:273
      text : aliased anon3821_text_array;  -- cups/ppd.h:274
      order : aliased int;  -- cups/ppd.h:275
      c_type : aliased ppd_cptype_t;  -- cups/ppd.h:276
      minimum : aliased ppd_cplimit_t;  -- cups/ppd.h:277
      maximum : aliased ppd_cplimit_t;  -- cups/ppd.h:278
      current : aliased ppd_cpvalue_t;  -- cups/ppd.h:279
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_cparam_s);  -- cups/ppd.h:271

   subtype ppd_cparam_t is ppd_cparam_s;

   subtype anon3827_keyword_array is Interfaces.C.char_array (0 .. 40);
   type ppd_coption_s is record
      keyword : aliased anon3827_keyword_array;  -- cups/ppd.h:284
      option : access ppd_option_t;  -- cups/ppd.h:285
      marked : aliased int;  -- cups/ppd.h:286
      params : System.Address;  -- cups/ppd.h:287
   end record;
   pragma Convention (C_Pass_By_Copy, ppd_coption_s);  -- cups/ppd.h:282

   subtype ppd_coption_t is ppd_coption_s;

   --  skipped empty struct u_ppd_cache_s

   --  skipped empty struct u_ppd_cache_t

   type anon3833_custom_min_array is array (0 .. 1) of aliased float;
   type anon3833_custom_max_array is array (0 .. 1) of aliased float;
   type anon3833_custom_margins_array is array (0 .. 3) of aliased float;
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
      custom_min : aliased anon3833_custom_min_array;  -- cups/ppd.h:323
      custom_max : aliased anon3833_custom_max_array;  -- cups/ppd.h:324
      custom_margins : aliased anon3833_custom_margins_array;  -- cups/ppd.h:325
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

   subtype ppd_file_t is ppd_file_s;

   function cupsMarkOptions
     (arg1 : access ppd_file_t;
      arg2 : int;
      arg3 : access libCUPS.cups_cups_h.cups_option_t) return int;  -- cups/ppd.h:365
   pragma Import (C, cupsMarkOptions, "cupsMarkOptions");

   procedure ppdClose (arg1 : access ppd_file_t);  -- cups/ppd.h:367
   pragma Import (C, ppdClose, "ppdClose");

   function ppdCollect
     (arg1 : access ppd_file_t;
      arg2 : ppd_section_t;
      arg3 : System.Address) return int;  -- cups/ppd.h:368
   pragma Import (C, ppdCollect, "ppdCollect");

   function ppdConflicts (arg1 : access ppd_file_t) return int;  -- cups/ppd.h:370
   pragma Import (C, ppdConflicts, "ppdConflicts");

   function ppdEmit
     (arg1 : access ppd_file_t;
      arg2 : access Interfaces.C_Streams.FILEs;
      arg3 : ppd_section_t) return int;  -- cups/ppd.h:371
   pragma Import (C, ppdEmit, "ppdEmit");

   function ppdEmitFd
     (arg1 : access ppd_file_t;
      arg2 : int;
      arg3 : ppd_section_t) return int;  -- cups/ppd.h:373
   pragma Import (C, ppdEmitFd, "ppdEmitFd");

   function ppdEmitJCL
     (arg1 : access ppd_file_t;
      arg2 : access Interfaces.C_Streams.FILEs;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ppd.h:375
   pragma Import (C, ppdEmitJCL, "ppdEmitJCL");

   function ppdFindChoice (arg1 : access ppd_option_t; arg2 : Interfaces.C.Strings.chars_ptr) return access ppd_choice_t;  -- cups/ppd.h:378
   pragma Import (C, ppdFindChoice, "ppdFindChoice");

   function ppdFindMarkedChoice (arg1 : access ppd_file_t; arg2 : Interfaces.C.Strings.chars_ptr) return access ppd_choice_t;  -- cups/ppd.h:380
   pragma Import (C, ppdFindMarkedChoice, "ppdFindMarkedChoice");

   function ppdFindOption (arg1 : access ppd_file_t; arg2 : Interfaces.C.Strings.chars_ptr) return access ppd_option_t;  -- cups/ppd.h:383
   pragma Import (C, ppdFindOption, "ppdFindOption");

   function ppdIsMarked
     (arg1 : access ppd_file_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ppd.h:385
   pragma Import (C, ppdIsMarked, "ppdIsMarked");

   procedure ppdMarkDefaults (arg1 : access ppd_file_t);  -- cups/ppd.h:387
   pragma Import (C, ppdMarkDefaults, "ppdMarkDefaults");

   function ppdMarkOption
     (arg1 : access ppd_file_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ppd.h:388
   pragma Import (C, ppdMarkOption, "ppdMarkOption");

   function ppdOpen (arg1 : access Interfaces.C_Streams.FILEs) return access ppd_file_t;  -- cups/ppd.h:390
   pragma Import (C, ppdOpen, "ppdOpen");

   function ppdOpenFd (arg1 : int) return access ppd_file_t;  -- cups/ppd.h:391
   pragma Import (C, ppdOpenFd, "ppdOpenFd");

   function ppdOpenFile (arg1 : Interfaces.C.Strings.chars_ptr) return access ppd_file_t;  -- cups/ppd.h:392
   pragma Import (C, ppdOpenFile, "ppdOpenFile");

   function ppdPageLength (arg1 : access ppd_file_t; arg2 : Interfaces.C.Strings.chars_ptr) return float;  -- cups/ppd.h:393
   pragma Import (C, ppdPageLength, "ppdPageLength");

   function ppdPageSize (arg1 : access ppd_file_t; arg2 : Interfaces.C.Strings.chars_ptr) return access ppd_size_t;  -- cups/ppd.h:395
   pragma Import (C, ppdPageSize, "ppdPageSize");

   function ppdPageWidth (arg1 : access ppd_file_t; arg2 : Interfaces.C.Strings.chars_ptr) return float;  -- cups/ppd.h:397
   pragma Import (C, ppdPageWidth, "ppdPageWidth");

   function ppdErrorString (arg1 : ppd_status_t) return Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:401
   pragma Import (C, ppdErrorString, "ppdErrorString");

   function ppdFindAttr
     (arg1 : access ppd_file_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr) return access ppd_attr_t;  -- cups/ppd.h:402
   pragma Import (C, ppdFindAttr, "ppdFindAttr");

   function ppdFindNextAttr
     (arg1 : access ppd_file_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr) return access ppd_attr_t;  -- cups/ppd.h:404
   pragma Import (C, ppdFindNextAttr, "ppdFindNextAttr");

   function ppdLastError (arg1 : access int) return ppd_status_t;  -- cups/ppd.h:406
   pragma Import (C, ppdLastError, "ppdLastError");

   procedure ppdSetConformance (arg1 : ppd_conform_t);  -- cups/ppd.h:409
   pragma Import (C, ppdSetConformance, "ppdSetConformance");

   function ppdCollect2
     (arg1 : access ppd_file_t;
      arg2 : ppd_section_t;
      arg3 : float;
      arg4 : System.Address) return int;  -- cups/ppd.h:412
   pragma Import (C, ppdCollect2, "ppdCollect2");

   function ppdEmitAfterOrder
     (arg1 : access ppd_file_t;
      arg2 : access Interfaces.C_Streams.FILEs;
      arg3 : ppd_section_t;
      arg4 : int;
      arg5 : float) return int;  -- cups/ppd.h:415
   pragma Import (C, ppdEmitAfterOrder, "ppdEmitAfterOrder");

   function ppdEmitJCLEnd (arg1 : access ppd_file_t; arg2 : access Interfaces.C_Streams.FILEs) return int;  -- cups/ppd.h:418
   pragma Import (C, ppdEmitJCLEnd, "ppdEmitJCLEnd");

   function ppdEmitString
     (arg1 : access ppd_file_t;
      arg2 : ppd_section_t;
      arg3 : float) return Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:420
   pragma Import (C, ppdEmitString, "ppdEmitString");

   function ppdFindCustomOption (arg1 : access ppd_file_t; arg2 : Interfaces.C.Strings.chars_ptr) return access ppd_coption_t;  -- cups/ppd.h:422
   pragma Import (C, ppdFindCustomOption, "ppdFindCustomOption");

   function ppdFindCustomParam (arg1 : access ppd_coption_t; arg2 : Interfaces.C.Strings.chars_ptr) return access ppd_cparam_t;  -- cups/ppd.h:425
   pragma Import (C, ppdFindCustomParam, "ppdFindCustomParam");

   function ppdFirstCustomParam (arg1 : access ppd_coption_t) return access ppd_cparam_t;  -- cups/ppd.h:427
   pragma Import (C, ppdFirstCustomParam, "ppdFirstCustomParam");

   function ppdFirstOption (arg1 : access ppd_file_t) return access ppd_option_t;  -- cups/ppd.h:429
   pragma Import (C, ppdFirstOption, "ppdFirstOption");

   function ppdNextCustomParam (arg1 : access ppd_coption_t) return access ppd_cparam_t;  -- cups/ppd.h:430
   pragma Import (C, ppdNextCustomParam, "ppdNextCustomParam");

   function ppdNextOption (arg1 : access ppd_file_t) return access ppd_option_t;  -- cups/ppd.h:431
   pragma Import (C, ppdNextOption, "ppdNextOption");

   function ppdLocalize (arg1 : access ppd_file_t) return int;  -- cups/ppd.h:432
   pragma Import (C, ppdLocalize, "ppdLocalize");

   function ppdOpen2 (arg1 : System.Address) return access ppd_file_t;  -- cups/ppd.h:433
   pragma Import (C, ppdOpen2, "ppdOpen2");

   function ppdLocalizeIPPReason
     (arg1 : access ppd_file_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : size_t) return Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:436
   pragma Import (C, ppdLocalizeIPPReason, "ppdLocalizeIPPReason");

   function cupsGetConflicts
     (arg1 : access ppd_file_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : System.Address) return int;  -- cups/ppd.h:443
   pragma Import (C, cupsGetConflicts, "cupsGetConflicts");

   function cupsResolveConflicts
     (arg1 : access ppd_file_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : access int;
      arg5 : System.Address) return int;  -- cups/ppd.h:447
   pragma Import (C, cupsResolveConflicts, "cupsResolveConflicts");

   function ppdInstallableConflict
     (arg1 : access ppd_file_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ppd.h:453
   pragma Import (C, ppdInstallableConflict, "ppdInstallableConflict");

   function ppdLocalizeAttr
     (arg1 : access ppd_file_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr) return access ppd_attr_t;  -- cups/ppd.h:457
   pragma Import (C, ppdLocalizeAttr, "ppdLocalizeAttr");

   function ppdLocalizeMarkerName (arg1 : access ppd_file_t; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/ppd.h:459
   pragma Import (C, ppdLocalizeMarkerName, "ppdLocalizeMarkerName");

   function ppdPageSizeLimits
     (arg1 : access ppd_file_t;
      arg2 : access ppd_size_t;
      arg3 : access ppd_size_t) return int;  -- cups/ppd.h:462
   pragma Import (C, ppdPageSizeLimits, "ppdPageSizeLimits");

end libCUPS.cups_ppd_h;
