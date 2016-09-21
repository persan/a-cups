with Ada.Sequential_IO; use Ada;
with Ada.Text_IO; use Ada.Text_IO;
with System;
with Interfaces.C;
with Cups.Cups;
with Cups.String_Maps;
with CUPS.Cups_Cups_H;


with Interfaces.C.Strings;
with Ada.Containers;

procedure CUPS.Pinprint.Main is -- Main, but no special name is needed.
   use Interfaces.C.Strings;
   use Interfaces.C;
   use Cups_Cups_H;

   Num_Options    : Job_Id          := 0;
   Printer_State  : Standard.String := "";
   Id             : Job_Id          := 0;
   Cancel_Job     : Job_Id          := 0;

   Options        : aliased Cups.Cups_Option;
   Temp_File      : File_Type;
   Temp_File_Name : Standard.String := "TempFile.txt";

begin
   --Printer_State := Cups.GetOption ("printer-state", Options'Address);


   -- If printer is active, print jobs
   --if Printer_State /= "" then
   --if Integer'Value(Printer_State) < 3 then
   --Put_Line (Printer_State);
   Num_Options := Cups.AddOption ("raw", "true", Num_Options, Options);
   Num_Options := Cups.AddOption ("usb-no-reattach-default", "true", Num_Options, Options);


   -- Create the file for printing
   Create (Temp_File, Out_File, Temp_File_Name);
   Put_Line (Temp_File, "Hi!");
   Put_Line (Temp_File, "Å");
   Put_Line (Temp_File, "Ä");
   Put_Line (Temp_File, "Ö");
   Put_Line (Temp_File, "Bye!");
   -- Close before sending to printer
   Close (Temp_File);

   -- Print file
   Id := Cups.PrintFile (Cups.GetDefault, Temp_File_Name, "Test Print", Num_Options, Options);
   if Id /= 0 then
      Put_Line ("Printing!");
   else
      Put_Line ("Printing failed!");
   end if;


   --Cancel all Jobs otherwise
   --else
   --         Cancel_Job := Cups.CancelJob (Cups.GetDefault);
   --Put_Line ("Printer not active!");
   --end if;
   --else
   --Put_Line ("No printer found!");
   --end if;

end Cups.Pinprint.Main;
