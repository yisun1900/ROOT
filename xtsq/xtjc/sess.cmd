set JAVA_HOME=f:\jdk1.6.0_07
set WL_HOME=c:\tomcat
set MYSERVER=%WL_HOME%\webapps\ROOT

set MYCLASSPATH=".;%JAVA_HOME%\lib;%JAVA_HOME%\bin;%JAVA_HOME%\lib\tools.jar;%JAVA_HOME%\lib\jxl.jar;%WL_HOME%\lib\jsp-api.jar;%WL_HOME%\lib\servlet-api.jar;%MYSERVER%\WEB-INF\classes;%MYSERVER%\WEB-INF\lib\poi-2.5.1-final-20040804.jar"

%JAVA_HOME%\bin\javac -d %MYSERVER%\WEB-INF\classes  -Xlint:unchecked  -classpath %MYCLASSPATH% MySessionListener.java

