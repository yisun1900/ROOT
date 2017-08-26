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
String ssfgs=null;
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
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cllx=null;
	ls_sql="select gysmc,cllx ";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where gysbm='"+gysbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gysmc=rs.getString("gysmc");
		cllx=rs.getString("cllx");
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

	String dqbm=null;
	ls_sql="select dqbm ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="delete from jxc_ppgysdzb ";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ls_sql+=" and  ppbm='"+ppbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jxc_ppgysdzb ( ppbm,ppmc,gysbm,gysmc,ssfgs,cllx ) ";
	ls_sql+=" values ( ?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,ppbm);
	ps.setString(2,ppmc);
	ps.setLong(3,gysbm);
	ps.setString(4,gysmc);
	ps.setString(5,ssfgs);
	ps.setString(6,cllx);
	ps.executeUpdate();
	ps.close();

	conn.commit();
		
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
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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