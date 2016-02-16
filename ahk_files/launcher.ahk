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
FileReadLine,current,settings.ini,2
FileReadLine,current1,settings.ini,3
FileReadLine,current2,settings.ini,4
FileReadLine,current3,settings.ini,5
Hotkey,%current%,ShowGui,On

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
Loop, Read, path%current1%.ka                                           ;LOOP TO READ THE BUTTON FILE
{
    Array.Insert(A_LoopReadLine) 
}


Loop, Read,run%current1%.ka                                          ;LOOP TO READ THE PATH FILE
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
FileDelete,path%current1%.ka
FileDelete,run%current1%.ka
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
FileDelete,path%current1%.ka
FileDelete,run%current1%.ka
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
Fileatline("settings.ini", hotkey, 2)
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

), path%current1%.ka
FileAppend,
(
%Path%
 
),run%current1%.ka
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

), path%current1%.ka


FileAppend,
(
%Path%
 
),run%current1%.ka
Reload
return

/*
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

FileAppend,        
(
%OutputVar% 

), path.ka


FileAppend,
(
%Path%
 
),run.ka
Reload
return
*/

/*
**********************
Functions definition
**********************
*/
Fileatline(file, filecon, number){
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


SetBtnTxtColor(HWND, TxtColor) {
   Static HTML := {BLACK: "000000", GRAY: "808080", SILVER: "C0C0C0", WHITE: "FFFFFF", MAROON: "800000"
                , PURPLE: "800080", FUCHSIA: "FF00FF", RED: "FF0000", GREEN:  "008000", OLIVE:  "808000"
                , YELLOW: "FFFF00", LIME: "00FF00", NAVY: "000080", TEAL: "008080", AQUA: "00FFFF", BLUE: "0000FF"}
   Static BS_CHECKBOX := 0x2, BS_RADIOBUTTON := 0x4, BS_GROUPBOX := 0x7, BS_AUTORADIOBUTTON := 0x9
        , BS_LEFT := 0x100, BS_RIGHT := 0x200, BS_CENTER := 0x300, BS_TOP := 0x400, BS_BOTTOM := 0x800
        , BS_VCENTER := 0xC00, BS_BITMAP := 0x0080, SA_LEFT := 0x0, SA_CENTER := 0x1, SA_RIGHT := 0x2
        , WM_GETFONT := 0x31, BCM_SETIMAGELIST := 0x1602, IMAGE_BITMAP := 0x0, BITSPIXEL := 0xC
        , RCBUTTONS := BS_CHECKBOX | BS_RADIOBUTTON | BS_AUTORADIOBUTTON
        , BUTTON_IMAGELIST_ALIGN_LEFT := 0, BUTTON_IMAGELIST_ALIGN_RIGHT := 1, BUTTON_IMAGELIST_ALIGN_CENTER := 4
   ; -------------------------------------------------------------------------------------------------------------------
   ErrorLevel := ""
   GDIPDll := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "Ptr")
   VarSetCapacity(SI, 24, 0)
   Numput(1, SI)
   DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", GDIPToken, "Ptr", &SI, "Ptr", 0)
   If (!GDIPToken) {
       ErrorLevel := "GDIPlus could not be started!`n`nSetBtnTxtColor won't work!"
       Return False
   }
   If !DllCall("User32.dll\IsWindow", "Ptr", HWND) {
      GoSub, CreateImageButton_GDIPShutdown
      ErrorLevel := "Invalid parameter HWND!"
      Return False
   }
   WinGetClass, BtnClass, ahk_id %HWND%
   ControlGet, BtnStyle, Style, , , ahk_id %HWND%
   If (BtnClass != "Button") || ((BtnStyle & 0xF ^ BS_GROUPBOX) = 0) || ((BtnStyle & RCBUTTONS) > 1) {
      GoSub, CreateImageButton_GDIPShutdown
      ErrorLevel := "You can use SetBtnTxtColor only for PushButtons!"
      Return False
   }
   PFONT := 0
   DC := DllCall("User32.dll\GetDC", "Ptr", HWND, "Ptr")
   BPP := DllCall("Gdi32.dll\GetDeviceCaps", "Ptr", DC, "Int", BITSPIXEL)
   HFONT := DllCall("User32.dll\SendMessage", "Ptr", HWND, "UInt", WM_GETFONT, "Ptr", 0, "Ptr", 0, "Ptr")
   DllCall("Gdi32.dll\SelectObject", "Ptr", DC, "Ptr", HFONT)
   DllCall("Gdiplus.dll\GdipCreateFontFromDC", "Ptr", DC, "PtrP", PFONT)
   DllCall("User32.dll\ReleaseDC", "Ptr", HWND, "Ptr", DC)
   If !(PFONT) {
      GoSub, CreateImageButton_GDIPShutdown
      ErrorLevel := "Couldn't get button's font!"
      Return False
   }
   VarSetCapacity(RECT, 16, 0)
   If !(DllCall("User32.dll\GetClientRect", "Ptr", HWND, "Ptr", &RECT)) {
      GoSub, CreateImageButton_GDIPShutdown
      ErrorLevel := "Couldn't get button's rectangle!"
      Return False
   }
   W := NumGet(RECT,  8, "Int"), H := NumGet(RECT, 12, "Int")
   BtnCaption := ""
   Len := DllCall("User32.dll\GetWindowTextLength", "Ptr", HWND) + 1
   If (Len > 1) {
      VarSetCapacity(BtnCaption, Len * (A_IsUnicode ? 2 : 1), 0)
      If !(DllCall("User32.dll\GetWindowText", "Ptr", HWND, "Str", BtnCaption, "Int", Len)) {
         GoSub, CreateImageButton_GDIPShutdown
         ErrorLevel := "Couldn't get button's caption!"
         Return False
      }
      VarSetCapacity(BtnCaption, -1)
   } Else {
      GoSub, CreateImageButton_GDIPShutdown
      ErrorLevel := "Couldn't get button's caption!"
      Return False
   }
   If HTML.HasKey(TxtColor)
      TxtColor := HTML[TxtColor]
   DllCall("Gdiplus.dll\GdipCreateBitmapFromScan0", "Int", W, "Int", H, "Int", 0
         , "UInt", 0x26200A, "Ptr", 0, "PtrP", PBITMAP)
   DllCall("Gdiplus.dll\GdipGetImageGraphicsContext", "Ptr", PBITMAP, "PtrP", PGRAPHICS)
   DllCall("Gdiplus.dll\GdipStringFormatGetGenericTypographic", "PtrP", PFORMAT)
   HALIGN := (BtnStyle & BS_CENTER) = BS_CENTER ? SA_CENTER : (BtnStyle & BS_CENTER) = BS_RIGHT ? SA_RIGHT
           : (BtnStyle & BS_CENTER) = BS_Left ? SA_LEFT : SA_CENTER
   DllCall("Gdiplus.dll\GdipSetStringFormatAlign", "Ptr", PFORMAT, "Int", HALIGN)
   VALIGN := (BtnStyle & BS_VCENTER) = BS_TOP ? 0 : (BtnStyle & BS_VCENTER) = BS_BOTTOM ? 2 : 1
   DllCall("Gdiplus.dll\GdipSetStringFormatLineAlign", "Ptr", PFORMAT, "Int", VALIGN)
   DllCall("Gdiplus.dll\GdipSetTextRenderingHint", "Ptr", PGRAPHICS, "Int", 3)
   NumPut(4, RECT, 0, "Float"), NumPut(2, RECT, 4, "Float")
   NumPut(W - 8, RECT, 8, "Float"), NumPut(H - 4, RECT, 12, "Float")
   DllCall("Gdiplus.dll\GdipCreateSolidFill", "UInt", "0xFF" . TxtColor, "PtrP", PBRUSH)
   DllCall("Gdiplus.dll\GdipDrawString", "Ptr", PGRAPHICS, "WStr", BtnCaption, "Int", -1, "Ptr", PFONT, "Ptr", &RECT
         , "Ptr", PFORMAT, "Ptr", PBRUSH)
   DllCall("Gdiplus.dll\GdipCreateHBITMAPFromBitmap", "Ptr", PBITMAP, "PtrP", HBITMAP, "UInt", 0X00FFFFFF)
   DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", PBITMAP)
   DllCall("Gdiplus.dll\GdipDeleteBrush", "Ptr", PBRUSH)
   DllCall("Gdiplus.dll\GdipDeleteStringFormat", "Ptr", PFORMAT)
   DllCall("Gdiplus.dll\GdipDeleteGraphics", "Ptr", PGRAPHICS)
   DllCall("Gdiplus.dll\GdipDeleteFont", "Ptr", PFONT)
   HIL := DllCall("Comctl32.dll\ImageList_Create", "UInt", W, "UInt", H, "UInt", BPP, "Int", 1, "Int", 0, "Ptr")
   DllCall("Comctl32.dll\ImageList_Add", "Ptr", HIL, "Ptr", HBITMAP, "Ptr", 0)
   VarSetCapacity(BIL, 20 + A_PtrSize, 0)
   NumPut(HIL, BIL, 0, "Ptr"), Numput(BUTTON_IMAGELIST_ALIGN_CENTER, BIL, A_PtrSize + 16, "UInt")
   GuiControl, , %HWND%
   SendMessage, BCM_SETIMAGELIST, 0, 0, , ahk_id %HWND%
   SendMessage, BCM_SETIMAGELIST, 0, &BIL, , ahk_id %HWND%
   GoSub, CreateImageButton_FreeBitmaps
   GoSub, CreateImageButton_GDIPShutdown
   Return True
   ; -------------------------------------------------------------------------------------------------------------------
   CreateImageButton_FreeBitmaps:
      DllCall("Gdi32.dll\DeleteObject", "Ptr", HBITMAP)
   Return    
   ; -------------------------------------------------------------------------------------------------------------------
   CreateImageButton_GDIPShutdown:
      DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", GDIPToken)
      DllCall("Kernel32.dll\FreeLibrary", "Ptr", GDIPDll)
   Return
}