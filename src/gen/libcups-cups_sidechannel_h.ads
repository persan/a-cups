pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

package libCUPS.cups_sidechannel_h is

   CUPS_SC_FD : constant := 4;  --  cups/sidechannel.h:41

   type cups_sc_bidi_e is 
     (CUPS_SC_BIDI_NOT_SUPPORTED,
      CUPS_SC_BIDI_SUPPORTED);
   pragma Convention (C, cups_sc_bidi_e);  -- cups/sidechannel.h:48

   subtype cups_sc_bidi_t is cups_sc_bidi_e;

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

   subtype cups_sc_command_t is cups_sc_command_e;

   type cups_sc_connected_e is 
     (CUPS_SC_NOT_CONNECTED,
      CUPS_SC_CONNECTED);
   pragma Convention (C, cups_sc_connected_e);  -- cups/sidechannel.h:72

   subtype cups_sc_connected_t is cups_sc_connected_e;

   subtype cups_sc_state_e is unsigned;
   CUPS_SC_STATE_OFFLINE : constant cups_sc_state_e := 0;
   CUPS_SC_STATE_ONLINE : constant cups_sc_state_e := 1;
   CUPS_SC_STATE_BUSY : constant cups_sc_state_e := 2;
   CUPS_SC_STATE_ERROR : constant cups_sc_state_e := 4;
   CUPS_SC_STATE_MEDIA_LOW : constant cups_sc_state_e := 16;
   CUPS_SC_STATE_MEDIA_EMPTY : constant cups_sc_state_e := 32;
   CUPS_SC_STATE_MARKER_LOW : constant cups_sc_state_e := 64;
   CUPS_SC_STATE_MARKER_EMPTY : constant cups_sc_state_e := 128;  -- cups/sidechannel.h:81

   subtype cups_sc_state_t is cups_sc_state_e;

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

   subtype cups_sc_status_t is cups_sc_status_e;

   type cups_sc_walk_func_t is access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : System.Address);
   pragma Convention (C, cups_sc_walk_func_t);  -- cups/sidechannel.h:109

   function cupsSideChannelDoRequest
     (arg1 : cups_sc_command_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access int;
      arg4 : double) return cups_sc_status_t;  -- cups/sidechannel.h:118
   pragma Import (C, cupsSideChannelDoRequest, "cupsSideChannelDoRequest");

   function cupsSideChannelRead
     (arg1 : access cups_sc_command_t;
      arg2 : access cups_sc_status_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : access int;
      arg5 : double) return int;  -- cups/sidechannel.h:121
   pragma Import (C, cupsSideChannelRead, "cupsSideChannelRead");

   function cupsSideChannelWrite
     (arg1 : cups_sc_command_t;
      arg2 : cups_sc_status_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int;
      arg5 : double) return int;  -- cups/sidechannel.h:125
   pragma Import (C, cupsSideChannelWrite, "cupsSideChannelWrite");

   function cupsSideChannelSNMPGet
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : access int;
      arg4 : double) return cups_sc_status_t;  -- cups/sidechannel.h:131
   pragma Import (C, cupsSideChannelSNMPGet, "cupsSideChannelSNMPGet");

   function cupsSideChannelSNMPWalk
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : double;
      arg3 : cups_sc_walk_func_t;
      arg4 : System.Address) return cups_sc_status_t;  -- cups/sidechannel.h:134
   pragma Import (C, cupsSideChannelSNMPWalk, "cupsSideChannelSNMPWalk");

end libCUPS.cups_sidechannel_h;
