<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
long ygbh=0;
String yhmc=null;
String xb=null;
String yfgsbh=null;
String ydwbh=null;
String yxzzwbm=null;
java.sql.Date yrzsj=null;
java.sql.Date ylzrq=null;
String ylzyy=null;
String xdwbh=null;
String xxzzwbm=null;
String xrzyy=null;
String lrr=null;
java.sql.Date lrsj=null;
java.sql.Date sqrq=null;
String lrbm=null;
String bz=null;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工序号]类型转换发生意外:"+e);
	return;
}
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
xb=cf.GB2Uni(request.getParameter("xb"));
yfgsbh=cf.GB2Uni(request.getParameter("yfgsbh"));
ydwbh=cf.GB2Uni(request.getParameter("ydwbh"));
yxzzwbm=cf.GB2Uni(request.getParameter("yxzzwbm"));
ls=request.getParameter("yrzsj");
try{
	if (!(ls.equals("")))  yrzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yrzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上次入职日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ylzrq");
try{
	if (!(ls.equals("")))  ylzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ylzrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[离职日期]类型转换发生意外:"+e);
	return;
}
ylzyy=cf.GB2Uni(request.getParameter("ylzyy"));
xdwbh=cf.GB2Uni(request.getParameter("xdwbh"));
xxzzwbm=cf.GB2Uni(request.getParameter("xxzzwbm"));
xrzyy=cf.GB2Uni(request.getParameter("xrzyy"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请日期]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String clzt=cf.GB2Uni(request.getParameter("clzt"));
String[] ztbm=request.getParameterValues("ztbm");

String wheresqxh=cf.GB2Uni(request.getParameter("wheresqxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  rs_ecrzsqd";
	ls_sql+=" where  (sqxh='"+wheresqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!getclzt.equals("00") && !getclzt.equals("01"))//01：等待审批
	{
		out.println("错误！处理状态不正确");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="delete from rs_ecrzsqsplc";
	ls_sql+=" where sqxh='"+wheresqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	String shztbm="";
	if (ztbm!=null)
	{

		for (int i=0;i<ztbm.length ;i++ )
		{
			ls_sql="insert into rs_ecrzsqsplc ( sqxh,ztbm,xh)";
			ls_sql+=" values ( ?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,wheresqxh);
			ps.setString(2,ztbm[i]);
			ps.setInt(3,(i+1));
			ps.executeUpdate();
			ps.close();
		}

		shztbm=ztbm[0];
	}

	ls_sql="update rs_ecrzsqd set fgsbh=?,ygbh=?,yhmc=?,xb=?,yfgsbh=?,ydwbh=?,yxzzwbm=?,yrzsj=?,ylzrq=?,ylzyy=?,xdwbh=?,xxzzwbm=?,xrzyy=?,lrr=?,lrsj=?,lrbm=?,bz=?,sqrq=?,clzt=?,ztbm=? ";
	ls_sql+=" where sqxh='"+wheresqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setLong(2,ygbh);
	ps.setString(3,yhmc);
	ps.setString(4,xb);
	ps.setString(5,yfgsbh);
	ps.setString(6,ydwbh);
	ps.setString(7,yxzzwbm);
	ps.setDate(8,yrzsj);
	ps.setDate(9,ylzrq);
	ps.setString(10,ylzyy);
	ps.setString(11,xdwbh);
	ps.setString(12,xxzzwbm);
	ps.setString(13,xrzyy);
	ps.setString(14,lrr);
	ps.setDate(15,lrsj);
	ps.setString(16,lrbm);
	ps.setString(17,bz);
	ps.setDate(18,sqrq);
	ps.setString(19,clzt);
	ps.setString(20,shztbm);
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