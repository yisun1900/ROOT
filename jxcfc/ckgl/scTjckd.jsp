<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ckphs = request.getParameterValues("ckph");
if (ckphs.length>1)
{
	out.println("����һ�β���ɾ�����");
	return;
}

String ckph=ckphs[0];

String cklx=cf.executeQuery("select cklx from jxc_ckd where ckph='"+ckph+"'");

if (cklx.equals("P"))//D���������⣻B�����ϳ��⣻T���˻����⣻ S���깺���⣻P�����ϵ����⣻J������ȯ���⣻X�����۳��⣻R:��������
{	
	response.sendRedirect("deleteTjckdCld.jsp?ckph="+ckph);
}
else if (cklx.equals("S"))
{	
	response.sendRedirect("deleteTjckdSgd.jsp?ckph="+ckph);
}
else if (cklx.equals("X"))
{	
	response.sendRedirect("deleteTjckdXsd.jsp?ckph="+ckph);
}
else if (cklx.equals("R"))
{	
	response.sendRedirect("deleteTjckdDbd.jsp?ckph="+ckph);
}
%>