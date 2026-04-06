//%attributes = {"invisible":true,"preemptive":"incapable"}
// BuildNo_SetBuildNo_LogComp (year; releaseNo; buildNo)
// 
// DESCRIPTION
//   Stores the build no object for the component.
//   For example: {"releaseYear":"2017","releaseNo":"r1","buildNo":"20170529","versionShort":"2017.r1","versionLong":"2017.r1 (build 20170529)"}
//   
//   NOTE: Cannot be run in a pre-emptive process.
//   NOTE: Private to the component
//
#DECLARE($input_Year : Text; $input_ReleaseNo : Text; $input_BuildNo : Text)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=3)

// Construct the bulid No obj
var $buildNoInfo : Object
$buildNoInfo:={}
$buildNoInfo.releaseYear:=$input_Year
$buildNoInfo.releaseNo:=$input_ReleaseNo
$buildNoInfo.buildNo:=$input_BuildNo
$buildNoInfo.versionShort:=$input_Year+"."+$input_ReleaseNo
$buildNoInfo.versionLong:=$input_Year+"."+$input_ReleaseNo+" (build "+$input_BuildNo+")"

ARRAY TEXT:C222($at_buildNo; 1)
$at_buildNo{1}:=JSON Stringify:C1217($buildNoInfo)

// Save it into the structure
ARRAY TO LIST:C287($at_buildNo; "BuildNo")
