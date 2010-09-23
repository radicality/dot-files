# turn on autocompletion

#------------------------------------------
# Options
#------------------------------------------
# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Alt+S to insert sudo at beginning of line
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo


zmodload zsh/complist
autoload -U compinit && compinit

#------------------------------------------
# Autocompletion
#------------------------------------------
zstyle ':completion:::::' completer _complete _approximate
zstyle ':completion:*' menu select

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' verbose yes

# allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# colorizer auto-completion for kill
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete
zstyle ':completion:*' completer _expand _force_rehash _complete _approximate _ignored

# generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'

# Don't prompt for a huge list, page it!
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Don't prompt for a huge list, menu it!
zstyle ':completion:*:default' menu 'select=0'

# Have the newer files last so I see them first
zstyle ':completion:*' file-sort modification reverse

# color code completion!!!!  Wohoo!
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
# foo
#------------------------------------------
# Colors
#------------------------------------------
# set colors to make terminal pretty!
autoload colors; colors
export CLICOLOR=1

export LS_OPTIONS='--color=auto'
export LSCOLORS=Exfxcxdxbxegedabagacad

PROMPT="%{$fg[cyan]%}[%n@%m] % ~%{$reset_color%} "
RPROMPT="[%{$fg[yellow]%}%3c%{$reset_color%}][%{$fg[red]%}%?%{$reset_color%}]" # prompt for right side of screen

#------------------------------------------
# Key Bindings
#------------------------------------------
bindkey '\e[3~' delete-char
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char

setopt no_list_beep

# directory in titlebar
chpwd() {
  [[ -t 1 ]] || return
  case $TERM in
    sun-cmd) print -Pn "\e]l%~\e\\"
      ;;
    *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
      ;;
  esac
}

# call chpwd when first loaded
 chpwd


###


# The below scripts seem to not work like i want
#
. ~/.zsh/mouse.zsh
zle-toggle-mouse  


### 	  PATH		###
#export PATH="/Users/rafal/dev/my_scripts:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin:/usr/X11/bin"
export PATH=/Users/rafal/dev/my_scripts:/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
# 
#
# For some reason shell was still /bin/bash
# Even using chsh doesn't fix this :S
export SHELL="/bin/zsh"
export TERM="xterm-256color"     # Otherwise vim hilighting is buggy	


 #	ALIASES 	###



alias ls='ls -l'
alias la='ls -la'
alias psx="ps aux | grep -i" 
alias preview="/Applications/Preview.app/Contents/MacOS/Preview"
alias reload="source ~/.zshrc"
alias vim='mvim -v'
alias tmux='tmux -2'	# force 256 color support


# SSH

alias hostmonster="ssh vlixterc@vlixter.com"
alias doc="shell1.sh"
alias tunnel="ssh -D 8080 -p 443 -l tunnel 208.79.207.84"
alias linode="ssh rafal@178.79.143.168"

# Play safe!
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# Typos
alias cd..="cd .."
alias dl="curl -L -O"
alias flushdns="dscacheutil -flushcache"





### PROGRAMS TO RUN ###

if [[2 == 2]]; then
    fortune 	# display a fortune :D
fi

# Start up tmux
if [[ "$TMUX" == "" ]]; 
	then if tmux has-session; then 
		exec tmux -2 -u attach; 
	else 
		exec tmux -2 -u new;
		# exec tmux splitw -h -d -p 25 -t 0:1; 
	fi; 
fi
