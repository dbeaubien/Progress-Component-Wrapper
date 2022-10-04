//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_SetProgress (progressIdentifier; progress{; subTitleMessage})
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress SET PROGRESS" command.
//
var $1; $progress_identifier : Integer
var $2; $progress : Real
var $3; $subTitleMessage : Text  // OPTIONAL
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259>=2)
ASSERT:C1129(Count parameters:C259<=3)
$progress_identifier:=$1
$progress:=$2
If (Count parameters:C259>=3)
	$subTitleMessage:=$3
End if 

If ($progress_identifier>0)
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
End if 