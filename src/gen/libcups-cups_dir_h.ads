pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with libCUPS.bits_stat_h;
with System;
with Interfaces.C.Strings;

package libCUPS.cups_dir_h is

   --  skipped empty struct u_cups_dir_s

   --  skipped empty struct cups_dir_t

   subtype anon3727_filename_array is Interfaces.C.char_array (0 .. 259);
   type cups_dentry_s is record
      filename : aliased anon3727_filename_array;  -- cups/dir.h:47
      fileinfo : aliased libCUPS.bits_stat_h.stat;  -- cups/dir.h:48
   end record;
   pragma Convention (C_Pass_By_Copy, cups_dentry_s);  -- cups/dir.h:45

   subtype cups_dentry_t is cups_dentry_s;

   procedure cupsDirClose (arg1 : System.Address);  -- cups/dir.h:56
   pragma Import (C, cupsDirClose, "cupsDirClose");

   function cupsDirOpen (arg1 : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/dir.h:57
   pragma Import (C, cupsDirOpen, "cupsDirOpen");

   function cupsDirRead (arg1 : System.Address) return access cups_dentry_t;  -- cups/dir.h:58
   pragma Import (C, cupsDirRead, "cupsDirRead");

   procedure cupsDirRewind (arg1 : System.Address);  -- cups/dir.h:59
   pragma Import (C, cupsDirRewind, "cupsDirRewind");

end libCUPS.cups_dir_h;
