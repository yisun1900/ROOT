<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>


<%
try {
	//������׼ƾ֤�ļ�
	String inFile="D:\\�Ų������\\ERP-yz\\�������\\����ƾ֤\\���ɻ�ƿ�Ŀ��.txt";
	String outFile="D:\\�Ų������\\ERP-yz\\�������\\����ƾ֤\\���ɻ�ƿ�Ŀ��.add.txt";

	int row=cf.addLine(inFile,outFile);

	out.println("ת���ɹ�����ת��["+row+"]��");
}
catch (Exception e) {
	out.print("��������: " + e);
}
%>

