pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with libCUPS.libio_h;
with libCUPS.stdarg_h;
with libCUPS.bits_types_h;
with libCUPS.uG_config_h;
with Interfaces.C.Strings;
with System;


package libCUPS.stdio_h is

   --  unsupported macro: BUFSIZ _IO_BUFSIZ
   SEEK_SET : constant := 0;  --  stdio.h:140
   SEEK_CUR : constant := 1;  --  stdio.h:141
   SEEK_END : constant := 2;  --  stdio.h:142

   P_tmpdir : aliased constant String := "/tmp" & ASCII.NUL;  --  stdio.h:151
   --  unsupported macro: stdin stdin
   --  unsupported macro: stdout stdout
   --  unsupported macro: stderr stderr
   --  arg-macro: procedure getc _IO_getc (_fp)
   --    _IO_getc (_fp)
   --  arg-macro: procedure putc _IO_putc (_ch, _fp)
   --    _IO_putc (_ch, _fp)

   subtype FILE is libCUPS.libio_h.u_IO_FILE;

   subtype uu_FILE is libCUPS.libio_h.u_IO_FILE;

   subtype va_list is libCUPS.stdarg_h.uu_gnuc_va_list;  -- stdio.h:79

   subtype off_t is libCUPS.bits_types_h.uu_off_t;  -- stdio.h:90

   subtype ssize_t is libCUPS.bits_types_h.uu_ssize_t;  -- stdio.h:102

   subtype fpos_t is libCUPS.uG_config_h.u_G_fpos_t;  -- stdio.h:110

   stdin : access libCUPS.libio_h.u_IO_FILE;  -- stdio.h:168
   pragma Import (C, stdin, "stdin");

   stdout : access libCUPS.libio_h.u_IO_FILE;  -- stdio.h:169
   pragma Import (C, stdout, "stdout");

   stderr : access libCUPS.libio_h.u_IO_FILE;  -- stdio.h:170
   pragma Import (C, stderr, "stderr");

   function remove (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- stdio.h:178
   pragma Import (C, remove, "remove");

   function rename (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- stdio.h:180
   pragma Import (C, rename, "rename");

   function renameat
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr) return int;  -- stdio.h:185
   pragma Import (C, renameat, "renameat");

   function tmpfile return access FILE;  -- stdio.h:195
   pragma Import (C, tmpfile, "tmpfile");

   function tmpnam (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- stdio.h:209
   pragma Import (C, tmpnam, "tmpnam");

   function tmpnam_r (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- stdio.h:215
   pragma Import (C, tmpnam_r, "tmpnam_r");

   function tempnam (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- stdio.h:227
   pragma Import (C, tempnam, "tempnam");

   function fclose (arg1 : access FILE) return int;  -- stdio.h:237
   pragma Import (C, fclose, "fclose");

   function fflush (arg1 : access FILE) return int;  -- stdio.h:242
   pragma Import (C, fflush, "fflush");

   function fflush_unlocked (arg1 : access FILE) return int;  -- stdio.h:252
   pragma Import (C, fflush_unlocked, "fflush_unlocked");

   function fopen (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return access FILE;  -- stdio.h:272
   pragma Import (C, fopen, "fopen");

   function freopen
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access FILE) return access FILE;  -- stdio.h:278
   pragma Import (C, freopen, "freopen");

   function fdopen (arg1 : int; arg2 : Interfaces.C.Strings.chars_ptr) return access FILE;  -- stdio.h:306
   pragma Import (C, fdopen, "fdopen");

   function fmemopen
     (arg1 : System.Address;
      arg2 : size_t;
      arg3 : Interfaces.C.Strings.chars_ptr) return access FILE;  -- stdio.h:319
   pragma Import (C, fmemopen, "fmemopen");

   function open_memstream (arg1 : System.Address; arg2 : access size_t) return access FILE;  -- stdio.h:325
   pragma Import (C, open_memstream, "open_memstream");

   procedure setbuf (arg1 : access FILE; arg2 : Interfaces.C.Strings.chars_ptr);  -- stdio.h:332
   pragma Import (C, setbuf, "setbuf");

   function setvbuf
     (arg1 : access FILE;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : size_t) return int;  -- stdio.h:336
   pragma Import (C, setvbuf, "setvbuf");

   procedure setbuffer
     (arg1 : access FILE;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t);  -- stdio.h:343
   pragma Import (C, setbuffer, "setbuffer");

   procedure setlinebuf (arg1 : access FILE);  -- stdio.h:347
   pragma Import (C, setlinebuf, "setlinebuf");

   function fprintf (arg1 : access FILE; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- stdio.h:356
   pragma Import (C, fprintf, "fprintf");

   function printf (arg1 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- stdio.h:362
   pragma Import (C, printf, "printf");

   function sprintf (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- stdio.h:364
   pragma Import (C, sprintf, "sprintf");

   function vfprintf
     (arg1 : access FILE;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access System.Address) return int;  -- stdio.h:371
   pragma Import (C, vfprintf, "vfprintf");

   function vprintf (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access System.Address) return int;  -- stdio.h:377
   pragma Import (C, vprintf, "vprintf");

   function vsprintf
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access System.Address) return int;  -- stdio.h:379
   pragma Import (C, vsprintf, "vsprintf");

   function snprintf
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : size_t;
      arg3 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- stdio.h:386
   pragma Import (C, snprintf, "snprintf");

   function vsnprintf
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : size_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : access System.Address) return int;  -- stdio.h:390
   pragma Import (C, vsnprintf, "vsnprintf");

   function vdprintf
     (arg1 : int;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access System.Address) return int;  -- stdio.h:412
   pragma Import (C, vdprintf, "vdprintf");

   function dprintf (arg1 : int; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- stdio.h:415
   pragma Import (C, dprintf, "dprintf");

   function fscanf (arg1 : access FILE; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- stdio.h:443
   pragma Import (C, fscanf, "__isoc99_fscanf");

   function scanf (arg1 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- stdio.h:446
   pragma Import (C, scanf, "__isoc99_scanf");

   function sscanf (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- stdio.h:448
   pragma Import (C, sscanf, "__isoc99_sscanf");

   function vfscanf
     (arg1 : access FILE;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access System.Address) return int;  -- stdio.h:494
   pragma Import (C, vfscanf, "__isoc99_vfscanf");

   function vscanf (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access System.Address) return int;  -- stdio.h:499
   pragma Import (C, vscanf, "__isoc99_vscanf");

   function vsscanf
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access System.Address) return int;  -- stdio.h:502
   pragma Import (C, vsscanf, "__isoc99_vsscanf");

   function fgetc (arg1 : access FILE) return int;  -- stdio.h:531
   pragma Import (C, fgetc, "fgetc");

   function getc (arg1 : access FILE) return int;  -- stdio.h:532
   pragma Import (C, getc, "getc");

   function getchar return int;  -- stdio.h:538
   pragma Import (C, getchar, "getchar");

   function getc_unlocked (arg1 : access FILE) return int;  -- stdio.h:550
   pragma Import (C, getc_unlocked, "getc_unlocked");

   function getchar_unlocked return int;  -- stdio.h:551
   pragma Import (C, getchar_unlocked, "getchar_unlocked");

   function fgetc_unlocked (arg1 : access FILE) return int;  -- stdio.h:561
   pragma Import (C, fgetc_unlocked, "fgetc_unlocked");

   function fputc (arg1 : int; arg2 : access FILE) return int;  -- stdio.h:573
   pragma Import (C, fputc, "fputc");

   function putc (arg1 : int; arg2 : access FILE) return int;  -- stdio.h:574
   pragma Import (C, putc, "putc");

   function putchar (arg1 : int) return int;  -- stdio.h:580
   pragma Import (C, putchar, "putchar");

   function fputc_unlocked (arg1 : int; arg2 : access FILE) return int;  -- stdio.h:594
   pragma Import (C, fputc_unlocked, "fputc_unlocked");

   function putc_unlocked (arg1 : int; arg2 : access FILE) return int;  -- stdio.h:602
   pragma Import (C, putc_unlocked, "putc_unlocked");

   function putchar_unlocked (arg1 : int) return int;  -- stdio.h:603
   pragma Import (C, putchar_unlocked, "putchar_unlocked");

   function getw (arg1 : access FILE) return int;  -- stdio.h:610
   pragma Import (C, getw, "getw");

   function putw (arg1 : int; arg2 : access FILE) return int;  -- stdio.h:613
   pragma Import (C, putw, "putw");

   function fgets
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : access FILE) return Interfaces.C.Strings.chars_ptr;  -- stdio.h:622
   pragma Import (C, fgets, "fgets");

   function gets (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- stdio.h:638
   pragma Import (C, gets, "gets");

   --  skipped func __getdelim

   function getdelim
     (arg1 : System.Address;
      arg2 : access size_t;
      arg3 : int;
      arg4 : access FILE) return libCUPS.bits_types_h.uu_ssize_t;  -- stdio.h:668
   pragma Import (C, getdelim, "getdelim");

   function getline
     (arg1 : System.Address;
      arg2 : access size_t;
      arg3 : access FILE) return libCUPS.bits_types_h.uu_ssize_t;  -- stdio.h:678
   pragma Import (C, getline, "getline");

   function fputs (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access FILE) return int;  -- stdio.h:689
   pragma Import (C, fputs, "fputs");

   function puts (arg1 : Interfaces.C.Strings.chars_ptr) return int;  -- stdio.h:695
   pragma Import (C, puts, "puts");

   function ungetc (arg1 : int; arg2 : access FILE) return int;  -- stdio.h:702
   pragma Import (C, ungetc, "ungetc");

   function fread
     (arg1 : System.Address;
      arg2 : size_t;
      arg3 : size_t;
      arg4 : access FILE) return size_t;  -- stdio.h:709
   pragma Import (C, fread, "fread");

   function fwrite
     (arg1 : System.Address;
      arg2 : size_t;
      arg3 : size_t;
      arg4 : access FILE) return size_t;  -- stdio.h:715
   pragma Import (C, fwrite, "fwrite");

   function fread_unlocked
     (arg1 : System.Address;
      arg2 : size_t;
      arg3 : size_t;
      arg4 : access FILE) return size_t;  -- stdio.h:737
   pragma Import (C, fread_unlocked, "fread_unlocked");

   function fwrite_unlocked
     (arg1 : System.Address;
      arg2 : size_t;
      arg3 : size_t;
      arg4 : access FILE) return size_t;  -- stdio.h:739
   pragma Import (C, fwrite_unlocked, "fwrite_unlocked");

   function fseek
     (arg1 : access FILE;
      arg2 : long;
      arg3 : int) return int;  -- stdio.h:749
   pragma Import (C, fseek, "fseek");

   function ftell (arg1 : access FILE) return long;  -- stdio.h:754
   pragma Import (C, ftell, "ftell");

   procedure rewind (arg1 : access FILE);  -- stdio.h:759
   pragma Import (C, rewind, "rewind");

   function fseeko
     (arg1 : access FILE;
      arg2 : libCUPS.bits_types_h.uu_off_t;
      arg3 : int) return int;  -- stdio.h:773
   pragma Import (C, fseeko, "fseeko");

   function ftello (arg1 : access FILE) return libCUPS.bits_types_h.uu_off_t;  -- stdio.h:778
   pragma Import (C, ftello, "ftello");

   function fgetpos (arg1 : access FILE; arg2 : access fpos_t) return int;  -- stdio.h:798
   pragma Import (C, fgetpos, "fgetpos");

   function fsetpos (arg1 : access FILE; arg2 : access constant fpos_t) return int;  -- stdio.h:803
   pragma Import (C, fsetpos, "fsetpos");

   procedure clearerr (arg1 : access FILE);  -- stdio.h:826
   pragma Import (C, clearerr, "clearerr");

   function feof (arg1 : access FILE) return int;  -- stdio.h:828
   pragma Import (C, feof, "feof");

   function ferror (arg1 : access FILE) return int;  -- stdio.h:830
   pragma Import (C, ferror, "ferror");

   procedure clearerr_unlocked (arg1 : access FILE);  -- stdio.h:835
   pragma Import (C, clearerr_unlocked, "clearerr_unlocked");

   function feof_unlocked (arg1 : access FILE) return int;  -- stdio.h:836
   pragma Import (C, feof_unlocked, "feof_unlocked");

   function ferror_unlocked (arg1 : access FILE) return int;  -- stdio.h:837
   pragma Import (C, ferror_unlocked, "ferror_unlocked");

   procedure perror (arg1 : Interfaces.C.Strings.chars_ptr);  -- stdio.h:846
   pragma Import (C, perror, "perror");

   function fileno (arg1 : access FILE) return int;  -- stdio.h:858
   pragma Import (C, fileno, "fileno");

   function fileno_unlocked (arg1 : access FILE) return int;  -- stdio.h:863
   pragma Import (C, fileno_unlocked, "fileno_unlocked");

   function popen (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return access FILE;  -- stdio.h:872
   pragma Import (C, popen, "popen");

   function pclose (arg1 : access FILE) return int;  -- stdio.h:878
   pragma Import (C, pclose, "pclose");

   function ctermid (arg1 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- stdio.h:884
   pragma Import (C, ctermid, "ctermid");

   procedure flockfile (arg1 : access FILE);  -- stdio.h:912
   pragma Import (C, flockfile, "flockfile");

   function ftrylockfile (arg1 : access FILE) return int;  -- stdio.h:916
   pragma Import (C, ftrylockfile, "ftrylockfile");

   procedure funlockfile (arg1 : access FILE);  -- stdio.h:919
   pragma Import (C, funlockfile, "funlockfile");

end libCUPS.stdio_h;
