pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with libCUPS.bits_types_h;


package libCUPS.libio_h is

   EOF : constant := (-1);  --  libio.h:62

   --  skipped empty struct u_IO_jump_t

   subtype u_IO_lock_t is System.Address;  -- libio.h:150

   type u_IO_FILE;
   type u_IO_marker is record
      u_next : access u_IO_marker;  -- libio.h:157
      u_sbuf : access u_IO_FILE;  -- libio.h:158
      u_pos : aliased int;  -- libio.h:162
   end record;
   pragma Convention (C_Pass_By_Copy, u_IO_marker);  -- libio.h:156

   type uu_codecvt_result is 
     (uu_codecvt_ok,
      uu_codecvt_partial,
      uu_codecvt_error,
      uu_codecvt_noconv);
   pragma Convention (C, uu_codecvt_result);  -- libio.h:176

   type anon966_u_shortbuf_array is array (1..1) of char;
   type anon966_u_unused2_array  is array (1..(15*int'size - 4 * System.Address'Size - size_t'size)/char'size)  of char;


   type u_IO_FILE is record
      u_flags : aliased int;  -- libio.h:242
      u_IO_read_ptr : Interfaces.C.Strings.chars_ptr;  -- libio.h:247
      u_IO_read_end : Interfaces.C.Strings.chars_ptr;  -- libio.h:248
      u_IO_read_base : Interfaces.C.Strings.chars_ptr;  -- libio.h:249
      u_IO_write_base : Interfaces.C.Strings.chars_ptr;  -- libio.h:250
      u_IO_write_ptr : Interfaces.C.Strings.chars_ptr;  -- libio.h:251
      u_IO_write_end : Interfaces.C.Strings.chars_ptr;  -- libio.h:252
      u_IO_buf_base : Interfaces.C.Strings.chars_ptr;  -- libio.h:253
      u_IO_buf_end : Interfaces.C.Strings.chars_ptr;  -- libio.h:254
      u_IO_save_base : Interfaces.C.Strings.chars_ptr;  -- libio.h:256
      u_IO_backup_base : Interfaces.C.Strings.chars_ptr;  -- libio.h:257
      u_IO_save_end : Interfaces.C.Strings.chars_ptr;  -- libio.h:258
      u_markers : access u_IO_marker;  -- libio.h:260
      u_chain : access u_IO_FILE;  -- libio.h:262
      u_fileno : aliased int;  -- libio.h:264
      u_flags2 : aliased int;  -- libio.h:268
      u_old_offset : aliased libCUPS.bits_types_h.uu_off_t;  -- libio.h:270
      u_cur_column : aliased unsigned_short;  -- libio.h:274
      u_vtable_offset : aliased signed_char;  -- libio.h:275
      u_shortbuf : aliased anon966_u_shortbuf_array;  -- libio.h:276
      u_lock : System.Address;  -- libio.h:280
      u_offset : aliased libCUPS.bits_types_h.uu_off64_t;  -- libio.h:289
      uu_pad1 : System.Address;  -- libio.h:297
      uu_pad2 : System.Address;  -- libio.h:298
      uu_pad3 : System.Address;  -- libio.h:299
      uu_pad4 : System.Address;  -- libio.h:300
      uu_pad5 : aliased size_t;  -- libio.h:302
      u_mode : aliased int;  -- libio.h:303
      u_unused2 : aliased anon966_u_unused2_array;  -- libio.h:305
   end record;
   pragma Convention (C_Pass_By_Copy, u_IO_FILE);  -- libio.h:241

   --  skipped empty struct u_IO_FILE_plus

   --  skipped function type uu_io_read_fn

   --  skipped function type uu_io_write_fn

   --  skipped function type uu_io_seek_fn

   --  skipped function type uu_io_close_fn

   --  skipped func __underflow

   --  skipped func __uflow

   --  skipped func __overflow

   --  skipped func _IO_getc

   --  skipped func _IO_putc

   --  skipped func _IO_feof

   --  skipped func _IO_ferror

   --  skipped func _IO_peekc_locked

   --  skipped func _IO_flockfile

   --  skipped func _IO_funlockfile

   --  skipped func _IO_ftrylockfile

   --  skipped func _IO_vfscanf

   --  skipped func _IO_vfprintf

   --  skipped func _IO_padn

   --  skipped func _IO_sgetn

   --  skipped func _IO_seekoff

   --  skipped func _IO_seekpos

   --  skipped func _IO_free_backup_area

end libCUPS.libio_h;
