# = Sethwolfwood zshrc
# github.com/sethwoodworth/dotfiles

# Source aliases
source "$XDG_CONFIG_HOME/aliases/aliases"

unsetopt beep

# == Editor
export EDITOR="nvim"
# because this is set, `bindkey -v` is implicit
export VISUAL="nvim"

# Less colors
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

# == Enabling zsh features
setopt autocd          # Allows for `/tmp` to act as `cd /tmp`
setopt completealiases # Lets me tab complete aliases

# == History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
# Binds C-r to search backwards through shell history
bindkey '^R' history-incremental-search-backward
# Write shell history after command exit
# :Note: does not make that history available to C-r
setopt inc_append_history
setopt share_history

#== Adds ability to edit current line in vim with C-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^E' edit-command-line


zstyle :compinstall filename '${HOME}/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz colors compinit
colors
compinit

source /etc/zsh_command_not_found
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${XDG_DATA_HOME}/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load fzf shortcuts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Powerline
powerline-daemon -q

setopt PROMPT_SUBST

source /usr/lib/git-core/git-sh-prompt
export GIT_PS1_SHOWDIRTYSTATE=1
PROMPT="
%B%F{red}┍━━━⎧⦇ %F{white}%n%F{red} :: %F{yellow}$(__git_ps1 "%s")%F{red} ⦈━(%F{white}%j%F{red})━[ %F{white}%~%F{red} ]
╘═══⎩%b%f "


# Pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Load a fortune on term launch
fortune ~/.config/fortune/

# scm_breeze git aliases
[ -s "/home/${USER}/.local/share/scm_breeze/scm_breeze.sh" ] && source "/home/${USER}/.local/share/scm_breeze/scm_breeze.sh"
[ -s "/home/${USER}/.local/bin/aws_zsh_completer.sh" ] && source "/home/${USER}/.local/bin/aws_zsh_completer.sh"

# pip zsh completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
