with Interfaces.C;
with CUPS.Cups_Cups_H;
with Interfaces.C.Strings;
with Ada.Containers;
package body CUPS.CUPS is
   use Interfaces.C.Strings;
   use Interfaces.C;
   use Cups_Cups_H;
   use Ada.Containers;

   type Options_Array is array (Natural Range <> ) of aliased Cups_Option_T;
   ----------------
   -- GetDefault --
   ----------------

   function GetDefault return String is
      V : chars_ptr := Cups_Cups_H.CupsGetDefault;
   begin
      if v /= Null_Ptr then
         return Interfaces.C.Strings.Value (V);
      else
         return "";
      end if;
   end GetDefault;

   ---------------
   -- PrintFile --
   ---------------

   function PrintFile
     (Name        : String;
      Filename    : String;
      Title       : String;
      Options     : String_Maps.Map := String_Maps.Empty_Map) return Job_Id
   is
      L_Name        : chars_ptr := New_String (Name);
      L_Filename    : chars_ptr := New_String (Filename);
      L_Title       : chars_ptr := New_String (Title);
      Ret           : Int;
      L_Options     : Options_Array (1 .. Natural (Options.Length));
   begin

      Ret := Cups_Cups_H.CupsPrintFile
        (Name        => L_Name ,
         Filename    => L_Filename,
         Title       => L_Title,
         Num_Options => Int (Options.Length),
         Options     => (if Options.Length = 0 then
                              null
                         else
                            L_Options (L_Options'First)'Access));
      Free (L_Name);
      Free (L_Filename);
      Free (L_Title);
      return Job_Id (Ret);
   end PrintFile;

end CUPS.CUPS;
