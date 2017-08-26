set JAVA_HOME=c:\jdk1.6.0_07
set WL_HOME=d:\tomcat
set MYSERVER=%WL_HOME%\webapps\ROOT

set MYCLASSPATH=".;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar;%JAVA_HOME%\lib\jxl.jar;%WL_HOME%\common\lib\jsp-api.jar;%WL_HOME%\common\lib\servlet-api.jar;%MYSERVER%\WEB-INF\classes;%MYSERVER%\WEB-INF\lib\poi-2.5.1-final-20040804.jar";D:\tomcat\dxlib\smsapi.jar;D:\tomcat\dxlib\junit.jar;D:\tomcat\dxlib\test.jar

%JAVA_HOME%\bin\javac   -d %MYSERVER%\WEB-INF\classes  -classpath %MYCLASSPATH% DX.java

