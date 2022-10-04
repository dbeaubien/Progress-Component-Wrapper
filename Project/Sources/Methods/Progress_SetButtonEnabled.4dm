//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_SetButtonEnabled (progress_identifier; isEnabled)
//
// DESCRIPTION
//   Pre-emptive capable replacement for 
//   the "Progress SET BUTTON ENABLED" command.
//
#DECLARE($progress_identifier : Integer\
; $isEnabled : Boolean)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=2)

If ($progress_identifier>0)
	var $inputs : Object
	$inputs:=New object:C1471("progressId"; $progress_identifier)
	$inputs.numParameters:=Count parameters:C259
	$inputs.isEnabled:=$isEnabled
	
	var $signal : Object
	$signal:=New signal:C1641("progress signal")
	
	CALL WORKER:C1389(WorkerName; "Worker"; "SET BUTTON ENABLED"; $signal; $inputs)
	
	var $signaled : Boolean
	$signaled:=$signal.wait(2)  // wait for 2 seconds max
End if 