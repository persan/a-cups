pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package libCUPS.bits_sockaddr_h is

   subtype sa_family_t is unsigned_short;  -- bits/sockaddr.h:28

end libCUPS.bits_sockaddr_h;
