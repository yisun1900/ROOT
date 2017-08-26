echo off
SET CLASSPATH=.;smsapi.jar;test.jar
java Demo -cp %CLASSPATH%
pause