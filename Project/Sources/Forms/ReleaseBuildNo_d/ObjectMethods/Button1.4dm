C_OBJECT:C1216($vo_buildNoObj)
$vo_buildNoObj:=BuildNo_GetBuildNo

C_POINTER:C301($vp_stringYear)
$vp_stringYear:=OBJECT Get data source:C1265(*; "string_year")
If (Not:C34(Is nil pointer:C315($vp_stringYear)))
	$vp_stringYear->:=OB Get:C1224($vo_buildNoObj; "releaseYear"; Is text:K8:3)
End if 

C_POINTER:C301($vp_stringReleaseNo)
$vp_stringReleaseNo:=OBJECT Get data source:C1265(*; "string_releaseNo")
If (Not:C34(Is nil pointer:C315($vp_stringReleaseNo)))
	$vp_stringReleaseNo->:=OB Get:C1224($vo_buildNoObj; "releaseNo"; Is text:K8:3)
End if 

C_POINTER:C301($vp_stringBuildNo)
$vp_stringBuildNo:=OBJECT Get data source:C1265(*; "string_buildNo")
If (Not:C34(Is nil pointer:C315($vp_stringBuildNo)))
	$vp_stringBuildNo->:=OB Get:C1224($vo_buildNoObj; "buildNo"; Is text:K8:3)
End if 