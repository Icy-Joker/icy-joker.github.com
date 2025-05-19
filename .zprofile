#
export http_proxy=http://127.0.0.1:1087;
export https_proxy=http://127.0.0.1:1087;
#export all_proxy=socks5://127.0.0.1:1086;
#
export BREW_HOME=/opt/homebrew
export PATH=$BREW_HOME/bin:$BREW_HOME/sbin:$PATH
if type brew &> /dev/null;
then
  export FPATH=$BREW_HOME/share/zsh/site-functions:$FPATH
fi
