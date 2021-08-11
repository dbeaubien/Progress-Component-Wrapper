//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_SetTitle (progressIdentifier; subTitleMessage)
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress SET TITLE" command.
//
var $1; $progressIdentifier : Integer
var $2; $subTitleMessage : Text
// ----------------------------------------------------
// HISTORY
//   Created by: DB (08/10/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=2)
$progressIdentifier:=$1
$subTitleMessage:=$2

var $inputs : Object
$inputs:=New object:C1471("progressId"; $progressIdentifier)
$inputs.subTitle:=$subTitleMessage

var $signal : Object
var $signaled : Boolean
$signal:=New signal:C1641("progress signal")

CALL WORKER:C1389(1; "Worker"; "SET MESSAGE"; $signal; $inputs)

$signaled:=$signal.wait(2)  // wait for 2 seconds max

$0:=$progressIdentifier