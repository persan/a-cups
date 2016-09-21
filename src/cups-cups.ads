with Interfaces.C;
with Interfaces.C.Strings;
with Ada.Containers;
with Cups.String_Maps;
with CUPS.Cups_Cups_H;
with System;

private package CUPS.CUPS is
   use Cups_Cups_H;
   use Interfaces.C.Strings;
   use Interfaces.C;
   use Ada.Containers;

   type Cups_Option is access Cups_Option_T;

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
      Num_Options : Job_Id;
      Options     : Cups_Option) return Job_Id;
   --
   -- Print a file to a printer or class on the default server.


   function CancelJob
     (Name        : String;
      JobId       : Integer := -1 ) return Job_Id;
   --
   -- Cancel a job in the queue
   -- JobId -1 yields a termination of all jobs

   function AddOption
     (Name   : String;
      Value  : String;
      Num_Options : Job_Id;
      Options     : aliased Cups_Option) return Job_Id;
   --
   -- Add an option to an option array

   function GetOption
     (Name : String;
      Num_Options : Job_Id;
      Options     : Cups_Option) return String;
   --
   -- Get an Option Value or Null
   -- For instance, "printer-state" tells if the printer is idle, processing etc..


end CUPS.CUPS;
