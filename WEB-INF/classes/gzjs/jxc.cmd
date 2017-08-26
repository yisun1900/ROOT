set JAVA_HOME=c:\jdk1.3
set WL_HOME=D:\tomcat
set MYSERVER=%WL_HOME%\webapps\ROOT

set MYCLASSPATH=".;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar;%WL_HOME%\lib;%WL_HOME%\common\lib\servlet.jar;%MYSERVER%\WEB-INF\classes"

javac  -d %MYSERVER%\WEB-INF\classes  -classpath %MYCLASSPATH% Gzjs.java
pause
