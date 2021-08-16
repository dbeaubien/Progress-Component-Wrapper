//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_Quit (progressIdentifier)
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress QUIT" command.
//
var $1; $progressIdentifier : Integer
// ----------------------------------------------------
// HISTORY
//   Created by: DB (08/10/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=1)
$progressIdentifier:=$1

var $inputs : Object
$inputs:=New object:C1471("progressId"; $progressIdentifier)

var $signal : Object
var $signaled : Boolean
$signal:=New signal:C1641("progress signal")

CALL WORKER:C1389(WorkerName; "Worker"; "QUIT"; $signal; $inputs)
CALL WORKER:C1389(WorkerName; "Worker"; "DIE"; $signal; $inputs)  // we are done with this now.

$signaled:=$signal.wait(2)  // wait for 2 seconds max

$0:=$progressIdentifier