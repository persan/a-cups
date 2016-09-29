with Interfaces.C;
with Interfaces.C.Strings;
with Ada.Containers;
with Cups.String_Maps;
private with CUPS.Cups_Cups_H;
with System;
with Ada.Strings.Bounded;
with Ada.Sequential_IO; use Ada;

with Ada.Text_IO;

package CUPS.CUPS is

   use Interfaces.C.Strings;
   use Interfaces.C;
   use Ada.Containers;

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

   procedure CancelJob
     (Name        : String := Cups.GetDefault;
      JobId       : Integer := -1 );
   --
   -- Cancel a job in the queue
   -- JobId -1 yields a termination of all jobs

   function GetDefaultPrinterState return String;
   --
   -- Get the state of the default printer

   procedure PrintString ( Str : String; Raw : Boolean);
   --
   -- Print a string on the default printer
   -- Set RAW True if raw printing is wanted

-------------------------------------------------------------------------------
private

   use Cups_Cups_H;

   type Option_T is access Cups_Option_T;
   type Destination_T is access all Cups_Dest_T;

   procedure SetRawPrinting (Num_Options : in out Job_ID;
                             Options     : aliased Option_T);
   --
   -- Initialises RAW printing and USB-no-reattach-default

   function AddOption
     (Name        : String;
      Value       : String;
      Num_Options : Job_Id;
      Options     : aliased Option_T) return Job_Id;
   --
   -- Add an option to an option array

   function GetOption
     (Name        : String;
      Num_Options : Job_Id;
      Options     : Option_T) return String;
   --
   -- Get an Option Value or Null
   -- For instance, "printer-state" tells if the printer is idle, processing etc..

   function PrintFile
     (Name        : String;
      Filename    : String;
      Title       : String;
      Num_Options : Job_Id;
      Options     : Option_T) return Job_Id;
   --
   -- Print a file to a printer or class on the default server.




end CUPS.CUPS;
