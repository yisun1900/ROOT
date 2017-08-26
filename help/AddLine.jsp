<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>


<%
try {
	//拷贝标准凭证文件
	String inFile="D:\\优铂利软件\\ERP-yz\\需求分析\\财务凭证\\集成会计科目表.txt";
	String outFile="D:\\优铂利软件\\ERP-yz\\需求分析\\财务凭证\\集成会计科目表.add.txt";

	int row=cf.addLine(inFile,outFile);

	out.println("转换成功！共转换["+row+"]行");
}
catch (Exception e) {
	out.print("发生意外: " + e);
}
%>

