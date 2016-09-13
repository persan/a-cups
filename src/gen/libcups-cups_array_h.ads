pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package libCUPS.cups_array_h is

   --  skipped empty struct u_cups_array_s

   --  skipped empty struct cups_array_t

   type cups_array_func_t is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address) return int;
   pragma Convention (C, cups_array_func_t);  -- cups/array.h:44

   type cups_ahash_func_t is access function (arg1 : System.Address; arg2 : System.Address) return int;
   pragma Convention (C, cups_ahash_func_t);  -- cups/array.h:46

   type cups_acopy_func_t is access function (arg1 : System.Address; arg2 : System.Address) return System.Address;
   pragma Convention (C, cups_acopy_func_t);  -- cups/array.h:48

   type cups_afree_func_t is access procedure (arg1 : System.Address; arg2 : System.Address);
   pragma Convention (C, cups_afree_func_t);  -- cups/array.h:50

   function cupsArrayAdd (arg1 : System.Address; arg2 : System.Address) return int;  -- cups/array.h:58
   pragma Import (C, cupsArrayAdd, "cupsArrayAdd");

   procedure cupsArrayClear (arg1 : System.Address);  -- cups/array.h:59
   pragma Import (C, cupsArrayClear, "cupsArrayClear");

   function cupsArrayCount (arg1 : System.Address) return int;  -- cups/array.h:60
   pragma Import (C, cupsArrayCount, "cupsArrayCount");

   function cupsArrayCurrent (arg1 : System.Address) return System.Address;  -- cups/array.h:61
   pragma Import (C, cupsArrayCurrent, "cupsArrayCurrent");

   procedure cupsArrayDelete (arg1 : System.Address);  -- cups/array.h:62
   pragma Import (C, cupsArrayDelete, "cupsArrayDelete");

   function cupsArrayDup (arg1 : System.Address) return System.Address;  -- cups/array.h:63
   pragma Import (C, cupsArrayDup, "cupsArrayDup");

   function cupsArrayFind (arg1 : System.Address; arg2 : System.Address) return System.Address;  -- cups/array.h:64
   pragma Import (C, cupsArrayFind, "cupsArrayFind");

   function cupsArrayFirst (arg1 : System.Address) return System.Address;  -- cups/array.h:65
   pragma Import (C, cupsArrayFirst, "cupsArrayFirst");

   function cupsArrayGetIndex (arg1 : System.Address) return int;  -- cups/array.h:66
   pragma Import (C, cupsArrayGetIndex, "cupsArrayGetIndex");

   function cupsArrayGetInsert (arg1 : System.Address) return int;  -- cups/array.h:67
   pragma Import (C, cupsArrayGetInsert, "cupsArrayGetInsert");

   function cupsArrayIndex (arg1 : System.Address; arg2 : int) return System.Address;  -- cups/array.h:68
   pragma Import (C, cupsArrayIndex, "cupsArrayIndex");

   function cupsArrayInsert (arg1 : System.Address; arg2 : System.Address) return int;  -- cups/array.h:69
   pragma Import (C, cupsArrayInsert, "cupsArrayInsert");

   function cupsArrayLast (arg1 : System.Address) return System.Address;  -- cups/array.h:70
   pragma Import (C, cupsArrayLast, "cupsArrayLast");

   function cupsArrayNew (arg1 : cups_array_func_t; arg2 : System.Address) return System.Address;  -- cups/array.h:71
   pragma Import (C, cupsArrayNew, "cupsArrayNew");

   function cupsArrayNew2
     (arg1 : cups_array_func_t;
      arg2 : System.Address;
      arg3 : cups_ahash_func_t;
      arg4 : int) return System.Address;  -- cups/array.h:72
   pragma Import (C, cupsArrayNew2, "cupsArrayNew2");

   function cupsArrayNew3
     (arg1 : cups_array_func_t;
      arg2 : System.Address;
      arg3 : cups_ahash_func_t;
      arg4 : int;
      arg5 : cups_acopy_func_t;
      arg6 : cups_afree_func_t) return System.Address;  -- cups/array.h:74
   pragma Import (C, cupsArrayNew3, "cupsArrayNew3");

   function cupsArrayNext (arg1 : System.Address) return System.Address;  -- cups/array.h:78
   pragma Import (C, cupsArrayNext, "cupsArrayNext");

   function cupsArrayPrev (arg1 : System.Address) return System.Address;  -- cups/array.h:79
   pragma Import (C, cupsArrayPrev, "cupsArrayPrev");

   function cupsArrayRemove (arg1 : System.Address; arg2 : System.Address) return int;  -- cups/array.h:80
   pragma Import (C, cupsArrayRemove, "cupsArrayRemove");

   function cupsArrayRestore (arg1 : System.Address) return System.Address;  -- cups/array.h:81
   pragma Import (C, cupsArrayRestore, "cupsArrayRestore");

   function cupsArraySave (arg1 : System.Address) return int;  -- cups/array.h:82
   pragma Import (C, cupsArraySave, "cupsArraySave");

   function cupsArrayUserData (arg1 : System.Address) return System.Address;  -- cups/array.h:83
   pragma Import (C, cupsArrayUserData, "cupsArrayUserData");

end libCUPS.cups_array_h;
