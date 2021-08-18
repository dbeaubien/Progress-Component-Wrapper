//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_SetButtonEnabled (progressIdentifier; isEnabled)
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress SET BUTTON ENABLED" command.
//
var $1; $progressIdentifier : Integer
var $2; $isEnabled : Boolean
// ----------------------------------------------------
// HISTORY
//   Created by: DB (08/10/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=2)
$progressIdentifier:=$1
$isEnabled:=$2

If ($progressIdentifier>0)
	var $inputs : Object
	$inputs:=New object:C1471("progressId"; $progressIdentifier)
	$inputs.numParameters:=Count parameters:C259
	$inputs.isEnabled:=$isEnabled
	
	var $signal : Object
	var $signaled : Boolean
	$signal:=New signal:C1641("progress signal")
	
	CALL WORKER:C1389(WorkerName; "Worker"; "SET BUTTON ENABLED"; $signal; $inputs)
	
	$signaled:=$signal.wait(2)  // wait for 2 seconds max
End if 

$0:=$progressIdentifier