<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
String blxhbm=null;
double dj=0;
long zjhsl=0;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
blxhbm=cf.GB2Uni(request.getParameter("blxhbm"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjhsl");
try{
	if (!(ls.equals("")))  zjhsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjhsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订购数量]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String lrxh=request.getParameter("lrxh");
String zjxxh=request.getParameter("zjxxh");
String lx=request.getParameter("lx");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double blzjxje=0;
double zjxze=0;
try {
	conn=cf.getConnection();

	String clzt=null;
	String dqbm=null;
	double mmzkl=10;
	//获取保留小数参数＋＋＋＋＋＋＋＋＋＋＋开始
	int jcddblxs=-100;//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	int jcddmxblxs=-100;//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	ls_sql="select jc_mmzjx.clzt,jc_mmzjx.mmzkl,sq_dwxx.dqbm,NVL(sq_dwxx.jcddblxs,-100) jcddblxs,NVL(sq_dwxx.jcddmxblxs,-100) jcddmxblxs";
	ls_sql+=" from  jc_mmzjx,sq_dwxx";
	ls_sql+=" where jc_mmzjx.fgsbh=sq_dwxx.dwbh and jc_mmzjx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		dqbm=rs.getString("dqbm");
		mmzkl=rs.getDouble("mmzkl");
		jcddblxs=rs.getInt("jcddblxs");
		jcddmxblxs=rs.getInt("jcddmxblxs");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再录入");
		return;
	}

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

	String blxh=null;
	String bllxbm=null;
	String blytbm=null;
	ls_sql="select blxh,bllxbm,blytbm";
	ls_sql+=" from  jc_blbj";
	ls_sql+=" where blxhbm='"+blxhbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		blxh=rs.getString("blxh");
		bllxbm=rs.getString("bllxbm");
		blytbm=rs.getString("blytbm");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	
	ls_sql="update jc_blddmx set blxhbm=?,bzdj=?,dj=ROUND(?,"+jcddmxblxs+"),zjhsl=?,bz=?,blxh=?,bllxbm=?,blytbm=? ";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,blxhbm);
	ps.setDouble(2,dj);
	ps.setDouble(3,dj*mmzkl/10);
	ps.setLong(4,zjhsl);
	ps.setString(5,bz);
	ps.setString(6,blxh);
	ps.setString(7,bllxbm);
	ps.setString(8,blytbm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_blzjxmx set xsl=?";
	ls_sql+=" where  yddbh='"+yddbh+"' and zjxxh="+zjxxh+" and lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjhsl);
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