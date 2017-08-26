<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dbyy=null;
String dcgs=null;
String drgs=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
dbyy=cf.GB2Uni(request.getParameter("dbyy"));
dcgs=cf.GB2Uni(request.getParameter("dcgs"));
drgs=cf.GB2Uni(request.getParameter("drgs"));
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

String dbcllx="0";//0：主材；1：辅材
String nian=cf.today("YY");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dcdq=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dcgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dcdq=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	String drdq=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+drgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		drdq=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	//生成调拨批号：F（Z）D+dcgs+XX(年)+XXXX
	String dbph=null;
	int count=0;
	ls_sql="select NVL(max(substr(dbph,10,4)),0)";
	ls_sql+=" from  jxc_db";
	ls_sql+=" where dcgs='"+dcgs+"' and dbcllx='"+dbcllx+"' and nian='"+nian+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	dbph="ZD"+dcgs+nian+cf.addZero(count+1,4);

	ls_sql="insert into jxc_db (dbph,dbyy,dcdq,dcgs,drdq,drgs,lrr,lrsj,lrbm,nian   ,bz,dbcllx,dbzsl,dbdzt,dbzje,cbzje,ckzsl,ckzje ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,0,'0',0,0,0,0  ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dbph);
	ps.setString(2,dbyy);
	ps.setString(3,dcdq);
	ps.setString(4,dcgs);
	ps.setString(5,drdq);
	ps.setString(6,drgs);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,nian);

	ps.setString(11,bz);
	ps.setString(12,dbcllx);
	ps.executeUpdate();
	ps.close();

	
	response.sendRedirect("EditJxc_db.jsp?lx=1&dbph="+dbph);
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
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