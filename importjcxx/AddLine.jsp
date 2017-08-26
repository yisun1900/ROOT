<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%
String path="D:\\优铂利软件\\ERP-yz\\需求分析\\2006-01-11";

FileReader fileReader = null;
java.io.BufferedReader oldFile=null;

FileWriter fileWriter = null;
java.io.PrintWriter newFile=null;

int row=0;
int len=0;
String ls=null;

try {
	
	fileReader = new FileReader(new File(path+"/复件 2005年工程客服1-11.txt"));
	oldFile= new BufferedReader(fileReader);

	fileWriter = new FileWriter(new File(path+"/复件 2005年工程客服1-11.add.txt"));
	newFile=new PrintWriter(fileWriter);


	while ((ls=oldFile.readLine())!=null)
	{
		row++;
		newFile.write(row+"	"+ls+ "\r\n");  
	}
	

	out.print("<BR>数据导入成功，共导入行数："+row);
}
catch (Exception e) {
	out.print("发生意外: " + e);
}
finally 
{
	if (fileReader!=null) fileReader.close();
	if (oldFile!=null) oldFile.close();
	if (fileWriter!=null) fileWriter.close();
	if (newFile!=null) newFile.close();
}
%>
