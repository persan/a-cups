pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with libCUPS.bits_sockaddr_h;

package libCUPS.sys_un_h is

   --  arg-macro: function SUN_LEN ((size_t) (((struct sockaddr_un *) 0).sun_path) + strlen ((ptr).sun_path)
   --    return (size_t) (((struct sockaddr_un *) 0).sun_path) + strlen ((ptr).sun_path);
   subtype anon2821_sun_path_array is Interfaces.C.char_array (0 .. 107);
   type sockaddr_un is record
      sun_family : aliased libCUPS.bits_sockaddr_h.sa_family_t;  -- sys/un.h:31
      sun_path : aliased anon2821_sun_path_array;  -- sys/un.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, sockaddr_un);  -- sys/un.h:29

end libCUPS.sys_un_h;
