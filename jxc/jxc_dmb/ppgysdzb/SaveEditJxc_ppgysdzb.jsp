<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ppbm=0;
String ppmc=null;
long gysbm=0;
String gysmc=null;
String dqbm=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
ls=request.getParameter("ppbm");
try{
	if (!(ls.equals("")))  ppbm=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ppbm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[子品牌编码]类型转换发生意外:"+e);
	return;
}
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
String whereppbm=null;
String wheregysbm=null;
whereppbm=cf.GB2Uni(request.getParameter("whereppbm"));
wheregysbm=cf.GB2Uni(request.getParameter("wheregysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gysmc ";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where gysbm='"+gysbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gysmc=rs.getString("gysmc");
	}
	rs.close();
	ps.close();

	ls_sql="select ppmc ";
	ls_sql+=" from  jxc_ppxx";
	ls_sql+=" where ppbm='"+ppbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppmc=rs.getString("ppmc");
	}
	rs.close();
	ps.close();


	ls_sql="update jxc_ppgysdzb set ppbm=?,ppmc=?,gysbm=?,gysmc=?,dqbm=? ";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,ppbm);
	ps.setString(2,ppmc);
	ps.setLong(3,gysbm);
	ps.setString(4,gysmc);
	ps.setString(5,dqbm);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>