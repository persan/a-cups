pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with libCUPS.bits_socket_h;
with libCUPS.netinet_in_h;
with libCUPS.sys_un_h;
with System;

with Interfaces.C.Strings;
with libCUPS.time_h;
limited with libCUPS.netdb_h;
with libCUPS.stdio_h;
with Interfaces.C_Streams;

package libCUPS.cups_http_h is

   HTTP_MAX_URI : constant := 1024;  --  cups/http.h:104
   HTTP_MAX_HOST : constant := 256;  --  cups/http.h:105
   HTTP_MAX_BUFFER : constant := 2048;  --  cups/http.h:106
   HTTP_MAX_VALUE : constant := 256;  --  cups/http.h:107
   --  unsupported macro: HTTP_ENCODE_LENGTH HTTP_ENCODING_LENGTH
   --  unsupported macro: HTTP_ENCODE_CHUNKED HTTP_ENCODING_CHUNKED
   --  unsupported macro: HTTP_ENCODE_FIELDS HTTP_ENCODING_FIELDS
   --  unsupported macro: HTTP_ENCRYPT_IF_REQUESTED HTTP_ENCRYPTION_IF_REQUESTED
   --  unsupported macro: HTTP_ENCRYPT_NEVER HTTP_ENCRYPTION_NEVER
   --  unsupported macro: HTTP_ENCRYPT_REQUIRED HTTP_ENCRYPTION_REQUIRED
   --  unsupported macro: HTTP_ENCRYPT_ALWAYS HTTP_ENCRYPTION_ALWAYS
   --  unsupported macro: HTTP_WAITING HTTP_STATE_WAITING
   --  unsupported macro: HTTP_OPTIONS HTTP_STATE_OPTIONS
   --  unsupported macro: HTTP_GET HTTP_STATE_GET
   --  unsupported macro: HTTP_GET_SEND HTTP_STATE_GET_SEND
   --  unsupported macro: HTTP_HEAD HTTP_STATE_HEAD
   --  unsupported macro: HTTP_POST HTTP_STATE_POST
   --  unsupported macro: HTTP_POST_RECV HTTP_STATE_POST_RECV
   --  unsupported macro: HTTP_POST_SEND HTTP_STATE_POST_SEND
   --  unsupported macro: HTTP_PUT HTTP_STATE_PUT
   --  unsupported macro: HTTP_PUT_RECV HTTP_STATE_PUT_RECV
   --  unsupported macro: HTTP_DELETE HTTP_STATE_DELETE
   --  unsupported macro: HTTP_TRACE HTTP_STATE_TRACE
   --  unsupported macro: HTTP_CLOSE HTTP_STATE_CONNECT
   --  unsupported macro: HTTP_STATUS HTTP_STATE_STATUS
   --  unsupported macro: HTTP_ERROR HTTP_STATUS_ERROR
   --  unsupported macro: HTTP_CONTINUE HTTP_STATUS_CONTINUE
   --  unsupported macro: HTTP_SWITCHING_PROTOCOLS HTTP_STATUS_SWITCHING_PROTOCOLS
   --  unsupported macro: HTTP_OK HTTP_STATUS_OK
   --  unsupported macro: HTTP_CREATED HTTP_STATUS_CREATED
   --  unsupported macro: HTTP_ACCEPTED HTTP_STATUS_ACCEPTED
   --  unsupported macro: HTTP_NOT_AUTHORITATIVE HTTP_STATUS_NOT_AUTHORITATIVE
   --  unsupported macro: HTTP_NO_CONTENT HTTP_STATUS_NO_CONTENT
   --  unsupported macro: HTTP_RESET_CONTENT HTTP_STATUS_RESET_CONTENT
   --  unsupported macro: HTTP_PARTIAL_CONTENT HTTP_STATUS_PARTIAL_CONTENT
   --  unsupported macro: HTTP_MULTIPLE_CHOICES HTTP_STATUS_MULTIPLE_CHOICES
   --  unsupported macro: HTTP_MOVED_PERMANENTLY HTTP_STATUS_MOVED_PERMANENTLY
   --  unsupported macro: HTTP_MOVED_TEMPORARILY HTTP_STATUS_MOVED_TEMPORARILY
   --  unsupported macro: HTTP_SEE_OTHER HTTP_STATUS_SEE_OTHER
   --  unsupported macro: HTTP_NOT_MODIFIED HTTP_STATUS_NOT_MODIFIED
   --  unsupported macro: HTTP_USE_PROXY HTTP_STATUS_USE_PROXY
   --  unsupported macro: HTTP_BAD_REQUEST HTTP_STATUS_BAD_REQUEST
   --  unsupported macro: HTTP_UNAUTHORIZED HTTP_STATUS_UNAUTHORIZED
   --  unsupported macro: HTTP_PAYMENT_REQUIRED HTTP_STATUS_PAYMENT_REQUIRED
   --  unsupported macro: HTTP_FORBIDDEN HTTP_STATUS_FORBIDDEN
   --  unsupported macro: HTTP_NOT_FOUND HTTP_STATUS_NOT_FOUND
   --  unsupported macro: HTTP_METHOD_NOT_ALLOWED HTTP_STATUS_METHOD_NOT_ALLOWED
   --  unsupported macro: HTTP_NOT_ACCEPTABLE HTTP_STATUS_NOT_ACCEPTABLE
   --  unsupported macro: HTTP_PROXY_AUTHENTICATION HTTP_STATUS_PROXY_AUTHENTICATION
   --  unsupported macro: HTTP_REQUEST_TIMEOUT HTTP_STATUS_REQUEST_TIMEOUT
   --  unsupported macro: HTTP_CONFLICT HTTP_STATUS_CONFLICT
   --  unsupported macro: HTTP_GONE HTTP_STATUS_GONE
   --  unsupported macro: HTTP_LENGTH_REQUIRED HTTP_STATUS_LENGTH_REQUIRED
   --  unsupported macro: HTTP_PRECONDITION HTTP_STATUS_PRECONDITION
   --  unsupported macro: HTTP_REQUEST_TOO_LARGE HTTP_STATUS_REQUEST_TOO_LARGE
   --  unsupported macro: HTTP_URI_TOO_LONG HTTP_STATUS_URI_TOO_LONG
   --  unsupported macro: HTTP_UNSUPPORTED_MEDIATYPE HTTP_STATUS_UNSUPPORTED_MEDIATYPE
   --  unsupported macro: HTTP_REQUESTED_RANGE HTTP_STATUS_REQUESTED_RANGE
   --  unsupported macro: HTTP_EXPECTATION_FAILED HTTP_STATUS_EXPECTATION_FAILED
   --  unsupported macro: HTTP_UPGRADE_REQUIRED HTTP_STATUS_UPGRADE_REQUIRED
   --  unsupported macro: HTTP_SERVER_ERROR HTTP_STATUS_SERVER_ERROR
   --  unsupported macro: HTTP_NOT_IMPLEMENTED HTTP_STATUS_NOT_IMPLEMENTED
   --  unsupported macro: HTTP_BAD_GATEWAY HTTP_STATUS_BAD_GATEWAY
   --  unsupported macro: HTTP_SERVICE_UNAVAILABLE HTTP_STATUS_SERVICE_UNAVAILABLE
   --  unsupported macro: HTTP_GATEWAY_TIMEOUT HTTP_STATUS_GATEWAY_TIMEOUT
   --  unsupported macro: HTTP_NOT_SUPPORTED HTTP_STATUS_NOT_SUPPORTED
   --  unsupported macro: HTTP_AUTHORIZATION_CANCELED HTTP_STATUS_CUPS_AUTHORIZATION_CANCELED
   --  unsupported macro: HTTP_PKI_ERROR HTTP_STATUS_CUPS_PKI_ERROR
   --  unsupported macro: HTTP_WEBIF_DISABLED HTTP_STATUS_CUPS_WEBIF_DISABLED
   --  unsupported macro: HTTP_URI_OVERFLOW HTTP_URI_STATUS_OVERFLOW
   --  unsupported macro: HTTP_URI_BAD_ARGUMENTS HTTP_URI_STATUS_BAD_ARGUMENTS
   --  unsupported macro: HTTP_URI_BAD_RESOURCE HTTP_URI_STATUS_BAD_RESOURCE
   --  unsupported macro: HTTP_URI_BAD_PORT HTTP_URI_STATUS_BAD_PORT
   --  unsupported macro: HTTP_URI_BAD_HOSTNAME HTTP_URI_STATUS_BAD_HOSTNAME
   --  unsupported macro: HTTP_URI_BAD_USERNAME HTTP_URI_STATUS_BAD_USERNAME
   --  unsupported macro: HTTP_URI_BAD_SCHEME HTTP_URI_STATUS_BAD_SCHEME
   --  unsupported macro: HTTP_URI_BAD_URI HTTP_URI_STATUS_BAD_URI
   --  unsupported macro: HTTP_URI_OK HTTP_URI_STATUS_OK
   --  unsupported macro: HTTP_URI_MISSING_SCHEME HTTP_URI_STATUS_MISSING_SCHEME
   --  unsupported macro: HTTP_URI_UNKNOWN_SCHEME HTTP_URI_STATUS_UNKNOWN_SCHEME
   --  unsupported macro: HTTP_URI_MISSING_RESOURCE HTTP_URI_STATUS_MISSING_RESOURCE
   --  unsupported macro: HTTP_0_9 HTTP_VERSION_0_9
   --  unsupported macro: HTTP_1_0 HTTP_VERSION_1_0
   --  unsupported macro: HTTP_1_1 HTTP_VERSION_1_1

   type http_auth_e is 
     (HTTP_AUTH_NONE,
      HTTP_AUTH_BASIC,
      HTTP_AUTH_MD5,
      HTTP_AUTH_MD5_SESS,
      HTTP_AUTH_MD5_INT,
      HTTP_AUTH_MD5_SESS_INT,
      HTTP_AUTH_NEGOTIATE);
   pragma Convention (C, http_auth_e);  -- cups/http.h:114

   subtype http_auth_t is http_auth_e;

   type http_encoding_e is 
     (HTTP_ENCODING_LENGTH,
      HTTP_ENCODING_CHUNKED,
      HTTP_ENCODING_FIELDS);
   pragma Convention (C, http_encoding_e);  -- cups/http.h:125

   subtype http_encoding_t is http_encoding_e;

   type http_encryption_e is 
     (HTTP_ENCRYPTION_IF_REQUESTED,
      HTTP_ENCRYPTION_NEVER,
      HTTP_ENCRYPTION_REQUIRED,
      HTTP_ENCRYPTION_ALWAYS);
   pragma Convention (C, http_encryption_e);  -- cups/http.h:138

   subtype http_encryption_t is http_encryption_e;

   subtype http_field_e is unsigned;
   HTTP_FIELD_UNKNOWN : constant http_field_e := -1;
   HTTP_FIELD_ACCEPT_LANGUAGE : constant http_field_e := 0;
   HTTP_FIELD_ACCEPT_RANGES : constant http_field_e := 1;
   HTTP_FIELD_AUTHORIZATION : constant http_field_e := 2;
   HTTP_FIELD_CONNECTION : constant http_field_e := 3;
   HTTP_FIELD_CONTENT_ENCODING : constant http_field_e := 4;
   HTTP_FIELD_CONTENT_LANGUAGE : constant http_field_e := 5;
   HTTP_FIELD_CONTENT_LENGTH : constant http_field_e := 6;
   HTTP_FIELD_CONTENT_LOCATION : constant http_field_e := 7;
   HTTP_FIELD_CONTENT_MD5 : constant http_field_e := 8;
   HTTP_FIELD_CONTENT_RANGE : constant http_field_e := 9;
   HTTP_FIELD_CONTENT_TYPE : constant http_field_e := 10;
   HTTP_FIELD_CONTENT_VERSION : constant http_field_e := 11;
   HTTP_FIELD_DATE : constant http_field_e := 12;
   HTTP_FIELD_HOST : constant http_field_e := 13;
   HTTP_FIELD_IF_MODIFIED_SINCE : constant http_field_e := 14;
   HTTP_FIELD_IF_UNMODIFIED_SINCE : constant http_field_e := 15;
   HTTP_FIELD_KEEP_ALIVE : constant http_field_e := 16;
   HTTP_FIELD_LAST_MODIFIED : constant http_field_e := 17;
   HTTP_FIELD_LINK : constant http_field_e := 18;
   HTTP_FIELD_LOCATION : constant http_field_e := 19;
   HTTP_FIELD_RANGE : constant http_field_e := 20;
   HTTP_FIELD_REFERER : constant http_field_e := 21;
   HTTP_FIELD_RETRY_AFTER : constant http_field_e := 22;
   HTTP_FIELD_TRANSFER_ENCODING : constant http_field_e := 23;
   HTTP_FIELD_UPGRADE : constant http_field_e := 24;
   HTTP_FIELD_USER_AGENT : constant http_field_e := 25;
   HTTP_FIELD_WWW_AUTHENTICATE : constant http_field_e := 26;
   HTTP_FIELD_ACCEPT_ENCODING : constant http_field_e := 27;
   HTTP_FIELD_ALLOW : constant http_field_e := 28;
   HTTP_FIELD_SERVER : constant http_field_e := 29;
   HTTP_FIELD_MAX : constant http_field_e := 30;  -- cups/http.h:153

   subtype http_field_t is http_field_e;

   type http_keepalive_e is 
     (HTTP_KEEPALIVE_OFF,
      HTTP_KEEPALIVE_ON);
   pragma Convention (C, http_keepalive_e);  -- cups/http.h:189

   subtype http_keepalive_t is http_keepalive_e;

   subtype http_state_e is unsigned;
   HTTP_STATE_ERROR : constant http_state_e := -1;
   HTTP_STATE_WAITING : constant http_state_e := 0;
   HTTP_STATE_OPTIONS : constant http_state_e := 1;
   HTTP_STATE_GET : constant http_state_e := 2;
   HTTP_STATE_GET_SEND : constant http_state_e := 3;
   HTTP_STATE_HEAD : constant http_state_e := 4;
   HTTP_STATE_POST : constant http_state_e := 5;
   HTTP_STATE_POST_RECV : constant http_state_e := 6;
   HTTP_STATE_POST_SEND : constant http_state_e := 7;
   HTTP_STATE_PUT : constant http_state_e := 8;
   HTTP_STATE_PUT_RECV : constant http_state_e := 9;
   HTTP_STATE_DELETE : constant http_state_e := 10;
   HTTP_STATE_TRACE : constant http_state_e := 11;
   HTTP_STATE_CONNECT : constant http_state_e := 12;
   HTTP_STATE_STATUS : constant http_state_e := 13;
   HTTP_STATE_UNKNOWN_METHOD : constant http_state_e := 14;
   HTTP_STATE_UNKNOWN_VERSION : constant http_state_e := 15;  -- cups/http.h:195

   subtype http_state_t is http_state_e;

   subtype http_status_e is unsigned;
   HTTP_STATUS_ERROR : constant http_status_e := -1;
   HTTP_STATUS_NONE : constant http_status_e := 0;
   HTTP_STATUS_CONTINUE : constant http_status_e := 100;
   HTTP_STATUS_SWITCHING_PROTOCOLS : constant http_status_e := 101;
   HTTP_STATUS_OK : constant http_status_e := 200;
   HTTP_STATUS_CREATED : constant http_status_e := 201;
   HTTP_STATUS_ACCEPTED : constant http_status_e := 202;
   HTTP_STATUS_NOT_AUTHORITATIVE : constant http_status_e := 203;
   HTTP_STATUS_NO_CONTENT : constant http_status_e := 204;
   HTTP_STATUS_RESET_CONTENT : constant http_status_e := 205;
   HTTP_STATUS_PARTIAL_CONTENT : constant http_status_e := 206;
   HTTP_STATUS_MULTIPLE_CHOICES : constant http_status_e := 300;
   HTTP_STATUS_MOVED_PERMANENTLY : constant http_status_e := 301;
   HTTP_STATUS_MOVED_TEMPORARILY : constant http_status_e := 302;
   HTTP_STATUS_SEE_OTHER : constant http_status_e := 303;
   HTTP_STATUS_NOT_MODIFIED : constant http_status_e := 304;
   HTTP_STATUS_USE_PROXY : constant http_status_e := 305;
   HTTP_STATUS_BAD_REQUEST : constant http_status_e := 400;
   HTTP_STATUS_UNAUTHORIZED : constant http_status_e := 401;
   HTTP_STATUS_PAYMENT_REQUIRED : constant http_status_e := 402;
   HTTP_STATUS_FORBIDDEN : constant http_status_e := 403;
   HTTP_STATUS_NOT_FOUND : constant http_status_e := 404;
   HTTP_STATUS_METHOD_NOT_ALLOWED : constant http_status_e := 405;
   HTTP_STATUS_NOT_ACCEPTABLE : constant http_status_e := 406;
   HTTP_STATUS_PROXY_AUTHENTICATION : constant http_status_e := 407;
   HTTP_STATUS_REQUEST_TIMEOUT : constant http_status_e := 408;
   HTTP_STATUS_CONFLICT : constant http_status_e := 409;
   HTTP_STATUS_GONE : constant http_status_e := 410;
   HTTP_STATUS_LENGTH_REQUIRED : constant http_status_e := 411;
   HTTP_STATUS_PRECONDITION : constant http_status_e := 412;
   HTTP_STATUS_REQUEST_TOO_LARGE : constant http_status_e := 413;
   HTTP_STATUS_URI_TOO_LONG : constant http_status_e := 414;
   HTTP_STATUS_UNSUPPORTED_MEDIATYPE : constant http_status_e := 415;
   HTTP_STATUS_REQUESTED_RANGE : constant http_status_e := 416;
   HTTP_STATUS_EXPECTATION_FAILED : constant http_status_e := 417;
   HTTP_STATUS_UPGRADE_REQUIRED : constant http_status_e := 426;
   HTTP_STATUS_SERVER_ERROR : constant http_status_e := 500;
   HTTP_STATUS_NOT_IMPLEMENTED : constant http_status_e := 501;
   HTTP_STATUS_BAD_GATEWAY : constant http_status_e := 502;
   HTTP_STATUS_SERVICE_UNAVAILABLE : constant http_status_e := 503;
   HTTP_STATUS_GATEWAY_TIMEOUT : constant http_status_e := 504;
   HTTP_STATUS_NOT_SUPPORTED : constant http_status_e := 505;
   HTTP_STATUS_CUPS_AUTHORIZATION_CANCELED : constant http_status_e := 1000;
   HTTP_STATUS_CUPS_PKI_ERROR : constant http_status_e := 1001;
   HTTP_STATUS_CUPS_WEBIF_DISABLED : constant http_status_e := 1002;  -- cups/http.h:235

   subtype http_status_t is http_status_e;

   type http_trust_e is 
     (HTTP_TRUST_OK,
      HTTP_TRUST_INVALID,
      HTTP_TRUST_CHANGED,
      HTTP_TRUST_EXPIRED,
      HTTP_TRUST_RENEWED,
      HTTP_TRUST_UNKNOWN);
   pragma Convention (C, http_trust_e);  -- cups/http.h:345

   subtype http_trust_t is http_trust_e;

   subtype http_uri_status_e is unsigned;
   HTTP_URI_STATUS_OVERFLOW : constant http_uri_status_e := -8;
   HTTP_URI_STATUS_BAD_ARGUMENTS : constant http_uri_status_e := -7;
   HTTP_URI_STATUS_BAD_RESOURCE : constant http_uri_status_e := -6;
   HTTP_URI_STATUS_BAD_PORT : constant http_uri_status_e := -5;
   HTTP_URI_STATUS_BAD_HOSTNAME : constant http_uri_status_e := -4;
   HTTP_URI_STATUS_BAD_USERNAME : constant http_uri_status_e := -3;
   HTTP_URI_STATUS_BAD_SCHEME : constant http_uri_status_e := -2;
   HTTP_URI_STATUS_BAD_URI : constant http_uri_status_e := -1;
   HTTP_URI_STATUS_OK : constant http_uri_status_e := 0;
   HTTP_URI_STATUS_MISSING_SCHEME : constant http_uri_status_e := 1;
   HTTP_URI_STATUS_UNKNOWN_SCHEME : constant http_uri_status_e := 2;
   HTTP_URI_STATUS_MISSING_RESOURCE : constant http_uri_status_e := 3;  -- cups/http.h:355

   subtype http_uri_status_t is http_uri_status_e;

   subtype http_uri_coding_e is unsigned;
   HTTP_URI_CODING_NONE : constant http_uri_coding_e := 0;
   HTTP_URI_CODING_USERNAME : constant http_uri_coding_e := 1;
   HTTP_URI_CODING_HOSTNAME : constant http_uri_coding_e := 2;
   HTTP_URI_CODING_RESOURCE : constant http_uri_coding_e := 4;
   HTTP_URI_CODING_MOST : constant http_uri_coding_e := 7;
   HTTP_URI_CODING_QUERY : constant http_uri_coding_e := 8;
   HTTP_URI_CODING_ALL : constant http_uri_coding_e := 15;
   HTTP_URI_CODING_RFC6874 : constant http_uri_coding_e := 16;  -- cups/http.h:386

   subtype http_uri_coding_t is http_uri_coding_e;

   subtype http_version_e is unsigned;
   HTTP_VERSION_0_9 : constant http_version_e := 9;
   HTTP_VERSION_1_0 : constant http_version_e := 100;
   HTTP_VERSION_1_1 : constant http_version_e := 101;  -- cups/http.h:398

   subtype http_version_t is http_version_e;

   subtype anon2846_pad_array is Interfaces.C.char_array (0 .. 255);
   type u_http_addr_u (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            addr : aliased libCUPS.bits_socket_h.sockaddr;  -- cups/http.h:417
         when 1 =>
            ipv4 : aliased libCUPS.netinet_in_h.sockaddr_in;  -- cups/http.h:418
         when 2 =>
            ipv6 : aliased libCUPS.netinet_in_h.sockaddr_in6;  -- cups/http.h:420
         when 3 =>
            un : aliased libCUPS.sys_un_h.sockaddr_un;  -- cups/http.h:423
         when others =>
            pad : aliased anon2846_pad_array;  -- cups/http.h:425
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, u_http_addr_u);
   pragma Unchecked_Union (u_http_addr_u);  -- cups/http.h:411

   subtype http_addr_t is u_http_addr_u;

   type http_addrlist_s is record
      next : access http_addrlist_s;  -- cups/http.h:434
      addr : aliased http_addr_t;  -- cups/http.h:435
   end record;
   pragma Convention (C_Pass_By_Copy, http_addrlist_s);  -- cups/http.h:428

   subtype http_addrlist_t is http_addrlist_s;

   --  skipped empty struct u_http_s

   --  skipped empty struct http_t

   type http_credential_s is record
      data : System.Address;  -- cups/http.h:442
      datalen : aliased size_t;  -- cups/http.h:443
   end record;
   pragma Convention (C_Pass_By_Copy, http_credential_s);  -- cups/http.h:440

   subtype http_credential_t is http_credential_s;

   type http_timeout_cb_t is access function (arg1 : System.Address; arg2 : System.Address) return int;
   pragma Convention (C, http_timeout_cb_t);  -- cups/http.h:446

   procedure httpBlocking (arg1 : System.Address; arg2 : int);  -- cups/http.h:455
   pragma Import (C, httpBlocking, "httpBlocking");

   function httpCheck (arg1 : System.Address) return int;  -- cups/http.h:456
   pragma Import (C, httpCheck, "httpCheck");

   procedure httpClearFields (arg1 : System.Address);  -- cups/http.h:457
   pragma Import (C, httpClearFields, "httpClearFields");

   procedure httpClose (arg1 : System.Address);  -- cups/http.h:458
   pragma Import (C, httpClose, "httpClose");

   function httpConnect (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return System.Address;  -- cups/http.h:459
   pragma Import (C, httpConnect, "httpConnect");

   function httpConnectEncrypt
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : http_encryption_t) return System.Address;  -- cups/http.h:461
   pragma Import (C, httpConnectEncrypt, "httpConnectEncrypt");

   function httpDelete (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/http.h:464
   pragma Import (C, httpDelete, "httpDelete");

   function httpEncryption (arg1 : System.Address; arg2 : http_encryption_t) return int;  -- cups/http.h:465
   pragma Import (C, httpEncryption, "httpEncryption");

   function httpError (arg1 : System.Address) return int;  -- cups/http.h:466
   pragma Import (C, httpError, "httpError");

   procedure httpFlush (arg1 : System.Address);  -- cups/http.h:467
   pragma Import (C, httpFlush, "httpFlush");

   function httpGet (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/http.h:468
   pragma Import (C, httpGet, "httpGet");

   function httpGets
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : System.Address) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:469
   pragma Import (C, httpGets, "httpGets");

   function httpGetDateString (arg1 : libCUPS.time_h.time_t) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:470
   pragma Import (C, httpGetDateString, "httpGetDateString");

   function httpGetDateTime (arg1 : Interfaces.C.Strings.chars_ptr) return libCUPS.time_h.time_t;  -- cups/http.h:471
   pragma Import (C, httpGetDateTime, "httpGetDateTime");

   function httpGetField (arg1 : System.Address; arg2 : http_field_t) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:472
   pragma Import (C, httpGetField, "httpGetField");

   function httpGetHostByName (arg1 : Interfaces.C.Strings.chars_ptr) return access libCUPS.netdb_h.hostent;  -- cups/http.h:473
   pragma Import (C, httpGetHostByName, "httpGetHostByName");

   function httpGetSubField
     (arg1 : System.Address;
      arg2 : http_field_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:474
   pragma Import (C, httpGetSubField, "httpGetSubField");

   function httpHead (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/http.h:476
   pragma Import (C, httpHead, "httpHead");

   procedure httpInitialize;  -- cups/http.h:477
   pragma Import (C, httpInitialize, "httpInitialize");

   function httpOptions (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/http.h:478
   pragma Import (C, httpOptions, "httpOptions");

   function httpPost (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/http.h:479
   pragma Import (C, httpPost, "httpPost");

   function httpPrintf (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- cups/http.h:480
   pragma Import (C, httpPrintf, "httpPrintf");

   function httpPut (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/http.h:482
   pragma Import (C, httpPut, "httpPut");

   function httpRead
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return int;  -- cups/http.h:483
   pragma Import (C, httpRead, "httpRead");

   function httpReconnect (arg1 : System.Address) return int;  -- cups/http.h:484
   pragma Import (C, httpReconnect, "httpReconnect");

   procedure httpSeparate
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : access int;
      arg6 : Interfaces.C.Strings.chars_ptr);  -- cups/http.h:485
   pragma Import (C, httpSeparate, "httpSeparate");

   procedure httpSetField
     (arg1 : System.Address;
      arg2 : http_field_t;
      arg3 : Interfaces.C.Strings.chars_ptr);  -- cups/http.h:488
   pragma Import (C, httpSetField, "httpSetField");

   function httpStatus (arg1 : http_status_t) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:490
   pragma Import (C, httpStatus, "httpStatus");

   function httpTrace (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/http.h:491
   pragma Import (C, httpTrace, "httpTrace");

   function httpUpdate (arg1 : System.Address) return http_status_t;  -- cups/http.h:492
   pragma Import (C, httpUpdate, "httpUpdate");

   function httpWrite
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return int;  -- cups/http.h:493
   pragma Import (C, httpWrite, "httpWrite");

   function httpEncode64 (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:494
   pragma Import (C, httpEncode64, "httpEncode64");

   function httpDecode64 (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:495
   pragma Import (C, httpDecode64, "httpDecode64");

   function httpGetLength (arg1 : System.Address) return int;  -- cups/http.h:496
   pragma Import (C, httpGetLength, "httpGetLength");

   function httpMD5
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:497
   pragma Import (C, httpMD5, "httpMD5");

   function httpMD5Final
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:499
   pragma Import (C, httpMD5Final, "httpMD5Final");

   function httpMD5String (arg1 : access unsigned_char; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:501
   pragma Import (C, httpMD5String, "httpMD5String");

   procedure httpClearCookie (arg1 : System.Address);  -- cups/http.h:504
   pragma Import (C, httpClearCookie, "httpClearCookie");

   function httpGetCookie (arg1 : System.Address) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:505
   pragma Import (C, httpGetCookie, "httpGetCookie");

   procedure httpSetCookie (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr);  -- cups/http.h:506
   pragma Import (C, httpSetCookie, "httpSetCookie");

   function httpWait (arg1 : System.Address; arg2 : int) return int;  -- cups/http.h:507
   pragma Import (C, httpWait, "httpWait");

   function httpDecode64_2
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : access int;
      arg3 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:510
   pragma Import (C, httpDecode64_2, "httpDecode64_2");

   function httpEncode64_2
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:511
   pragma Import (C, httpEncode64_2, "httpEncode64_2");

   procedure httpSeparate2
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : int;
      arg6 : Interfaces.C.Strings.chars_ptr;
      arg7 : int;
      arg8 : access int;
      arg9 : Interfaces.C.Strings.chars_ptr;
      arg10 : int);  -- cups/http.h:513
   pragma Import (C, httpSeparate2, "httpSeparate2");

   function httpAddrAny (arg1 : access constant http_addr_t) return int;  -- cups/http.h:520
   pragma Import (C, httpAddrAny, "httpAddrAny");

   function httpAddrConnect (arg1 : access http_addrlist_t; arg2 : access int) return access http_addrlist_t;  -- cups/http.h:521
   pragma Import (C, httpAddrConnect, "httpAddrConnect");

   function httpAddrEqual (arg1 : access constant http_addr_t; arg2 : access constant http_addr_t) return int;  -- cups/http.h:522
   pragma Import (C, httpAddrEqual, "httpAddrEqual");

   procedure httpAddrFreeList (arg1 : access http_addrlist_t);  -- cups/http.h:524
   pragma Import (C, httpAddrFreeList, "httpAddrFreeList");

   function httpAddrGetList
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr) return access http_addrlist_t;  -- cups/http.h:525
   pragma Import (C, httpAddrGetList, "httpAddrGetList");

   function httpAddrLength (arg1 : access constant http_addr_t) return int;  -- cups/http.h:527
   pragma Import (C, httpAddrLength, "httpAddrLength");

   function httpAddrLocalhost (arg1 : access constant http_addr_t) return int;  -- cups/http.h:528
   pragma Import (C, httpAddrLocalhost, "httpAddrLocalhost");

   function httpAddrLookup
     (arg1 : access constant http_addr_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:529
   pragma Import (C, httpAddrLookup, "httpAddrLookup");

   function httpAddrString
     (arg1 : access constant http_addr_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:531
   pragma Import (C, httpAddrString, "httpAddrString");

   function httpAssembleURI
     (arg1 : http_uri_coding_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : Interfaces.C.Strings.chars_ptr;
      arg7 : int;
      arg8 : Interfaces.C.Strings.chars_ptr) return http_uri_status_t;  -- cups/http.h:533
   pragma Import (C, httpAssembleURI, "httpAssembleURI");

   function httpAssembleURIf
     (arg1 : http_uri_coding_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : Interfaces.C.Strings.chars_ptr;
      arg7 : int;
      arg8 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return http_uri_status_t;  -- cups/http.h:539
   pragma Import (C, httpAssembleURIf, "httpAssembleURIf");

   function httpFlushWrite (arg1 : System.Address) return int;  -- cups/http.h:545
   pragma Import (C, httpFlushWrite, "httpFlushWrite");

   function httpGetBlocking (arg1 : System.Address) return int;  -- cups/http.h:546
   pragma Import (C, httpGetBlocking, "httpGetBlocking");

   function httpGetDateString2
     (arg1 : libCUPS.time_h.time_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:547
   pragma Import (C, httpGetDateString2, "httpGetDateString2");

   function httpGetFd (arg1 : System.Address) return int;  -- cups/http.h:548
   pragma Import (C, httpGetFd, "httpGetFd");

   function httpGetHostname
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:549
   pragma Import (C, httpGetHostname, "httpGetHostname");

   function httpGetLength2 (arg1 : System.Address) return libCUPS.stdio_h.off_t;  -- cups/http.h:550
   pragma Import (C, httpGetLength2, "httpGetLength2");

   function httpGetStatus (arg1 : System.Address) return http_status_t;  -- cups/http.h:551
   pragma Import (C, httpGetStatus, "httpGetStatus");

   function httpGetSubField2
     (arg1 : System.Address;
      arg2 : http_field_t;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : int) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:552
   pragma Import (C, httpGetSubField2, "httpGetSubField2");

   function httpRead2
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return size_t;  -- cups/http.h:555
   pragma Import (C, httpRead2, "httpRead2");

   function httpSeparateURI
     (arg1 : http_uri_coding_t;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : int;
      arg7 : Interfaces.C.Strings.chars_ptr;
      arg8 : int;
      arg9 : access int;
      arg10 : Interfaces.C.Strings.chars_ptr;
      arg11 : int) return http_uri_status_t;  -- cups/http.h:556
   pragma Import (C, httpSeparateURI, "httpSeparateURI");

   procedure httpSetExpect (arg1 : System.Address; arg2 : http_status_t);  -- cups/http.h:562
   pragma Import (C, httpSetExpect, "httpSetExpect");

   procedure httpSetLength (arg1 : System.Address; arg2 : size_t);  -- cups/http.h:563
   pragma Import (C, httpSetLength, "httpSetLength");

   function httpWrite2
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return size_t;  -- cups/http.h:564
   pragma Import (C, httpWrite2, "httpWrite2");

   function httpGetAuthString (arg1 : System.Address) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:568
   pragma Import (C, httpGetAuthString, "httpGetAuthString");

   procedure httpSetAuthString
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr);  -- cups/http.h:569
   pragma Import (C, httpSetAuthString, "httpSetAuthString");

   function httpAddCredential
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : size_t) return int;  -- cups/http.h:573
   pragma Import (C, httpAddCredential, "httpAddCredential");

   function httpCopyCredentials (arg1 : System.Address; arg2 : System.Address) return int;  -- cups/http.h:576
   pragma Import (C, httpCopyCredentials, "httpCopyCredentials");

   procedure httpFreeCredentials (arg1 : System.Address);  -- cups/http.h:579
   pragma Import (C, httpFreeCredentials, "httpFreeCredentials");

   function httpSetCredentials (arg1 : System.Address; arg2 : System.Address) return int;  -- cups/http.h:580
   pragma Import (C, httpSetCredentials, "httpSetCredentials");

   procedure httpSetTimeout
     (arg1 : System.Address;
      arg2 : double;
      arg3 : http_timeout_cb_t;
      arg4 : System.Address);  -- cups/http.h:582
   pragma Import (C, httpSetTimeout, "httpSetTimeout");

   function httpAddrConnect2
     (arg1 : access http_addrlist_t;
      arg2 : access int;
      arg3 : int;
      arg4 : access int) return access http_addrlist_t;  -- cups/http.h:587
   pragma Import (C, httpAddrConnect2, "httpAddrConnect2");

   function httpGetState (arg1 : System.Address) return http_state_t;  -- cups/http.h:590
   pragma Import (C, httpGetState, "httpGetState");

   function httpGetVersion (arg1 : System.Address) return http_version_t;  -- cups/http.h:591
   pragma Import (C, httpGetVersion, "httpGetVersion");

   function httpReconnect2
     (arg1 : System.Address;
      arg2 : int;
      arg3 : access int) return int;  -- cups/http.h:592
   pragma Import (C, httpReconnect2, "httpReconnect2");

   function httpAcceptConnection (arg1 : int; arg2 : int) return System.Address;  -- cups/http.h:597
   pragma Import (C, httpAcceptConnection, "httpAcceptConnection");

   function httpAddrCopyList (arg1 : access http_addrlist_t) return access http_addrlist_t;  -- cups/http.h:599
   pragma Import (C, httpAddrCopyList, "httpAddrCopyList");

   function httpAddrListen (arg1 : access http_addr_t; arg2 : int) return int;  -- cups/http.h:600
   pragma Import (C, httpAddrListen, "httpAddrListen");

   function httpAddrPort (arg1 : access http_addr_t) return int;  -- cups/http.h:602
   pragma Import (C, httpAddrPort, "httpAddrPort");

   function httpAssembleUUID
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : size_t) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:603
   pragma Import (C, httpAssembleUUID, "httpAssembleUUID");

   function httpConnect2
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : int;
      arg3 : access http_addrlist_t;
      arg4 : int;
      arg5 : http_encryption_t;
      arg6 : int;
      arg7 : int;
      arg8 : access int) return System.Address;  -- cups/http.h:607
   pragma Import (C, httpConnect2, "httpConnect2");

   function httpGetContentEncoding (arg1 : System.Address) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:612
   pragma Import (C, httpGetContentEncoding, "httpGetContentEncoding");

   function httpGetExpect (arg1 : System.Address) return http_status_t;  -- cups/http.h:613
   pragma Import (C, httpGetExpect, "httpGetExpect");

   function httpPeek
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return size_t;  -- cups/http.h:614
   pragma Import (C, httpPeek, "httpPeek");

   function httpReadRequest
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return http_state_t;  -- cups/http.h:616
   pragma Import (C, httpReadRequest, "httpReadRequest");

   procedure httpSetDefaultField
     (arg1 : System.Address;
      arg2 : http_field_t;
      arg3 : Interfaces.C.Strings.chars_ptr);  -- cups/http.h:618
   pragma Import (C, httpSetDefaultField, "httpSetDefaultField");

   function httpWriteResponse (arg1 : System.Address; arg2 : http_status_t) return http_state_t;  -- cups/http.h:620
   pragma Import (C, httpWriteResponse, "httpWriteResponse");

   function httpAddrClose (arg1 : access http_addr_t; arg2 : int) return int;  -- cups/http.h:624
   pragma Import (C, httpAddrClose, "httpAddrClose");

   function httpAddrFamily (arg1 : access http_addr_t) return int;  -- cups/http.h:625
   pragma Import (C, httpAddrFamily, "httpAddrFamily");

   function httpCompareCredentials (arg1 : System.Address; arg2 : System.Address) return int;  -- cups/http.h:626
   pragma Import (C, httpCompareCredentials, "httpCompareCredentials");

   function httpCredentialsAreValidForName (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/http.h:627
   pragma Import (C, httpCredentialsAreValidForName, "httpCredentialsAreValidForName");

   function httpCredentialsGetExpiration (arg1 : System.Address) return libCUPS.time_h.time_t;  -- cups/http.h:628
   pragma Import (C, httpCredentialsGetExpiration, "httpCredentialsGetExpiration");

   function httpCredentialsGetTrust (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return http_trust_t;  -- cups/http.h:629
   pragma Import (C, httpCredentialsGetTrust, "httpCredentialsGetTrust");

   function httpCredentialsString
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return size_t;  -- cups/http.h:630
   pragma Import (C, httpCredentialsString, "httpCredentialsString");

   function httpFieldValue (arg1 : Interfaces.C.Strings.chars_ptr) return http_field_t;  -- cups/http.h:631
   pragma Import (C, httpFieldValue, "httpFieldValue");

   function httpGetActivity (arg1 : System.Address) return libCUPS.time_h.time_t;  -- cups/http.h:632
   pragma Import (C, httpGetActivity, "httpGetActivity");

   function httpGetAddress (arg1 : System.Address) return access http_addr_t;  -- cups/http.h:633
   pragma Import (C, httpGetAddress, "httpGetAddress");

   function httpGetEncryption (arg1 : System.Address) return http_encryption_t;  -- cups/http.h:634
   pragma Import (C, httpGetEncryption, "httpGetEncryption");

   function httpGetKeepAlive (arg1 : System.Address) return http_keepalive_t;  -- cups/http.h:635
   pragma Import (C, httpGetKeepAlive, "httpGetKeepAlive");

   function httpGetPending (arg1 : System.Address) return size_t;  -- cups/http.h:636
   pragma Import (C, httpGetPending, "httpGetPending");

   function httpGetReady (arg1 : System.Address) return size_t;  -- cups/http.h:637
   pragma Import (C, httpGetReady, "httpGetReady");

   function httpGetRemaining (arg1 : System.Address) return size_t;  -- cups/http.h:638
   pragma Import (C, httpGetRemaining, "httpGetRemaining");

   function httpIsChunked (arg1 : System.Address) return int;  -- cups/http.h:639
   pragma Import (C, httpIsChunked, "httpIsChunked");

   function httpIsEncrypted (arg1 : System.Address) return int;  -- cups/http.h:640
   pragma Import (C, httpIsEncrypted, "httpIsEncrypted");

   function httpLoadCredentials
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : System.Address;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/http.h:641
   pragma Import (C, httpLoadCredentials, "httpLoadCredentials");

   function httpResolveHostname
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:642
   pragma Import (C, httpResolveHostname, "httpResolveHostname");

   function httpSaveCredentials
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : System.Address;
      arg3 : Interfaces.C.Strings.chars_ptr) return int;  -- cups/http.h:643
   pragma Import (C, httpSaveCredentials, "httpSaveCredentials");

   procedure httpSetKeepAlive (arg1 : System.Address; arg2 : http_keepalive_t);  -- cups/http.h:644
   pragma Import (C, httpSetKeepAlive, "httpSetKeepAlive");

   procedure httpShutdown (arg1 : System.Address);  -- cups/http.h:645
   pragma Import (C, httpShutdown, "httpShutdown");

   function httpStateString (arg1 : http_state_t) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:646
   pragma Import (C, httpStateString, "httpStateString");

   function httpURIStatusString (arg1 : http_uri_status_t) return Interfaces.C.Strings.chars_ptr;  -- cups/http.h:647
   pragma Import (C, httpURIStatusString, "httpURIStatusString");

end libCUPS.cups_http_h;
