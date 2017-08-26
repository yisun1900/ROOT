<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String khbh=request.getParameter("khbh");
String hflxbm=request.getParameter("hflxbm");
String hfdl=cf.executeQuery("select hfdl from dm_hflxbm where hflxbm='"+hflxbm+"'");

if (hfdl.equals("1"))//1：投诉回访；2：工程回访；3：咨询回访
{
	response.sendRedirect("/tsgl/tshf/InsertCrm_tshfjl.jsp?khbh="+khbh);
}
else if (hfdl.equals("2"))//1：投诉回访；2：工程回访；3：咨询回访
{
	response.sendRedirect("/gcgl/hfjl/InsertCrm_hfjl.jsp?khbh="+khbh);
}
else if (hfdl.equals("3"))//1：投诉回访；2：工程回访；3：咨询回访
{
	response.sendRedirect("/dhzx/dhhf/InsertCrm_zxhfjl.jsp?khbh="+khbh);
}


%>

