


export LC_ALL=C
cat "$@" |
tr "\t" "\n" |
awk '{print $0 " "}' |
sed 's/"/\\\"/g' | sed 's/\$/\\$/g' | sed "s/'/\\'/g"
exit 0