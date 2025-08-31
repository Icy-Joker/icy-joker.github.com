#
OS_TYPE=$(uname)
#######################################################################################################################################
#文件|目录操作
alias rm='rm -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
#显示
alias ls='ls --color=always'
alias la='ls -a'
if [[ "$OS_TYPE" == "Darwin" ]]; then
  alias ll='ls -l -h -D "+%Y/%m/%d %H:%M:%S"'
  alias l.='ls -l -h -D "+%Y/%m/%d %H:%M:%S" -d .*'
elif [[ "$OS_TYPE" == "Linux" ]]; then
  alias ll='ls -lh --time-style="+%Y/%m/%d %H:%M:%S" -t'
  alias l.='ls -lh --time-style="+%Y/%m/%d %H:%M:%S" -t -d .*'
fi
#查找
alias grep='grep -i'
#清屏
alias cls='clear'
