pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package libCUPS.cups_language_h is

   subtype cups_encoding_e is unsigned;
   CUPS_AUTO_ENCODING : constant cups_encoding_e := -1;
   CUPS_US_ASCII : constant cups_encoding_e := 0;
   CUPS_ISO8859_1 : constant cups_encoding_e := 1;
   CUPS_ISO8859_2 : constant cups_encoding_e := 2;
   CUPS_ISO8859_3 : constant cups_encoding_e := 3;
   CUPS_ISO8859_4 : constant cups_encoding_e := 4;
   CUPS_ISO8859_5 : constant cups_encoding_e := 5;
   CUPS_ISO8859_6 : constant cups_encoding_e := 6;
   CUPS_ISO8859_7 : constant cups_encoding_e := 7;
   CUPS_ISO8859_8 : constant cups_encoding_e := 8;
   CUPS_ISO8859_9 : constant cups_encoding_e := 9;
   CUPS_ISO8859_10 : constant cups_encoding_e := 10;
   CUPS_UTF8 : constant cups_encoding_e := 11;
   CUPS_ISO8859_13 : constant cups_encoding_e := 12;
   CUPS_ISO8859_14 : constant cups_encoding_e := 13;
   CUPS_ISO8859_15 : constant cups_encoding_e := 14;
   CUPS_WINDOWS_874 : constant cups_encoding_e := 15;
   CUPS_WINDOWS_1250 : constant cups_encoding_e := 16;
   CUPS_WINDOWS_1251 : constant cups_encoding_e := 17;
   CUPS_WINDOWS_1252 : constant cups_encoding_e := 18;
   CUPS_WINDOWS_1253 : constant cups_encoding_e := 19;
   CUPS_WINDOWS_1254 : constant cups_encoding_e := 20;
   CUPS_WINDOWS_1255 : constant cups_encoding_e := 21;
   CUPS_WINDOWS_1256 : constant cups_encoding_e := 22;
   CUPS_WINDOWS_1257 : constant cups_encoding_e := 23;
   CUPS_WINDOWS_1258 : constant cups_encoding_e := 24;
   CUPS_KOI8_R : constant cups_encoding_e := 25;
   CUPS_KOI8_U : constant cups_encoding_e := 26;
   CUPS_ISO8859_11 : constant cups_encoding_e := 27;
   CUPS_ISO8859_16 : constant cups_encoding_e := 28;
   CUPS_MAC_ROMAN : constant cups_encoding_e := 29;
   CUPS_ENCODING_SBCS_END : constant cups_encoding_e := 63;
   CUPS_WINDOWS_932 : constant cups_encoding_e := 64;
   CUPS_WINDOWS_936 : constant cups_encoding_e := 65;
   CUPS_WINDOWS_949 : constant cups_encoding_e := 66;
   CUPS_WINDOWS_950 : constant cups_encoding_e := 67;
   CUPS_WINDOWS_1361 : constant cups_encoding_e := 68;
   CUPS_ENCODING_DBCS_END : constant cups_encoding_e := 127;
   CUPS_EUC_CN : constant cups_encoding_e := 128;
   CUPS_EUC_JP : constant cups_encoding_e := 129;
   CUPS_EUC_KR : constant cups_encoding_e := 130;
   CUPS_EUC_TW : constant cups_encoding_e := 131;
   CUPS_JIS_X0213 : constant cups_encoding_e := 132;
   CUPS_ENCODING_VBCS_END : constant cups_encoding_e := 191;  -- cups/language.h:37

   subtype cups_encoding_t is cups_encoding_e;

   subtype anon3363_language_array is Interfaces.C.char_array (0 .. 15);
   type cups_lang_s is record
      next : access cups_lang_s;  -- cups/language.h:89
      used : aliased int;  -- cups/language.h:90
      encoding : aliased cups_encoding_t;  -- cups/language.h:91
      language : aliased anon3363_language_array;  -- cups/language.h:92
      strings : System.Address;  -- cups/language.h:93
   end record;
   pragma Convention (C_Pass_By_Copy, cups_lang_s);  -- cups/language.h:87

   subtype cups_lang_t is cups_lang_s;

   function cupsLangDefault return access cups_lang_t;  -- cups/language.h:101
   pragma Import (C, cupsLangDefault, "cupsLangDefault");

   function cupsLangEncoding (arg1 : access cups_lang_t) return Interfaces.C.Strings.chars_ptr;  -- cups/language.h:102
   pragma Import (C, cupsLangEncoding, "cupsLangEncoding");

   procedure cupsLangFlush;  -- cups/language.h:103
   pragma Import (C, cupsLangFlush, "cupsLangFlush");

   procedure cupsLangFree (arg1 : access cups_lang_t);  -- cups/language.h:104
   pragma Import (C, cupsLangFree, "cupsLangFree");

   function cupsLangGet (arg1 : Interfaces.C.Strings.chars_ptr) return access cups_lang_t;  -- cups/language.h:105
   pragma Import (C, cupsLangGet, "cupsLangGet");

end libCUPS.cups_language_h;
