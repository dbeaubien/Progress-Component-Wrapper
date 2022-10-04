//%attributes = {"preemptive":"capable"}

var $progHdl; $progHdl2 : Integer
$progHdl:=Progress_New()
$progHdl2:=Progress_New()
DELAY PROCESS:C323(Current process:C322; 60)

Progress_SetTitle($progHdl; "message 1")
Progress_SetButtonEnabled($progHdl; True:C214)
Progress_SetTitle($progHdl2; "message 2")
DELAY PROCESS:C323(Current process:C322; 120)

Progress_SetTitle($progHdl; "message 2"; 0.25)
DELAY PROCESS:C323(Current process:C322; 60)

Progress_SetTitle($progHdl; "message 3"; 0.5; "message 2")
DELAY PROCESS:C323(Current process:C322; 60)

Progress_SetMessage($progHdl; "message 3.25")
DELAY PROCESS:C323(Current process:C322; 60)

Progress_SetProgress($progHdl; 0.25; "message 3")
DELAY PROCESS:C323(Current process:C322; 60)

If (Progress_Stopped($progHdl))
	BEEP:C151
End if 
DELAY PROCESS:C323(Current process:C322; 120)

Progress_Quit($progHdl)
DELAY PROCESS:C323(Current process:C322; 120)

Progress_Quit($progHdl2)