<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String mmcljs=cf.GB2Uni(request.getParameter("mmcljs"));
String ccsm=cf.GB2Uni(request.getParameter("ccsm"));
String cclrr=cf.GB2Uni(request.getParameter("cclrr"));

String ls=null;
java.sql.Date sccsj=null;
ls=request.getParameter("sccsj");
try{
	if (!(ls.equals("")))  sccsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sccsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实初测时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date cclrsj=null;
ls=request.getParameter("cclrsj");
try{
	if (!(ls.equals("")))  cclrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cclrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[初测录入时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("02"))
	{
		out.println("！存盘失败，处理状态不正确。");
		return;
	}

	int xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  jc_mmccd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update jc_mmydd set sccsj=?,ccsm=?,mmcljs=?,cclrr=?,cclrsj=?,clzt='03'";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt='02' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sccsj);
	ps.setString(2,ccsm);
	ps.setString(3,mmcljs);
	ps.setString(4,cclrr);
	ps.setDate(5,cclrsj);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into jc_mmccd ( xh,yddbh,mmdglxbm,mlx,mmxh,sl,ysbm,czbm,azwzbm,kqfxbm,dczlbm,ctbs,dj,blxhbm,sfsmjcc,sfydc,bz,dbh ) ";
	ls_sql+=" select "+xh+"+rownum,yddbh,mmdglxbm,mlx,mmxh,sl,ysbm,czbm,azwzbm,kqfxbm,jc_mmydmx.dczlbm,ctbs,0,blxhbm,sfsmjcc,sfydc,bz,dzhd";
	ls_sql+=" from jc_mmydmx,jdm_dczlbm ";
	ls_sql+=" where  jc_mmydmx.dczlbm=jdm_dczlbm.dczlbm(+) and yddbh='"+yddbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_mmzjx set mmcljs=?";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmcljs);
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
	out.print("Exception: " + e);
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