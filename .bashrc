echo
ddate
echo
fortune -s
echo

complete -cf sudo
complete -cf man

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias ll="ls -l --group-directories-first"
alias ls='ls -hF --color' # add colors for filetype recognition
alias la='ls -Al' # show hidden files
alias lx='ls -lXB' # sort by extension
alias lk='ls -lSr' # sort by size, biggest last
alias lc='ls -ltcr' # sort by and show change time, most recent last
alias lu='ls -ltur' # sort by and show access time, most recent last
alias lt='ls -ltr' # sort by date, most recent last
alias lm='ls -al |more' # pipe through 'more'
alias lr='ls -lR' # recursive ls
alias tree='tree -Csu' # nice alternative to 'recursive ls'




function extract() # Handy Extract Program.
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2) tar xvjf $1 ;;
             *.tar.gz) tar xvzf $1 ;;
             *.bz2) bunzip2 $1 ;;
             *.rar) unrar x $1 ;;
             *.gz) gunzip $1 ;;
             *.tar) tar xvf $1 ;;
             *.tbz2) tar xvjf $1 ;;
             *.tgz) tar xvzf $1 ;;
             *.zip) unzip $1 ;;
             *.Z) uncompress $1 ;;
             *.7z) 7z x $1 ;;
             *) echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Dircolor: set ls color of dirs to cyan

eval `dircolors .dircolors.txt`


# Random Alias
alias emacs='emacs -nw' # start emacs in no window mode

alias ls='ls -hF --color'  # add colors for filetype recognition

alias vpn='sudo vpnc uni-leipzig-vpn.config' #start VPNC Connection to Uni Leipzig

alias vpnoff='sudo vpnc-disconnect' # disconnect VPNC Connection

alias ..='cd ..' # use ".." instead of "cd .." 

alias aus='sudo shutdown -h now' # use "aus" to shutdown without using a password

alias neu='sudo reboot' # use "neu" to reboot without using a password

alias matlab='exec $HOME/Public/matlab/bin/matlab' # start matlab