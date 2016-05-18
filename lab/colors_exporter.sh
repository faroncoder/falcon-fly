#!/bin/bash
GETSOURCE=( 0:100:On_IBlack 0:101:On_IRed 0:102:On_IGreen 0:103:On_IYellow 0:104:On_IBlue 0:105:On_IPurple 0:106:On_ICyan 0:107:On_IWhite 0:30:Black 0:31:Red 0:32:Green 0:33:Yellow 0:34:Blue 0:35:Purple 0:36:Cyan 0:37:White 0:90:IBlack 0:91:IRed 0:92:IGreen 0:93:IYellow 0:94:IBlue 0:95:IPurple 0:96:ICyan 0:97:IWhite 1:30:BBlack 1:31:BRed 1:32:BGreen 1:33:BYellow 1:34:BBlue 1:35:BPurple 1:36:BCyan 1:37:BWhite 1:90:BIBlack 1:91:BIRed 1:92:BIGreen 1:93:BIYellow 1:94:BIBlue 1:95:BIPurple 1:96:BICyan 1:97:BIWhite 4:30:UBlack 4:31:URed 4:32:UGreen 4:33:UYellow 4:34:UBlue 4:35:UPurple 4:36:UCyan 4:37:UWhite )


BIT1="m"
BIT="\e["
NO=0
for fe in "${GETSOURCE[@]}"; do
	NO=$( echo $(( $NO + 1 )) )
	TY="$( echo $fe | cut -d":" -f1 )"
	COL="$( echo $fe | cut -d":" -f2 )"

	PRINT="$( echo $fe | cut -d":" -f3 )"
	if [[ "$COL" == 0 ]]; then
		COL=""
	fi
	CODEN="$BIT$TY;$COL$BIT1"
	EXPRTR=`printf "COL$NO" `
	#MSGIN=$PRINT
	#export $EXPRTR="echo -e $CODEN $MSGIN"
	echo -e "$BIT$TY;$COL$BIT1 $PRINT \e[0;m"
	export "$EXPRTR"="$( echo -e \"$BIT$TY;$COL$BIT1\" )"
	#BUILD2="$BUILD1 $PRINT"
	#echo -e $THISCOLOR
done
