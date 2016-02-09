alias   falcon=" cd ~/.falcon/scripts "
alias	ff.clean=" ff.bin.files.backup.delete "
alias	ff.code=" cd ~/.falcon/code "
alias	ff.edit.alias=" nano ~/.bash_aliases "
alias	ff.edit.bashrc=" nano ~/.bashrc "
alias	ff.edit.scripts=" nano ~/.bash_scripts "
alias	ff.edit.profile=" nano ~/.profile "
alias	ff.fstab=" cat /etc/fstab "
alias	ff.id="   cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 "
alias	ff.java=" cd ~/.falcon/code/java/projects "
alias	ff.loc=" cd /usr/local 2> /dev/null "
alias	ff.log=" tail -n 50 /var/log/syslog"
alias	ff.md5="      grabfiles=( \"$( find -L $PWD -maxdepth 1 -type f ! -type d ! -path '*/.gvfs' -exec basename {} \; )\" ); for w in \"${grabfiles[@]}\"; do md5sum $w; done "
alias	ff.node="    cd ~/.falcon/code/node/projects "
alias	ff.open=" nautilus . 2> /dev/null < /dev/null"
alias	ff.script="  cd ~/.falcon/scripts "
alias	ff.vid="  cd ~/Videos"
#alias	ff6=" ssh -o PubkeyAuthentication=no faron@192.168.1.6 "
alias	ff6=" ssh faron@f6 "
#alias	ff7=" ssh -o PubkeyAuthentication=no faron@192.168.1.7 "
alias	ff7=" ssh faron@f7"
alias	ff.met=" cd ~/.falcon/scripts/meteor/projects-meteor "
alias	ff.privs=" cd /srv/www/htdocs/.privs "
alias	fly=" cd ~/.falcon "
alias	mtrmake=" meteor-kitchen "
alias	ports="     sudo netstat -tulanp "
alias	setup="     cd ~/.falcon/setup "
alias   bashsr="    source ~/.bashrc "
alias   bin=" ls /usr/local/bin "
alias   diskspace=" gksu baobab "
alias   ff.colors="  cat ~/.falcon/bash/.bash_colors_help "
alias   ff.desk="    cd ~/Desktop "
alias   ff.dl="      cd ~/Downloads "
alias   ff.pix="     cd ~/Pictures "
alias   ff.vid="     cd ~/Videos "
alias   ff10="      ssh -o PubkeyAuthentication=no faron@192.168.1.10 "
#alias   ff10="      ssh faron@f10"
alias   fff="       cd /srv/www/htdocs"
alias   ff.html.in="    cd ~/.falcon/code/htmls/projects-htmls "
alias   ff.html.out="    cd /srv/www/htdocs/.jsc/projects "
alias   ff.x="     cd ~/Videos/XXX "
alias   play=" mpv --msg-color --msg-module --really-quiet"
alias   play1=" mpv --msg-color --msg-module --speed 1 --really-quiet"
alias   play2=" mpv --msg-color --msg-module --speed 2 --really-quiet"
alias ff.task.list=" yokadi t_list "
alias ff.mov6=" cd /mnt/clips6 "
alias ff.mov7=" cd /mnt/clips7 "
alias ff.mov1=" cd /mnt/clips10 "
alias ffj=" cd /srv/www/htdocs/.jsc "
alias ff.doc=" cd ~/Documents "
alias ff.stream=" cd /mnt/clips6/lib/mp4/lock-in "
alias flocal=" /usr/local/bin "
alias ff.etc=" cd /etc "
alias ff.usr=" cd /usr/local "
