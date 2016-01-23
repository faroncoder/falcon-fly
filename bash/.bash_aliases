alias   falcon=" cd $HOME/.falcon/scripts "
alias	ff.clean=" ff.bin.files.backup.delete "
alias	ff.code=" cd $HOME/.falcon/code "
alias	ff.edit.alias=" nano ~/.bash_aliases "
alias	ff.edit.bashrc=" nano ~/.bashrc "
alias	ff.edit.scripts=" nano ~/.bash_scripts "
alias	ff.edit.profile=" nano ~/.profile "
alias	ff.fstab=" cat /etc/fstab "
alias	ff.id="   cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 "
alias	ff.java=" cd ~/.falcon/code/java/projects "
alias	ff.loc=" cd ~/.falcon/code/usr-local"
alias	ff.log=" tail -n 50 /var/log/syslog"
alias	ff.md5="      grabfiles=( \"$( find -L $PWD -maxdepth 1 -type f ! -type d ! -path '*/.gvfs' -exec basename {} \; )\" ); for w in \"${grabfiles[@]}\"; do md5sum $w; done "
alias	ff.node="    cd $HOME/.falcon/code/node/projects "
alias	ff.open=" nautilus . "
alias	ff.script="  cd ~/.falcon/scripts "
alias	ff.vid="  cd ~/Videos"
alias	ff6=" ssh -o PubkeyAuthentication=no faron@192.168.1.6 "
#alias	ff6=" ssh f6 "
alias	ff7=" ssh -o PubkeyAuthentication=no faron@192.168.1.7 "
#alias	ff7=" ssh f7"
alias	ff.met=" cd $HOME/.falcon/scripts/meteor/projects-meteor "
alias	ff.privs=" cd /srv/www/htdocs/.jsc/.privs "
alias	fly=" cd $HOME/.falcon "
alias	mtrmake=" meteor-kitchen "
alias	ports="     sudo netstat -tulanp "
alias	ff.work=" cd /srv/www/htdocs/.jsc/projects "
alias	setup="     cd ~/.falcon/setup "
alias   bashsr="    cd ~/; source ~/.bashrc "
alias   bin=" ls ~/.bin "
alias   diskspace=" gksu baobab "
alias   ff.colors="  cat ~/.falcon/bash/.bash_colors_help "
alias   ff.desk="    cd ~/Desktop "
alias   ff.dl="      cd ~/Downloads "
alias   ff.pix="     cd ~/Pictures "
alias   ff.vid="     cd ~/Videos "
#alias   ff10="      ssh -o PubkeyAuthentication=no faron@192.168.1.10 "
alias   ff10="      ssh f10"
alias   fff="       cd /srv/www/htdocs"
alias   ff.html="    cd $HOME/.falcon/code/htmls/projects-htmls "
alias   ff.x="     cd ~/Videos/XXX "
alias   play=" mpv --msg-color --msg-module --really-quiet"
alias   play1=" mpv --msg-color --msg-module --speed 1 --really-quiet"
alias   play2=" mpv --msg-color --msg-module --speed 2 --really-quiet"
alias ff.task.list=" yokadi t_list "
alias ff.mov=" cd /media/clips/lib "
alias ffj=" cd /srv/www/htdocs/.jsc "
alias ff.doc=" cd ~/Documents "
alias ff.stream=" cd /media/clips/lib/mp4/lock-in "
