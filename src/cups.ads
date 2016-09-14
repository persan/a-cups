with GNAT.Strings;
package CUPS is

   type Cups_Option is record
      Name : GNAT.Strings.String_Access;
      Value : GNAT.Strings.String_Access;
   end record;
   function GetDefault return String;
   procedure PrintFile
     (Arg1 : String;
      Arg2 : String;
      Arg3 : String;
      Arg4 : Integer;
      Arg5 : access Cups_Option := null);  -- cups/cups.h:370
end CUPS;
