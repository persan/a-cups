pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

private package CUPS.cups_array_h is

  -- * "$Id: array.h 10996 2013-05-29 11:51:34Z msweet $"
  -- *
  -- *   Sorted array definitions for CUPS.
  -- *
  -- *   Copyright 2007-2010 by Apple Inc.
  -- *   Copyright 1997-2007 by Easy Software Products.
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

  -- * C++ magic...
  --  

  -- * Types and structures...
  --  

   --  skipped empty struct u_cups_array_s

   --  skipped empty struct cups_array_t

  --*** CUPS array type *** 
   type cups_array_func_t is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address) return int;
   pragma Convention (C, cups_array_func_t);  -- cups/array.h:44

  --*** Array comparison function *** 
   type cups_ahash_func_t is access function (arg1 : System.Address; arg2 : System.Address) return int;
   pragma Convention (C, cups_ahash_func_t);  -- cups/array.h:46

  --*** Array hash function *** 
   type cups_acopy_func_t is access function (arg1 : System.Address; arg2 : System.Address) return System.Address;
   pragma Convention (C, cups_acopy_func_t);  -- cups/array.h:48

  --*** Array element copy function *** 
   type cups_afree_func_t is access procedure (arg1 : System.Address; arg2 : System.Address);
   pragma Convention (C, cups_afree_func_t);  -- cups/array.h:50

  --*** Array element free function *** 
  -- * Functions...
  --  

  -- * "$Id: array.h 10996 2013-05-29 11:51:34Z msweet $"
  -- *
  -- *   Sorted array definitions for CUPS.
  -- *
  -- *   Copyright 2007-2010 by Apple Inc.
  -- *   Copyright 1997-2007 by Easy Software Products.
  -- *
  -- *   These coded instructions, statements, and computer programs are the
  -- *   property of Apple Inc. and are protected by Federal copyright
  -- *   law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- *   which should have been included with this file.  If this file is
  -- *   file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- *   This file is subject to the Apple OS-Developed Software exception.
  --  

   function cupsArrayAdd (a : System.Address; e : System.Address) return int;  -- cups/array.h:58
   pragma Import (C, cupsArrayAdd, "cupsArrayAdd");

   procedure cupsArrayClear (a : System.Address);  -- cups/array.h:59
   pragma Import (C, cupsArrayClear, "cupsArrayClear");

   function cupsArrayCount (a : System.Address) return int;  -- cups/array.h:60
   pragma Import (C, cupsArrayCount, "cupsArrayCount");

   function cupsArrayCurrent (a : System.Address) return System.Address;  -- cups/array.h:61
   pragma Import (C, cupsArrayCurrent, "cupsArrayCurrent");

   procedure cupsArrayDelete (a : System.Address);  -- cups/array.h:62
   pragma Import (C, cupsArrayDelete, "cupsArrayDelete");

   function cupsArrayDup (a : System.Address) return System.Address;  -- cups/array.h:63
   pragma Import (C, cupsArrayDup, "cupsArrayDup");

   function cupsArrayFind (a : System.Address; e : System.Address) return System.Address;  -- cups/array.h:64
   pragma Import (C, cupsArrayFind, "cupsArrayFind");

   function cupsArrayFirst (a : System.Address) return System.Address;  -- cups/array.h:65
   pragma Import (C, cupsArrayFirst, "cupsArrayFirst");

   function cupsArrayGetIndex (a : System.Address) return int;  -- cups/array.h:66
   pragma Import (C, cupsArrayGetIndex, "cupsArrayGetIndex");

   function cupsArrayGetInsert (a : System.Address) return int;  -- cups/array.h:67
   pragma Import (C, cupsArrayGetInsert, "cupsArrayGetInsert");

   function cupsArrayIndex (a : System.Address; n : int) return System.Address;  -- cups/array.h:68
   pragma Import (C, cupsArrayIndex, "cupsArrayIndex");

   function cupsArrayInsert (a : System.Address; e : System.Address) return int;  -- cups/array.h:69
   pragma Import (C, cupsArrayInsert, "cupsArrayInsert");

   function cupsArrayLast (a : System.Address) return System.Address;  -- cups/array.h:70
   pragma Import (C, cupsArrayLast, "cupsArrayLast");

   function cupsArrayNew (f : cups_array_func_t; d : System.Address) return System.Address;  -- cups/array.h:71
   pragma Import (C, cupsArrayNew, "cupsArrayNew");

   function cupsArrayNew2
     (f : cups_array_func_t;
      d : System.Address;
      h : cups_ahash_func_t;
      hsize : int) return System.Address;  -- cups/array.h:72
   pragma Import (C, cupsArrayNew2, "cupsArrayNew2");

   function cupsArrayNew3
     (f : cups_array_func_t;
      d : System.Address;
      h : cups_ahash_func_t;
      hsize : int;
      cf : cups_acopy_func_t;
      ff : cups_afree_func_t) return System.Address;  -- cups/array.h:74
   pragma Import (C, cupsArrayNew3, "cupsArrayNew3");

   function cupsArrayNext (a : System.Address) return System.Address;  -- cups/array.h:78
   pragma Import (C, cupsArrayNext, "cupsArrayNext");

   function cupsArrayPrev (a : System.Address) return System.Address;  -- cups/array.h:79
   pragma Import (C, cupsArrayPrev, "cupsArrayPrev");

   function cupsArrayRemove (a : System.Address; e : System.Address) return int;  -- cups/array.h:80
   pragma Import (C, cupsArrayRemove, "cupsArrayRemove");

   function cupsArrayRestore (a : System.Address) return System.Address;  -- cups/array.h:81
   pragma Import (C, cupsArrayRestore, "cupsArrayRestore");

   function cupsArraySave (a : System.Address) return int;  -- cups/array.h:82
   pragma Import (C, cupsArraySave, "cupsArraySave");

   function cupsArrayUserData (a : System.Address) return System.Address;  -- cups/array.h:83
   pragma Import (C, cupsArrayUserData, "cupsArrayUserData");

  -- * End of "$Id: array.h 10996 2013-05-29 11:51:34Z msweet $".
  --  

end CUPS.cups_array_h;
