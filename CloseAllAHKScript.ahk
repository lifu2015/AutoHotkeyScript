; =====================================================================
; Script Information
; =====================================================================
; Author: lifu
; Date: 2024-05
; Description: This script closes all other running instances of AutoHotkey
;              scripts except the current one.
; Usage: Run this script with AutoHotkey to terminate other AutoHotkey
;        script instances. It uses WMI to query processes and DllCall to
;        get the current process ID.
; =====================================================================

currentPID := DllCall("GetCurrentProcessId")
; Enumerate all processes
for process in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process where Name='AutoHotkey.exe'")
{
    pid := process.ProcessId
    ; Close other scripts, keeping the current script running
    if (pid != currentPID)
    {
        Process, Close, %pid%
    }
}
