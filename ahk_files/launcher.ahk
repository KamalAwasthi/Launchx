/*
**************************************************************************************************
LAUNCH-X-by, KAMAL AWASTHI
A DIRECT LAUNCHER WITH CUSTOMIZABLE BUTTON FOR YOUR PERSONAL USE
WRITTEN ON AUTOHOTKEY SCRIPT
**************************************************************************************************
**************************************************************************************************
  I have a lot of fun coding this, and hope you will
  enjoy using it too. Feel free to drop me an email with
  your comments and feedback at: kamalawasthi97 (*a.t*) gmail.com
**************************************************************************************************
*/

#NoEnv
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
SetBatchLines, -1
Page = http://www.kamalahktips.blogspot.com

FileReadLine,current,settings.ini,3

;Reading the ini file

IniRead,currentfile,settings.ini,filelog,current
   if(currentfile= "ERROR")
   {
      IniWrite,0,settings.ini,filelog,current
   }
IniRead,nextfile,settings.ini,filelog,next
   if(nextfile= "ERROR")
   {
      IniWrite,1,settings.ini,filelog,next
   }
IniRead,current3,settings.ini,filelog,extra
   if(current3= "ERROR")
   {
      IniWrite,0,settings.ini,filelog,extra
   }

/*
******************************
Controlling the window styles
******************************
*/

Gui,+Border +Caption +e0x80 +Toolwindow
TransColor = D4D1CF
Gui, Color, %transColor%

/*
***********
 GLOBALS
***********
*/
global x_axis:=20
global y_axis:=30
global Array := Object()
global Path := Object()
global count:=0



/*
***************
MENU OPTIONS                                                                                         
***************
*/

Menu, FileMenu, Add, &About, MenuAbout
Menu, FileMenu, Add, &Exit, MenuExit
Menu, HelpMenu, Add, &Help, HelpAbout
Menu, HelpMenu, Add, &Online Help,help
Menu,SettingsMenu,Add,&Shortcut,Settings
Menu,SettingsMenu,Add,&Delete_All,Delete_All

; Create the menu bar by attaching the sub-menus to it:
Menu, MyMenuBar, Add, &Menu, :FileMenu
Menu, MyMenuBar, Add, &Help, :HelpMenu
MENU, MyMenuBar, Add, &Settings, :SettingsMenu

; Attach the menu bar to the window:
Gui, Menu, MyMenuBar

;Menu,logo.png,,1
Menu, Tray, Icon,,,1

;***************************
;shortcut setting Gui
;***************************
;A1F1A0
Gui, 2:Color,A0E1D0
Gui,2:+Border +Caption -e0x90 +Toolwindow
TransColor = D4D1CF
Gui, 2:Font, S16 CBlue,  Verdana 
Gui, 2:Add, Text, x40 y10 w400 h25  , Change Your Shortcut 
Gui, 2:Font, S14 CBlue,  Verdana 
Gui, 2:Add, Text, x20 y70 w150 h20 , Active Shortcut
Gui, 2:Font, S12 CBlack,  Verdana 
Gui, 2:Add, Hotkey, x200 y70 w170 h25 gnewkey vhotkey,
Gui, 2:Font, S14 CBlue,  Verdana 
;Gui, Add, Link,, This is a <a href="http://ahkscript.org">link</a>
Gui, 2:Add,Text, x20 y160 w400 h20 ghome ,Launchx Home
Gui, 2:Font, S10 CBlue,  Verdana 
Gui, 2:Add, Button,x300 y100 gSave,&Save




/*
*******************************
  TRAY   settings
********************************
*/
Menu, Tray, NoStandard
Menu, Tray, Tip, Launch-X by Kamal Awasthi
Menu, Tray, Add, About, about
Menu, Tray, Add,
Menu, Tray, Add, Settings,setting 
Menu, Tray, Add,
Menu, Tray, Add, Visit Launch-X Home, help
Menu, Tray, Add
Menu, Tray, Add, Quit, quit



/*
*************************************************
 MAIN PROGRAMME
*************************************************
*/

Gui, Color,D1F1A0 
 WinSet, Transparent, 190
