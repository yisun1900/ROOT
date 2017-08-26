<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String gtxh=null;
String gtpjbh=null;
double bzdj=0;
double sl=0;
double je=0;
String bz=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
gtxh=cf.GB2Uni(request.getParameter("gtxh"));
gtpjbh=cf.GB2Uni(request.getParameter("gtpjbh"));
ls=request.getParameter("bzdj");
try{
	if (!(ls.equals("")))  bzdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量je不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[金额]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String jjpjflbm=cf.GB2Uni(request.getParameter("jjpjflbm"));
String jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
String zjxxh=request.getParameter("zjxxh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

long pjxh=0;

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

	ls_sql="select NVL(max(pjxh),0)";
	ls_sql+=" from  jc_gtpjmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pjxh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	pjxh++;

	conn.setAutoCommit(false);
	
	ls_sql="insert into jc_gtpjmx ( pjxh,ddbh,gtxh,gtpjbh,gtpjmc,xinghao,guige,bzdj,khdj,sl,zqje,je,bz,jjpjflbm,jldwbm ) ";
	ls_sql+=" select ?,?,?,gtpjbh,gtpjmc,xinghao,guige,?,?,?,?,ROUND(?,"+jcddmxblxs+"),?,?,?";
	ls_sql+=" from  jc_jjpjbj";
	ls_sql+=" where gtpjbh='"+gtpjbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,pjxh);
	ps.setString(2,ddbh);
	ps.setString(3,gtxh);
	ps.setDouble(4,bzdj);
	ps.setDouble(5,bzdj*jjzkl/10);
	ps.setDouble(6,sl);
	ps.setDouble(7,je);
	ps.setDouble(8,je*jjzkl/10);
	ps.setString(9,bz);
	ps.setString(10,jjpjflbm);
	ps.setString(11,jldwbm);
	ps.executeUpdate();
	ps.close();


	//配件部分金额
	double pjbfje=0;
	double zqpjbfje=0;
	ls_sql="select sum(je),sum(zqje)";
	ls_sql+=" from  jc_gtpjmx";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pjbfje=rs.getDouble(1);
		zqpjbfje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_jjgtmx set pjbfje=ROUND(?,"+jcddmxblxs+"),zqpjbfje=?,zj=bcbfje+ROUND(?,"+jcddmxblxs+"),zqzj=zqbcbfje+? ";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,pjbfje);
	ps.setDouble(2,zqpjbfje);
	ps.setDouble(3,pjbfje);
	ps.setDouble(4,zqpjbfje);
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
	out.print("存盘失败,发生意外: " + e);
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