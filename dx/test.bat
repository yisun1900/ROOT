echo off
SET CLASSPATH=.;junit.jar;test.jar;smsapi.jar
java com.roya.mcc.thirdapi.sendsms.test.TestSMSService -cp %CLASSPATH%
pause