Loop, Read, path%currentfile%.ka                                           ;LOOP TO READ THE BUTTON FILE
{
    Array.Insert(A_LoopReadLine) 
}


Loop, Read,run%currentfile%.ka                                          ;LOOP TO READ THE PATH FILE
{
  Path.Insert(A_LoopReadLine)
}

gui, font, s10 CBlue, Verdana                                                              ;SETTING THE FONT

for index, element in Array                                         ;ADDING THE BUUTONS ON WINDOW
{
	;Gui,Color,EEAA99
	;Gui, Font, s10 CWhite, Verdana 
  Gui,Add,Button,gArray%A_Index%  X%x_axis%  Y%y_axis% w100 h30, %   "" . element

if (x_axis==20)                               ;SETTING THE POSITONS OF BUTTONS
{
 x_axis:=x_axis+110
}
else
{
x_axis:=20
y_axis:=y_axis+45
}

 count:=count+1
}
temp:=y_axis+60 
Gui,Add,Button,x20 y%temp% w210 h30 cWhite gDelete ,&Remove A Button                  ;ADDING THE +ADD BUTTON
;Gui,Add,Button,X130 Y%temp% w100 h30 CBlue,&Delete_All   
temp:=y_axis+45+60
Gui,Add,Button,x20 y%temp% w100 h30 cWhite ,Add_New                  ;ADDING THE +ADD BUTTON
Gui,Add,Button,X130 Y%temp% w100 h30 CBlue,&Exit_App                 ;ADDING THE CLOSE BUTTON
Gui,Show,w250,Launch-X ;PUTS ALL GUI ON WINDOW
return

/*
*****************************
end of main programe
*****************************
*/

quit:
ButtonExit_App:                 ;g-LABEL FOE CLOSE BUTTON
GuiClose: 
ExitApp
return 

/*
****************************
MENU EVENT 
****************************
*/

about:
MenuAbout:       
MsgBox,**************************************************************************************`nLaunch-X`n-by Kamal Awasthi(kamalahktips.blogspot.in)`n**************************************************************************************`nInstructions`n1)The default Hotkey is:[Ctrl]+[G]`n2)Use Add_New Button to add the shortcut buttons.`n3)You can add add a Folder or a File by choosing the appropriate option henced poped up.`n4)Enter the name of the button you wanna see as hint for the destination folder/file.`n5)Choose the file/folder.`n6)all set your button is added on the app.`n8)You can change the Hotkey by Settings->Shortcuts
return

MenuExit:
ExitApp
return

home:
help:
Browse("http://kamalahktips.blogspot.in/")
return

HelpAbout:
MsgBox,***************************ADDING THE NEW BUTTON:***************************`n1)The default Hotkey is:[Ctrl]+[G]`n2)Use Add_New Button to add the shortcut buttons.`n3)You can add add a Folder or a File by choosing the appropriate option henced poped up.`n4)Enter the name of the button you wanna see as hint for the destination folder/file.`n5)Choose the file/folder.`n6)all set your button is added on the app.`n8)You can change the Hotkey by Settings->Shortcuts `n`n***********************DELETING A BUTTON***********************`n1.)Click on the 'Remove A Button' button.`n2.) A new window will open caontaining a list of the shortcut buttons you have added sa far. just click on the name of the button you want to remove.`n
return

setting:
Settings:
GuiControl,2:,hotkey,%current%
Gui, 2:Show, w400 h200, New Shortcut
return

Delete_All:
FileDelete,path%currentfile%.ka
FileDelete,run%currentfile%.ka
Reload
return

Save:
Run,launch.ahk
Reload
return

Delete:
Run,delete.ahk
return

ButtonDelete_All:
FileDelete,path%currentfile%.ka
FileDelete,run%currentfile%.ka
Reload
return

/*
****************************
 BUTTON EVENTS
****************************
*/
 Array1:
t:=Path[1]
Run,%t%
ExitApp
return

Array2:
t:=Path[2]
Run,%t%
ExitApp
return

Array3:
t:=Path[3]
Run,%t%
ExitApp
return

Array4:
t:=Path[4]
Run,%t%
ExitApp
return

Array5:
g:=Path[5]
Run,%g%
ExitApp
return

Array6:
g:=Path[6]
Run,%g%
ExitApp
return

Array7:
g:=Path[7]
Run,%g%
ExitApp
return

Array8:
g:=Path[8]
Run,%g%
ExitApp
return

Array9:
g:=Path[9]
Run,%g%
ExitApp
return

Array10:
g:=Path[10]
Run,%g%
ExitApp
return


Array11:
g:=Path[11]
Run,%g%
ExitApp
return


Array12:
g:=Path[12]
Run,%g%
ExitApp
return


Array13:
g:=Path[13]
Run,%g%
ExitApp
return

Array14:
g:=Path[14]
Run,%g%
ExitApp
return


Array15:
g:=Path[15]
Run,%g%
ExitApp
return


Array16:
g:=Path[16]
Run,%g%
ExitApp
return


Array17:
g:=Path[17]
Run,%g%
ExitApp
return


Array18:
g:=Path[18]
Run,%g%
ExitApp
return


Array19:
g:=Path[`9]
Run,%g%
ExitApp
return

