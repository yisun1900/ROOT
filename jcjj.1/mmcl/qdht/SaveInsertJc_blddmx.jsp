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
long sl=0;
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
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订购数量]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String dqbm=null;
	double blzkl=10;
	//获取保留小数参数＋＋＋＋＋＋＋＋＋＋＋开始
	int jcddblxs=-100;//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	int jcddmxblxs=-100;//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	ls_sql="select sq_dwxx.dqbm,jc_mmydd.blzkl,NVL(sq_dwxx.jcddblxs,-100) jcddblxs,NVL(sq_dwxx.jcddmxblxs,-100) jcddmxblxs";
	ls_sql+=" from  jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
		blzkl=rs.getDouble("blzkl");
		jcddblxs=rs.getInt("jcddblxs");
		jcddmxblxs=rs.getInt("jcddmxblxs");
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

	int lrxh=0;
	ls_sql="select NVL(max(lrxh),0)";
	ls_sql+=" from  jc_blddmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lrxh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	lrxh++;

	conn.setAutoCommit(false);

	ls_sql="insert into jc_blddmx ( yddbh,blxhbm,bzdj,dj,sl,zjhsl,lx,bz,lrxh,blxh,bllxbm,blytbm ) ";
	ls_sql+=" values ( ?,?,?,ROUND(?,"+jcddmxblxs+"),?,?,'1',?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yddbh);
	ps.setString(2,blxhbm);
	ps.setDouble(3,dj);
	ps.setDouble(4,dj*blzkl/10);
	ps.setLong(5,sl);
	ps.setLong(6,sl);
	ps.setString(7,bz);
	ps.setInt(8,lrxh);
	ps.setString(9,blxh);
	ps.setString(10,bllxbm);
	ps.setString(11,blytbm);
	ps.executeUpdate();
	ps.close();


	double zqblhtje=0;
	double blhtje=0;
	ls_sql="select sum(bzdj*sl),sum(dj*sl)";
	ls_sql+=" from  jc_blddmx";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqblhtje=rs.getDouble(1);
		blhtje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	double wdzje=0;
	double htje=0;
	ls_sql="select fwf+zqmmhtje+zqwjhtje+"+zqblhtje+",fwf+mmhtje+wjhtje+"+blhtje;
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wdzje=rs.getDouble(1);
		htje=rs.getDouble(2);
	}
	rs.close();
	ps.close();
	
	ls_sql="update jc_mmydd set zqblhtje=? ,blhtje=ROUND(?,"+jcddblxs+") ,wdzje=?  ,htje=ROUND(?,"+jcddblxs+")";
	ls_sql+="                  ,zqzjhblje=?,zjhblje=ROUND(?,"+jcddblxs+"),zqzjhze=?,zjhze=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zqblhtje);
	ps.setDouble(2,blhtje);
	ps.setDouble(3,wdzje);
	ps.setDouble(4,htje);

	ps.setDouble(5,zqblhtje);
	ps.setDouble(6,blhtje);
	ps.setDouble(7,wdzje);
	ps.setDouble(8,htje);
	ps.executeUpdate();
	ps.close();
	
	//集成订单
	ls_sql="update jc_jcdd set zqje=?,zhje=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where gjz='"+yddbh+"' and lx='1' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wdzje);
	ps.setDouble(2,htje);
	ps.executeUpdate();
	ps.close();


	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！玻璃金额=<%=blhtje%>，合同总额=<%=htje%>");
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
		if (conn != null) cf.close(conn); 
	}
}
%>