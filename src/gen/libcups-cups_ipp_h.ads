pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

with libCUPS.stdio_h;
with Interfaces.C_Streams;
with Interfaces.C.Strings;
with libCUPS.time_h;

package libCUPS.cups_ipp_h is

   --  unsupported macro: IPP_VERSION "\002\001"
   IPP_PORT : constant := 631;  --  cups/ipp.h:52

   IPP_MAX_CHARSET : constant := 64;  --  cups/ipp.h:58
   IPP_MAX_KEYWORD : constant := 256;  --  cups/ipp.h:59
   IPP_MAX_LANGUAGE : constant := 64;  --  cups/ipp.h:60
   IPP_MAX_LENGTH : constant := 32767;  --  cups/ipp.h:61
   IPP_MAX_MIMETYPE : constant := 256;  --  cups/ipp.h:62
   IPP_MAX_NAME : constant := 256;  --  cups/ipp.h:63
   IPP_MAX_OCTETSTRING : constant := 1023;  --  cups/ipp.h:64
   IPP_MAX_TEXT : constant := 1024;  --  cups/ipp.h:65
   IPP_MAX_URI : constant := 1024;  --  cups/ipp.h:66
   IPP_MAX_URISCHEME : constant := 64;  --  cups/ipp.h:67
   IPP_MAX_VALUES : constant := 8;  --  cups/ipp.h:68
   --  arg-macro: function IPP_CONST_TAG (ipp_tag_t)(IPP_TAG_CUPS_CONST or (x)
   --    return ipp_tag_t)(IPP_TAG_CUPS_CONST or (x);
   --  unsupported macro: IPP_DOCUMENT_PENDING IPP_DSTATE_PENDING
   --  unsupported macro: IPP_DOCUMENT_PROCESSING IPP_DSTATE_PROCESSING
   --  unsupported macro: IPP_DOCUMENT_CANCELED IPP_DSTATE_CANCELED
   --  unsupported macro: IPP_DOCUMENT_ABORTED IPP_DSTATE_ABORTED
   --  unsupported macro: IPP_DOCUMENT_COMPLETED IPP_DSTATE_COMPLETED
   --  unsupported macro: IPP_FINISHINGS_JOB_OFFSET IPP_FINISHINGS_JOG_OFFSET
   --  unsupported macro: IPP_JOB_UNCOLLATED_SHEETS IPP_JCOLLATE_UNCOLLATED_SHEETS
   --  unsupported macro: IPP_JOB_COLLATED_DOCUMENTS IPP_JCOLLATE_COLLATED_DOCUMENTS
   --  unsupported macro: IPP_JOB_UNCOLLATED_DOCUMENTS IPP_JCOLLATE_UNCOLLATED_DOCUMENTS
   --  unsupported macro: IPP_JOB_PENDING IPP_JSTATE_PENDING
   --  unsupported macro: IPP_JOB_HELD IPP_JSTATE_HELD
   --  unsupported macro: IPP_JOB_PROCESSING IPP_JSTATE_PROCESSING
   --  unsupported macro: IPP_JOB_STOPPED IPP_JSTATE_STOPPED
   --  unsupported macro: IPP_JOB_CANCELED IPP_JSTATE_CANCELED
   --  unsupported macro: IPP_JOB_ABORTED IPP_JSTATE_ABORTED
   --  unsupported macro: IPP_JOB_COMPLETED IPP_JSTATE_COMPLETED
   --  unsupported macro: IPP_JOB_CANCELLED IPP_JSTATE_CANCELED
   --  unsupported macro: IPP_PRINT_JOB IPP_OP_PRINT_JOB
   --  unsupported macro: IPP_PRINT_URI IPP_OP_PRINT_URI
   --  unsupported macro: IPP_VALIDATE_JOB IPP_OP_VALIDATE_JOB
   --  unsupported macro: IPP_CREATE_JOB IPP_OP_CREATE_JOB
   --  unsupported macro: IPP_SEND_DOCUMENT IPP_OP_SEND_DOCUMENT
   --  unsupported macro: IPP_SEND_URI IPP_OP_SEND_URI
   --  unsupported macro: IPP_CANCEL_JOB IPP_OP_CANCEL_JOB
   --  unsupported macro: IPP_GET_JOB_ATTRIBUTES IPP_OP_GET_JOB_ATTRIBUTES
   --  unsupported macro: IPP_GET_JOBS IPP_OP_GET_JOBS
   --  unsupported macro: IPP_GET_PRINTER_ATTRIBUTES IPP_OP_GET_PRINTER_ATTRIBUTES
   --  unsupported macro: IPP_HOLD_JOB IPP_OP_HOLD_JOB
   --  unsupported macro: IPP_RELEASE_JOB IPP_OP_RELEASE_JOB
   --  unsupported macro: IPP_RESTART_JOB IPP_OP_RESTART_JOB
   --  unsupported macro: IPP_PAUSE_PRINTER IPP_OP_PAUSE_PRINTER
   --  unsupported macro: IPP_RESUME_PRINTER IPP_OP_RESUME_PRINTER
   --  unsupported macro: IPP_PURGE_JOBS IPP_OP_PURGE_JOBS
   --  unsupported macro: IPP_SET_PRINTER_ATTRIBUTES IPP_OP_SET_PRINTER_ATTRIBUTES
   --  unsupported macro: IPP_SET_JOB_ATTRIBUTES IPP_OP_SET_JOB_ATTRIBUTES
   --  unsupported macro: IPP_GET_PRINTER_SUPPORTED_VALUES IPP_OP_GET_PRINTER_SUPPORTED_VALUES
   --  unsupported macro: IPP_CREATE_PRINTER_SUBSCRIPTION IPP_OP_CREATE_PRINTER_SUBSCRIPTIONS
   --  unsupported macro: IPP_CREATE_JOB_SUBSCRIPTION IPP_OP_CREATE_JOB_SUBSCRIPTIONS
   --  unsupported macro: IPP_OP_CREATE_PRINTER_SUBSCRIPTION IPP_OP_CREATE_PRINTER_SUBSCRIPTIONS
   --  unsupported macro: IPP_OP_CREATE_JOB_SUBSCRIPTION IPP_OP_CREATE_JOB_SUBSCRIPTIONS
   --  unsupported macro: IPP_GET_SUBSCRIPTION_ATTRIBUTES IPP_OP_GET_SUBSCRIPTION_ATTRIBUTES
   --  unsupported macro: IPP_GET_SUBSCRIPTIONS IPP_OP_GET_SUBSCRIPTIONS
   --  unsupported macro: IPP_RENEW_SUBSCRIPTION IPP_OP_RENEW_SUBSCRIPTION
   --  unsupported macro: IPP_CANCEL_SUBSCRIPTION IPP_OP_CANCEL_SUBSCRIPTION
   --  unsupported macro: IPP_GET_NOTIFICATIONS IPP_OP_GET_NOTIFICATIONS
   --  unsupported macro: IPP_SEND_NOTIFICATIONS IPP_OP_SEND_NOTIFICATIONS
   --  unsupported macro: IPP_GET_RESOURCE_ATTRIBUTES IPP_OP_GET_RESOURCE_ATTRIBUTES
   --  unsupported macro: IPP_GET_RESOURCE_DATA IPP_OP_GET_RESOURCE_DATA
   --  unsupported macro: IPP_GET_RESOURCES IPP_OP_GET_RESOURCES
   --  unsupported macro: IPP_GET_PRINT_SUPPORT_FILES IPP_OP_GET_PRINT_SUPPORT_FILES
   --  unsupported macro: IPP_ENABLE_PRINTER IPP_OP_ENABLE_PRINTER
   --  unsupported macro: IPP_DISABLE_PRINTER IPP_OP_DISABLE_PRINTER
   --  unsupported macro: IPP_PAUSE_PRINTER_AFTER_CURRENT_JOB IPP_OP_PAUSE_PRINTER_AFTER_CURRENT_JOB
   --  unsupported macro: IPP_HOLD_NEW_JOBS IPP_OP_HOLD_NEW_JOBS
   --  unsupported macro: IPP_RELEASE_HELD_NEW_JOBS IPP_OP_RELEASE_HELD_NEW_JOBS
   --  unsupported macro: IPP_DEACTIVATE_PRINTER IPP_OP_DEACTIVATE_PRINTER
   --  unsupported macro: IPP_ACTIVATE_PRINTER IPP_OP_ACTIVATE_PRINTER
   --  unsupported macro: IPP_RESTART_PRINTER IPP_OP_RESTART_PRINTER
   --  unsupported macro: IPP_SHUTDOWN_PRINTER IPP_OP_SHUTDOWN_PRINTER
   --  unsupported macro: IPP_STARTUP_PRINTER IPP_OP_STARTUP_PRINTER
   --  unsupported macro: IPP_REPROCESS_JOB IPP_OP_REPROCESS_JOB
   --  unsupported macro: IPP_CANCEL_CURRENT_JOB IPP_OP_CANCEL_CURRENT_JOB
   --  unsupported macro: IPP_SUSPEND_CURRENT_JOB IPP_OP_SUSPEND_CURRENT_JOB
   --  unsupported macro: IPP_RESUME_JOB IPP_OP_RESUME_JOB
   --  unsupported macro: IPP_PROMOTE_JOB IPP_OP_PROMOTE_JOB
   --  unsupported macro: IPP_SCHEDULE_JOB_AFTER IPP_OP_SCHEDULE_JOB_AFTER
   --  unsupported macro: IPP_CANCEL_DOCUMENT IPP_OP_CANCEL_DOCUMENT
   --  unsupported macro: IPP_GET_DOCUMENT_ATTRIBUTES IPP_OP_GET_DOCUMENT_ATTRIBUTES
   --  unsupported macro: IPP_GET_DOCUMENTS IPP_OP_GET_DOCUMENTS
   --  unsupported macro: IPP_DELETE_DOCUMENT IPP_OP_DELETE_DOCUMENT
   --  unsupported macro: IPP_SET_DOCUMENT_ATTRIBUTES IPP_OP_SET_DOCUMENT_ATTRIBUTES
   --  unsupported macro: IPP_CANCEL_JOBS IPP_OP_CANCEL_JOBS
   --  unsupported macro: IPP_CANCEL_MY_JOBS IPP_OP_CANCEL_MY_JOBS
   --  unsupported macro: IPP_RESUBMIT_JOB IPP_OP_RESUBMIT_JOB
   --  unsupported macro: IPP_CLOSE_JOB IPP_OP_CLOSE_JOB
   --  unsupported macro: IPP_IDENTIFY_PRINTER IPP_OP_IDENTIFY_PRINTER
   --  unsupported macro: IPP_VALIDATE_DOCUMENT IPP_OP_VALIDATE_DOCUMENT
   --  unsupported macro: IPP_PRIVATE IPP_OP_PRIVATE
   --  unsupported macro: CUPS_GET_DEFAULT IPP_OP_CUPS_GET_DEFAULT
   --  unsupported macro: CUPS_GET_PRINTERS IPP_OP_CUPS_GET_PRINTERS
   --  unsupported macro: CUPS_ADD_MODIFY_PRINTER IPP_OP_CUPS_ADD_MODIFY_PRINTER
   --  unsupported macro: CUPS_DELETE_PRINTER IPP_OP_CUPS_DELETE_PRINTER
   --  unsupported macro: CUPS_GET_CLASSES IPP_OP_CUPS_GET_CLASSES
   --  unsupported macro: CUPS_ADD_MODIFY_CLASS IPP_OP_CUPS_ADD_MODIFY_CLASS
   --  unsupported macro: CUPS_DELETE_CLASS IPP_OP_CUPS_DELETE_CLASS
   --  unsupported macro: CUPS_ACCEPT_JOBS IPP_OP_CUPS_ACCEPT_JOBS
   --  unsupported macro: CUPS_REJECT_JOBS IPP_OP_CUPS_REJECT_JOBS
   --  unsupported macro: CUPS_SET_DEFAULT IPP_OP_CUPS_SET_DEFAULT
   --  unsupported macro: CUPS_GET_DEVICES IPP_OP_CUPS_GET_DEVICES
   --  unsupported macro: CUPS_GET_PPDS IPP_OP_CUPS_GET_PPDS
   --  unsupported macro: CUPS_MOVE_JOB IPP_OP_CUPS_MOVE_JOB
   --  unsupported macro: CUPS_AUTHENTICATE_JOB IPP_OP_CUPS_AUTHENTICATE_JOB
   --  unsupported macro: CUPS_GET_PPD IPP_OP_CUPS_GET_PPD
   --  unsupported macro: CUPS_GET_DOCUMENT IPP_OP_CUPS_GET_DOCUMENT
   --  unsupported macro: CUPS_ADD_PRINTER IPP_OP_CUPS_ADD_MODIFY_PRINTER
   --  unsupported macro: CUPS_ADD_CLASS IPP_OP_CUPS_ADD_MODIFY_CLASS
   --  unsupported macro: IPP_PORTRAIT IPP_ORIENT_PORTRAIT
   --  unsupported macro: IPP_LANDSCAPE IPP_ORIENT_LANDSCAPE
   --  unsupported macro: IPP_REVERSE_LANDSCAPE IPP_ORIENT_REVERSE_LANDSCAPE
   --  unsupported macro: IPP_REVERSE_PORTRAIT IPP_ORIENT_REVERSE_PORTRAIT
   --  unsupported macro: IPP_PRINTER_IDLE IPP_PSTATE_IDLE
   --  unsupported macro: IPP_PRINTER_PROCESSING IPP_PSTATE_PROCESSING
   --  unsupported macro: IPP_PRINTER_STOPPED IPP_PSTATE_STOPPED
   --  unsupported macro: IPP_ERROR IPP_STATE_ERROR
   --  unsupported macro: IPP_IDLE IPP_STATE_IDLE
   --  unsupported macro: IPP_HEADER IPP_STATE_HEADER
   --  unsupported macro: IPP_ATTRIBUTE IPP_STATE_ATTRIBUTE
   --  unsupported macro: IPP_DATA IPP_STATE_DATA
   --  unsupported macro: IPP_OK IPP_STATUS_OK
   --  unsupported macro: IPP_OK_SUBST IPP_STATUS_OK_IGNORED_OR_SUBSTITUTED
   --  unsupported macro: IPP_OK_CONFLICT IPP_STATUS_OK_CONFLICTING
   --  unsupported macro: IPP_OK_IGNORED_SUBSCRIPTIONS IPP_STATUS_OK_IGNORED_SUBSCRIPTIONS
   --  unsupported macro: IPP_OK_IGNORED_NOTIFICATIONS IPP_STATUS_OK_IGNORED_NOTIFICATIONS
   --  unsupported macro: IPP_OK_TOO_MANY_EVENTS IPP_STATUS_OK_TOO_MANY_EVENTS
   --  unsupported macro: IPP_OK_BUT_CANCEL_SUBSCRIPTION IPP_STATUS_OK_BUT_CANCEL_SUBSCRIPTION
   --  unsupported macro: IPP_OK_EVENTS_COMPLETE IPP_STATUS_OK_EVENTS_COMPLETE
   --  unsupported macro: IPP_REDIRECTION_OTHER_SITE IPP_STATUS_REDIRECTION_OTHER_SITE
   --  unsupported macro: CUPS_SEE_OTHER IPP_STATUS_CUPS_SEE_OTHER
   --  unsupported macro: IPP_BAD_REQUEST IPP_STATUS_ERROR_BAD_REQUEST
   --  unsupported macro: IPP_FORBIDDEN IPP_STATUS_ERROR_FORBIDDEN
   --  unsupported macro: IPP_NOT_AUTHENTICATED IPP_STATUS_ERROR_NOT_AUTHENTICATED
   --  unsupported macro: IPP_NOT_AUTHORIZED IPP_STATUS_ERROR_NOT_AUTHORIZED
   --  unsupported macro: IPP_NOT_POSSIBLE IPP_STATUS_ERROR_NOT_POSSIBLE
   --  unsupported macro: IPP_TIMEOUT IPP_STATUS_ERROR_TIMEOUT
   --  unsupported macro: IPP_NOT_FOUND IPP_STATUS_ERROR_NOT_FOUND
   --  unsupported macro: IPP_GONE IPP_STATUS_ERROR_GONE
   --  unsupported macro: IPP_REQUEST_ENTITY IPP_STATUS_ERROR_REQUEST_ENTITY
   --  unsupported macro: IPP_REQUEST_VALUE IPP_STATUS_ERROR_REQUEST_VALUE
   --  unsupported macro: IPP_DOCUMENT_FORMAT IPP_STATUS_ERROR_DOCUMENT_FORMAT_NOT_SUPPORTED
   --  unsupported macro: IPP_ATTRIBUTES IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES
   --  unsupported macro: IPP_URI_SCHEME IPP_STATUS_ERROR_URI_SCHEME
   --  unsupported macro: IPP_CHARSET IPP_STATUS_ERROR_CHARSET
   --  unsupported macro: IPP_CONFLICT IPP_STATUS_ERROR_CONFLICTING
   --  unsupported macro: IPP_COMPRESSION_NOT_SUPPORTED IPP_STATUS_ERROR_COMPRESSION_NOT_SUPPORTED
   --  unsupported macro: IPP_COMPRESSION_ERROR IPP_STATUS_ERROR_COMPRESSION_ERROR
   --  unsupported macro: IPP_DOCUMENT_FORMAT_ERROR IPP_STATUS_ERROR_DOCUMENT_FORMAT_ERROR
   --  unsupported macro: IPP_DOCUMENT_ACCESS_ERROR IPP_STATUS_ERROR_DOCUMENT_ACCESS
   --  unsupported macro: IPP_ATTRIBUTES_NOT_SETTABLE IPP_STATUS_ERROR_ATTRIBUTES_NOT_SETTABLE
   --  unsupported macro: IPP_IGNORED_ALL_SUBSCRIPTIONS IPP_STATUS_ERROR_IGNORED_ALL_SUBSCRIPTIONS
   --  unsupported macro: IPP_TOO_MANY_SUBSCRIPTIONS IPP_STATUS_ERROR_TOO_MANY_SUBSCRIPTIONS
   --  unsupported macro: IPP_IGNORED_ALL_NOTIFICATIONS IPP_STATUS_ERROR_IGNORED_ALL_NOTIFICATIONS
   --  unsupported macro: IPP_PRINT_SUPPORT_FILE_NOT_FOUND IPP_STATUS_ERROR_PRINT_SUPPORT_FILE_NOT_FOUND
   --  unsupported macro: IPP_DOCUMENT_PASSWORD_ERROR IPP_STATUS_ERROR_DOCUMENT_PASSWORD
   --  unsupported macro: IPP_DOCUMENT_PERMISSION_ERROR IPP_STATUS_ERROR_DOCUMENT_PERMISSION
   --  unsupported macro: IPP_DOCUMENT_SECURITY_ERROR IPP_STATUS_ERROR_DOCUMENT_SECURITY
   --  unsupported macro: IPP_DOCUMENT_UNPRINTABLE_ERROR IPP_STATUS_ERROR_DOCUMENT_UNPRINTABLE
   --  unsupported macro: IPP_INTERNAL_ERROR IPP_STATUS_ERROR_INTERNAL
   --  unsupported macro: IPP_OPERATION_NOT_SUPPORTED IPP_STATUS_ERROR_OPERATION_NOT_SUPPORTED
   --  unsupported macro: IPP_SERVICE_UNAVAILABLE IPP_STATUS_ERROR_SERVICE_UNAVAILABLE
   --  unsupported macro: IPP_VERSION_NOT_SUPPORTED IPP_STATUS_ERROR_VERSION_NOT_SUPPORTED
   --  unsupported macro: IPP_DEVICE_ERROR IPP_STATUS_ERROR_DEVICE
   --  unsupported macro: IPP_TEMPORARY_ERROR IPP_STATUS_ERROR_TEMPORARY
   --  unsupported macro: IPP_NOT_ACCEPTING IPP_STATUS_ERROR_NOT_ACCEPTING_JOBS
   --  unsupported macro: IPP_PRINTER_BUSY IPP_STATUS_ERROR_BUSY
   --  unsupported macro: IPP_ERROR_JOB_CANCELED IPP_STATUS_ERROR_JOB_CANCELED
   --  unsupported macro: IPP_MULTIPLE_JOBS_NOT_SUPPORTED IPP_STATUS_ERROR_MULTIPLE_JOBS_NOT_SUPPORTED
   --  unsupported macro: IPP_PRINTER_IS_DEACTIVATED IPP_STATUS_ERROR_PRINTER_IS_DEACTIVATED
   --  unsupported macro: IPP_TOO_MANY_JOBS IPP_STATUS_ERROR_TOO_MANY_JOBS
   --  unsupported macro: IPP_TOO_MANY_DOCUMENTS IPP_STATUS_ERROR_TOO_MANY_DOCUMENTS
   --  unsupported macro: IPP_AUTHENTICATION_CANCELED IPP_STATUS_ERROR_CUPS_AUTHENTICATION_CANCELED
   --  unsupported macro: IPP_PKI_ERROR IPP_STATUS_ERROR_CUPS_PKI
   --  unsupported macro: IPP_UPGRADE_REQUIRED IPP_STATUS_ERROR_CUPS_UPGRADE_REQUIRED
   --  unsupported macro: IPP_ERROR_JOB_CANCELLED IPP_STATUS_ERROR_JOB_CANCELED
   --  unsupported macro: IPP_TAG_MASK IPP_TAG_CUPS_MASK
   --  unsupported macro: IPP_TAG_COPY IPP_TAG_CUPS_CONST

  -- * "$Id: ipp.h 12666 2015-05-25 19:38:09Z msweet $"
  -- *
  -- * Internet Printing Protocol definitions for CUPS.
  -- *
  -- * Copyright 2007-2014 by Apple Inc.
  -- * Copyright 1997-2006 by Easy Software Products.
  -- *
  -- * These coded instructions, statements, and computer programs are the
  -- * property of Apple Inc. and are protected by Federal copyright
  -- * law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- * which should have been included with this file.  If this file is
  -- * file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- * This file is subject to the Apple OS-Developed Software exception.
  --  

  -- * Include necessary headers...
  --  

  -- * C++ magic...
  --  

  -- * IPP version string...
  --  

  -- * IPP registered port number...
  -- *
  -- * Note: Applications should never use IPP_PORT, but instead use the
  -- * ippPort() function to allow overrides via the IPP_PORT environment
  -- * variable and services file if needed!
  --  

  -- * Common limits...
  --  

  -- * Macro to flag a text string attribute as "const" (static storage) vs.
  -- * allocated.
  --  

  -- * Types and structures...
  --  

  --*** Document states *** 
   subtype ipp_dstate_e is unsigned;
   IPP_DOCUMENT_PENDING : constant ipp_dstate_e := 3;
   IPP_DOCUMENT_PROCESSING : constant ipp_dstate_e := 5;
   IPP_DOCUMENT_CANCELED : constant ipp_dstate_e := 7;
   IPP_DOCUMENT_ABORTED : constant ipp_dstate_e := 8;
   IPP_DOCUMENT_COMPLETED : constant ipp_dstate_e := 9;  -- cups/ipp.h:82

  -- Document is pending  
  -- Document is processing  
  -- Document is canceled  
  -- Document is aborted  
  -- Document is completed  
   subtype ipp_dstate_t is ipp_dstate_e;

  --*** Finishings *** 
   subtype ipp_finishings_e is unsigned;
   IPP_FINISHINGS_NONE : constant ipp_finishings_e := 3;
   IPP_FINISHINGS_STAPLE : constant ipp_finishings_e := 4;
   IPP_FINISHINGS_PUNCH : constant ipp_finishings_e := 5;
   IPP_FINISHINGS_COVER : constant ipp_finishings_e := 6;
   IPP_FINISHINGS_BIND : constant ipp_finishings_e := 7;
   IPP_FINISHINGS_SADDLE_STITCH : constant ipp_finishings_e := 8;
   IPP_FINISHINGS_EDGE_STITCH : constant ipp_finishings_e := 9;
   IPP_FINISHINGS_FOLD : constant ipp_finishings_e := 10;
   IPP_FINISHINGS_TRIM : constant ipp_finishings_e := 11;
   IPP_FINISHINGS_BALE : constant ipp_finishings_e := 12;
   IPP_FINISHINGS_BOOKLET_MAKER : constant ipp_finishings_e := 13;
   IPP_FINISHINGS_JOG_OFFSET : constant ipp_finishings_e := 14;
   IPP_FINISHINGS_COAT : constant ipp_finishings_e := 15;
   IPP_FINISHINGS_LAMINATE : constant ipp_finishings_e := 16;
   IPP_FINISHINGS_STAPLE_TOP_LEFT : constant ipp_finishings_e := 20;
   IPP_FINISHINGS_STAPLE_BOTTOM_LEFT : constant ipp_finishings_e := 21;
   IPP_FINISHINGS_STAPLE_TOP_RIGHT : constant ipp_finishings_e := 22;
   IPP_FINISHINGS_STAPLE_BOTTOM_RIGHT : constant ipp_finishings_e := 23;
   IPP_FINISHINGS_EDGE_STITCH_LEFT : constant ipp_finishings_e := 24;
   IPP_FINISHINGS_EDGE_STITCH_TOP : constant ipp_finishings_e := 25;
   IPP_FINISHINGS_EDGE_STITCH_RIGHT : constant ipp_finishings_e := 26;
   IPP_FINISHINGS_EDGE_STITCH_BOTTOM : constant ipp_finishings_e := 27;
   IPP_FINISHINGS_STAPLE_DUAL_LEFT : constant ipp_finishings_e := 28;
   IPP_FINISHINGS_STAPLE_DUAL_TOP : constant ipp_finishings_e := 29;
   IPP_FINISHINGS_STAPLE_DUAL_RIGHT : constant ipp_finishings_e := 30;
   IPP_FINISHINGS_STAPLE_DUAL_BOTTOM : constant ipp_finishings_e := 31;
   IPP_FINISHINGS_STAPLE_TRIPLE_LEFT : constant ipp_finishings_e := 32;
   IPP_FINISHINGS_STAPLE_TRIPLE_TOP : constant ipp_finishings_e := 33;
   IPP_FINISHINGS_STAPLE_TRIPLE_RIGHT : constant ipp_finishings_e := 34;
   IPP_FINISHINGS_STAPLE_TRIPLE_BOTTOM : constant ipp_finishings_e := 35;
   IPP_FINISHINGS_BIND_LEFT : constant ipp_finishings_e := 50;
   IPP_FINISHINGS_BIND_TOP : constant ipp_finishings_e := 51;
   IPP_FINISHINGS_BIND_RIGHT : constant ipp_finishings_e := 52;
   IPP_FINISHINGS_BIND_BOTTOM : constant ipp_finishings_e := 53;
   IPP_FINISHINGS_TRIM_AFTER_PAGES : constant ipp_finishings_e := 60;
   IPP_FINISHINGS_TRIM_AFTER_DOCUMENTS : constant ipp_finishings_e := 61;
   IPP_FINISHINGS_TRIM_AFTER_COPIES : constant ipp_finishings_e := 62;
   IPP_FINISHINGS_TRIM_AFTER_JOB : constant ipp_finishings_e := 63;
   IPP_FINISHINGS_PUNCH_TOP_LEFT : constant ipp_finishings_e := 70;
   IPP_FINISHINGS_PUNCH_BOTTOM_LEFT : constant ipp_finishings_e := 71;
   IPP_FINISHINGS_PUNCH_TOP_RIGHT : constant ipp_finishings_e := 72;
   IPP_FINISHINGS_PUNCH_BOTTOM_RIGHT : constant ipp_finishings_e := 73;
   IPP_FINISHINGS_PUNCH_DUAL_LEFT : constant ipp_finishings_e := 74;
   IPP_FINISHINGS_PUNCH_DUAL_TOP : constant ipp_finishings_e := 75;
   IPP_FINISHINGS_PUNCH_DUAL_RIGHT : constant ipp_finishings_e := 76;
   IPP_FINISHINGS_PUNCH_DUAL_BOTTOM : constant ipp_finishings_e := 77;
   IPP_FINISHINGS_PUNCH_TRIPLE_LEFT : constant ipp_finishings_e := 78;
   IPP_FINISHINGS_PUNCH_TRIPLE_TOP : constant ipp_finishings_e := 79;
   IPP_FINISHINGS_PUNCH_TRIPLE_RIGHT : constant ipp_finishings_e := 80;
   IPP_FINISHINGS_PUNCH_TRIPLE_BOTTOM : constant ipp_finishings_e := 81;
   IPP_FINISHINGS_PUNCH_QUAD_LEFT : constant ipp_finishings_e := 82;
   IPP_FINISHINGS_PUNCH_QUAD_TOP : constant ipp_finishings_e := 83;
   IPP_FINISHINGS_PUNCH_QUAD_RIGHT : constant ipp_finishings_e := 84;
   IPP_FINISHINGS_PUNCH_QUAD_BOTTOM : constant ipp_finishings_e := 85;
   IPP_FINISHINGS_FOLD_ACCORDIAN : constant ipp_finishings_e := 90;
   IPP_FINISHINGS_FOLD_DOUBLE_GATE : constant ipp_finishings_e := 91;
   IPP_FINISHINGS_FOLD_GATE : constant ipp_finishings_e := 92;
   IPP_FINISHINGS_FOLD_HALF : constant ipp_finishings_e := 93;
   IPP_FINISHINGS_FOLD_HALF_Z : constant ipp_finishings_e := 94;
   IPP_FINISHINGS_FOLD_LEFT_GATE : constant ipp_finishings_e := 95;
   IPP_FINISHINGS_FOLD_LETTER : constant ipp_finishings_e := 96;
   IPP_FINISHINGS_FOLD_PARALLEL : constant ipp_finishings_e := 97;
   IPP_FINISHINGS_FOLD_POSTER : constant ipp_finishings_e := 98;
   IPP_FINISHINGS_FOLD_RIGHT_GATE : constant ipp_finishings_e := 99;
   IPP_FINISHINGS_FOLD_Z : constant ipp_finishings_e := 100;
   IPP_FINISHINGS_CUPS_PUNCH_TOP_LEFT : constant ipp_finishings_e := 1073741894;
   IPP_FINISHINGS_CUPS_PUNCH_BOTTOM_LEFT : constant ipp_finishings_e := 1073741895;
   IPP_FINISHINGS_CUPS_PUNCH_TOP_RIGHT : constant ipp_finishings_e := 1073741896;
   IPP_FINISHINGS_CUPS_PUNCH_BOTTOM_RIGHT : constant ipp_finishings_e := 1073741897;
   IPP_FINISHINGS_CUPS_PUNCH_DUAL_LEFT : constant ipp_finishings_e := 1073741898;
   IPP_FINISHINGS_CUPS_PUNCH_DUAL_TOP : constant ipp_finishings_e := 1073741899;
   IPP_FINISHINGS_CUPS_PUNCH_DUAL_RIGHT : constant ipp_finishings_e := 1073741900;
   IPP_FINISHINGS_CUPS_PUNCH_DUAL_BOTTOM : constant ipp_finishings_e := 1073741901;
   IPP_FINISHINGS_CUPS_PUNCH_TRIPLE_LEFT : constant ipp_finishings_e := 1073741902;
   IPP_FINISHINGS_CUPS_PUNCH_TRIPLE_TOP : constant ipp_finishings_e := 1073741903;
   IPP_FINISHINGS_CUPS_PUNCH_TRIPLE_RIGHT : constant ipp_finishings_e := 1073741904;
   IPP_FINISHINGS_CUPS_PUNCH_TRIPLE_BOTTOM : constant ipp_finishings_e := 1073741905;
   IPP_FINISHINGS_CUPS_PUNCH_QUAD_LEFT : constant ipp_finishings_e := 1073741906;
   IPP_FINISHINGS_CUPS_PUNCH_QUAD_TOP : constant ipp_finishings_e := 1073741907;
   IPP_FINISHINGS_CUPS_PUNCH_QUAD_RIGHT : constant ipp_finishings_e := 1073741908;
   IPP_FINISHINGS_CUPS_PUNCH_QUAD_BOTTOM : constant ipp_finishings_e := 1073741909;
   IPP_FINISHINGS_CUPS_FOLD_ACCORDIAN : constant ipp_finishings_e := 1073741914;
   IPP_FINISHINGS_CUPS_FOLD_DOUBLE_GATE : constant ipp_finishings_e := 1073741915;
   IPP_FINISHINGS_CUPS_FOLD_GATE : constant ipp_finishings_e := 1073741916;
   IPP_FINISHINGS_CUPS_FOLD_HALF : constant ipp_finishings_e := 1073741917;
   IPP_FINISHINGS_CUPS_FOLD_HALF_Z : constant ipp_finishings_e := 1073741918;
   IPP_FINISHINGS_CUPS_FOLD_LEFT_GATE : constant ipp_finishings_e := 1073741919;
   IPP_FINISHINGS_CUPS_FOLD_LETTER : constant ipp_finishings_e := 1073741920;
   IPP_FINISHINGS_CUPS_FOLD_PARALLEL : constant ipp_finishings_e := 1073741921;
   IPP_FINISHINGS_CUPS_FOLD_POSTER : constant ipp_finishings_e := 1073741922;
   IPP_FINISHINGS_CUPS_FOLD_RIGHT_GATE : constant ipp_finishings_e := 1073741923;
   IPP_FINISHINGS_CUPS_FOLD_Z : constant ipp_finishings_e := 1073741924;  -- cups/ipp.h:99

  -- No finishing  
  -- Staple (any location)  
  -- Punch (any location/count)  
  -- Add cover  
  -- Bind  
  -- Staple interior  
  -- Stitch along any side  
  -- Fold (any type)  
  -- Trim (any type)  
  -- Bale (any type)  
  -- Fold to make booklet  
  -- Offset for binding (any type)  
  -- Apply protective liquid or powder coating  
  -- Apply protective (solid) material  
  -- Staple top left corner  
  -- Staple bottom left corner  
  -- Staple top right corner  
  -- Staple bottom right corner  
  -- Stitch along left side  
  -- Stitch along top edge  
  -- Stitch along right side  
  -- Stitch along bottom edge  
  -- Two staples on left  
  -- Two staples on top  
  -- Two staples on right  
  -- Two staples on bottom  
  -- Three staples on left  
  -- Three staples on top  
  -- Three staples on right  
  -- Three staples on bottom  
  -- Bind on left  
  -- Bind on top  
  -- Bind on right  
  -- Bind on bottom  
  -- Trim output after each page  
  -- Trim output after each document  
  -- Trim output after each copy  
  -- Trim output after job  
  -- Punch 1 hole top left  
  -- Punch 1 hole bottom left  
  -- Punch 1 hole top right  
  -- Punch 1 hole bottom right  
  -- Punch 2 holes left side  
  -- Punch 2 holes top edge  
  -- Punch 2 holes right side  
  -- Punch 2 holes bottom edge  
  -- Punch 3 holes left side  
  -- Punch 3 holes top edge  
  -- Punch 3 holes right side  
  -- Punch 3 holes bottom edge  
  -- Punch 4 holes left side  
  -- Punch 4 holes top edge  
  -- Punch 4 holes right side  
  -- Punch 4 holes bottom edge  
  -- Accordian-fold the paper vertically into four sections  
  -- Fold the top and bottom quarters of the paper towards the midline, then fold in half vertically  
  -- Fold the top and bottom quarters of the paper towards the midline  
  -- Fold the paper in half vertically  
  -- Fold the paper in half horizontally, then Z-fold the paper vertically  
  -- Fold the top quarter of the paper towards the midline  
  -- Fold the paper into three sections vertically; sometimes also known as a C fold 
  -- Fold the paper in half vertically two times, yielding four sections  
  -- Fold the paper in half horizontally and vertically; sometimes also called a cross fold  
  -- Fold the bottom quarter of the paper towards the midline  
  -- Fold the paper vertically into three sections, forming a Z  
  -- CUPS extensions for finishings (pre-standard versions of values above)  
  -- Punch 1 hole top left  
  -- Punch 1 hole bottom left  
  -- Punch 1 hole top right  
  -- Punch 1 hole bottom right  
  -- Punch 2 holes left side  
  -- Punch 2 holes top edge  
  -- Punch 2 holes right side  
  -- Punch 2 holes bottom edge  
  -- Punch 3 holes left side  
  -- Punch 3 holes top edge  
  -- Punch 3 holes right side  
  -- Punch 3 holes bottom edge  
  -- Punch 4 holes left side  
  -- Punch 4 holes top edge  
  -- Punch 4 holes right side  
  -- Punch 4 holes bottom edge  
  -- Accordian-fold the paper vertically into four sections  
  -- Fold the top and bottom quarters of the paper towards the midline, then fold in half vertically  
  -- Fold the top and bottom quarters of the paper towards the midline  
  -- Fold the paper in half vertically  
  -- Fold the paper in half horizontally, then Z-fold the paper vertically  
  -- Fold the top quarter of the paper towards the midline  
  -- Fold the paper into three sections vertically; sometimes also known as a C fold 
  -- Fold the paper in half vertically two times, yielding four sections  
  -- Fold the paper in half horizontally and vertically; sometimes also called a cross fold  
  -- Fold the bottom quarter of the paper towards the midline  
  -- Fold the paper vertically into three sections, forming a Z  
   subtype ipp_finishings_t is ipp_finishings_e;

  -- Long-time misspelling...  
   subtype ipp_finish_t is ipp_finishings_e;

  --*** Job collation types *** 
   subtype ipp_jcollate_e is unsigned;
   IPP_JCOLLATE_UNCOLLATED_SHEETS : constant ipp_jcollate_e := 3;
   IPP_JCOLLATE_COLLATED_DOCUMENTS : constant ipp_jcollate_e := 4;
   IPP_JCOLLATE_UNCOLLATED_DOCUMENTS : constant ipp_jcollate_e := 5;  -- cups/ipp.h:208

   subtype ipp_jcollate_t is ipp_jcollate_e;

  --*** Job states *** 
   subtype ipp_jstate_e is unsigned;
   IPP_JSTATE_PENDING : constant ipp_jstate_e := 3;
   IPP_JSTATE_HELD : constant ipp_jstate_e := 4;
   IPP_JSTATE_PROCESSING : constant ipp_jstate_e := 5;
   IPP_JSTATE_STOPPED : constant ipp_jstate_e := 6;
   IPP_JSTATE_CANCELED : constant ipp_jstate_e := 7;
   IPP_JSTATE_ABORTED : constant ipp_jstate_e := 8;
   IPP_JSTATE_COMPLETED : constant ipp_jstate_e := 9;  -- cups/ipp.h:221

  -- Job is waiting to be printed  
  -- Job is held for printing  
  -- Job is currently printing  
  -- Job has been stopped  
  -- Job has been canceled  
  -- Job has aborted due to error  
  -- Job has completed successfully  
  -- Legacy name for canceled state  
   subtype ipp_jstate_t is ipp_jstate_e;

  --*** IPP operations *** 
   subtype ipp_op_e is unsigned;
   IPP_OP_CUPS_INVALID : constant ipp_op_e := -1;
   IPP_OP_CUPS_NONE : constant ipp_op_e := 0;
   IPP_OP_PRINT_JOB : constant ipp_op_e := 2;
   IPP_OP_PRINT_URI : constant ipp_op_e := 3;
   IPP_OP_VALIDATE_JOB : constant ipp_op_e := 4;
   IPP_OP_CREATE_JOB : constant ipp_op_e := 5;
   IPP_OP_SEND_DOCUMENT : constant ipp_op_e := 6;
   IPP_OP_SEND_URI : constant ipp_op_e := 7;
   IPP_OP_CANCEL_JOB : constant ipp_op_e := 8;
   IPP_OP_GET_JOB_ATTRIBUTES : constant ipp_op_e := 9;
   IPP_OP_GET_JOBS : constant ipp_op_e := 10;
   IPP_OP_GET_PRINTER_ATTRIBUTES : constant ipp_op_e := 11;
   IPP_OP_HOLD_JOB : constant ipp_op_e := 12;
   IPP_OP_RELEASE_JOB : constant ipp_op_e := 13;
   IPP_OP_RESTART_JOB : constant ipp_op_e := 14;
   IPP_OP_PAUSE_PRINTER : constant ipp_op_e := 16;
   IPP_OP_RESUME_PRINTER : constant ipp_op_e := 17;
   IPP_OP_PURGE_JOBS : constant ipp_op_e := 18;
   IPP_OP_SET_PRINTER_ATTRIBUTES : constant ipp_op_e := 19;
   IPP_OP_SET_JOB_ATTRIBUTES : constant ipp_op_e := 20;
   IPP_OP_GET_PRINTER_SUPPORTED_VALUES : constant ipp_op_e := 21;
   IPP_OP_CREATE_PRINTER_SUBSCRIPTIONS : constant ipp_op_e := 22;
   IPP_OP_CREATE_JOB_SUBSCRIPTIONS : constant ipp_op_e := 23;
   IPP_OP_GET_SUBSCRIPTION_ATTRIBUTES : constant ipp_op_e := 24;
   IPP_OP_GET_SUBSCRIPTIONS : constant ipp_op_e := 25;
   IPP_OP_RENEW_SUBSCRIPTION : constant ipp_op_e := 26;
   IPP_OP_CANCEL_SUBSCRIPTION : constant ipp_op_e := 27;
   IPP_OP_GET_NOTIFICATIONS : constant ipp_op_e := 28;
   IPP_OP_SEND_NOTIFICATIONS : constant ipp_op_e := 29;
   IPP_OP_GET_RESOURCE_ATTRIBUTES : constant ipp_op_e := 30;
   IPP_OP_GET_RESOURCE_DATA : constant ipp_op_e := 31;
   IPP_OP_GET_RESOURCES : constant ipp_op_e := 32;
   IPP_OP_GET_PRINT_SUPPORT_FILES : constant ipp_op_e := 33;
   IPP_OP_ENABLE_PRINTER : constant ipp_op_e := 34;
   IPP_OP_DISABLE_PRINTER : constant ipp_op_e := 35;
   IPP_OP_PAUSE_PRINTER_AFTER_CURRENT_JOB : constant ipp_op_e := 36;
   IPP_OP_HOLD_NEW_JOBS : constant ipp_op_e := 37;
   IPP_OP_RELEASE_HELD_NEW_JOBS : constant ipp_op_e := 38;
   IPP_OP_DEACTIVATE_PRINTER : constant ipp_op_e := 39;
   IPP_OP_ACTIVATE_PRINTER : constant ipp_op_e := 40;
   IPP_OP_RESTART_PRINTER : constant ipp_op_e := 41;
   IPP_OP_SHUTDOWN_PRINTER : constant ipp_op_e := 42;
   IPP_OP_STARTUP_PRINTER : constant ipp_op_e := 43;
   IPP_OP_REPROCESS_JOB : constant ipp_op_e := 44;
   IPP_OP_CANCEL_CURRENT_JOB : constant ipp_op_e := 45;
   IPP_OP_SUSPEND_CURRENT_JOB : constant ipp_op_e := 46;
   IPP_OP_RESUME_JOB : constant ipp_op_e := 47;
   IPP_OP_PROMOTE_JOB : constant ipp_op_e := 48;
   IPP_OP_SCHEDULE_JOB_AFTER : constant ipp_op_e := 49;
   IPP_OP_CANCEL_DOCUMENT : constant ipp_op_e := 51;
   IPP_OP_GET_DOCUMENT_ATTRIBUTES : constant ipp_op_e := 52;
   IPP_OP_GET_DOCUMENTS : constant ipp_op_e := 53;
   IPP_OP_DELETE_DOCUMENT : constant ipp_op_e := 54;
   IPP_OP_SET_DOCUMENT_ATTRIBUTES : constant ipp_op_e := 55;
   IPP_OP_CANCEL_JOBS : constant ipp_op_e := 56;
   IPP_OP_CANCEL_MY_JOBS : constant ipp_op_e := 57;
   IPP_OP_RESUBMIT_JOB : constant ipp_op_e := 58;
   IPP_OP_CLOSE_JOB : constant ipp_op_e := 59;
   IPP_OP_IDENTIFY_PRINTER : constant ipp_op_e := 60;
   IPP_OP_VALIDATE_DOCUMENT : constant ipp_op_e := 61;
   IPP_OP_SEND_HARDCOPY_DOCUMENT : constant ipp_op_e := 62;
   IPP_OP_ACKNOWLEDGE_DOCUMENT : constant ipp_op_e := 63;
   IPP_OP_ACKNOWLEDGE_IDENTIFY_PRINTER : constant ipp_op_e := 64;
   IPP_OP_ACKNOWLEDGE_JOB : constant ipp_op_e := 65;
   IPP_OP_FETCH_DOCUMENT : constant ipp_op_e := 66;
   IPP_OP_FETCH_JOB : constant ipp_op_e := 67;
   IPP_OP_GET_OUTPUT_DEVICE_ATTRIBUTES : constant ipp_op_e := 68;
   IPP_OP_UPDATE_ACTIVE_JOBS : constant ipp_op_e := 69;
   IPP_OP_DEREGISTER_OUTPUT_DEVICE : constant ipp_op_e := 70;
   IPP_OP_UPDATE_DOCUMENT_STATUS : constant ipp_op_e := 71;
   IPP_OP_UPDATE_JOB_STATUS : constant ipp_op_e := 72;
   IPP_OP_UPDATE_OUTPUT_DEVICE_ATTRIBUTES : constant ipp_op_e := 73;
   IPP_OP_GET_NEXT_DOCUMENT_DATA : constant ipp_op_e := 74;
   IPP_OP_PRIVATE : constant ipp_op_e := 16384;
   IPP_OP_CUPS_GET_DEFAULT : constant ipp_op_e := 16385;
   IPP_OP_CUPS_GET_PRINTERS : constant ipp_op_e := 16386;
   IPP_OP_CUPS_ADD_MODIFY_PRINTER : constant ipp_op_e := 16387;
   IPP_OP_CUPS_DELETE_PRINTER : constant ipp_op_e := 16388;
   IPP_OP_CUPS_GET_CLASSES : constant ipp_op_e := 16389;
   IPP_OP_CUPS_ADD_MODIFY_CLASS : constant ipp_op_e := 16390;
   IPP_OP_CUPS_DELETE_CLASS : constant ipp_op_e := 16391;
   IPP_OP_CUPS_ACCEPT_JOBS : constant ipp_op_e := 16392;
   IPP_OP_CUPS_REJECT_JOBS : constant ipp_op_e := 16393;
   IPP_OP_CUPS_SET_DEFAULT : constant ipp_op_e := 16394;
   IPP_OP_CUPS_GET_DEVICES : constant ipp_op_e := 16395;
   IPP_OP_CUPS_GET_PPDS : constant ipp_op_e := 16396;
   IPP_OP_CUPS_MOVE_JOB : constant ipp_op_e := 16397;
   IPP_OP_CUPS_AUTHENTICATE_JOB : constant ipp_op_e := 16398;
   IPP_OP_CUPS_GET_PPD : constant ipp_op_e := 16399;
   IPP_OP_CUPS_GET_DOCUMENT : constant ipp_op_e := 16423;  -- cups/ipp.h:244

  -- Invalid operation name for @link ippOpValue@  
  -- No operation @private@  
  -- Print a single file  
  -- Print a single URL  
  -- Validate job options  
  -- Create an empty print job  
  -- Add a file to a job  
  -- Add a URL to a job  
  -- Cancel a job  
  -- Get job attributes  
  -- Get a list of jobs  
  -- Get printer attributes  
  -- Hold a job for printing  
  -- Release a job for printing  
  -- Reprint a job  
  -- Stop a printer  
  -- Start a printer  
  -- Cancel all jobs  
  -- Set printer attributes  
  -- Set job attributes  
  -- Get supported attribute values  
  -- Create one or more printer subscriptions @since CUPS 1.2/OS X 10.5@  
  -- Create one of more job subscriptions @since CUPS 1.2/OS X 10.5@  
  -- Get subscription attributes @since CUPS 1.2/OS X 10.5@  
  -- Get list of subscriptions @since CUPS 1.2/OS X 10.5@  
  -- Renew a printer subscription @since CUPS 1.2/OS X 10.5@  
  -- Cancel a subscription @since CUPS 1.2/OS X 10.5@  
  -- Get notification events @since CUPS 1.2/OS X 10.5@  
  -- Send notification events @private@  
  -- Get resource attributes @private@  
  -- Get resource data @private@  
  -- Get list of resources @private@  
  -- Get printer support files @private@  
  -- Start a printer  
  -- Stop a printer  
  -- Stop printer after the current job  
  -- Hold new jobs  
  -- Release new jobs  
  -- Stop a printer  
  -- Start a printer  
  -- Restart a printer  
  -- Turn a printer off  
  -- Turn a printer on  
  -- Reprint a job  
  -- Cancel the current job  
  -- Suspend the current job  
  -- Resume the current job  
  -- Promote a job to print sooner  
  -- Schedule a job to print after another  
  -- Cancel-Document  
  -- Get-Document-Attributes  
  -- Get-Documents  
  -- Delete-Document  
  -- Set-Document-Attributes  
  -- Cancel-Jobs  
  -- Cancel-My-Jobs  
  -- Resubmit-Job  
  -- Close-Job  
  -- Identify-Printer  
  -- Validate-Document  
  -- Send-Hardcopy-Document  
  -- Acknowledge-Document  
  -- Acknowledge-Identify-Printer  
  -- Acknowledge-Job  
  -- Fetch-Document  
  -- Fetch-Job  
  -- Get-Output-Device-Attributes  
  -- Update-Active-Jobs  
  -- Deregister-Output-Device  
  -- Update-Document-Status  
  -- Update-Job-Status  
  -- Update-Output-Device-Attributes  
  -- Get-Next-Document-Data  
  -- Reserved @private@  
  -- Get the default printer  
  -- Get a list of printers and/or classes  
  -- Add or modify a printer  
  -- Delete a printer  
  -- Get a list of classes @deprecated@  
  -- Add or modify a class  
  -- Delete a class  
  -- Accept new jobs on a printer  
  -- Reject new jobs on a printer  
  -- Set the default printer  
  -- Get a list of supported devices  
  -- Get a list of supported drivers  
  -- Move a job to a different printer  
  -- Authenticate a job @since CUPS 1.2/OS X 10.5@  
  -- Get a PPD file @since CUPS 1.3/OS X 10.5@  
  -- Get a document file @since CUPS 1.4/OS X 10.6@  
  -- Legacy names  
   subtype ipp_op_t is ipp_op_e;

  --*** Orientation values *** 
   subtype ipp_orient_e is unsigned;
   IPP_ORIENT_PORTRAIT : constant ipp_orient_e := 3;
   IPP_ORIENT_LANDSCAPE : constant ipp_orient_e := 4;
   IPP_ORIENT_REVERSE_LANDSCAPE : constant ipp_orient_e := 5;
   IPP_ORIENT_REVERSE_PORTRAIT : constant ipp_orient_e := 6;
   IPP_ORIENT_NONE : constant ipp_orient_e := 7;  -- cups/ipp.h:424

  -- No rotation  
  -- 90 degrees counter-clockwise  
  -- 90 degrees clockwise  
  -- 180 degrees  
  -- No rotation  
   subtype ipp_orient_t is ipp_orient_e;

  --*** Printer states *** 
   subtype ipp_pstate_e is unsigned;
   IPP_PSTATE_IDLE : constant ipp_pstate_e := 3;
   IPP_PSTATE_PROCESSING : constant ipp_pstate_e := 4;
   IPP_PSTATE_STOPPED : constant ipp_pstate_e := 5;  -- cups/ipp.h:440

  -- Printer is idle  
  -- Printer is working  
  -- Printer is stopped  
   subtype ipp_pstate_t is ipp_pstate_e;

  --*** Qualities *** 
   subtype ipp_quality_e is unsigned;
   IPP_QUALITY_DRAFT : constant ipp_quality_e := 3;
   IPP_QUALITY_NORMAL : constant ipp_quality_e := 4;
   IPP_QUALITY_HIGH : constant ipp_quality_e := 5;  -- cups/ipp.h:453

  -- Draft quality  
  -- Normal quality  
  -- High quality  
   subtype ipp_quality_t is ipp_quality_e;

  --*** Resolution units *** 
   subtype ipp_res_e is unsigned;
   IPP_RES_PER_INCH : constant ipp_res_e := 3;
   IPP_RES_PER_CM : constant ipp_res_e := 4;  -- cups/ipp.h:460

  -- Pixels per inch  
  -- Pixels per centimeter  
   subtype ipp_res_t is ipp_res_e;

  --*** IPP states *** 
   subtype ipp_state_e is unsigned;
   IPP_STATE_ERROR : constant ipp_state_e := -1;
   IPP_STATE_IDLE : constant ipp_state_e := 0;
   IPP_STATE_HEADER : constant ipp_state_e := 1;
   IPP_STATE_ATTRIBUTE : constant ipp_state_e := 2;
   IPP_STATE_DATA : constant ipp_state_e := 3;  -- cups/ipp.h:466

  -- An error occurred  
  -- Nothing is happening/request completed  
  -- The request header needs to be sent/received  
  -- One or more attributes need to be sent/received  
  -- IPP request data needs to be sent/received  
   subtype ipp_state_t is ipp_state_e;

  --*** IPP status codes *** 
   subtype ipp_status_e is unsigned;
   IPP_STATUS_CUPS_INVALID : constant ipp_status_e := -1;
   IPP_STATUS_OK : constant ipp_status_e := 0;
   IPP_STATUS_OK_IGNORED_OR_SUBSTITUTED : constant ipp_status_e := 1;
   IPP_STATUS_OK_CONFLICTING : constant ipp_status_e := 2;
   IPP_STATUS_OK_IGNORED_SUBSCRIPTIONS : constant ipp_status_e := 3;
   IPP_STATUS_OK_IGNORED_NOTIFICATIONS : constant ipp_status_e := 4;
   IPP_STATUS_OK_TOO_MANY_EVENTS : constant ipp_status_e := 5;
   IPP_STATUS_OK_BUT_CANCEL_SUBSCRIPTION : constant ipp_status_e := 6;
   IPP_STATUS_OK_EVENTS_COMPLETE : constant ipp_status_e := 7;
   IPP_STATUS_REDIRECTION_OTHER_SITE : constant ipp_status_e := 512;
   IPP_STATUS_CUPS_SEE_OTHER : constant ipp_status_e := 640;
   IPP_STATUS_ERROR_BAD_REQUEST : constant ipp_status_e := 1024;
   IPP_STATUS_ERROR_FORBIDDEN : constant ipp_status_e := 1025;
   IPP_STATUS_ERROR_NOT_AUTHENTICATED : constant ipp_status_e := 1026;
   IPP_STATUS_ERROR_NOT_AUTHORIZED : constant ipp_status_e := 1027;
   IPP_STATUS_ERROR_NOT_POSSIBLE : constant ipp_status_e := 1028;
   IPP_STATUS_ERROR_TIMEOUT : constant ipp_status_e := 1029;
   IPP_STATUS_ERROR_NOT_FOUND : constant ipp_status_e := 1030;
   IPP_STATUS_ERROR_GONE : constant ipp_status_e := 1031;
   IPP_STATUS_ERROR_REQUEST_ENTITY : constant ipp_status_e := 1032;
   IPP_STATUS_ERROR_REQUEST_VALUE : constant ipp_status_e := 1033;
   IPP_STATUS_ERROR_DOCUMENT_FORMAT_NOT_SUPPORTED : constant ipp_status_e := 1034;
   IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES : constant ipp_status_e := 1035;
   IPP_STATUS_ERROR_URI_SCHEME : constant ipp_status_e := 1036;
   IPP_STATUS_ERROR_CHARSET : constant ipp_status_e := 1037;
   IPP_STATUS_ERROR_CONFLICTING : constant ipp_status_e := 1038;
   IPP_STATUS_ERROR_COMPRESSION_NOT_SUPPORTED : constant ipp_status_e := 1039;
   IPP_STATUS_ERROR_COMPRESSION_ERROR : constant ipp_status_e := 1040;
   IPP_STATUS_ERROR_DOCUMENT_FORMAT_ERROR : constant ipp_status_e := 1041;
   IPP_STATUS_ERROR_DOCUMENT_ACCESS : constant ipp_status_e := 1042;
   IPP_STATUS_ERROR_ATTRIBUTES_NOT_SETTABLE : constant ipp_status_e := 1043;
   IPP_STATUS_ERROR_IGNORED_ALL_SUBSCRIPTIONS : constant ipp_status_e := 1044;
   IPP_STATUS_ERROR_TOO_MANY_SUBSCRIPTIONS : constant ipp_status_e := 1045;
   IPP_STATUS_ERROR_IGNORED_ALL_NOTIFICATIONS : constant ipp_status_e := 1046;
   IPP_STATUS_ERROR_PRINT_SUPPORT_FILE_NOT_FOUND : constant ipp_status_e := 1047;
   IPP_STATUS_ERROR_DOCUMENT_PASSWORD : constant ipp_status_e := 1048;
   IPP_STATUS_ERROR_DOCUMENT_PERMISSION : constant ipp_status_e := 1049;
   IPP_STATUS_ERROR_DOCUMENT_SECURITY : constant ipp_status_e := 1050;
   IPP_STATUS_ERROR_DOCUMENT_UNPRINTABLE : constant ipp_status_e := 1051;
   IPP_STATUS_ERROR_ACCOUNT_INFO_NEEDED : constant ipp_status_e := 1052;
   IPP_STATUS_ERROR_ACCOUNT_CLOSED : constant ipp_status_e := 1053;
   IPP_STATUS_ERROR_ACCOUNT_LIMIT_REACHED : constant ipp_status_e := 1054;
   IPP_STATUS_ERROR_ACCOUNT_AUTHORIZATION_FAILED : constant ipp_status_e := 1055;
   IPP_STATUS_ERROR_CUPS_ACCOUNT_INFO_NEEDED : constant ipp_status_e := 1180;
   IPP_STATUS_ERROR_CUPS_ACCOUNT_CLOSED : constant ipp_status_e := 1181;
   IPP_STATUS_ERROR_CUPS_ACCOUNT_LIMIT_REACHED : constant ipp_status_e := 1182;
   IPP_STATUS_ERROR_CUPS_ACCOUNT_AUTHORIZATION_FAILED : constant ipp_status_e := 1183;
   IPP_STATUS_ERROR_INTERNAL : constant ipp_status_e := 1280;
   IPP_STATUS_ERROR_OPERATION_NOT_SUPPORTED : constant ipp_status_e := 1281;
   IPP_STATUS_ERROR_SERVICE_UNAVAILABLE : constant ipp_status_e := 1282;
   IPP_STATUS_ERROR_VERSION_NOT_SUPPORTED : constant ipp_status_e := 1283;
   IPP_STATUS_ERROR_DEVICE : constant ipp_status_e := 1284;
   IPP_STATUS_ERROR_TEMPORARY : constant ipp_status_e := 1285;
   IPP_STATUS_ERROR_NOT_ACCEPTING_JOBS : constant ipp_status_e := 1286;
   IPP_STATUS_ERROR_BUSY : constant ipp_status_e := 1287;
   IPP_STATUS_ERROR_JOB_CANCELED : constant ipp_status_e := 1288;
   IPP_STATUS_ERROR_MULTIPLE_JOBS_NOT_SUPPORTED : constant ipp_status_e := 1289;
   IPP_STATUS_ERROR_PRINTER_IS_DEACTIVATED : constant ipp_status_e := 1290;
   IPP_STATUS_ERROR_TOO_MANY_JOBS : constant ipp_status_e := 1291;
   IPP_STATUS_ERROR_TOO_MANY_DOCUMENTS : constant ipp_status_e := 1292;
   IPP_STATUS_ERROR_CUPS_AUTHENTICATION_CANCELED : constant ipp_status_e := 4096;
   IPP_STATUS_ERROR_CUPS_PKI : constant ipp_status_e := 4097;
   IPP_STATUS_ERROR_CUPS_UPGRADE_REQUIRED : constant ipp_status_e := 4098;  -- cups/ipp.h:483

  -- Invalid status name for @link ippErrorValue@  
  -- successful-ok  
  -- successful-ok-ignored-or-substituted-attributes  
  -- successful-ok-conflicting-attributes  
  -- successful-ok-ignored-subscriptions  
  -- successful-ok-ignored-notifications @private@  
  -- successful-ok-too-many-events  
  -- successful-ok-but-cancel-subscription @private@  
  -- successful-ok-events-complete  
  -- redirection-other-site @private@  
  -- cups-see-other  
  -- client-error-bad-request  
  -- client-error-forbidden  
  -- client-error-not-authenticated  
  -- client-error-not-authorized  
  -- client-error-not-possible  
  -- client-error-timeout  
  -- client-error-not-found  
  -- client-error-gone  
  -- client-error-request-entity-too-large  
  -- client-error-request-value-too-long  
  -- client-error-document-format-not-supported  
  -- client-error-attributes-or-values-not-supported  
  -- client-error-uri-scheme-not-supported  
  -- client-error-charset-not-supported  
  -- client-error-conflicting-attributes  
  -- client-error-compression-not-supported  
  -- client-error-compression-error  
  -- client-error-document-format-error  
  -- client-error-document-access-error  
  -- client-error-attributes-not-settable  
  -- client-error-ignored-all-subscriptions  
  -- client-error-too-many-subscriptions  
  -- client-error-ignored-all-notifications @private@  
  -- client-error-print-support-file-not-found @private@  
  -- client-error-document-password-error  
  -- client-error-document-permission-error  
  -- client-error-document-security-error  
  -- client-error-document-unprintable-error  
  -- client-error-account-info-needed  
  -- client-error-account-closed  
  -- client-error-account-limit-reached  
  -- client-error-account-authorization-failed  
  -- Legacy status codes for paid printing  
  -- cups-error-account-info-needed @deprecated@  
  -- cups-error-account-closed @deprecate@  
  -- cups-error-account-limit-reached @deprecated@  
  -- cups-error-account-authorization-failed @deprecated@  
  -- server-error-internal-error  
  -- server-error-operation-not-supported  
  -- server-error-service-unavailable  
  -- server-error-version-not-supported  
  -- server-error-device-error  
  -- server-error-temporary-error  
  -- server-error-not-accepting-jobs  
  -- server-error-busy  
  -- server-error-job-canceled  
  -- server-error-multiple-document-jobs-not-supported  
  -- server-error-printer-is-deactivated  
  -- server-error-too-many-jobs  
  -- server-error-too-many-documents  
  -- These are internal and never sent over the wire...  
  -- cups-authentication-canceled - Authentication canceled by user @since CUPS 1.5/OS X 10.7@  
  -- cups-pki-error - Error negotiating a secure connection @since CUPS 1.5/OS X 10.7@  
  -- cups-upgrade-required - TLS upgrade required  
  -- Legacy name for canceled status  
   subtype ipp_status_t is ipp_status_e;

  --*** Format tags for attributes *** 
   subtype ipp_tag_e is unsigned;
   IPP_TAG_CUPS_INVALID : constant ipp_tag_e := -1;
   IPP_TAG_ZERO : constant ipp_tag_e := 0;
   IPP_TAG_OPERATION : constant ipp_tag_e := 1;
   IPP_TAG_JOB : constant ipp_tag_e := 2;
   IPP_TAG_END : constant ipp_tag_e := 3;
   IPP_TAG_PRINTER : constant ipp_tag_e := 4;
   IPP_TAG_UNSUPPORTED_GROUP : constant ipp_tag_e := 5;
   IPP_TAG_SUBSCRIPTION : constant ipp_tag_e := 6;
   IPP_TAG_EVENT_NOTIFICATION : constant ipp_tag_e := 7;
   IPP_TAG_RESOURCE : constant ipp_tag_e := 8;
   IPP_TAG_DOCUMENT : constant ipp_tag_e := 9;
   IPP_TAG_UNSUPPORTED_VALUE : constant ipp_tag_e := 16;
   IPP_TAG_DEFAULT : constant ipp_tag_e := 17;
   IPP_TAG_UNKNOWN : constant ipp_tag_e := 18;
   IPP_TAG_NOVALUE : constant ipp_tag_e := 19;
   IPP_TAG_NOTSETTABLE : constant ipp_tag_e := 21;
   IPP_TAG_DELETEATTR : constant ipp_tag_e := 22;
   IPP_TAG_ADMINDEFINE : constant ipp_tag_e := 23;
   IPP_TAG_INTEGER : constant ipp_tag_e := 33;
   IPP_TAG_BOOLEAN : constant ipp_tag_e := 34;
   IPP_TAG_ENUM : constant ipp_tag_e := 35;
   IPP_TAG_STRING : constant ipp_tag_e := 48;
   IPP_TAG_DATE : constant ipp_tag_e := 49;
   IPP_TAG_RESOLUTION : constant ipp_tag_e := 50;
   IPP_TAG_RANGE : constant ipp_tag_e := 51;
   IPP_TAG_BEGIN_COLLECTION : constant ipp_tag_e := 52;
   IPP_TAG_TEXTLANG : constant ipp_tag_e := 53;
   IPP_TAG_NAMELANG : constant ipp_tag_e := 54;
   IPP_TAG_END_COLLECTION : constant ipp_tag_e := 55;
   IPP_TAG_TEXT : constant ipp_tag_e := 65;
   IPP_TAG_NAME : constant ipp_tag_e := 66;
   IPP_TAG_RESERVED_STRING : constant ipp_tag_e := 67;
   IPP_TAG_KEYWORD : constant ipp_tag_e := 68;
   IPP_TAG_URI : constant ipp_tag_e := 69;
   IPP_TAG_URISCHEME : constant ipp_tag_e := 70;
   IPP_TAG_CHARSET : constant ipp_tag_e := 71;
   IPP_TAG_LANGUAGE : constant ipp_tag_e := 72;
   IPP_TAG_MIMETYPE : constant ipp_tag_e := 73;
   IPP_TAG_MEMBERNAME : constant ipp_tag_e := 74;
   IPP_TAG_EXTENSION : constant ipp_tag_e := 127;
   IPP_TAG_CUPS_MASK : constant ipp_tag_e := 2147483647;
   IPP_TAG_CUPS_CONST : constant ipp_tag_e := -2147483648;  -- cups/ipp.h:633

  -- Invalid tag name for @link ippTagValue@  
  -- Zero tag - used for separators  
  -- Operation group  
  -- Job group  
  -- End-of-attributes  
  -- Printer group  
  -- Unsupported attributes group  
  -- Subscription group  
  -- Event group  
  -- Resource group @private@  
  -- Document group  
  -- Unsupported value  
  -- Default value  
  -- Unknown value  
  -- No-value value  
  -- Not-settable value  
  -- Delete-attribute value  
  -- Admin-defined value  
  -- Integer value  
  -- Boolean value  
  -- Enumeration value  
  -- Octet string value  
  -- Date/time value  
  -- Resolution value  
  -- Range value  
  -- Beginning of collection value  
  -- Text-with-language value  
  -- Name-with-language value  
  -- End of collection value  
  -- Text value  
  -- Name value  
  -- Reserved for future string value @private@  
  -- Keyword value  
  -- URI value  
  -- URI scheme value  
  -- Character set value  
  -- Language value  
  -- MIME media type value  
  -- Collection member name value  
  -- Extension point for 32-bit tags  
  -- Mask for copied attribute values @private@  
  -- The following expression is used to avoid compiler warnings with +/-0x80000000  
  -- Bitflag for copied/const attribute values @private@  
   subtype ipp_tag_t is ipp_tag_e;

  --*** Unsigned 8-bit integer/character *** 
   subtype ipp_uchar_t is unsigned_char;  -- cups/ipp.h:685

  --*** IPP request/response data *** 
   --  skipped empty struct u_ipp_s

   --  skipped empty struct ipp_t

   --  skipped empty struct u_ipp_attribute_s

   --  skipped empty struct ipp_attribute_t

  --*** IPP attribute *** 
  --*** New in CUPS 1.2/OS X 10.5 *** 
   type ipp_iocb_t is access function
        (arg1 : System.Address;
         arg2 : access ipp_uchar_t;
         arg3 : size_t) return size_t;
   pragma Convention (C, ipp_iocb_t);  -- cups/ipp.h:691

  --*** IPP IO Callback Function @since CUPS 1.2/OS X 10.5@ *** 
  --*** New in CUPS 1.6/OS X 10.8 *** 
   type ipp_copycb_t is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address) return int;
   pragma Convention (C, ipp_copycb_t);  -- cups/ipp.h:695

  -- * The following structures are PRIVATE starting with CUPS 1.6/OS X 10.8.
  -- * Please use the new accessor functions available in CUPS 1.6 and later, as
  -- * these definitions will be moved to a private header file in a future release.
  -- *
  -- * Define _IPP_PRIVATE_STRUCTURES to 1 to cause the private IPP structures to be
  -- * exposed in CUPS 1.6.  This happens automatically on OS X when compiling for
  -- * a deployment target of 10.7 or earlier.
  -- *
  -- * Define _IPP_PRIVATE_STRUCTURES to 0 to prevent the private IPP structures
  -- * from being exposed.  This is useful when migrating existing code to the new
  -- * accessors.
  --  

  -- Somebody has overridden the value  
  -- Building CUPS  
  -- Building for 10.7 and earlier  
  -- Building for 10.7 and earlier  
  --*** Request Header *** 
  -- Any Header  
  -- Protocol version number  
  -- Operation ID or status code 
  -- Request ID  
  -- Operation Header  
  -- Protocol version number  
  -- Operation ID  
  -- Request ID  
  -- Status Header  
  -- Protocol version number  
  -- Status code  
  -- Request ID  
  --*** New in CUPS 1.1.19 *** 
  -- Event Header @since CUPS 1.1.19/OS X 10.3@  
  -- Protocol version number  
  -- Status code  
  -- Request ID  
  --*** New in CUPS 1.1.19 *** 
  --*** Attribute Value *** 
  -- Integer/enumerated value  
  -- Boolean value  
  -- Date/time value  
  -- Horizontal resolution  
  -- Vertical resolution  
  -- Resolution units  
  -- Resolution value  
  -- Lower value  
  -- Upper value  
  -- Range of integers value  
  -- Language code  
  -- String  
  -- String with language value  
  -- Length of attribute  
  -- Data in attribute  
  -- Unknown attribute type  
  --*** New in CUPS 1.1.19 *** 
  -- Collection value @since CUPS 1.1.19/OS X 10.3@  
  --*** Convenience typedef that will be removed @private@ *** 
  --*** Attribute *** 
  -- Next attribute in list  
  -- Job/Printer/Operation group tag  
  -- What type of value is it?  
  -- Name of attribute  
  -- Number of values  
  -- Values  
  --*** IPP Request/Response/Notification *** 
  -- State of request  
  -- Request header  
  -- Attributes  
  -- Last attribute in list  
  -- Current attribute (for read/write)  
  -- Current attribute group tag  
  --*** New in CUPS 1.2 *** 
  -- Previous attribute (for read) @since CUPS 1.2/OS X 10.5@  
  --*** New in CUPS 1.4.4 *** 
  -- Use count @since CUPS 1.4.4/OS X 10.6.?@  
  --*** New in CUPS 2.0 *** 
  -- At end of list?  
  -- Current attribute index for hierarchical search  
  -- * Prototypes...
  --  

   function ippAddBoolean
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : char) return System.Address;  -- cups/ipp.h:837
   pragma Import (C, ippAddBoolean, "ippAddBoolean");

   function ippAddBooleans
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int;
      arg5 : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/ipp.h:839
   pragma Import (C, ippAddBooleans, "ippAddBooleans");

   function ippAddDate
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : access ipp_uchar_t) return System.Address;  -- cups/ipp.h:842
   pragma Import (C, ippAddDate, "ippAddDate");

   function ippAddInteger
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : ipp_tag_t;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : int) return System.Address;  -- cups/ipp.h:844
   pragma Import (C, ippAddInteger, "ippAddInteger");

   function ippAddIntegers
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : ipp_tag_t;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : int;
      arg6 : access int) return System.Address;  -- cups/ipp.h:847
   pragma Import (C, ippAddIntegers, "ippAddIntegers");

   function ippAddRange
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int;
      arg5 : int) return System.Address;  -- cups/ipp.h:850
   pragma Import (C, ippAddRange, "ippAddRange");

   function ippAddRanges
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int;
      arg5 : access int;
      arg6 : access int) return System.Address;  -- cups/ipp.h:852
   pragma Import (C, ippAddRanges, "ippAddRanges");

   function ippAddResolution
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : ipp_res_t;
      arg5 : int;
      arg6 : int) return System.Address;  -- cups/ipp.h:855
   pragma Import (C, ippAddResolution, "ippAddResolution");

   function ippAddResolutions
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int;
      arg5 : ipp_res_t;
      arg6 : access int;
      arg7 : access int) return System.Address;  -- cups/ipp.h:858
   pragma Import (C, ippAddResolutions, "ippAddResolutions");

   function ippAddSeparator (arg1 : System.Address) return System.Address;  -- cups/ipp.h:862
   pragma Import (C, ippAddSeparator, "ippAddSeparator");

   function ippAddString
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : ipp_tag_t;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/ipp.h:863
   pragma Import (C, ippAddString, "ippAddString");

   function ippAddStrings
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : ipp_tag_t;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : int;
      arg6 : Interfaces.C.Strings.chars_ptr;
      arg7 : System.Address) return System.Address;  -- cups/ipp.h:866
   pragma Import (C, ippAddStrings, "ippAddStrings");

   function ippDateToTime (arg1 : access ipp_uchar_t) return libCUPS.time_h.time_t;  -- cups/ipp.h:870
   pragma Import (C, ippDateToTime, "ippDateToTime");

   procedure ippDelete (arg1 : System.Address);  -- cups/ipp.h:871
   pragma Import (C, ippDelete, "ippDelete");

   function ippErrorString (arg1 : ipp_status_t) return Interfaces.C.Strings.chars_ptr;  -- cups/ipp.h:872
   pragma Import (C, ippErrorString, "ippErrorString");

   function ippFindAttribute
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : ipp_tag_t) return System.Address;  -- cups/ipp.h:873
   pragma Import (C, ippFindAttribute, "ippFindAttribute");

   function ippFindNextAttribute
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : ipp_tag_t) return System.Address;  -- cups/ipp.h:875
   pragma Import (C, ippFindNextAttribute, "ippFindNextAttribute");

   function ippLength (arg1 : System.Address) return size_t;  -- cups/ipp.h:877
   pragma Import (C, ippLength, "ippLength");

   function ippNew return System.Address;  -- cups/ipp.h:878
   pragma Import (C, ippNew, "ippNew");

   function ippRead (arg1 : System.Address; arg2 : System.Address) return ipp_state_t;  -- cups/ipp.h:879
   pragma Import (C, ippRead, "ippRead");

   function ippTimeToDate (arg1 : libCUPS.time_h.time_t) return access ipp_uchar_t;  -- cups/ipp.h:880
   pragma Import (C, ippTimeToDate, "ippTimeToDate");

   function ippWrite (arg1 : System.Address; arg2 : System.Address) return ipp_state_t;  -- cups/ipp.h:881
   pragma Import (C, ippWrite, "ippWrite");

   function ippPort return int;  -- cups/ipp.h:882
   pragma Import (C, ippPort, "ippPort");

   procedure ippSetPort (arg1 : int);  -- cups/ipp.h:883
   pragma Import (C, ippSetPort, "ippSetPort");

  --*** New in CUPS 1.1.19 *** 
   function ippAddCollection
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : System.Address) return System.Address;  -- cups/ipp.h:886
   pragma Import (C, ippAddCollection, "ippAddCollection");

   function ippAddCollections
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int;
      arg5 : System.Address) return System.Address;  -- cups/ipp.h:888
   pragma Import (C, ippAddCollections, "ippAddCollections");

   procedure ippDeleteAttribute (arg1 : System.Address; arg2 : System.Address);  -- cups/ipp.h:891
   pragma Import (C, ippDeleteAttribute, "ippDeleteAttribute");

   function ippReadFile (arg1 : int; arg2 : System.Address) return ipp_state_t;  -- cups/ipp.h:892
   pragma Import (C, ippReadFile, "ippReadFile");

   function ippWriteFile (arg1 : int; arg2 : System.Address) return ipp_state_t;  -- cups/ipp.h:893
   pragma Import (C, ippWriteFile, "ippWriteFile");

  --*** New in CUPS 1.2/OS X 10.5 *** 
   function ippAddOctetString
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : System.Address;
      arg5 : int) return System.Address;  -- cups/ipp.h:896
   pragma Import (C, ippAddOctetString, "ippAddOctetString");

   function ippErrorValue (arg1 : Interfaces.C.Strings.chars_ptr) return ipp_status_t;  -- cups/ipp.h:899
   pragma Import (C, ippErrorValue, "ippErrorValue");

   function ippNewRequest (arg1 : ipp_op_t) return System.Address;  -- cups/ipp.h:900
   pragma Import (C, ippNewRequest, "ippNewRequest");

   function ippOpString (arg1 : ipp_op_t) return Interfaces.C.Strings.chars_ptr;  -- cups/ipp.h:901
   pragma Import (C, ippOpString, "ippOpString");

   function ippOpValue (arg1 : Interfaces.C.Strings.chars_ptr) return ipp_op_t;  -- cups/ipp.h:902
   pragma Import (C, ippOpValue, "ippOpValue");

   function ippReadIO
     (arg1 : System.Address;
      arg2 : ipp_iocb_t;
      arg3 : int;
      arg4 : System.Address;
      arg5 : System.Address) return ipp_state_t;  -- cups/ipp.h:903
   pragma Import (C, ippReadIO, "ippReadIO");

   function ippWriteIO
     (arg1 : System.Address;
      arg2 : ipp_iocb_t;
      arg3 : int;
      arg4 : System.Address;
      arg5 : System.Address) return ipp_state_t;  -- cups/ipp.h:905
   pragma Import (C, ippWriteIO, "ippWriteIO");

  --*** New in CUPS 1.4/OS X 10.6 *** 
   function ippTagString (arg1 : ipp_tag_t) return Interfaces.C.Strings.chars_ptr;  -- cups/ipp.h:909
   pragma Import (C, ippTagString, "ippTagString");

   function ippTagValue (arg1 : Interfaces.C.Strings.chars_ptr) return ipp_tag_t;  -- cups/ipp.h:910
   pragma Import (C, ippTagValue, "ippTagValue");

  --*** New in CUPS 1.6/OS X 10.8 *** 
   function ippAddOutOfBand
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : ipp_tag_t;
      arg4 : Interfaces.C.Strings.chars_ptr) return System.Address;  -- cups/ipp.h:913
   pragma Import (C, ippAddOutOfBand, "ippAddOutOfBand");

   function ippAttributeString
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return size_t;  -- cups/ipp.h:916
   pragma Import (C, ippAttributeString, "ippAttributeString");

   function ippCopyAttribute
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int) return System.Address;  -- cups/ipp.h:918
   pragma Import (C, ippCopyAttribute, "ippCopyAttribute");

   function ippCopyAttributes
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ipp_copycb_t;
      arg5 : System.Address) return int;  -- cups/ipp.h:920
   pragma Import (C, ippCopyAttributes, "ippCopyAttributes");

   function ippDeleteValues
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : int) return int;  -- cups/ipp.h:923
   pragma Import (C, ippDeleteValues, "ippDeleteValues");

   function ippEnumString (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return Interfaces.C.Strings.chars_ptr;  -- cups/ipp.h:925
   pragma Import (C, ippEnumString, "ippEnumString");

   function ippEnumValue (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ipp.h:927
   pragma Import (C, ippEnumValue, "ippEnumValue");

   function ippFirstAttribute (arg1 : System.Address) return System.Address;  -- cups/ipp.h:929
   pragma Import (C, ippFirstAttribute, "ippFirstAttribute");

   function ippGetBoolean (arg1 : System.Address; arg2 : int) return int;  -- cups/ipp.h:930
   pragma Import (C, ippGetBoolean, "ippGetBoolean");

   function ippGetCollection (arg1 : System.Address; arg2 : int) return System.Address;  -- cups/ipp.h:932
   pragma Import (C, ippGetCollection, "ippGetCollection");

   function ippGetCount (arg1 : System.Address) return int;  -- cups/ipp.h:934
   pragma Import (C, ippGetCount, "ippGetCount");

   function ippGetDate (arg1 : System.Address; arg2 : int) return access ipp_uchar_t;  -- cups/ipp.h:935
   pragma Import (C, ippGetDate, "ippGetDate");

   function ippGetGroupTag (arg1 : System.Address) return ipp_tag_t;  -- cups/ipp.h:937
   pragma Import (C, ippGetGroupTag, "ippGetGroupTag");

   function ippGetInteger (arg1 : System.Address; arg2 : int) return int;  -- cups/ipp.h:938
   pragma Import (C, ippGetInteger, "ippGetInteger");

   function ippGetName (arg1 : System.Address) return Interfaces.C.Strings.chars_ptr;  -- cups/ipp.h:940
   pragma Import (C, ippGetName, "ippGetName");

   function ippGetOperation (arg1 : System.Address) return ipp_op_t;  -- cups/ipp.h:941
   pragma Import (C, ippGetOperation, "ippGetOperation");

   function ippGetRange
     (arg1 : System.Address;
      arg2 : int;
      arg3 : access int) return int;  -- cups/ipp.h:942
   pragma Import (C, ippGetRange, "ippGetRange");

   function ippGetRequestId (arg1 : System.Address) return int;  -- cups/ipp.h:944
   pragma Import (C, ippGetRequestId, "ippGetRequestId");

   function ippGetResolution
     (arg1 : System.Address;
      arg2 : int;
      arg3 : access int;
      arg4 : access ipp_res_t) return int;  -- cups/ipp.h:945
   pragma Import (C, ippGetResolution, "ippGetResolution");

   function ippGetState (arg1 : System.Address) return ipp_state_t;  -- cups/ipp.h:948
   pragma Import (C, ippGetState, "ippGetState");

   function ippGetStatusCode (arg1 : System.Address) return ipp_status_t;  -- cups/ipp.h:949
   pragma Import (C, ippGetStatusCode, "ippGetStatusCode");

   function ippGetString
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address) return Interfaces.C.Strings.chars_ptr;  -- cups/ipp.h:950
   pragma Import (C, ippGetString, "ippGetString");

   function ippGetValueTag (arg1 : System.Address) return ipp_tag_t;  -- cups/ipp.h:952
   pragma Import (C, ippGetValueTag, "ippGetValueTag");

   function ippGetVersion (arg1 : System.Address; arg2 : access int) return int;  -- cups/ipp.h:953
   pragma Import (C, ippGetVersion, "ippGetVersion");

   function ippNextAttribute (arg1 : System.Address) return System.Address;  -- cups/ipp.h:954
   pragma Import (C, ippNextAttribute, "ippNextAttribute");

   function ippSetBoolean
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : int) return int;  -- cups/ipp.h:955
   pragma Import (C, ippSetBoolean, "ippSetBoolean");

   function ippSetCollection
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : System.Address) return int;  -- cups/ipp.h:957
   pragma Import (C, ippSetCollection, "ippSetCollection");

   function ippSetDate
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : access ipp_uchar_t) return int;  -- cups/ipp.h:960
   pragma Import (C, ippSetDate, "ippSetDate");

   function ippSetGroupTag
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : ipp_tag_t) return int;  -- cups/ipp.h:963
   pragma Import (C, ippSetGroupTag, "ippSetGroupTag");

   function ippSetInteger
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : int) return int;  -- cups/ipp.h:965
   pragma Import (C, ippSetInteger, "ippSetInteger");

   function ippSetName
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ipp.h:967
   pragma Import (C, ippSetName, "ippSetName");

   function ippSetOperation (arg1 : System.Address; arg2 : ipp_op_t) return int;  -- cups/ipp.h:969
   pragma Import (C, ippSetOperation, "ippSetOperation");

   function ippSetRange
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : int;
      arg5 : int) return int;  -- cups/ipp.h:970
   pragma Import (C, ippSetRange, "ippSetRange");

   function ippSetRequestId (arg1 : System.Address; arg2 : int) return int;  -- cups/ipp.h:973
   pragma Import (C, ippSetRequestId, "ippSetRequestId");

   function ippSetResolution
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : ipp_res_t;
      arg5 : int;
      arg6 : int) return int;  -- cups/ipp.h:975
   pragma Import (C, ippSetResolution, "ippSetResolution");

   function ippSetState (arg1 : System.Address; arg2 : ipp_state_t) return int;  -- cups/ipp.h:979
   pragma Import (C, ippSetState, "ippSetState");

   function ippSetStatusCode (arg1 : System.Address; arg2 : ipp_status_t) return int;  -- cups/ipp.h:981
   pragma Import (C, ippSetStatusCode, "ippSetStatusCode");

   function ippSetString
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ipp.h:983
   pragma Import (C, ippSetString, "ippSetString");

   function ippSetValueTag
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : ipp_tag_t) return int;  -- cups/ipp.h:986
   pragma Import (C, ippSetValueTag, "ippSetValueTag");

   function ippSetVersion
     (arg1 : System.Address;
      arg2 : int;
      arg3 : int) return int;  -- cups/ipp.h:988
   pragma Import (C, ippSetVersion, "ippSetVersion");

  --*** New in CUPS 1.7 *** 
   function ippAddStringf
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : ipp_tag_t;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return System.Address;  -- cups/ipp.h:992
   pragma Import (C, ippAddStringf, "ippAddStringf");

   function ippAddStringfv
     (arg1 : System.Address;
      arg2 : ipp_tag_t;
      arg3 : ipp_tag_t;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : Interfaces.C.Strings.chars_ptr;
      arg7 : access System.Address) return System.Address;  -- cups/ipp.h:996
   pragma Import (C, ippAddStringfv, "ippAddStringfv");

   function ippContainsInteger (arg1 : System.Address; arg2 : int) return int;  -- cups/ipp.h:1001
   pragma Import (C, ippContainsInteger, "ippContainsInteger");

   function ippContainsString (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/ipp.h:1003
   pragma Import (C, ippContainsString, "ippContainsString");

   function ippCreateRequestedArray (arg1 : System.Address) return System.Address;  -- cups/ipp.h:1005
   pragma Import (C, ippCreateRequestedArray, "ippCreateRequestedArray");

   function ippGetOctetString
     (arg1 : System.Address;
      arg2 : int;
      arg3 : access int) return System.Address;  -- cups/ipp.h:1006
   pragma Import (C, ippGetOctetString, "ippGetOctetString");

   function ippNewResponse (arg1 : System.Address) return System.Address;  -- cups/ipp.h:1008
   pragma Import (C, ippNewResponse, "ippNewResponse");

   function ippSetOctetString
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : System.Address;
      arg5 : int) return int;  -- cups/ipp.h:1009
   pragma Import (C, ippSetOctetString, "ippSetOctetString");

   function ippSetStringf
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- cups/ipp.h:1012
   pragma Import (C, ippSetStringf, "ippSetStringf");

   function ippSetStringfv
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : access System.Address) return int;  -- cups/ipp.h:1015
   pragma Import (C, ippSetStringfv, "ippSetStringfv");

   function ippValidateAttribute (arg1 : System.Address) return int;  -- cups/ipp.h:1018
   pragma Import (C, ippValidateAttribute, "ippValidateAttribute");

   function ippValidateAttributes (arg1 : System.Address) return int;  -- cups/ipp.h:1020
   pragma Import (C, ippValidateAttributes, "ippValidateAttributes");

  --*** New in CUPS 2.0 *** 
   function ippStateString (arg1 : ipp_state_t) return Interfaces.C.Strings.chars_ptr;  -- cups/ipp.h:1024
   pragma Import (C, ippStateString, "ippStateString");

  -- * C++ magic...
  --  

  -- * "$Id: ipp.h 12666 2015-05-25 19:38:09Z msweet $"
  -- *
  -- * Internet Printing Protocol definitions for CUPS.
  -- *
  -- * Copyright 2007-2014 by Apple Inc.
  -- * Copyright 1997-2006 by Easy Software Products.
  -- *
  -- * These coded instructions, statements, and computer programs are the
  -- * property of Apple Inc. and are protected by Federal copyright
  -- * law.  Distribution and use rights are outlined in the file "LICENSE.txt"
  -- * which should have been included with this file.  If this file is
  -- * file is missing or damaged, see the license at "http://www.cups.org/".
  -- *
  -- * This file is subject to the Apple OS-Developed Software exception.
  --  

end libCUPS.cups_ipp_h;
