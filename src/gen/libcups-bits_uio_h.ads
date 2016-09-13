pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;


package libCUPS.bits_uio_h is

   UIO_MAXIOV : constant := 1024;  --  bits/uio.h:39

   type iovec is record
      iov_base : System.Address;  -- bits/uio.h:45
      iov_len : aliased size_t;  -- bits/uio.h:46
   end record;
   pragma Convention (C_Pass_By_Copy, iovec);  -- bits/uio.h:43

end libCUPS.bits_uio_h;
