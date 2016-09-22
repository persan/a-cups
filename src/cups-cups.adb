package body CUPS.CUPS is

   ----------------
   -- GetDefault --
   ----------------
   function GetDefault return String is
      V : Chars_Ptr := Cups_Cups_H.CupsGetDefault;
   begin
      if V /= Null_Ptr then
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
      Options     : Option_T) return Job_Id
   is
      L_Name        : Chars_Ptr := New_String (Name);
      L_Filename    : Chars_Ptr := New_String (Filename);
      L_Title       : Chars_Ptr := New_String (Title);
      L_Num_Options : Int := Int (Num_Options);
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

   ---------------
   -- CancelJob --
   ---------------
   function CancelJob
     (Name        : String;
      JobId       : Integer := -1 ) return Job_Id
   is
      L_Name        : Chars_Ptr := New_String (Name);
      L_Id          : Int :=  Int (JobId);
      Ret           : Int;
   begin
      Ret := Cups_Cups_H.CupsCancelJob
        (Name   => L_Name,
         Job_Id => L_Id);
      Free (L_Name);
      return Job_Id (Ret);
   end CancelJob;

   ---------------
   -- AddOption --
   ---------------
   function AddOption
     (Name        : String;
      Value       : String;
      Num_Options : Job_Id;
      Options     : aliased Option_T) return Job_Id
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
      return Job_Id (Ret);

   end AddOption;

   ---------------
   -- GetOption --
   ---------------
   function GetOption
     (Name        : String;
      Num_Options : Job_Id;
      Options     : Option_T) return String
   is
      L_Name        : Chars_Ptr := New_String (Name);
      L_Num_Options : Int := Int (Num_Options);
      Ret           : Chars_Ptr;
   begin
      Ret := Cups_Cups_H.CupsGetOption
        (Name        => L_Name,
         Num_Options => L_Num_Options,
         Options     => Options);
      Free (L_Name);
      if Ret = Interfaces.C.Strings.Null_Ptr then
         return "null";
      else
         return Value (Ret);
      end if;
   end GetOption;

   ----------------------------
   -- GetDefaultPrinterState --
   ----------------------------
   function GetDefaultPrinterState return String
   is
      L_State        : Chars_Ptr := New_String ("printer-state");
      Num_Dests      : Int;
      Dest           : aliased Cups.Destination_T;
      Destinations   : aliased Cups.Destination_T;

      Ret            : Chars_Ptr;

   begin
      Num_Dests := Cups_Cups_H.CupsGetDests (Destinations'Address);
      Dest := Cups_Cups_H.CupsGetDest (Name => Interfaces.C.Strings.Null_Ptr,
                                       Instance  => Interfaces.C.Strings.Null_Ptr,
                                       Num_Dests => Num_Dests,
                                       Dests     => Destinations);
      if Dest /= null then
         Ada.Text_IO.Put_Line ("Printer found!: " & Value (Dest.Name));
         Ret := Cups_Cups_H.CupsGetOption ( Name       => L_State,
                                            Num_Options => Dest.Num_Options,
                                            Options     => Dest.Options);
         if Ret = Interfaces.C.Strings.Null_Ptr then
            return "null";
         else
            return Value (Ret);
         end if;
      else
         return "null";
      end if;
   end GetDefaultPrinterState;

   procedure InitRawPrinting (Num_Options : in out Job_ID;
                              Options     : aliased Option_T) is
   begin
      Num_Options := Cups.AddOption ("raw", "true", Num_Options, Options);
      Num_Options := Cups.AddOption ("usb-no-reattach-default", "true", Num_Options, Options);
   end InitRawPrinting;

   --------------------
   -- PrintRawString --
   --------------------
   procedure PrintString ( Str : String; Raw : Boolean)
   is
      package BS is new Ada.Strings.Bounded.Generic_Bounded_Length (Max =>  20);
      Num_Options    : Job_Id          := 0;

      Printer_State  : BS.Bounded_String;
      Id             : Job_Id          := 0;
      Cancel_Job     : Job_Id          := 0;
      Options        : aliased Cups.Option_T;
      Temp_File      : Ada.Text_IO.File_Type;
      Temp_File_Name : Standard.String := "TempFile.txt";
   begin
      Printer_State := BS.To_Bounded_String (Cups.GetDefaultPrinterState);
      Ada.Text_IO.Put_Line ("Printer state: " & BS.To_String (Printer_State));
      -- If a printer exists
      if BS.To_String (Printer_State) /= "null" then
         -- If the printer is active
         if Integer'Value (BS.To_String (Printer_State)) < 4 then
            case Raw is
               when True =>
                  InitRawPrinting (Num_Options => Num_Options,
                                   Options     => Options);
               when False =>
                  null;
            end case;


            -- Create the file for printing
            Ada.Text_IO.Create (Temp_File, Ada.Text_IO.Out_File, Temp_File_Name);
            Ada.Text_IO.Put_Line (Temp_File, Str);
            -- Close before sending to printer
            Ada.Text_IO.Close (Temp_File);
            -- Print file
            Id := Cups.PrintFile (Cups.GetDefault, Temp_File_Name, "Test Print", Num_Options, Options);
            if Id /= 0 then
               Ada.Text_IO.Put_Line ("Printing!");
            else
               Ada.Text_IO.Put_Line ("Printing failed!");
            end if;

            --
            --Cancel all Jobs otherwise
            --
            -- TODO: See if there is another status to look for than 4
            -- (if Multiple Jobs Are Stacked all jobs will be cancelled)
         else
            Cancel_Job := Cups.CancelJob (Cups.GetDefault);
            Ada.Text_IO.Put_Line ("Printer not active!");
         end if;
      else
         Ada.Text_IO.Put_Line ("No printer found!");
      end if;
   end PrintString;






end CUPS.CUPS;
