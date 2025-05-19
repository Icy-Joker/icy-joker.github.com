#!/bin/bash
#
file_names="$HOME/.bashrc;$HOME/.bash_profile;$HOME/.gitconfig;$HOME/.inputrc;$HOME/.vimrc;$HOME/.zprofile;$HOME/.zshenv;$HOME/.zshrc;$HOME/.wgetrc;$HOME/.curlrc"
# 设置 IFS 为分号
IFS=';'
# 逐个输出字符串中分号隔开的部分
for file_name in $file_names; do
  echo "$file_name"
  ln -f "$file_name" .
done
# 恢复 IFS 为默认空格
unset IFS
