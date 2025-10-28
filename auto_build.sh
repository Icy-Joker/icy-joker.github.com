#!/bin/bash
#
#记录脚本所在位置
export script_directory=`dirname $0`
#进入脚本所在位置
pushd "$script_directory" > /dev/null
  #此脚本要求和源码包共同存放于"src"目录
  export current_directory_name=$(basename $PWD)
  if [[ "$current_directory_name" == "src" ]]
  then
    export current_library_name="fmt"
    export default_install_prefix=$(cd ".." && pwd)
    #解压源码
    mkdir -p "$current_library_name"
    tar -zxvf "$current_library_name.tar.gz" -C "$current_library_name"
    #构建&编译&安装
    if [ -e "$current_library_name/CMakeLists.txt" ]
    then
      mkdir -p "build"
      pushd "build" > /dev/null
        #
        cmake \
          -DCMAKE_POSITION_INDEPENDENT_CODE="ON" \
          ../$current_library_name
        #
        make CXXFLAGS="-fPIC" CFLAGS="-fPIC" -j4
        if [ $? -eq 0 ]
        then
          read -t 5 -n 1 -p "Do you want to execute command [make install]? [Y/N] (default: Y):" confirm
          confirm=${confirm:-"Y"}
          echo ""
          if [[ $confirm =~ ^[Yy]$ ]]
          then
            read -p "Confirm the install directory (default:$default_install_prefix):" install_directory
            install_directory=${install_directory:-"$default_install_prefix"}
            make DESTDIR=$install_directory install
          fi
        fi
      popd > /dev/null
    elif [ -e "$current_library_name/configure" ]
    then
      pushd "build" > /dev/null
        #
        ./configure
        #
        make CXXFLAGS="-fPIC" CFLAGS="-fPIC" -j4
        if [ $? -eq 0 ]
        then
          read -t 5 -n 1 -p "Do you want to execute command [make install]? [Y/N] (default: Y):" confirm
          confirm=${confirm:-"Y"}
          echo ""
          if [[ $confirm =~ ^[Yy]$ ]]
          then
            read -p "Confirm the install directory (default:$default_install_prefix):" install_directory
            install_directory=${install_directory:-"$default_install_prefix"}
            make DESTDIR=$install_directory install
          fi
        fi
      popd > /dev/null
    else
      echo "未找到可直接使用的构建系统,请确认源码是否提供..."
    fi
  fi
popd > /dev/null
