//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_SetTitle (progressIdentifier; subTitleMessage)
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress SET TITLE" command.
//
#DECLARE($progress_identifier : Integer\
; $subTitleMessage : Text)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=2)

If ($progress_identifier>0)
	var $inputs : Object
	$inputs:=New object:C1471("progressId"; $progress_identifier)
	$inputs.subTitle:=$subTitleMessage
	
	var $signal : Object
	$signal:=New signal:C1641("progress signal")
	
	CALL WORKER:C1389(WorkerName; "Worker"; "SET MESSAGE"; $signal; $inputs)
	
	var $signaled : Boolean
	$signaled:=$signal.wait(2)  // wait for 2 seconds max
End if 
