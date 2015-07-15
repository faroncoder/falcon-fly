FILEGRAB="$( find ./ -maxdepth 1 -type f  ! -name '*.mp4' -name '*.mkv' ! -name '*.sh' | sort | head -n1 )"


function grabmediaonfly {
TEMPNAME="$( rev <<< "$FILEGRAB" | cut -d "." -f2 | rev )"
TEMPFILE="$TEMPNAME.list"
mediainfo $FILEGRAB > $TEMPFILE
## FIND FPS
GETFPS=$( awk '{ if ( $1 == "Frame" && $2 == "rate" && $5 == "fps" ) { print $4; exit; }}' $TEMPFILE )
FPS=$( printf "%s" $GETFPS )


## RETURNS FPS in $FPS
## FIND MEMETHOD
GETMEMETHOD=$( awk '{ if ( $1 == "Encoding" ) { print $12; exit; }}' $TEMPFILE )
GETTMEMETHOD="$( echo $GETMEMETHOD | sed 's/me=//g' )"
MEMETHOD=$(printf "%s" $GETTMEMETHOD )
FFMEMETHOD="-me_method $MEMETHOD"
echo $FFMEMETHOD

GETBIT="$( awk '{ if ( $1 == "Bit" && $2 == "rate" ) { print $4; exit; }}' $TEMPFILE )"
BITRAT=$(printf "%s" $GETBIT )
FFBITRAT="-b:v $BITRAT"
echo $FFBITRAT

GETKEYMIN=$( awk '{ if ( $1 == "Encoding" ) { print $72; exit; }}' $TEMPFILE )
KEYMIN=$(printf "%s" $GETKEYMIN )
FFKEYMIN="-keyint_min $KEYMIN"
echo $FFKEYMIN

GETKEYMAX=$( awk '{ if ( $1 == "Encoding" ) { print $70; exit; }}' $TEMPFILE )
KEYMAX=$(printf "%s" $GETKEYMAX )
FFKEYMAX="-keyint_max $KEYMAX"
echo $FFKEYMAX

GETBPYR=$( awk '{ if ( $1 == "Encoding" ) { print $56; exit; }}' $TEMPFILE )
BPYR=$(printf "%s" $GETBPYR )
FFBPYR="-flags2 +bpyramind $BPYR"
echo $FFBPYR

GETBSTRGY=$( awk '{ if ( $1 == "Encoding" ) { print $56; exit; }}' $TEMPFILE )
BSTRGY=$(printf "%s" $GETBSTRGY )
FFBSTRGY="-b_strategy $BSTRGY"
echo $FFBSTRGY

GETBFRAME=$( awk '{ if ( $1 == "Encoding" ) { print $54; exit; }}' $TEMPFILE )
BFRAME=$(printf "%s" $GETBFRAME )
FFBFRAME="-bf $BFRAME"
echo $FFBFRAME

GETBIAS=$( awk '{ if ( $1 == "Encoding" ) { print $54; exit; }}' $TEMPFILE )
BIASREG="$( echo GETBIAS | sed 's/b_bias=//g'  )"
BIAS=$(printf "%s" $BIASREG )
FFBIAS="-bframebias $BIAS"
echo $FFBIAS


## CHECK http://en.wikibooks.org/wiki/FFMPEG_An_Intermediate_Guide/AVCodecContext_AVOptions#-trellis
## AND
## CHECKhttps://sites.google.com/site/linuxencoding/x264-ffmpeg-mapping
##
## USE THES LINKS TO COMPLETE THIS SCRIPT

}

grabmediaonfly