<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph=cf.GB2Uni(request.getParameter("ckph"));
String cklx=cf.executeQuery("select cklx from jxc_ckd where ckph='"+ckph+"'");
if (cklx.equals("P"))//D���������⣻B�����ϳ��⣻T���˻����⣻ S���깺���⣻P�����ϵ����⣻J������ȯ���⣻X�����۳��⣻R:��������
{
	response.sendRedirect("EditJxc_ckdCld.jsp?ckph="+ckph);
}
else if (cklx.equals("S"))//S���깺����
{
	response.sendRedirect("EditJxc_ckdSgd.jsp?ckph="+ckph);
}
else if (cklx.equals("X"))//X�����۳���
{
	response.sendRedirect("EditJxc_ckdXsd.jsp?ckph="+ckph);
}
else if (cklx.equals("R"))//R����������
{
	response.sendRedirect("EditJxc_ckdDbd.jsp?ckph="+ckph);
}
else if (cklx.equals("D"))//D�����Ķ�������
{
	response.sendRedirect("EditJxc_ckdDd.jsp?ckph="+ckph);
}
%>