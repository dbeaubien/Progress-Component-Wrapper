//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_SetTitle (progressIdentifier; titleMessage{; progress{; subTitleMessage}})
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress SET TITLE" command.
//
#DECLARE($progress_identifier : Integer\
; $titleMessage : Text\
; $progress : Real\
; $subTitleMessage : Text)
// ----------------------------------------------------
ASSERT:C1129((Count parameters:C259>=2) && (Count parameters:C259<=4))

If ($progress_identifier<=0)
	return 
End if 

var $inputs : Object
$inputs:=New object:C1471("progressId"; $progress_identifier)
$inputs.numParameters:=Count parameters:C259
$inputs.title:=$titleMessage
$inputs.progress:=$progress
$inputs.subTitle:=$subTitleMessage

var $signal : Object
$signal:=New signal:C1641("progress signal")

CALL WORKER:C1389(WorkerName; "Worker"; "SET TITLE"; $signal; $inputs)

var $signaled : Boolean
$signaled:=$signal.wait(2)  // wait for 2 seconds max