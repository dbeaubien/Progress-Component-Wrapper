//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_Stopped (progressIdentifier) : wasStopped
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress Stopped" command.
//
var $0; $wasStopped : Boolean
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

CALL WORKER:C1389(1; "Worker"; "WAS STOPPED?"; $signal; $inputs)

$signaled:=$signal.wait(2)  // wait for 2 seconds max

If ($signaled)
	$wasStopped:=$signal.wasStopped
End if 

$0:=$wasStopped