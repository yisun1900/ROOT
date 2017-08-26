<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long shbh=0;
long shhrs=0;
String zpsqbh=null;
String shjl=null;
String ztbm=null;
String shyj=null;
String shr=null;
java.sql.Date shsj=null;
ls=request.getParameter("shbh");
try{
	if (!(ls.equals("")))  shbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核编号]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("shhrs");
try{
	if (!(ls.equals("")))  shhrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shhrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核后人数]类型转换发生意外:"+e);
	return;
}
zpsqbh=cf.GB2Uni(request.getParameter("zpsqbh"));
shjl=cf.GB2Uni(request.getParameter("shjl"));
ztbm=cf.GB2Uni(request.getParameter("ztbm"));
shyj=cf.GB2Uni(request.getParameter("shyj"));
shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
//String xysqzt=null;
String yztbm=null;
String sqzt=null;
String ysqzt=null;
String yshjl=null;
String yshyj=null;
String yshr=null;
long yshbh=0;
long yshhrs=0;
java.sql.Date yshsj=null;
try {
	conn=cf.getConnection();
	ls_sql=" SELECT ztbm,sqzt,shjl,shyj,shr,shsj,shbh,shhrs ";
	ls_sql+=" FROM rs_zpsq ";
    ls_sql+=" where zpsqbh='"+zpsqbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yztbm=rs.getString(1);
		ysqzt=rs.getString(2);
		yshjl=rs.getString(3);
		yshyj=rs.getString(4);
		yshr=rs.getString(5);
		yshsj=rs.getDate(6);
		yshbh=rs.getLong(7);
		yshhrs=rs.getLong(8);
	}
	rs.close();
	ps.close();

//从读取下一申请状态
	ls_sql=" SELECT sqzt ";
	ls_sql+=" FROM rs_ztbm ";
    ls_sql+=" where ztbm='"+ztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqzt=rs.getString(1);
	}
	rs.close();
	ps.close();

//	if(xyztbm.equals("0100"))
//	{
//		sqzt="6";
//	}
//	if(shjl.equals("0"))
//	{
//		sqzt="4";
//	}
//	if(shjl.equals("9"))
//	{
//		sqzt="5";
//	}

	conn.setAutoCommit(false);

	ls_sql="insert into rs_zpsh ( shbh,shjl,shyj,shr,shsj,zpsqbh,ysqzt,yshjl,yshyj,yshr,yshsj,yztbm,yshbh,yshhrs,ztbm,sqzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,shbh);
	ps.setString(2,shjl);
	ps.setString(3,shyj);
	ps.setString(4,shr);
	ps.setDate(5,shsj);
	ps.setString(6,zpsqbh);
	ps.setString(7,ysqzt);
	ps.setString(8,yshjl);
	ps.setString(9,yshyj);
	ps.setString(10,yshr);
	ps.setDate(11,yshsj);
	ps.setString(12,yztbm);
	ps.setLong(13,yshbh);
	ps.setLong(14,yshhrs);
	ps.setString(15,ztbm);
	ps.setString(16,sqzt);

	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_zpsq set ztbm=?,shjl=?,sqzt=?,shyj=?,shr=?,shsj=?,shbh=?,shhrs=? ";
	ls_sql+=" where zpsqbh='"+zpsqbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ztbm);
	ps.setString(2,shjl);
	ps.setString(3,sqzt);
	ps.setString(4,shyj);
	ps.setString(5,shr);
	ps.setDate(6,shsj);
	ps.setLong(7,shbh);
	ps.setLong(8,shhrs);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("审核成功!");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>