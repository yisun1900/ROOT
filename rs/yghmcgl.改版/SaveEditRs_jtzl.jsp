<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xm=null;
String gx=null;
String csnf=null;
String gzdw=null;
String zw=null;
String lxdh=null;
xm=cf.GB2Uni(request.getParameter("xm"));
gx=cf.GB2Uni(request.getParameter("gx"));
csnf=cf.GB2Uni(request.getParameter("csnf"));
gzdw=cf.GB2Uni(request.getParameter("gzdw"));
zw=cf.GB2Uni(request.getParameter("zw"));
lxdh=cf.GB2Uni(request.getParameter("lxdh"));
String whereygbh=null;
String wherexm=null;
whereygbh=cf.GB2Uni(request.getParameter("whereygbh"));
wherexm=cf.GB2Uni(request.getParameter("wherexm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_jtzl set xm=?,gx=?,csnf=?,gzdw=?,zw=?,lxdh=? ";
	ls_sql+=" where  (ygbh="+whereygbh+") and  (xm='"+wherexm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xm);
	ps.setString(2,gx);
	ps.setString(3,csnf);
	ps.setString(4,gzdw);
	ps.setString(5,zw);
	ps.setString(6,lxdh);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>´æÅÌÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("´æÅÌ³É¹¦£¡");
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