@echo off
color 02
echo.------------------------------------
echo.TODO:����java��������
echo.Author:Icy-Joker
echo.Feedback  QQ��790238255
echo.------------------------------------
pushd C:\Program Files\Java\*jdk*
set JDK_Path=%cd%
::����java�İ�װ·�����ɷ����л���ͬ�İ汾
set input=
set /p "input=������java��jdk·������س�ʹ��Ĭ��·����%JDK_Path%��:"
if defined input (set JDK_Path=%input% & echo JDK·��������Ϊ%JDK_Path%) else (echo JDK·��������Ϊ%JDK_Path%)
echo.------------------------------------
::����еĻ�����ɾ��JAVA_HOME
wmic ENVIRONMENT where "name='JAVA_HOME'" delete>nul
::����JAVA_HOME
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%JDK_Path%">nul
::����еĻ�����ɾ��ClASSPATH 
wmic ENVIRONMENT where "name='CLASSPATH'" delete>nul
::����CLASSPATH
wmic ENVIRONMENT create name="CLASSPATH",username="<system>",VariableValue=".;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;">nul
::����PATH�й���java�Ļ�������
wmic ENVIRONMENT where "name='path'and username='<system>'" set VariableValue="%path%;%%JAVA_HOME%%\bin;">nul
echo Java�������������ɹ�
pause