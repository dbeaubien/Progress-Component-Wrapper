//%attributes = {"invisible":true,"preemptive":"capable"}
// WorkerName () : processName
//
#DECLARE()->$process_name : Text
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=0)

$process_name:="$progressWrapperWorker"