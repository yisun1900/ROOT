<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String ckph=cf.GB2Uni(request.getParameter("ckph"));
String cklx=cf.executeQuery("select cklx from jxc_ckd where ckph='"+ckph+"'");
if (cklx.equals("P") || cklx.equals("J"))//D���������⣻B�����ϳ��⣻T���˻����⣻ S���깺���⣻P�����ϵ����⣻J������ȯ���⣻X�����۳��⣻R:��������
{
	response.sendRedirect("printCld1.jsp?ckph="+ckph);
}
else{
	response.sendRedirect("printCld2.jsp?ckph="+ckph);
}

%>



