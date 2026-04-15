var $buildNoInfo : Object
$buildNoInfo:=BuildNo_GetBuildNo

var $vp_stringYear : Pointer
$vp_stringYear:=OBJECT Get data source:C1265(*; "string_year")
If (Not:C34(Is nil pointer:C315($vp_stringYear)))
	$vp_stringYear->:=OB Get:C1224($buildNoInfo; "releaseYear"; Is text:K8:3)
End if 

var $vp_stringReleaseNo : Pointer
$vp_stringReleaseNo:=OBJECT Get data source:C1265(*; "string_releaseNo")
If (Not:C34(Is nil pointer:C315($vp_stringReleaseNo)))
	$vp_stringReleaseNo->:=OB Get:C1224($buildNoInfo; "releaseNo"; Is text:K8:3)
End if 

var $vp_stringBuildNo : Pointer
$vp_stringBuildNo:=OBJECT Get data source:C1265(*; "string_buildNo")
If (Not:C34(Is nil pointer:C315($vp_stringBuildNo)))
	$vp_stringBuildNo->:=OB Get:C1224($buildNoInfo; "buildNo"; Is text:K8:3)
End if 