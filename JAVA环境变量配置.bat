@echo off
color 02
echo.------------------------------------
echo.TODO:设置java环境变量
echo.Author:Icy-Joker
echo.Feedback  QQ：790238255
echo.------------------------------------
pushd C:\Program Files\Java\*jdk*
set JDK_Path=%cd%
::设置java的安装路径，可方便切换不同的版本
set input=
set /p "input=请输入java的jdk路径（或回车使用默认路径：%JDK_Path%）:"
if defined input (set JDK_Path=%input% & echo JDK路径已设置为%JDK_Path%) else (echo JDK路径已设置为%JDK_Path%)
echo.------------------------------------
::如果有的话，先删除JAVA_HOME
wmic ENVIRONMENT where "name='JAVA_HOME'" delete>nul
::创建JAVA_HOME
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%JDK_Path%">nul
::如果有的话，先删除ClASSPATH 
wmic ENVIRONMENT where "name='CLASSPATH'" delete>nul
::创建CLASSPATH
wmic ENVIRONMENT create name="CLASSPATH",username="<system>",VariableValue=".;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;">nul
::增加PATH中关于java的环境变量
wmic ENVIRONMENT where "name='path'and username='<system>'" set VariableValue="%path%;%%JAVA_HOME%%\bin;">nul
echo Java环境变量创建成功
pause