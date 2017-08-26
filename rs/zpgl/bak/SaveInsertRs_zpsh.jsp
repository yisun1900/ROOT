<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long shbh=0;
String zpjhbh=null;
String shjl=null;
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
zpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
shjl=cf.GB2Uni(request.getParameter("shjl"));
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
String xyztbm=null;
String ztbm=null;
String jhzt="2";
String yjhzt=null;
String yshjl=null;
String yshyj=null;
String yshr=null;
long yshbh=0;
java.sql.Date yshsj=null;
try {
	conn=cf.getConnection();


	ls_sql=" SELECT ztbm,jhzt,shjl,shyj,shr,shsj,shbh ";
	ls_sql+=" FROM rs_zpjh ";
    ls_sql+=" where zpjhbh='"+zpjhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ztbm=rs.getString(1);
		yjhzt=rs.getString(2);
		yshjl=rs.getString(3);
		yshyj=rs.getString(4);
		yshr=rs.getString(5);
		yshsj=rs.getDate(6);
		yshbh=rs.getLong(7);
	}
	rs.close();
	ps.close();

//从流程控制里读取，下一流程状态
	ls_sql=" SELECT xyztbm ";
	ls_sql+=" FROM rs_zpztkz ";
    ls_sql+=" where shjl='"+shjl+"' and ztbm='"+ztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xyztbm=rs.getString(1);
	}
	rs.close();
	ps.close();

	if(xyztbm.equals("0100"))
	{
		jhzt="6";
	}
	if(shjl.equals("0"))
	{
		jhzt="4";
	}
	if(shjl.equals("9"))
	{
		jhzt="5";
	}

	conn.setAutoCommit(false);

	ls_sql="insert into rs_zpsh ( shbh,shjl,shyj,shr,shsj,zpjhbh,yjhzt,yshjl,yshyj,yshr,yshsj,yztbm,yshbh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,shbh);
	ps.setString(2,shjl);
	ps.setString(3,shyj);
	ps.setString(4,shr);
	ps.setDate(5,shsj);
	ps.setString(6,zpjhbh);
	ps.setString(7,yjhzt);
	ps.setString(8,yshjl);
	ps.setString(9,yshyj);
	ps.setString(10,yshr);
	ps.setDate(11,yshsj);
	ps.setString(12,ztbm);
	ps.setLong(13,yshbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_zpjh set ztbm=?,shjl=?,jhzt=?,shyj=?,shr=?,shsj=?,shbh=? ";
	ls_sql+=" where zpjhbh='"+zpjhbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xyztbm);
	ps.setString(2,shjl);
	ps.setString(3,jhzt);
	ps.setString(4,shyj);
	ps.setString(5,shr);
	ps.setDate(6,shsj);
	ps.setLong(7,shbh);
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