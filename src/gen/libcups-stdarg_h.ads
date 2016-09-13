pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package libCUPS.stdarg_h is

   --  arg-macro: procedure va_start __builtin_va_start(v,l)
   --    __builtin_va_start(v,l)
   --  arg-macro: procedure va_end __builtin_va_end(v)
   --    __builtin_va_end(v)
   --  arg-macro: procedure va_arg __builtin_va_arg(v,l)
   --    __builtin_va_arg(v,l)
   --  arg-macro: procedure va_copy __builtin_va_copy(d,s)
   --    __builtin_va_copy(d,s)
   subtype uu_gnuc_va_list is System.Address;  -- /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.9.4/include/stdarg.h:40

end libCUPS.stdarg_h;
