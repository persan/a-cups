with interfaces.C;
with libCUPS.cups_cups_h;
with Interfaces.C.Strings;
package body CUPS is

   ----------------
   -- GetDefault --
   ----------------

   function GetDefault return String is

   begin
      return interfaces.C.Strings.Value(libCUPS.cups_cups_h.cupsGetDefault);
   end GetDefault;

   ---------------
   -- PrintFile --
   ---------------

   procedure PrintFile
     (Arg1 : String;
      Arg2 : String;
      Arg3 : String;
      Arg4 : Integer;
      Arg5 : access Cups_Option := null)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "PrintFile unimplemented");
      raise Program_Error with "Unimplemented procedure PrintFile";
   end PrintFile;

end CUPS;
