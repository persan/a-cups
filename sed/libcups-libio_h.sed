s!High-order word is _IO_MAGIC; rest is flags.!High-order word is _IO_MAGIC; rest is flags.!\
\
   type u_IO_FILE_u_shortbuf_array is array (1..1) of char;\
   type u_IO_FILE_u_unused2_array  is array (1..(15*int'size - 4 * System.Address'Size - size_t'size)/char'size)  of char;\
!
