# apt aliases
alias apt='sudo aptitude install'
alias search='apt-cache search'
alias update ='sudo aptitude update'
alias upgrade ='sudo aptitude safe-upgrade'

# lists
alias l='ls -lnh'
alias la='ls -lnhA'

# spelling errors
alias cim='vim'
alias sl='ls'

# music
alias m.='mplayer ./*'
alias m1.='mplayer -channels 1 ./*'

# screen
alias sx='screen -x'

# todo
alias t='todo.sh -d /home/seth/todo/todo.cfg'

# pulseaudio sucks
alias restartpulse='sudo killall -9 pulseaudio; pulseaudio >/dev/null 2>&1 &'

# xmonad
alias pullthestring='killall metacity; xmonad &'
alias dotawesome='killall metacity; awesome-start &'

# Directory changing shortcuts
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias _='cd -'

# Git
alias ga='git add'
alias gcm='git commit -m'
alias gp='git push origin master'
alias g?='git status'
alias gc='git log --check'
alias g1='git log --pretty=oneline'

# ssh tunneling
# TODO: add firefox socks proxy hacks here
alias sshtun="ssh -D 1080 toast"

# commands to call from vim
alias adate="date +'%Y-%m-%d %H:%M:%S %z'"
