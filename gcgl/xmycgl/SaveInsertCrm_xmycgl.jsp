<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
java.sql.Date cxwtsj=null;
String dsr=null;
String cxwt=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("cxwtsj");
try{
	if (!(ls.equals("")))  cxwtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cxwtsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出现问题时间]类型转换发生意外:"+e);
	return;
}
dsr=cf.GB2Uni(request.getParameter("dsr"));
cxwt=cf.GB2Uni(request.getParameter("cxwt"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ycflbm=cf.GB2Uni(request.getParameter("ycflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String gcjdbm=null;
	ls_sql=" select gcjdbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";//
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
	}
	rs.close();
	ps.close();

	if (gcjdbm.equals("4") || gcjdbm.equals("5"))
	{
		out.println("<BR>！！！错误，客户已完工");
		return;
	}


	String djbh=null;
	int count=0;
	ls_sql="select NVL(max(substr(djbh,8,3)),0)";
	ls_sql+=" from  crm_xmycgl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	djbh=khbh+cf.addZero(count+1,3);

	ls_sql="insert into crm_xmycgl ( djbh,khbh,cxwtsj,dsr,ycflbm,cxwt,lrr,lrsj,lrbm,bz,zt,wtsfjj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,'1','N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,djbh);
	ps.setString(2,khbh);
	ps.setDate(3,cxwtsj);
	ps.setString(4,dsr);
	ps.setString(5,ycflbm);
	ps.setString(6,cxwt);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>