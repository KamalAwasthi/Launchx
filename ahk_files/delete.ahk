#SingleInstance,force

gui, font, s10, Verdana 
Gui,Add,Text,, DOUBLE CLICK to Remove
Gui, Add, ListView, r11 w230 gMyListView -HScroll,FileName

/*
*************************
Redading the INI File
*********************
*/

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
*****************************
GLOBALS
**************************
*/
global source
global Array := Object()
global countline
countline:= 0
/*
*********************************
MAIN PROGRAMMING
*********************************
*/

Loop, Read, path%currentfile%.ka                                         ;LOOP TO READ THE BUTTON FILE
{
    Array.Insert(A_LoopReadLine) 
 LV_Add("",A_LoopReadLine )
 countline=countline+1
}          

/*
ADDING UP THE BUTTONS AT THE BOTTOM
*/
if(countline=0)
{MsgBox,No Button added.
	return
}

gui, font, s11, Verdana
;Gui,Add,Button, W100 gClose  X613 Y%countline%+20,&EXIT
Gui, Show, w250 ,Delete
return


MyListView:
if A_GuiEvent = DoubleClick
{
    LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
 Loop, Read, path%currentfile%.ka                                           ;LOOP TO READ THE BUTTON FILE
{
			current3:=current3+1
	
	if(current3 =A_EventInfo)
	{continue
	}
	
	
    FileAppend,        
   (
   %A_LoopReadline%
 
   ),path%nextfile%.ka
}
current3:=0
 Loop, Read, run%currentfile%.ka      ;LOOP TO READ THE BUTTON FILE
{
			current3:=current3+1
	
	if(current3 =A_EventInfo)
	{continue
	}
	
	
    FileAppend,        
   (
   %A_LoopReadline%
 
   ),run%nextfile%.ka
}

}
FileDelete,path%currentfile%.ka
FileDelete,run%currentfile%.ka
m:=currentfile+1
l:=nextfile+1
IniWrite, %m%,settings.ini,filelog,current
IniWrite, %l%,settings.ini,filelog, next
;TF_ReplaceLine("!settings.ini", 3, 3, m)
;TF_ReplaceLine("!settings.ini", 4, 4, l)
Run,launcher.ahk
ExitApp
return

Close:
GuiClose:  ; Indicate that the script should exit automatically when the window is closed.
ExitApp
