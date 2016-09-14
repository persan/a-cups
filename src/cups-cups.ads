with Cups.String_Maps;
package CUPS.CUPS is


   function GetDefault return String;
   --
   --  Get the default printer or class for the default server.
   --  This function returns the default printer or class as defined by the
   --  LPDEST or PRINTER environment variables.
   --  If these environment variables are not set, the
   --  server default destination is returned.
   --  Applications should use the cupsGetDests and cupsGetDest functions to
   --  get the user-defined default printer,
   --  as this function does not support the lpoptions-defined default printer.



   function PrintFile
     (Name        : String;
      Filename    : String;
      Title       : String;
      Options     : String_Maps.Map := String_Maps.Empty_Map) return Job_Id;
   --
   -- Print a file to a printer or class on the default server.


end CUPS.CUPS;
