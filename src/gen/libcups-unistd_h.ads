pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with libCUPS.bits_types_h;
with Interfaces.C.Strings;
with System;

with libCUPS.stdio_h;
with Interfaces.C_Streams;

package libCUPS.unistd_h is

   STDIN_FILENO : constant := 0;  --  unistd.h:213
   STDOUT_FILENO : constant := 1;  --  unistd.h:214
   STDERR_FILENO : constant := 2;  --  unistd.h:215

   R_OK : constant := 4;  --  unistd.h:284
   W_OK : constant := 2;  --  unistd.h:285
   X_OK : constant := 1;  --  unistd.h:286
   F_OK : constant := 0;  --  unistd.h:287
   --  unsupported macro: L_SET SEEK_SET
   --  unsupported macro: L_INCR SEEK_CUR
   --  unsupported macro: L_XTND SEEK_END

   F_ULOCK : constant := 0;  --  unistd.h:1078
   F_LOCK : constant := 1;  --  unistd.h:1079
   F_TLOCK : constant := 2;  --  unistd.h:1080
   F_TEST : constant := 3;  --  unistd.h:1081

   subtype useconds_t is libCUPS.bits_types_h.uu_useconds_t;  -- unistd.h:258

   subtype intptr_t is libCUPS.bits_types_h.uu_intptr_t;  -- unistd.h:270

   subtype socklen_t is libCUPS.bits_types_h.uu_socklen_t;  -- unistd.h:277

   function c_access (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return int;  -- unistd.h:290
   pragma Import (C, c_access, "access");

   function faccessat
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : int) return int;  -- unistd.h:307
   pragma Import (C, faccessat, "faccessat");

   function lseek
     (arg1 : int;
      arg2 : libCUPS.bits_types_h.uu_off_t;
      arg3 : int) return libCUPS.bits_types_h.uu_off_t;  -- unistd.h:337
   pragma Import (C, lseek, "lseek");

   function close (arg1 : int) return int;  -- unistd.h:356
   pragma Import (C, close, "close");

   function read
     (arg1 : int;
      arg2 : System.Address;
      arg3 : size_t) return size_t;  -- unistd.h:363
   pragma Import (C, read, "read");

   function write
     (arg1 : int;
      arg2 : System.Address;
      arg3 : size_t) return size_t;  -- unistd.h:369
   pragma Import (C, write, "write");

   function pread
     (arg1 : int;
      arg2 : System.Address;
      arg3 : size_t;
      arg4 : libCUPS.bits_types_h.uu_off_t) return size_t;  -- unistd.h:379
   pragma Import (C, pread, "pread");

   function pwrite
     (arg1 : int;
      arg2 : System.Address;
      arg3 : size_t;
      arg4 : libCUPS.bits_types_h.uu_off_t) return size_t;  -- unistd.h:387
   pragma Import (C, pwrite, "pwrite");

   function pipe (arg1 : access int) return int;  -- unistd.h:420
   pragma Import (C, pipe, "pipe");

   function alarm (arg1 : unsigned) return unsigned;  -- unistd.h:435
   pragma Import (C, alarm, "alarm");

   function sleep (arg1 : unsigned) return unsigned;  -- unistd.h:447
   pragma Import (C, sleep, "sleep");

   function ualarm (arg1 : libCUPS.bits_types_h.uu_useconds_t; arg2 : libCUPS.bits_types_h.uu_useconds_t) return libCUPS.bits_types_h.uu_useconds_t;  -- unistd.h:455
   pragma Import (C, ualarm, "ualarm");

   function usleep (arg1 : libCUPS.bits_types_h.uu_useconds_t) return int;  -- unistd.h:463
   pragma Import (C, usleep, "usleep");

   function pause return int;  -- unistd.h:472
   pragma Import (C, pause, "pause");

   function chown
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : libCUPS.bits_types_h.uu_uid_t;
      arg3 : libCUPS.bits_types_h.uu_gid_t) return int;  -- unistd.h:476
   pragma Import (C, chown, "chown");

   function fchown
     (arg1 : int;
      arg2 : libCUPS.bits_types_h.uu_uid_t;
      arg3 : libCUPS.bits_types_h.uu_gid_t) return int;  -- unistd.h:481
   pragma Import (C, fchown, "fchown");

   function lchown
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : libCUPS.bits_types_h.uu_uid_t;
      arg3 : libCUPS.bits_types_h.uu_gid_t) return int;  -- unistd.h:486
   pragma Import (C, lchown, "lchown");

   function fchownat
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : libCUPS.bits_types_h.uu_uid_t;
      arg4 : libCUPS.bits_types_h.uu_gid_t;
      arg5 : int) return int;  -- unistd.h:494
   pragma Import (C, fchownat, "fchownat");

   function chdir (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- unistd.h:500
   pragma Import (C, chdir, "chdir");

   function fchdir (arg1 : int) return int;  -- unistd.h:504
   pragma Import (C, fchdir, "fchdir");

   function getcwd (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : size_t) return Interfaces.C.Strings.chars_ptr;  -- unistd.h:514
   pragma Import (C, getcwd, "getcwd");

   function getwd (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- unistd.h:528
   pragma Import (C, getwd, "getwd");

   function dup (arg1 : int) return int;  -- unistd.h:534
   pragma Import (C, dup, "dup");

   function dup2 (arg1 : int; arg2 : int) return int;  -- unistd.h:537
   pragma Import (C, dup2, "dup2");

   function execve
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : System.Address;
      arg3 : System.Address) return int;  -- unistd.h:554
   pragma Import (C, execve, "execve");

   function fexecve
     (arg1 : int;
      arg2 : System.Address;
      arg3 : System.Address) return int;  -- unistd.h:560
   pragma Import (C, fexecve, "fexecve");

   function execv (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address) return int;  -- unistd.h:566
   pragma Import (C, execv, "execv");

   function execle (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- unistd.h:571
   pragma Import (C, execle, "execle");

   function execl (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- unistd.h:576
   pragma Import (C, execl, "execl");

   function execvp (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : System.Address) return int;  -- unistd.h:581
   pragma Import (C, execvp, "execvp");

   function execlp (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- unistd.h:587
   pragma Import (C, execlp, "execlp");

   function nice (arg1 : int) return int;  -- unistd.h:601
   pragma Import (C, nice, "nice");

   --  skipped func _exit

   function pathconf (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return long;  -- unistd.h:615
   pragma Import (C, pathconf, "pathconf");

   function fpathconf (arg1 : int; arg2 : int) return long;  -- unistd.h:619
   pragma Import (C, fpathconf, "fpathconf");

   function sysconf (arg1 : int) return long;  -- unistd.h:622
   pragma Import (C, sysconf, "sysconf");

   function confstr
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return size_t;  -- unistd.h:626
   pragma Import (C, confstr, "confstr");

   function getpid return libCUPS.bits_types_h.uu_pid_t;  -- unistd.h:631
   pragma Import (C, getpid, "getpid");

   function getppid return libCUPS.bits_types_h.uu_pid_t;  -- unistd.h:634
   pragma Import (C, getppid, "getppid");

   function getpgrp return libCUPS.bits_types_h.uu_pid_t;  -- unistd.h:637
   pragma Import (C, getpgrp, "getpgrp");

   --  skipped func __getpgid

   function getpgid (arg1 : libCUPS.bits_types_h.uu_pid_t) return libCUPS.bits_types_h.uu_pid_t;  -- unistd.h:642
   pragma Import (C, getpgid, "getpgid");

   function setpgid (arg1 : libCUPS.bits_types_h.uu_pid_t; arg2 : libCUPS.bits_types_h.uu_pid_t) return int;  -- unistd.h:649
   pragma Import (C, setpgid, "setpgid");

   function setpgrp return int;  -- unistd.h:663
   pragma Import (C, setpgrp, "setpgrp");

   function setsid return libCUPS.bits_types_h.uu_pid_t;  -- unistd.h:670
   pragma Import (C, setsid, "setsid");

   function getsid (arg1 : libCUPS.bits_types_h.uu_pid_t) return libCUPS.bits_types_h.uu_pid_t;  -- unistd.h:674
   pragma Import (C, getsid, "getsid");

   function getuid return libCUPS.bits_types_h.uu_uid_t;  -- unistd.h:678
   pragma Import (C, getuid, "getuid");

   function geteuid return libCUPS.bits_types_h.uu_uid_t;  -- unistd.h:681
   pragma Import (C, geteuid, "geteuid");

   function getgid return libCUPS.bits_types_h.uu_gid_t;  -- unistd.h:684
   pragma Import (C, getgid, "getgid");

   function getegid return libCUPS.bits_types_h.uu_gid_t;  -- unistd.h:687
   pragma Import (C, getegid, "getegid");

   function getgroups (arg1 : int; arg2 : access libCUPS.bits_types_h.uu_gid_t) return int;  -- unistd.h:692
   pragma Import (C, getgroups, "getgroups");

   function setuid (arg1 : libCUPS.bits_types_h.uu_uid_t) return int;  -- unistd.h:703
   pragma Import (C, setuid, "setuid");

   function setreuid (arg1 : libCUPS.bits_types_h.uu_uid_t; arg2 : libCUPS.bits_types_h.uu_uid_t) return int;  -- unistd.h:708
   pragma Import (C, setreuid, "setreuid");

   function seteuid (arg1 : libCUPS.bits_types_h.uu_uid_t) return int;  -- unistd.h:713
   pragma Import (C, seteuid, "seteuid");

   function setgid (arg1 : libCUPS.bits_types_h.uu_gid_t) return int;  -- unistd.h:720
   pragma Import (C, setgid, "setgid");

   function setregid (arg1 : libCUPS.bits_types_h.uu_gid_t; arg2 : libCUPS.bits_types_h.uu_gid_t) return int;  -- unistd.h:725
   pragma Import (C, setregid, "setregid");

   function setegid (arg1 : libCUPS.bits_types_h.uu_gid_t) return int;  -- unistd.h:730
   pragma Import (C, setegid, "setegid");

   function fork return libCUPS.bits_types_h.uu_pid_t;  -- unistd.h:759
   pragma Import (C, fork, "fork");

   function vfork return libCUPS.bits_types_h.uu_pid_t;  -- unistd.h:767
   pragma Import (C, vfork, "vfork");

   function ttyname (arg1 : int) return Interfaces.C.Strings.chars_ptr;  -- unistd.h:773
   pragma Import (C, ttyname, "ttyname");

   function ttyname_r
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return int;  -- unistd.h:777
   pragma Import (C, ttyname_r, "ttyname_r");

   function isatty (arg1 : int) return int;  -- unistd.h:782
   pragma Import (C, isatty, "isatty");

   function ttyslot return int;  -- unistd.h:788
   pragma Import (C, ttyslot, "ttyslot");

   function link (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- unistd.h:793
   pragma Import (C, link, "link");

   function linkat
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : int) return int;  -- unistd.h:799
   pragma Import (C, linkat, "linkat");

   function symlink (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- unistd.h:806
   pragma Import (C, symlink, "symlink");

   function readlink
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return size_t;  -- unistd.h:812
   pragma Import (C, readlink, "readlink");

   function symlinkat
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- unistd.h:819
   pragma Import (C, symlinkat, "symlinkat");

   function readlinkat
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : size_t) return size_t;  -- unistd.h:823
   pragma Import (C, readlinkat, "readlinkat");

   function unlink (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- unistd.h:829
   pragma Import (C, unlink, "unlink");

   function unlinkat
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return int;  -- unistd.h:833
   pragma Import (C, unlinkat, "unlinkat");

   function rmdir (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- unistd.h:838
   pragma Import (C, rmdir, "rmdir");

   function tcgetpgrp (arg1 : int) return libCUPS.bits_types_h.uu_pid_t;  -- unistd.h:842
   pragma Import (C, tcgetpgrp, "tcgetpgrp");

   function tcsetpgrp (arg1 : int; arg2 : libCUPS.bits_types_h.uu_pid_t) return int;  -- unistd.h:845
   pragma Import (C, tcsetpgrp, "tcsetpgrp");

   function getlogin return Interfaces.C.Strings.chars_ptr;  -- unistd.h:852
   pragma Import (C, getlogin, "getlogin");

   function getlogin_r (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : size_t) return int;  -- unistd.h:860
   pragma Import (C, getlogin_r, "getlogin_r");

   function setlogin (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- unistd.h:865
   pragma Import (C, setlogin, "setlogin");

   function gethostname (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : size_t) return int;  -- unistd.h:882
   pragma Import (C, gethostname, "gethostname");

   function sethostname (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : size_t) return int;  -- unistd.h:889
   pragma Import (C, sethostname, "sethostname");

   function sethostid (arg1 : long) return int;  -- unistd.h:894
   pragma Import (C, sethostid, "sethostid");

   function getdomainname (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : size_t) return int;  -- unistd.h:900
   pragma Import (C, getdomainname, "getdomainname");

   function setdomainname (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : size_t) return int;  -- unistd.h:902
   pragma Import (C, setdomainname, "setdomainname");

   function vhangup return int;  -- unistd.h:909
   pragma Import (C, vhangup, "vhangup");

   function revoke (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- unistd.h:912
   pragma Import (C, revoke, "revoke");

   function profil
     (arg1 : access unsigned_short;
      arg2 : size_t;
      arg3 : size_t;
      arg4 : unsigned) return int;  -- unistd.h:920
   pragma Import (C, profil, "profil");

   function acct (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- unistd.h:928
   pragma Import (C, acct, "acct");

   function getusershell return Interfaces.C.Strings.chars_ptr;  -- unistd.h:932
   pragma Import (C, getusershell, "getusershell");

   procedure endusershell;  -- unistd.h:933
   pragma Import (C, endusershell, "endusershell");

   procedure setusershell;  -- unistd.h:934
   pragma Import (C, setusershell, "setusershell");

   function daemon (arg1 : int; arg2 : int) return int;  -- unistd.h:940
   pragma Import (C, daemon, "daemon");

   function chroot (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- unistd.h:947
   pragma Import (C, chroot, "chroot");

   function getpass (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- unistd.h:951
   pragma Import (C, getpass, "getpass");

   function fsync (arg1 : int) return int;  -- unistd.h:959
   pragma Import (C, fsync, "fsync");

   function gethostid return long;  -- unistd.h:972
   pragma Import (C, gethostid, "gethostid");

   procedure sync;  -- unistd.h:975
   pragma Import (C, sync, "sync");

   function getpagesize return int;  -- unistd.h:981
   pragma Import (C, getpagesize, "getpagesize");

   function getdtablesize return int;  -- unistd.h:986
   pragma Import (C, getdtablesize, "getdtablesize");

   function truncate (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : libCUPS.bits_types_h.uu_off_t) return int;  -- unistd.h:996
   pragma Import (C, truncate, "truncate");

   function ftruncate (arg1 : int; arg2 : libCUPS.bits_types_h.uu_off_t) return int;  -- unistd.h:1019
   pragma Import (C, ftruncate, "ftruncate");

   function brk (arg1 : System.Address) return int;  -- unistd.h:1040
   pragma Import (C, brk, "brk");

   function sbrk (arg1 : intptr_t) return System.Address;  -- unistd.h:1046
   pragma Import (C, sbrk, "sbrk");

   function syscall (arg1 : long  -- , ...
      ) return long;  -- unistd.h:1061
   pragma Import (C, syscall, "syscall");

   function lockf
     (arg1 : int;
      arg2 : int;
      arg3 : libCUPS.bits_types_h.uu_off_t) return int;  -- unistd.h:1084
   pragma Import (C, lockf, "lockf");

   function fdatasync (arg1 : int) return int;  -- unistd.h:1115
   pragma Import (C, fdatasync, "fdatasync");

end libCUPS.unistd_h;
