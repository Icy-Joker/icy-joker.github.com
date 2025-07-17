#
#export http_proxy=http://127.0.0.1:1087;
#export https_proxy=http://127.0.0.1:1087;
#export all_proxy=socks5://127.0.0.1:1086;
#
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export BREW_HOME=/opt/homebrew
export PATH=$BREW_HOME/bin:$BREW_HOME/sbin:$PATH
if type brew &> /dev/null;
then
  export FPATH=$BREW_HOME/share/zsh/site-functions:$FPATH
fi
#