Array20:
g:=Path[20]
Run,%g%
ExitApp
return


/*
**************************
newhotkey
**************************
*/
newkey:
Gui, 2:Submit, Nohide
IfNotEqual, hotkey
{
Fileatline("settings.ini", hotkey, 3)
Hotkey,%current%,ShowGUI, Off
Hotkey,%hotkey%,ShowGUI, On
current := hotkey
}
return

/*
***************************
Show Shortcut Reset window
***************************
*/
ShowGui:
WinActivate,Launch-X
return

/*
****************
+ADD_EVENT
****************
*/
ButtonAdd_New:
Gui, 3:Color,0xefe6a3
Gui,3:+Border +Caption -e0x90 +Toolwindow
TransColor = D4D1CF

Gui,3:Font,S10 CBlue, Verdana
Gui,3:Add,Text, x20 y10 w150 h30,_Add New?
Gui,3:Add,Button,x15 y70 w100 h30 gfolder ,&Folder
Gui,3:Add,Button,x135 y70 w100 h30 gfile,&File
Gui,3:Add,Button,x190 y140 w55 h30 gcan,&Cancel
Gui,3:Show,w250 h180,Selection
return

can:
Gui,3:Hide
return

folder:
Gui,3:Hide
InputBox, OutputVar, File Name, Button name?   ;ASKING THE BUTTON NAME
if  OutputVar=                                 ;IF NONE IS SELECTED , RETURN
return
 FileSelectFolder,Path, ,3,Select the Folder
 if Path=                                        ;IF INPUT IS EMPTY,RETURN ,OTHERWISE CONTINUE
return
 FileAppend,        
(
%OutputVar% 

), path%currentfile%.ka
FileAppend,
(
%Path%
 
),run%currentfile%.ka
Reload
return

file:
Gui,3:Hide
InputBox, OutputVar, File Name, Button name?   ;ASKING THE BUTTON NAME
if  OutputVar=                                 ;IF NONE IS SELECTED , RETURN
return
FileSelectFile,Path, , 3, Select the file
if Path=                                        ;IF INPUT IS EMPTY,RETURN ,OTHERWISE CONTINUE
return
FileAppend,        
(
%OutputVar% 

), path%currentfile%.ka


FileAppend,
(
%Path%
 
),run%currentfile%.ka
Reload
return


/*
**********************
Functions definition
**********************
*/
FILEATLINE(file, filecon, number){
loop
{
	FileReadLine,readline,%file%,%A_index%
	if Errorlevel = 1
		lineended := true , readline := ""

	if !(A_index == number)
		filedata .= readline . "`r`n"
	else
		filedata .= filecon . "`r`n"

	if (A_index >= number)
		if (lineended)
			break
}
StringTrimRight,filedata,filedata,2
FileDelete, %file%
FileAppend, %filedata%, %file%
}


Browse(site){
RegRead, OutputVar, HKEY_CLASSES_ROOT, http\shell\open\command 
  run,% "iexplore.exe" . " """ . site . """"	;internet explorer
}
