<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] rkph=request.getParameterValues("rkph");
if (rkph.length>1)
{
	out.println("����һ�β���ɾ�����");
	return;
}

String rklx=cf.executeQuery("select rklx from jxc_rkd where rkph='"+rkph[0]+"'");

if (rklx.equals("F"))//F�����������
{
	response.sendRedirect("deleteTjrkdCkd.jsp?rkph="+rkph[0]);
}
else if (rklx.equals("S"))//S���깺���
{
	response.sendRedirect("deleteTjrkdSgd.jsp?rkph="+rkph[0]);
}
else{//C���ɹ���⣻T���˻���⣻R��������⣻S���깺��⣻J������ȯ�˻���⣻D�����Ķ����˻���F����������⣻Z��ֱ�����
	response.sendRedirect("deleteTjrkd.jsp?rkph="+rkph[0]);
}
%>