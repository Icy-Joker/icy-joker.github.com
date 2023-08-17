alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias mkdir='mkdir -p'

alias l.='ls -l -d .* --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'

alias grep='grep -i'

alias cls='clear'

export CMAKE_ROOT=/usr/local/cmake-3.26.0-rc3

export PATH=$CMAKE_ROOT/bin:$PATH

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
