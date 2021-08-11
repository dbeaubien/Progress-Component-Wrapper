//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_SetProgress (progressIdentifier; progress{; subTitleMessage})
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress SET PROGRESS" command.
//
var $1; $progressIdentifier : Integer
var $2; $progress : Real
var $3; $subTitleMessage : Text  // OPTIONAL
// ----------------------------------------------------
// HISTORY
//   Created by: DB (08/10/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259>=2)
ASSERT:C1129(Count parameters:C259<=3)
$progressIdentifier:=$1
$progress:=$2
If (Count parameters:C259>=3)
	$subTitleMessage:=$3
End if 

var $inputs : Object
$inputs:=New object:C1471("progressId"; $progressIdentifier)
$inputs.numParameters:=Count parameters:C259
$inputs.progress:=$progress
$inputs.subTitle:=$subTitleMessage

var $signal : Object
var $signaled : Boolean
$signal:=New signal:C1641("progress signal")

CALL WORKER:C1389(1; "Worker"; "SET PROGRESS"; $signal; $inputs)

$signaled:=$signal.wait(2)  // wait for 2 seconds max

$0:=$progressIdentifier