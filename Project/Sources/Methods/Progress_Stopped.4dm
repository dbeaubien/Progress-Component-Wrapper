//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Progress_Stopped (progressIdentifier) : wasStopped
//
// DESCRIPTION
//   Pre-emptive capable replacement for the "Progress Stopped" command.
//
#DECLARE($progress_identifier : Integer)->$wasStopped : Boolean
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=1)
$wasStopped:=False:C215

If ($progress_identifier>0)
	var $inputs : Object
	$inputs:=New object:C1471("progressId"; $progress_identifier)
	
	var $signal : Object
	$signal:=New signal:C1641("progress signal")
	
	CALL WORKER:C1389(WorkerName; "Worker"; "WAS STOPPED?"; $signal; $inputs)
	
	var $signaled : Boolean
	$signaled:=$signal.wait(2)  // wait for 2 seconds max
	
	If ($signaled)
		$wasStopped:=$signal.wasStopped
	End if 
End if 
