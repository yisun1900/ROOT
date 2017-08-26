<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xh=0;
long gysbm=0;
String lxrxm=null;
String zw=null;
String sj=null;
String bgdh=null;
String cz=null;
String sflz=null;
String bz=null;
ls=request.getParameter("gysbm");
try{
	if (!(ls.equals("")))  gysbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gysbm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[供应商编码]类型转换发生意外:"+e);
	return;
}
lxrxm=cf.GB2Uni(request.getParameter("lxrxm"));
zw=cf.GB2Uni(request.getParameter("zw"));
sj=cf.GB2Uni(request.getParameter("sj"));
bgdh=cf.GB2Uni(request.getParameter("bgdh"));
cz=cf.GB2Uni(request.getParameter("cz"));
sflz=cf.GB2Uni(request.getParameter("sflz"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_gyslxr set gysbm=?,lxrxm=?,zw=?,sj=?,bgdh=?,cz=?,sflz=?,bz=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,gysbm);
	ps.setString(2,lxrxm);
	ps.setString(3,zw);
	ps.setString(4,sj);
	ps.setString(5,bgdh);
	ps.setString(6,cz);
	ps.setString(7,sflz);
	ps.setString(8,bz);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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