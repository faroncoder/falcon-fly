SSH_KEYGEN=`which ssh-keygen`
SSH=`which ssh`
SSH_COPY_ID=`which ssh-copy-id`
KEYSIZE=2048
KEYTYPE=rsa
USER="${USER}"
HOMEBASE="$( hostname --short )"
FILEA="id_"
REMOTEHOST=( f6 f7 )
for x in "${REMOTEHOST[@]}"; do
    FILEB=$FILEA$HOMEBASE-to-$x
  /usr/bin/ssh-keygen -t $KEYTYPE -b $KEYSIZE  -f "$HOME/.ssh/$FILEB"
    RET=$?
    if [ $RET -ne 0 ];then
        echo "ssh-keygen failed: $RET"
        exit 1
    fi
    RET=$?
    if [ $RET -ne 0 ];then
        echo "ssh-keygen failed: $RET"
        exit 1
    fi
    echo "Adjust permissions of generated key-files locally"
    find "$HOME/.ssh" -maxdepth 1 -type f -name "*$FILEB*" -exec chmod 0700 {} \;
    RET=$?
    if [ $RET -ne 0 ];then
        echo "chmod failed: $RET"
        exit 1
    fi
    REMHOST=$( echo $FILEB | cut -d"-" -f3 )
    echo "Copying the key to the remote machine $USER@$REMHOST"
    /usr/bin/ssh-copy-id -i "$HOME/.ssh/$FILEB" $USER@$REMHOST
    RET=$?
    if [ $RET -ne 0 ];then
        echo "ssh-copy-id failed: $RET"
        exit 1
    fi
done
