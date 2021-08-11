//%attributes = {"invisible":true,"preemptive":"incapable"}
// Worker (action, signal; inputs)
//
// DESCRIPTION
//   
//
var $1; $action : Text
var $2; $signal : Object
var $3; $inputs : Object
// ----------------------------------------------------
// HISTORY
//   Created by: DB (08/10/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=3)
$action:=$1
$signal:=$2
$inputs:=$3

var $progressIdentifier : Integer
$progressIdentifier:=Num:C11($inputs.progressId)

Case of 
	: ($action="NEW")
		$progressIdentifier:=Progress New()
		Use ($signal)
			$signal.progressId:=$progressIdentifier
		End use 
		
		
	: ($action="QUIT")
		Progress QUIT($progressIdentifier)
		
		
	: ($action="SET TITLE")
		Case of 
			: ($inputs.numParameters=2)
				Progress SET TITLE($progressIdentifier; $inputs.title)
			: ($inputs.numParameters=3)
				Progress SET TITLE($progressIdentifier; $inputs.title; $inputs.progress)
			: ($inputs.numParameters=4)
				Progress SET TITLE($progressIdentifier; $inputs.title; $inputs.progress; $inputs.subTitle)
		End case 
		
		
	: ($action="SET MESSAGE")
		Progress SET MESSAGE($progressIdentifier; $inputs.subTitle)
		
		
	: ($action="SET PROGRESS")
		Case of 
			: ($inputs.numParameters=2)
				Progress SET PROGRESS($progressIdentifier; $inputs.progress)
			: ($inputs.numParameters=3)
				Progress SET PROGRESS($progressIdentifier; $inputs.progress; $inputs.subTitle)
		End case 
		
		
	: ($action="SET BUTTON ENABLED")
		Progress SET BUTTON ENABLED($progressIdentifier; $inputs.isEnabled)
		
		
	: ($action="WAS STOPPED?")
		Use ($signal)
			$signal.wasStopped:=Progress Stopped($progressIdentifier)
		End use 
		
End case 

$signal.trigger()  // The work is finished