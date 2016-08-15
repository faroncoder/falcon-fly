for fe in "${GETSOURCE[@]}"; do
	TY="$( echo $fe | cut -d":" -f1 )"
	COL="$( echo $fe | cut -d":" -f2 )"
	PRINT="$( echo $fe | cut -d":" -f3 )"
	if [[ "$COL" == 0 ]]; then
		COL=""
	fi
	echo  -e "$BIT$TY;$COL$BIT1 $PRINT"
	#BUILD2="$BUILD1 $PRINT"
	#echo -e $THISCOLOR
done
