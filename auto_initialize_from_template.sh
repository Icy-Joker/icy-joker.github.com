#!/bin/bash

#根据模版项目仓库初始化新项目仓库
git clone UniversalTemplate $1
#进入新项目目录
cd "$1"
#移除复制出的新仓库的远端地址
git remote remove origin
#将模版文件中的所有原项目名称信息替换为新项目名称
bash -c 'git-filter-repo --force --replace-text <(echo "UniversalTemplate==>$1")' _ "$1"
#将模版仓库历史提交中原项目的目录名称替换为新项目名称
bash -c 'git-filter-repo --path-rename src/UniversalTemplate/:src/$1/' _ "$1"
