<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sqxh=null;
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
sqxh=cf.GB2Uni(request.getParameter("sqxh"));
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  rs_ecrzsqd";
	ls_sql+=" where ygbh="+ygbh+" and clzt not in('04','05')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("错误！已录入『二次入职申请』");
		return;
	}

	String sfzszg="";
	ls_sql="select sfzszg";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfzszg=rs.getString(1);
	}
	rs.close();
	ps.close();

	if (!sfzszg.equals("S") && !sfzszg.equals("T"))
	{
		out.println("错误！员工未离职");
		return;
	}

	conn.setAutoCommit(false);

	String shztbm="";
	if (ztbm!=null)
	{
		for (int i=0;i<ztbm.length ;i++ )
		{
			ls_sql="insert into rs_ecrzsqsplc ( sqxh,ztbm,xh)";
			ls_sql+=" values ( ?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sqxh);
			ps.setString(2,ztbm[i]);
			ps.setInt(3,(i+1));
			ps.executeUpdate();
			ps.close();
		}

		shztbm=ztbm[0];
	}

	ls_sql="insert into rs_ecrzsqd ( sqxh,fgsbh,ygbh,yhmc,xb,yfgsbh,ydwbh,yxzzwbm,yrzsj,ylzrq,ylzyy,xdwbh,xxzzwbm,xrzyy,lrr,lrsj,lrbm,bz,sqrq,clzt,ztbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sqxh);
	ps.setString(2,fgsbh);
	ps.setLong(3,ygbh);
	ps.setString(4,yhmc);
	ps.setString(5,xb);
	ps.setString(6,yfgsbh);
	ps.setString(7,ydwbh);
	ps.setString(8,yxzzwbm);
	ps.setDate(9,yrzsj);
	ps.setDate(10,ylzrq);
	ps.setString(11,ylzyy);
	ps.setString(12,xdwbh);
	ps.setString(13,xxzzwbm);
	ps.setString(14,xrzyy);
	ps.setString(15,lrr);
	ps.setDate(16,lrsj);
	ps.setString(17,lrbm);
	ps.setString(18,bz);
	ps.setDate(19,sqrq);
	ps.setString(20,clzt);
	ps.setString(21,shztbm);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>