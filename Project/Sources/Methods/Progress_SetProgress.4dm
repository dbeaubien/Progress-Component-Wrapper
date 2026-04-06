//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_SetProgress (progressIdentifier; progress{; subTitleMessage})
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress SET PROGRESS" command.
//
#DECLARE($progress_identifier : Integer\
; $progress : Real\
; $subTitleMessage : Text)
// ----------------------------------------------------
ASSERT:C1129((Count parameters:C259>=2) && (Count parameters:C259<=3))

If ($progress_identifier<=0)
	return 
End if 

var $inputs : Object
$inputs:=New object:C1471("progressId"; $progress_identifier)
$inputs.numParameters:=Count parameters:C259
$inputs.progress:=$progress
$inputs.subTitle:=$subTitleMessage

var $signal : Object
$signal:=New signal:C1641("progress signal")

CALL WORKER:C1389(WorkerName; "Worker"; "SET PROGRESS"; $signal; $inputs)

var $signaled : Boolean
$signaled:=$signal.wait(2)  // wait for 2 seconds max