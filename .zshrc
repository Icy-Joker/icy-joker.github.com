#文件|目录操作
alias rm='rm -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
#显示
#alias ls='ls -auto-color'
alias ll='ls -l -h -D "%Y/%m/%d %H:%M:%S"'
alias l.='ls -l -h -D "%Y/%m/%d %H:%M:%S" -d .*'
alias la='ls -a'
#查找
alias grep='grep -i'
#清屏
alias cls='clear'

# 启用补全系统
autoload -Uz compinit && compinit
# 忽略补全时的大小写
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
