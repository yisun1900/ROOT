<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ygbh=0;
String sjd=null;
String gzdwbm=null;
String drzw=null;
String dwdh=null;
String zmr=null;
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
sjd=cf.GB2Uni(request.getParameter("sjd"));
gzdwbm=cf.GB2Uni(request.getParameter("gzdwbm"));
drzw=cf.GB2Uni(request.getParameter("drzw"));
dwdh=cf.GB2Uni(request.getParameter("dwdh"));
zmr=cf.GB2Uni(request.getParameter("zmr"));
String whereygbh=null;
String wheresjd=null;
whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));
wheresjd=cf.GB2Uni(request.getParameter("wheresjd"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_gzjl set ygbh=?,sjd=?,gzdwbm=?,drzw=?,dwdh=?,zmr=? ";
	ls_sql+=" where  (ygbh="+whereygbh+") and  (sjd='"+wheresjd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,ygbh);
	ps.setString(2,sjd);
	ps.setString(3,gzdwbm);
	ps.setString(4,drzw);
	ps.setString(5,dwdh);
	ps.setString(6,zmr);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>