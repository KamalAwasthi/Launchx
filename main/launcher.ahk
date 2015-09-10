
/*
**************************************************************************************************
LAUNCH-X-by, KAMAL AWASTHI
A DIRECT LAUNCHER WITH CUSTOMIZABLE BUTTON FOR YOUR PERSONAL USE
WRITTEN ON AUTOHOTKEY SCRIPT
**************************************************************************************************
*/ 

/*
**************************************************************************************************
  I have a lot of fun coding this, and hope you will
  enjoy using it too. Feel free to drop me an email with
  your comments and feedback at: kamalawasthi97 (*a.t*) gmail.com
**************************************************************************************************
:HOW TO LAUNCH?
1)THE SHORTCUT FOR THE APP IS [WINDOW_BUUTON]+[P]
2)SOME OF THE DEFAULT BUTTONS ARE ALREADY ADDED 
3)IF YOU WANT TO ADD SOME OF THE SHORTCUT AS PER YOUR REQUIRMENT ,YOU CAN ADD WITH +ADD_NEW BUTTON GIVEN AT THE        BOTTOM OF THE APP(ASIDE THE EXIT_APP BUTTON).
4) ON CLICKING THE _ADD BUTTON YOU WILL BE ASKED FOR THE BUTTON NAME(NAME OF THE BUTTON YOU WANT TO BE DISPLAYED ON APP WINDOW).
5)ENTER THE BUUTON NAME AND PRESS [ENTER].
6)FILE? OR FOLDER?,CHOOSE ACCORDDINGLY. 
7)SELECT THE FILE/FOLDER.
8)THE APP WILL BE CLOSED.RELAUNCH THE APP WITH THE SHORTCUT.
9)THE NEW BUTTON IS ADDED.
10)IT'S LIKE "WOW! HOW FUN!!!"
**************************************************************************************************
*/      

/*
*************************************************************************************************
MENU OPTIONS                                                                                         
*************************************************************************************************
*/

Menu, FileMenu, Add, &About, MenuAbout
Menu, FileMenu, Add, &Exit, MenuExit
Menu, HelpMenu, Add, &Help, HelpAbout

; Create the menu bar by attaching the sub-menus to it:
Menu, MyMenuBar, Add, &Menu, :FileMenu
Menu, MyMenuBar, Add, &Help, :HelpMenu

; Attach the menu bar to the window:
Gui, Menu, MyMenuBar

;set tray icon
Menu, Tray, Tip, Launch-X
Menu, Tray, Icon,,,1



/*
**************************
 GLOBALS
**************************
*/


global x_axis:=20
global y_axis:=100
global Array := Object()
global Path := Object()
global count:=0


/*
*************************************************
 MAIN PROGRAMME
*************************************************
*/


Loop, Read, path.ka                                           ;LOOP TO READ THE BUTTON FILE
{
    Array.Insert(A_LoopReadLine) 
}


Loop, Read,run.ka                                          ;LOOP TO READ THE PATH FILE
{
  Path.Insert(A_LoopReadLine)
}

Gui, Add, Picture, w80 h-1,..\Logo\logo.png                          ;ADDING A PIC ON WINDOW
gui, font, s10, Verdana                                                              ;SETTING THE FONT

for index, element in Array                                         ;ADDING THE BUUTONS ON WINDOW
{
  Gui,Add,Button,gArray%A_Index%  X%x_axis%  Y%y_axis%, % "" . index . "." . element

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

temp:=y_axis+45
Gui,Add,Button,gAdd  X20 Y%temp%,+&Add_New                  ;ADDING THE +ADD BUTTON

Gui,Add,Button,gClose  X130 Y%temp%,&Exit_App                 ;ADDING THE CLOSE BUTTON

;Gui +Resize  ;MAKE THE WINDOW RESIZABLE
Gui,Show,,Launch-X ;PUTS ALL GUI ON WINDOW

return

Close:                 ;g-LABEL FOE CLOSE BUTTON
GuiClose: 
ExitApp

/*
*********************************************************************************
        MENU EVENT 
*********************************************************************************
*/


MenuAbout:       
Run,About.txt
return

MenuExit:
ExitApp
return


HelpAbout:
Run,Help.txt
return


/*
******************************************************************
      BUTTON EVENTS
******************************************************************
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
*************************************************
    +ADD_EVENT
*************************************************
*/


Add:
InputBox, OutputVar, File Name, Button name?   ;ASKING THE BUTTON NAME
if  OutputVar=                                 ;IF NONE IS SELECTED , RETURN
return
InputBox, Input, File Path, 1.A_File? | 2.A_Folder?  _Enter the number:     ;ASKING FOR THE PATH
if Input=                                        ;IF INPUT IS EMPTY,RETURN ,OTHERWISE CONTINUE
return
if(Input==1)                 
{
FileSelectFile,Path, , 3, Select the file
}
else
{
FileSelectFolder,Path, ,3,Select the Folder
}

;EDITING THE FILES(APPENDING)

FileAppend,        
(
%OutputVar% 

), path.ka


FileAppend,
(
%Path%
 
), run.ka

MsgBox You added a new a button. Find it, next time you launch the "launcX"
ExitApp
return
