pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with libCUPS.bits_types_h;

package libCUPS.sys_types_h is

   subtype u_char is libCUPS.bits_types_h.uu_u_char;  -- sys/types.h:33

   subtype u_short is libCUPS.bits_types_h.uu_u_short;  -- sys/types.h:34

   subtype u_int is libCUPS.bits_types_h.uu_u_int;  -- sys/types.h:35

   subtype u_long is libCUPS.bits_types_h.uu_u_long;  -- sys/types.h:36

   subtype quad_t is libCUPS.bits_types_h.uu_quad_t;  -- sys/types.h:37

   subtype u_quad_t is libCUPS.bits_types_h.uu_u_quad_t;  -- sys/types.h:38

   subtype fsid_t is libCUPS.bits_types_h.uu_fsid_t;  -- sys/types.h:39

   subtype loff_t is libCUPS.bits_types_h.uu_loff_t;  -- sys/types.h:44

   subtype ino_t is libCUPS.bits_types_h.uu_ino_t;  -- sys/types.h:48

   subtype dev_t is libCUPS.bits_types_h.uu_dev_t;  -- sys/types.h:60

   subtype gid_t is libCUPS.bits_types_h.uu_gid_t;  -- sys/types.h:65

   subtype mode_t is libCUPS.bits_types_h.uu_mode_t;  -- sys/types.h:70

   subtype nlink_t is libCUPS.bits_types_h.uu_nlink_t;  -- sys/types.h:75

   subtype uid_t is libCUPS.bits_types_h.uu_uid_t;  -- sys/types.h:80

   subtype pid_t is libCUPS.bits_types_h.uu_pid_t;  -- sys/types.h:98

   subtype id_t is libCUPS.bits_types_h.uu_id_t;  -- sys/types.h:104

   subtype daddr_t is libCUPS.bits_types_h.uu_daddr_t;  -- sys/types.h:115

   subtype caddr_t is libCUPS.bits_types_h.uu_caddr_t;  -- sys/types.h:116

   subtype key_t is libCUPS.bits_types_h.uu_key_t;  -- sys/types.h:122

   subtype ulong is unsigned_long;  -- sys/types.h:150

   subtype ushort is unsigned_short;  -- sys/types.h:151

   subtype uint is unsigned;  -- sys/types.h:152

   subtype int8_t is signed_char;  -- sys/types.h:194

   subtype int16_t is short;  -- sys/types.h:195

   subtype int32_t is int;  -- sys/types.h:196

   subtype int64_t is long;  -- sys/types.h:197

   subtype u_int8_t is unsigned_char;  -- sys/types.h:200

   subtype u_int16_t is unsigned_short;  -- sys/types.h:201

   subtype u_int32_t is unsigned;  -- sys/types.h:202

   subtype u_int64_t is unsigned_long;  -- sys/types.h:203

   subtype register_t is long;  -- sys/types.h:205

   subtype blksize_t is libCUPS.bits_types_h.uu_blksize_t;  -- sys/types.h:228

   subtype blkcnt_t is libCUPS.bits_types_h.uu_blkcnt_t;  -- sys/types.h:235

   subtype fsblkcnt_t is libCUPS.bits_types_h.uu_fsblkcnt_t;  -- sys/types.h:239

   subtype fsfilcnt_t is libCUPS.bits_types_h.uu_fsfilcnt_t;  -- sys/types.h:243

end libCUPS.sys_types_h;
