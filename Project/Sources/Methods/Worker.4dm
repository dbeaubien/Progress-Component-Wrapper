//%attributes = {"invisible":true,"preemptive":"incapable"}
// Worker (action, signal; inputs)
//
#DECLARE($action : Text\
; $signal : Object\
; $inputs : Object)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=3)

var $progress_identifier : Integer
$progress_identifier:=Num:C11($inputs.progressId)

Case of 
	: ($action="NEW")
		$progress_identifier:=Progress New()
		Use ($signal)
			$signal.progressId:=$progress_identifier
		End use 
		
		
	: ($action="QUIT")
		Progress QUIT($progress_identifier)
		
		
	: ($action="SET TITLE")
		Case of 
			: ($inputs.numParameters=2)
				Progress SET TITLE($progress_identifier; $inputs.title)
			: ($inputs.numParameters=3)
				Progress SET TITLE($progress_identifier; $inputs.title; $inputs.progress)
			: ($inputs.numParameters=4)
				Progress SET TITLE($progress_identifier; $inputs.title; $inputs.progress; $inputs.subTitle)
		End case 
		
		
	: ($action="SET MESSAGE")
		Progress SET MESSAGE($progress_identifier; $inputs.subTitle)
		
		
	: ($action="SET PROGRESS")
		Case of 
			: ($inputs.numParameters=2)
				Progress SET PROGRESS($progress_identifier; $inputs.progress)
			: ($inputs.numParameters=3)
				Progress SET PROGRESS($progress_identifier; $inputs.progress; $inputs.subTitle)
		End case 
		
		
	: ($action="SET BUTTON ENABLED")
		Progress SET BUTTON ENABLED($progress_identifier; $inputs.isEnabled)
		
		
	: ($action="WAS STOPPED?")
		Use ($signal)
			$signal.wasStopped:=Progress Stopped($progress_identifier)
		End use 
		
End case 

$signal.trigger()  // The work is finished