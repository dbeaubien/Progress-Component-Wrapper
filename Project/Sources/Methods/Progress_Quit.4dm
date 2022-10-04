//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_Quit (progressIdentifier)
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress QUIT" command.
//
#DECLARE($progress_identifier : Integer)
// ----------------------------------------------------
// HISTORY
//   Created by: DB (08/10/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=1)

var $inputs : Object
$inputs:=New object:C1471("progressId"; $progress_identifier)

var $signal : Object
$signal:=New signal:C1641("progress signal")

CALL WORKER:C1389(WorkerName; "Worker"; "QUIT"; $signal; $inputs)

var $signaled : Boolean
$signaled:=$signal.wait(2)  // wait for 2 seconds max