//%attributes = {"preemptive":"capable"}

var $progHdl : Integer
$progHdl:=Progress_New()
Progress_SetTitle($progHdl; "message 1")

Progress_SetButtonEnabled($progHdl; True:C214)

Progress_SetTitle($progHdl; "message 2"; 0.25)
Progress_SetTitle($progHdl; "message 3"; 0.5; "message 2")

Progress_SetMessage($progHdl; "message 3.25")

Progress_SetProgress($progHdl; 0.25; "message 3")

If (Progress_Stopped($progHdl))
	BEEP:C151
End if 

Progress_Quit($progHdl)