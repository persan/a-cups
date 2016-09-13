pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with libCUPS.bits_types_h;
with libCUPS.time_h;

package libCUPS.bits_stat_h is

   --  unsupported macro: st_atime st_atim.tv_sec
   --  unsupported macro: st_mtime st_mtim.tv_sec
   --  unsupported macro: st_ctime st_ctim.tv_sec
   UTIME_NOW : constant := ((2 ** 30) - 1);  --  bits/stat.h:206
   UTIME_OMIT : constant := ((2 ** 30) - 2);  --  bits/stat.h:207

   type anon3657_uu_glibc_reserved_array is array (0 .. 2) of aliased libCUPS.bits_types_h.uu_syscall_slong_t;
   type stat is record
      st_dev : aliased libCUPS.bits_types_h.uu_dev_t;  -- bits/stat.h:48
      st_ino : aliased libCUPS.bits_types_h.uu_ino_t;  -- bits/stat.h:53
      st_nlink : aliased libCUPS.bits_types_h.uu_nlink_t;  -- bits/stat.h:61
      st_mode : aliased libCUPS.bits_types_h.uu_mode_t;  -- bits/stat.h:62
      st_uid : aliased libCUPS.bits_types_h.uu_uid_t;  -- bits/stat.h:64
      st_gid : aliased libCUPS.bits_types_h.uu_gid_t;  -- bits/stat.h:65
      uu_pad0 : aliased int;  -- bits/stat.h:67
      st_rdev : aliased libCUPS.bits_types_h.uu_dev_t;  -- bits/stat.h:69
      st_size : aliased libCUPS.bits_types_h.uu_off_t;  -- bits/stat.h:74
      st_blksize : aliased libCUPS.bits_types_h.uu_blksize_t;  -- bits/stat.h:78
      st_blocks : aliased libCUPS.bits_types_h.uu_blkcnt_t;  -- bits/stat.h:80
      st_atim : aliased libCUPS.time_h.timespec;  -- bits/stat.h:91
      st_mtim : aliased libCUPS.time_h.timespec;  -- bits/stat.h:92
      st_ctim : aliased libCUPS.time_h.timespec;  -- bits/stat.h:93
      uu_glibc_reserved : aliased anon3657_uu_glibc_reserved_array;  -- bits/stat.h:106
   end record;
   pragma Convention (C_Pass_By_Copy, stat);  -- bits/stat.h:46

end libCUPS.bits_stat_h;
