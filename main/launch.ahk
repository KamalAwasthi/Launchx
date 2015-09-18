#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#NoEnv
#SingleInstance, force
SetWorkingDir %A_ScriptDir%

Menu, Tray, NoStandard
Menu, Tray, Tip, Launch-X by Kamal Awasthi
Menu, Tray, Add, About, about
Menu, Tray, Add,
Menu, Tray, Add, Visit Launch-X Home, help
Menu, Tray, Add
Menu, Tray, Add, Quit, quit

FileReadLine,current,settings.ini,2
Hotkey,%current%,ShowGui,On
return

ShowGui:
Run,launcher.exe
return

help:
Browse("http://kamalahktips.blogspot.in/")
return

about:       
Run,About.txt
return

Browse(site){
RegRead, OutputVar, HKEY_CLASSES_ROOT, http\shell\open\command 
  run,% "iexplore.exe" . " """ . site . """"	;internet explorer
}


quit:
GuiClose:
ExitApp
