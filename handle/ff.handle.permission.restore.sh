#!/bin/bash
PATH=$PWD
source /usr/bin/find "$PATH" -type f -exe source /usr/bin/stat {} --format "chown %G:%G ${MPOINT}%n && chmod %a ${MPOINT}%n"  \; >>  /tmp/this.txt

echo "#!/bin/bash" > /tmp/final.txt
echo "export PATH=\$PATH:/usr/bin:/bin" > /tmp/final.txt

while read line; do
  echo $line | /bin/sed "s/$( echo $PATH | /bin/sed 's/\//\\\//g' )/$( echo \$PATH )/g" >> /tmp/final.txt
done < /tmp/this.txt

exit 0