pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
limited with CUPS.bits_pthreadtypes_h;
with CUPS.bits_types_h;

private package CUPS.bits_siginfo_h is

   --  unsupported macro: sigev_notify_function _sigev_un._sigev_thread._function
   --  unsupported macro: sigev_notify_attributes _sigev_un._sigev_thread._attribute
   --  unsupported macro: SIGEV_SIGNAL SIGEV_SIGNAL
   --  unsupported macro: SIGEV_NONE SIGEV_NONE
   --  unsupported macro: SIGEV_THREAD SIGEV_THREAD
   --  unsupported macro: SIGEV_THREAD_ID SIGEV_THREAD_ID
  -- siginfo_t, sigevent and constants.  Linux x86-64 version.
  --   Copyright (C) 2012-2016 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <http://www.gnu.org/licenses/>.   

  -- Type for data associated with a signal.   
   type sigval (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            sival_int : aliased int;  -- bits/siginfo.h:34
         when others =>
            sival_ptr : System.Address;  -- bits/siginfo.h:35
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, sigval);
   pragma Unchecked_Union (sigval);  -- bits/siginfo.h:32

   subtype sigval_t is sigval;

  -- si_utime and si_stime must be 4 byte aligned for x32 to match the
  --   kernel.  We align siginfo_t to 8 bytes so that si_utime and si_stime
  --   are actually aligned to 8 bytes since their offsets are multiple of
  --   8 bytes.   

  -- Signal number.   
  -- If non-zero, an errno value associated with
  --				   this signal, as defined in <errno.h>.   

  -- Signal code.   
  -- kill().   
  -- Sending process ID.   
  -- Real user ID of sending process.   
  -- POSIX.1b timers.   
  -- Timer ID.   
  -- Overrun count.   
  -- Signal value.   
  -- POSIX.1b signals.   
  -- Sending process ID.   
  -- Real user ID of sending process.   
  -- Signal value.   
  -- SIGCHLD.   
  -- Which child.   
  -- Real user ID of sending process.   
  -- Exit value or signal.   
  -- SIGILL, SIGFPE, SIGSEGV, SIGBUS.   
  -- Faulting insn/memory ref.   
  -- Valid LSB of the reported address.   
  -- SIGPOLL.   
  -- Band event for SIGPOLL.   
  -- SIGSYS.   
  -- Calling user insn.   
  -- Triggering system call number.   
  -- AUDIT_ARCH_* of syscall.   
  -- X/Open requires some more fields with fixed names.   
  -- Values for `si_code'.  Positive values are reserved for kernel-generated
  --   signals.   

  -- Sent by asynch name lookup completion.   
  -- Sent by tkill.   
  -- Sent by queued SIGIO.  
  -- Sent by AIO completion.   
  -- Sent by real time mesq state change.   
  -- Sent by timer expiration.   
  -- Sent by sigqueue.   
  -- Sent by kill, sigsend.   
  -- Send by kernel.   
  -- `si_code' values for SIGILL signal.   
  -- Illegal opcode.   
  -- Illegal operand.   
  -- Illegal addressing mode.   
  -- Illegal trap.  
  -- Privileged opcode.   
  -- Privileged register.   
  -- Coprocessor error.   
  -- Internal stack error.   
  -- `si_code' values for SIGFPE signal.   
  -- Integer divide by zero.   
  -- Integer overflow.   
  -- Floating point divide by zero.   
  -- Floating point overflow.   
  -- Floating point underflow.   
  -- Floating point inexact result.   
  -- Floating point invalid operation.   
  -- Subscript out of range.   
  -- `si_code' values for SIGSEGV signal.   
  -- Address not mapped to object.   
  -- Invalid permissions for mapped object.   
  -- `si_code' values for SIGBUS signal.   
  -- Invalid address alignment.   
  -- Non-existant physical address.   
  -- Object specific hardware error.   
  -- Hardware memory error: action required.   
  -- Hardware memory error: action optional.   
  -- `si_code' values for SIGTRAP signal.   
  -- Process breakpoint.   
  -- Process trace trap.   
  -- `si_code' values for SIGCHLD signal.   
  -- Child has exited.   
  -- Child was killed.   
  -- Child terminated abnormally.   
  -- Traced child has trapped.   
  -- Child has stopped.   
  -- Stopped child has continued.   
  -- `si_code' values for SIGPOLL signal.   
  -- Data input available.   
  -- Output buffers available.   
  -- Input message available.    
  -- I/O error.   
  -- High priority input available.   
  -- Device disconnected.   
  -- Structure to transport application-defined values with signals.   
  -- Forward declaration.   
   type sigevent;
   type anon_33;
   type anon_34 is record
      u_function : access procedure (arg1 : sigval_t);  -- bits/siginfo.h:336
      u_attribute : access CUPS.bits_pthreadtypes_h.pthread_attr_t;  -- bits/siginfo.h:337
   end record;
   pragma Convention (C_Pass_By_Copy, anon_34);
   type sigevent_u_pad_array is array (0 .. 11) of aliased int;
   type anon_33 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            u_pad : aliased sigevent_u_pad_array;  -- bits/siginfo.h:328
         when 1 =>
            u_tid : aliased CUPS.bits_types_h.uu_pid_t;  -- bits/siginfo.h:332
         when others =>
            u_sigev_thread : aliased anon_34;  -- bits/siginfo.h:338
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_33);
   pragma Unchecked_Union (anon_33);type sigevent is record
      sigev_value : aliased sigval_t;  -- bits/siginfo.h:322
      sigev_signo : aliased int;  -- bits/siginfo.h:323
      sigev_notify : aliased int;  -- bits/siginfo.h:324
      u_sigev_un : aliased anon_33;  -- bits/siginfo.h:339
   end record;
   pragma Convention (C_Pass_By_Copy, sigevent);  -- bits/siginfo.h:320

  -- When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
  --	   thread to receive the signal.   

  -- Function to start.   
  -- Thread attributes.   
   subtype sigevent_t is sigevent;

  -- POSIX names to access some of the members.   
  -- `sigev_notify' values.   
  -- Notify via signal.   
  -- Other notification: meaningless.   
  -- Deliver via thread creation.   
  -- Send signal to specific thread.   
end CUPS.bits_siginfo_h;
