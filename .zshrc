alias rm='rm -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

#alias ls='ls -auto-color'
alias l.='ls -l -d .*'
alias ll='ls -lh'
alias la='ls -a'

alias grep='grep -i'

alias cls='clear'

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
