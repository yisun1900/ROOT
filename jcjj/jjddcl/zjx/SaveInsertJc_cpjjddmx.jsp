<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String cpjjbh=null;
String cpjjhs=null;
double bzdj=0;
int sl=0;
double zj=0;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
cpjjbh=cf.GB2Uni(request.getParameter("cpjjbh"));
cpjjhs=cf.GB2Uni(request.getParameter("cpjjhs"));
ls=request.getParameter("bzdj");
try{
	if (!(ls.equals("")))  bzdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同数量]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("zj");
try{
	if (!(ls.equals("")))  zj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[总价]类型转换发生意外:"+e);
	return;
}

bz=cf.GB2Uni(request.getParameter("bz"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String fgsbh=null;
	String clzt=null;
	double jjzkl=0;
	ls_sql="select fgsbh,clzt,jjzkl";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		clzt=rs.getString("clzt");
		jjzkl=rs.getDouble("jjzkl");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再录入");
		return;
	}

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cpjjddmx";
	ls_sql+=" where cpjjbh='"+cpjjbh+"' and ddbh='"+ddbh+"'";
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
		out.println("错误！该种产品已选择，不能录入新项目，请增减原有项目");
		return;
	}

	//获取保留小数参数＋＋＋＋＋＋＋＋＋＋＋开始
	int jcddblxs=-100;//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	int jcddmxblxs=-100;//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jcddblxs=rs.getInt(1);
		jcddmxblxs=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>错误，没有设置『集成订单保留小数位数』，请联系管理员");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>错误，没有设置『集成订单明细保留小数』，请联系管理员");
		return;
	}
	//获取保留小数参数＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	conn.setAutoCommit(false);

	ls_sql="insert into jc_cpjjddmx ( ddbh,cpjjbh,cpjjfg,cpjjmc,xh,gg,cpjjxl,cpjjcz   ,cpjjhs,bzdj,khdj,sl,zqzj,zj  ,zjhsl,zqzjhzj,zjhzj  ,cktp,cptp,cpsm,cpbz,bz ) ";
	ls_sql+=" select ?,cpjjbh,cpjjfg,cpjjmc,xh,gg,cpjjxl,cpjjcz   ,?,?,?,?,?,ROUND(?,"+jcddmxblxs+")  ,?,?,ROUND(?,"+jcddmxblxs+")  ,cktp,cptp,cpsm,bz,? ";
	ls_sql+=" from jc_cpjjbj ";
	ls_sql+=" where cpjjbh='"+cpjjbh+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);

	ps.setString(2,cpjjhs);
	ps.setDouble(3,bzdj);
	ps.setDouble(4,bzdj*jjzkl/10);
	ps.setInt(5,0);
	ps.setDouble(6,0);
	ps.setDouble(7,0);

	ps.setInt(8,sl);
	ps.setDouble(9,zj);
	ps.setDouble(10,zj*jjzkl/10);

	ps.setString(11,bz);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_cpjjzjxmx (zjxxh,cpjjbh,ddbh,lx,ysl,xsl)";
	ls_sql+=" values('"+zjxxh+"','"+cpjjbh+"','"+ddbh+"','2',0,"+sl+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.close();
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