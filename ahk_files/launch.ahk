#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance,force
FileCreateShortcut,%A_ScriptFullPath%,%A_Startup%/launch.lnk
IfExist,%A_Startup%/launch.lnk
{
FileDelete,%A_Startup%/launch.lnk
FileCreateShortcut,%A_ScriptFullPath%,%A_Startup%/launch.lnk
}

#NoEnv
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
FileReadLine,current,settings.ini,2
Hotkey,%current%,ShowGui,On
return

ShowGui:
Run,launcher.ahk
return

GuiClose:
ExitApp