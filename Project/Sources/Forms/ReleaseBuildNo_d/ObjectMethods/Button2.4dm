
C_POINTER:C301($vp_stringYear)
$vp_stringYear:=OBJECT Get data source:C1265(*; "string_year")

If (Not:C34(Is nil pointer:C315($vp_stringYear)))
	$vp_stringYear->:=String:C10(Num:C11($vp_stringYear->)+1)
End if 