
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
