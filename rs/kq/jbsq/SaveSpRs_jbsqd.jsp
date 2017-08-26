<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String shr=null;
java.sql.Date shsj=null;
String shjl=null;
String shyj=null;

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

shjl=cf.GB2Uni(request.getParameter("shjl"));
shyj=cf.GB2Uni(request.getParameter("shyj"));

String ztbm=cf.GB2Uni(request.getParameter("ztbm"));

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String yspxh=null;
	String yclzt=null;
	String yztbm=null;
	String yshjl=null;
	String yshyj=null;
	String yshr=null;
	java.sql.Date yshsj=null;
	ls_sql="select spxh,clzt,ztbm,shjl,shyj,shr,shsj";
	ls_sql+=" from  rs_jbsqd";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yspxh=cf.fillNull(rs.getString("spxh"));
		yclzt=cf.fillNull(rs.getString("clzt"));
		yztbm=cf.fillNull(rs.getString("ztbm"));
		yshjl=cf.fillNull(rs.getString("shjl"));
		yshyj=cf.fillNull(rs.getString("shyj"));
		yshr=cf.fillNull(rs.getString("shr"));
		yshsj=rs.getDate("shsj");
	}
	rs.close();
	ps.close();

	if (!yclzt.equals("01") && !yclzt.equals("02"))//01：等待审批,02：正在审批
	{
		out.println("错误！处理状态不正确");
		return;
	}

	if (!yztbm.equals(ztbm))
	{
		out.println("错误！『审批状态』已改变");
		return;
	}

	//取下一状态
	String xyztbm=null;
	ls_sql="select xyztbm";
	ls_sql+=" from  rs_shztlc";
	ls_sql+=" where ztbm='"+ztbm+"' and shjl='"+shjl+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xyztbm=cf.fillNull(rs.getString("xyztbm"));
	}
	rs.close();
	ps.close();

	String sqzt=null;
	ls_sql="select sqzt";
	ls_sql+=" from  rs_ztbm";
	ls_sql+=" where ztbm='"+xyztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqzt=cf.fillNull(rs.getString("sqzt"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//取审核表序号
	long spxh=0;
	ls_sql="select max(spxh)  from rs_jbsqspb ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		spxh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	spxh++;
	
	ls_sql="insert into rs_jbsqspb (spxh,sqxh,shjl,shyj,shr,shsj,clzt,ztbm   ,yspxh,yclzt,yztbm,yshjl,yshyj,yshr,yshsj)";
	ls_sql+=" values("+spxh+",?,?,?,?,?,?,?   ,?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sqxh);
	ps.setString(2,shjl);
	ps.setString(3,shyj);
	ps.setString(4,shr);
	ps.setDate(5,shsj);
	ps.setString(6,sqzt);
	ps.setString(7,xyztbm);

	ps.setString(8,yspxh);
	ps.setString(9,yclzt);
	ps.setString(10,yztbm);
	ps.setString(11,yshjl);
	ps.setString(12,yshyj);
	ps.setString(13,yshr);
	ps.setDate(14,yshsj);
	ps.executeUpdate();
	ps.close();


	ls_sql="update rs_jbsqd set spxh=?,shr=?,shsj=?,shjl=?,shyj=?,clzt=?,ztbm=? ";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,spxh);
	ps.setString(2,shr);
	ps.setDate(3,shsj);
	ps.setString(4,shjl);
	ps.setString(5,shyj);
	ps.setString(6,sqzt);
	ps.setString(7,xyztbm);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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