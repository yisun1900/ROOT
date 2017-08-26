set JAVA_HOME=c:\j2sdk1.4.0
set WL_HOME=c:\tomcat
set MYSERVER=%WL_HOME%\webapps\ROOT

set MYCLASSPATH=".;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar;%WL_HOME%\lib;%WL_HOME%\common\lib\servlet.jar;%MYSERVER%\WEB-INF\classes"

javac  -d %MYSERVER%\WEB-INF\classes  -classpath %MYCLASSPATH% money.java
pause
