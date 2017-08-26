<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ygbh=0;
String xm=null;
String gx=null;
String csnf=null;
String gzdw=null;
String zw=null;
String lxdh=null;
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
xm=cf.GB2Uni(request.getParameter("xm"));
gx=cf.GB2Uni(request.getParameter("gx"));
csnf=cf.GB2Uni(request.getParameter("csnf"));
gzdw=cf.GB2Uni(request.getParameter("gzdw"));
zw=cf.GB2Uni(request.getParameter("zw"));
lxdh=cf.GB2Uni(request.getParameter("lxdh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into rs_jtzl ( ygbh,xm,gx,csnf,gzdw,zw,lxdh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,ygbh);
	ps.setString(2,xm);
	ps.setString(3,gx);
	ps.setString(4,csnf);
	ps.setString(5,gzdw);
	ps.setString(6,zw);
	ps.setString(7,lxdh);
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
	out.print("存盘失败,发生意外: " + e);
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