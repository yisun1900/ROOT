<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String rklx=cf.executeQuery("select rklx from jxc_rkd where rkph='"+rkph+"'");

if (rklx.equals("F"))//F�����������
{
	response.sendRedirect("EditJxc_rkdCkd.jsp?rkph="+rkph);
}
else if (rklx.equals("S"))//S���깺���
{
	response.sendRedirect("EditJxc_rkdSgd.jsp?rkph="+rkph);
}
else if (rklx.equals("C"))//C���ɹ����
{
	response.sendRedirect("EditJxc_rkdGys.jsp?rkph="+rkph);
}
else{//C���ɹ���⣻T���˻���⣻R��������⣻S���깺��⣻J������ȯ�˻���⣻D�����Ķ����˻���F����������⣻Z��ֱ�����
	response.sendRedirect("EditJxc_rkd.jsp?rkph="+rkph);
}
%>