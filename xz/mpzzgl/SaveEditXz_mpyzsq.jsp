<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
int yqsl=0;
java.sql.Date yqjfrq=null;
String bz=null;
String mpbb=null;
bz=cf.GB2Uni(request.getParameter("bz"));
mpbb=cf.GB2Uni(request.getParameter("mpbb"));

ls=request.getParameter("yqsl");
try{
	if (!(ls.equals("")))  yqsl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[要求数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yqjfrq");
try{
	if (!(ls.equals("")))  yqjfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqjfrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[要求交付日期]类型转换发生意外:"+e);
	return;
}
String cz=null;
String yx=null;
cz=cf.GB2Uni(request.getParameter("cz"));
yx=cf.GB2Uni(request.getParameter("yx"));

String wheresqxh=null;
wheresqxh=cf.GB2Uni(request.getParameter("wheresqxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update xz_mpyzsq set yqsl=?,yqjfrq=?,bz=?,mpbb=?,cz=?,yx=?";
	ls_sql+=" where  (sqxh='"+wheresqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,yqsl);
	ps.setDate(2,yqjfrq);
	ps.setString(3,bz);
	ps.setString(4,mpbb);
	ps.setString(5,cz);
	ps.setString(6,yx);
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

