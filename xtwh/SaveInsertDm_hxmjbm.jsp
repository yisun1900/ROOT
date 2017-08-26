<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hxmjbm=null;
String hxmjmc=null;
double qd=0;
double zd=0;
hxmjbm=cf.GB2Uni(request.getParameter("hxmjbm"));
hxmjmc=cf.GB2Uni(request.getParameter("hxmjmc"));
ls=request.getParameter("qd");
try{
	if (!(ls.equals("")))  qd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[起点]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zd");
try{
	if (!(ls.equals("")))  zd=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[终点]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into dm_hxmjbm ( hxmjbm,hxmjmc,qd,zd ) ";
	ls_sql+=" values ( ?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hxmjbm);
	ps.setString(2,hxmjmc);
	ps.setDouble(3,qd);
	ps.setDouble(4,zd);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set hxmjbm=(select hxmjbm from dm_hxmjbm where  qd<crm_khxx.fwmj  and crm_khxx.fwmj<=zd)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

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