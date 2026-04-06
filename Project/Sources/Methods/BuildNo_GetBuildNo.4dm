//%attributes = {"invisible":true,"preemptive":"incapable"}
// BuildNo_GetBuildNo () : buildNoObj
// 
// DESCRIPTION
//   Returns a build no object or the component.
//   For example: {"releaseYear":"2017","releaseNo":"r1","buildNo":"20170529","versionShort":"2017.r1","versionLong":"2017.r1 (build 20170529)"}
//
//   NOTE: Cannot be run in a pre-emptive process.
//
#DECLARE()->$buildNoInfo : Object
// ----------------------------------------------------

ARRAY TEXT:C222($at_buildNo; 0)
LIST TO ARRAY:C288("BuildNo"; $at_buildNo)

If (Size of array:C274($at_buildNo)=0)  // Make sure there is at least one element 
	APPEND TO ARRAY:C911($at_buildNo; "")
End if 

var $value : Text
$value:=$at_buildNo{1}

If ($value#"") & ($value="{@")
	$buildNoInfo:=JSON Parse:C1218($value)
	
Else 
	$buildNoInfo:={}
	$buildNoInfo.releaseYear:=String:C10(Year of:C25(Current date:C33))
	$buildNoInforeleaseNo:="r1"
	$buildNoInfobuildNo:=Date2String(Current date:C33; "yyyymmdd")
	$buildNoInfoversionShort:=String:C10(Year of:C25(Current date:C33))+".r1"
	$buildNoInfoversionLong:=String:C10(Year of:C25(Current date:C33))+".r1 (build "+Date2String(Current date:C33; "yyyymmdd")+")"
	
	$at_buildNo{1}:=JSON Stringify:C1217($buildNoInfo)
	ARRAY TO LIST:C287($at_buildNo; "BuildNo")
End if 