pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

private package CUPS.cups_sidechannel_h is

   CUPS_SC_FD : constant := 4;  --  cups/sidechannel.h:41

  -- * "$Id: sidechannel.h 10996 2013-05-29 11:51:34Z msweet $"
  -- *
  -- *   Side-channel API definitions for CUPS.
  -- *
  -- *   Copyright 2007-2012 by Apple Inc.
  -- *   Copyright 2006 by Easy Software Products.
  -- *
  -- *   These coded instructions, statements, and computer programs are the
  -- *   property of Apple Inc. and are protected by Federal copyright
  -- *   law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- *   which should have been included with this file.  If this file is
  -- *   file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- *   This file is subject to the Apple OS-Developed Software exception.
  --  

  -- * Include necessary headers...
  --  

  -- * C++ magic...
  --  

  -- * Constants...
  --  

  -- * Enumerations...
  --  

  --*** Bidirectional capability values *** 
   type cups_sc_bidi_e is 
     (CUPS_SC_BIDI_NOT_SUPPORTED,
      CUPS_SC_BIDI_SUPPORTED);
   pragma Convention (C, cups_sc_bidi_e);  -- cups/sidechannel.h:48

  -- Bidirectional I/O is not supported  
  -- Bidirectional I/O is supported  
   subtype cups_sc_bidi_t is cups_sc_bidi_e;

  --*** Bidirectional capabilities *** 
  --*** Request command codes *** 
   type cups_sc_command_e is 
     (CUPS_SC_CMD_NONE,
      CUPS_SC_CMD_SOFT_RESET,
      CUPS_SC_CMD_DRAIN_OUTPUT,
      CUPS_SC_CMD_GET_BIDI,
      CUPS_SC_CMD_GET_DEVICE_ID,
      CUPS_SC_CMD_GET_STATE,
      CUPS_SC_CMD_SNMP_GET,
      CUPS_SC_CMD_SNMP_GET_NEXT,
      CUPS_SC_CMD_GET_CONNECTED,
      CUPS_SC_CMD_MAX);
   pragma Convention (C, cups_sc_command_e);  -- cups/sidechannel.h:56

  -- No command @private@  
  -- Do a soft reset  
  -- Drain all pending output  
  -- Return bidirectional capabilities  
  -- Return the IEEE-1284 device ID  
  -- Return the device state  
  -- Query an SNMP OID @since CUPS 1.4/OS X 10.6@  
  -- Query the next SNMP OID @since CUPS 1.4/OS X 10.6@  
  -- Return whether the backend is "connected" to the printer @since CUPS 1.5/OS X 10.7@  
  -- End of valid values @private@  
   subtype cups_sc_command_t is cups_sc_command_e;

  --*** Request command codes *** 
  --*** Connectivity values *** 
   type cups_sc_connected_e is 
     (CUPS_SC_NOT_CONNECTED,
      CUPS_SC_CONNECTED);
   pragma Convention (C, cups_sc_connected_e);  -- cups/sidechannel.h:72

  -- Backend is not "connected" to printer  
  -- Backend is "connected" to printer  
   subtype cups_sc_connected_t is cups_sc_connected_e;

  --*** Connectivity values *** 
  --*** Printer state bits *** 
   subtype cups_sc_state_e is unsigned;
   CUPS_SC_STATE_OFFLINE : constant cups_sc_state_e := 0;
   CUPS_SC_STATE_ONLINE : constant cups_sc_state_e := 1;
   CUPS_SC_STATE_BUSY : constant cups_sc_state_e := 2;
   CUPS_SC_STATE_ERROR : constant cups_sc_state_e := 4;
   CUPS_SC_STATE_MEDIA_LOW : constant cups_sc_state_e := 16;
   CUPS_SC_STATE_MEDIA_EMPTY : constant cups_sc_state_e := 32;
   CUPS_SC_STATE_MARKER_LOW : constant cups_sc_state_e := 64;
   CUPS_SC_STATE_MARKER_EMPTY : constant cups_sc_state_e := 128;  -- cups/sidechannel.h:81

  -- Device is offline  
  -- Device is online  
  -- Device is busy  
  -- Other error condition  
  -- Paper low condition  
  -- Paper out condition  
  -- Toner/ink low condition  
  -- Toner/ink out condition  
   subtype cups_sc_state_t is cups_sc_state_e;

  --*** Printer state bits *** 
  --*** Response status codes *** 
   type cups_sc_status_e is 
     (CUPS_SC_STATUS_NONE,
      CUPS_SC_STATUS_OK,
      CUPS_SC_STATUS_IO_ERROR,
      CUPS_SC_STATUS_TIMEOUT,
      CUPS_SC_STATUS_NO_RESPONSE,
      CUPS_SC_STATUS_BAD_MESSAGE,
      CUPS_SC_STATUS_TOO_BIG,
      CUPS_SC_STATUS_NOT_IMPLEMENTED);
   pragma Convention (C, cups_sc_status_e);  -- cups/sidechannel.h:95

  -- No status  
  -- Operation succeeded  
  -- An I/O error occurred  
  -- The backend did not respond  
  -- The device did not respond  
  -- The command/response message was invalid  
  -- Response too big  
  -- Command not implemented  
   subtype cups_sc_status_t is cups_sc_status_e;

  --*** Response status codes *** 
   type cups_sc_walk_func_t is access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : System.Address);
   pragma Convention (C, cups_sc_walk_func_t);  -- cups/sidechannel.h:109

  --*** SNMP walk callback *** 
  -- * Prototypes...
  --  

   function cupsSideChannelDoRequest
     (command : cups_sc_command_t;
      data : Interfaces.C.Strings.chars_ptr;
      datalen : access int;
      timeout : double) return cups_sc_status_t;  -- cups/sidechannel.h:118
   pragma Import (C, cupsSideChannelDoRequest, "cupsSideChannelDoRequest");

   function cupsSideChannelRead
     (command : access cups_sc_command_t;
      status : access cups_sc_status_t;
      data : Interfaces.C.Strings.chars_ptr;
      datalen : access int;
      timeout : double) return int;  -- cups/sidechannel.h:121
   pragma Import (C, cupsSideChannelRead, "cupsSideChannelRead");

   function cupsSideChannelWrite
     (command : cups_sc_command_t;
      status : cups_sc_status_t;
      data : Interfaces.C.Strings.chars_ptr;
      datalen : int;
      timeout : double) return int;  -- cups/sidechannel.h:125
   pragma Import (C, cupsSideChannelWrite, "cupsSideChannelWrite");

  --*** New in CUPS 1.4 *** 
   function cupsSideChannelSNMPGet
     (oid : Interfaces.C.Strings.chars_ptr;
      data : Interfaces.C.Strings.chars_ptr;
      datalen : access int;
      timeout : double) return cups_sc_status_t;  -- cups/sidechannel.h:131
   pragma Import (C, cupsSideChannelSNMPGet, "cupsSideChannelSNMPGet");

   function cupsSideChannelSNMPWalk
     (oid : Interfaces.C.Strings.chars_ptr;
      timeout : double;
      cb : cups_sc_walk_func_t;
      context : System.Address) return cups_sc_status_t;  -- cups/sidechannel.h:134
   pragma Import (C, cupsSideChannelSNMPWalk, "cupsSideChannelSNMPWalk");

  -- * End of "$Id: sidechannel.h 10996 2013-05-29 11:51:34Z msweet $".
  --  

end CUPS.cups_sidechannel_h;
