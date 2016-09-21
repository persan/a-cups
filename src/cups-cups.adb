package body CUPS.CUPS is

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
      Num_Options : Job_Id;
      Options     : Cups_Option) return Job_Id
   is
      L_Name        : chars_ptr := New_String (Name);
      L_Filename    : chars_ptr := New_String (Filename);
      L_Title       : Chars_Ptr := New_String (Title);
      L_Num_Options : Int := Int(Num_Options);
      Ret           : Int;
   begin

      Ret := Cups_Cups_H.CupsPrintFile
        (Name        => L_Name,
         Filename    => L_Filename,
         Title       => L_Title,
         Num_Options => L_Num_Options,
         Options     => Options);
      Free (L_Name);
      Free (L_Filename);
      Free (L_Title);
      return Job_Id (Ret);
   end PrintFile;

   -----------------
   -- CancelJob --
   -----------------
   function CancelJob
     (Name        : String;
      JobId       : Integer := -1 ) return Job_Id
   is
      L_Name        : chars_ptr := New_String (Name);
      L_Id          : Int :=  Int(JobId);
      Ret           : Int;
   begin
      Ret := Cups_Cups_H.CupsCancelJob
        (Name => L_Name,
         Job_Id => L_Id);
      Free (L_Name);
      return Job_Id (Ret);
   end CancelJob;

   ---------------
   -- AddOption --
   ---------------
   function AddOption
     (Name   : String;
      Value  : String;
      Num_Options : Job_Id;
      Options     : aliased Cups_Option) return Job_Id
   is
      L_Name        : Chars_Ptr := New_String (Name);
      L_Value       : Chars_Ptr := New_String (Value);
      L_Num_Options : Int       := Int (Num_Options);
      Ret           : Int;
   begin
      Ret := Cups_Cups_H.CupsAddOption
        (Name        => L_Name ,
         Value       => L_Value,
         Num_Options => L_Num_Options,
         Options     => Options'Address);
      Free (L_Name);
      Free (L_Value);
      return Job_Id(Ret);

   end AddOption;

   ---------------------
   -- GetOption --
   ---------------------
   function GetOption
     (Name : String;
      Num_Options : Job_Id;
      Options     : Cups_Option) return String
   is
      L_Name : Chars_Ptr := New_String (Name);
      L_Num_Options : Int := Int(Num_Options);
      Ret       : Chars_Ptr;
   begin
      Ret := Cups_Cups_H.CupsGetOption
        (Name => L_Name,
         Num_Options => L_Num_Options,
         Options     => Options);
      Free (L_Name);
      if Ret = Interfaces.C.Strings.Null_Ptr then
         return "";
      else
         return Value(Ret);
      end if;
   end GetOption;


end CUPS.CUPS;
