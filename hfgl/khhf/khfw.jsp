<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String khbh=request.getParameter("khbh");
String hflxbm=request.getParameter("hflxbm");
String hfdl=cf.executeQuery("select hfdl from dm_hflxbm where hflxbm='"+hflxbm+"'");

if (hfdl.equals("1"))//1��Ͷ�߻طã�2�����̻طã�3����ѯ�ط�
{
	response.sendRedirect("/tsgl/tshf/InsertCrm_tshfjl.jsp?khbh="+khbh);
}
else if (hfdl.equals("2"))//1��Ͷ�߻طã�2�����̻طã�3����ѯ�ط�
{
	response.sendRedirect("/gcgl/hfjl/InsertCrm_hfjl.jsp?khbh="+khbh);
}
else if (hfdl.equals("3"))//1��Ͷ�߻طã�2�����̻طã�3����ѯ�ط�
{
	response.sendRedirect("/dhzx/dhhf/InsertCrm_zxhfjl.jsp?khbh="+khbh);
}


%>

