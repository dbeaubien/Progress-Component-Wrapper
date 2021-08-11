//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_SetTitle (progressIdentifier; titleMessage{; progress{; subTitleMessage}})
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress SET TITLE" command.
//
var $1; $progressIdentifier : Integer
var $2; $titleMessage : Text
var $3; $progress : Real  // OPTIONAL
var $4; $subTitleMessage : Text  // OPTIONAL
// ----------------------------------------------------
// HISTORY
//   Created by: DB (08/10/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259>=2)
ASSERT:C1129(Count parameters:C259<=4)
$progressIdentifier:=$1
$titleMessage:=$2
If (Count parameters:C259>=3)
	$progress:=$3
End if 
If (Count parameters:C259>=4)
	$subTitleMessage:=$4
End if 

var $inputs : Object
$inputs:=New object:C1471("progressId"; $progressIdentifier)
$inputs.numParameters:=Count parameters:C259
$inputs.title:=$titleMessage
$inputs.progress:=$progress
$inputs.subTitle:=$subTitleMessage

var $signal : Object
var $signaled : Boolean
$signal:=New signal:C1641("progress signal")

CALL WORKER:C1389(1; "Worker"; "SET TITLE"; $signal; $inputs)

$signaled:=$signal.wait(2)  // wait for 2 seconds max

$0:=$progressIdentifier