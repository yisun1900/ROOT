<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
double ysl=0;
ls=request.getParameter("ysl");
try{
	if (!(ls.equals("")))  ysl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ysl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原数量]类型转换发生意外:"+e);
	return;
}

double srdj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  srdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[dj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际单价]类型转换发生意外:"+e);
	return;
}

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String oldcpbm=cf.GB2Uni(request.getParameter("oldcpbm"));
String cpbm=cf.GB2Uni(request.getParameter("cpbm"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String oldsxh=cf.GB2Uni(request.getParameter("sxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	sl=ysl+sl;

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}


 	String getcpbm="";
	String zclx="";
	String sfkgdj=null;
	String lx=null;
	ls_sql="select cpbm,zclx,sfkgdj,lx";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcpbm=rs.getString(1);
		zclx=cf.fillNull(rs.getString("zclx"));
		sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		lx=cf.fillNull(rs.getString("lx"));//1：原项目；2：新增
	}
	rs.close();
	ps.close();


	if (sfkgdj.equals("Y") && lx.equals("2"))//是否可改单价  Y：是；N：否
	{
		double sjdj=0;//实际单价
		sjdj=srdj;

		ls_sql=" update bj_khzcxmh set sl=?,xdsl=?,ptcpsm=?,dj=?";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sl);
		ps.setDouble(2,sl);
		ps.setString(3,ptcpsm);
		ps.setDouble(4,sjdj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql=" update bj_khzcxmh set sl=?,xdsl=?,ptcpsm=?";
		ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sl);
		ps.setDouble(2,sl);
		ps.setString(3,ptcpsm);
		ps.executeUpdate();
		ps.close();
	}



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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) ps.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>