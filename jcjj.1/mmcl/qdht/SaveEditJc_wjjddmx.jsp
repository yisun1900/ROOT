<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
long xh=0;
double dj=0;
double sl=0;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[五金件序号]类型转换发生意外:"+e);
	return;
}
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
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
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

String wjjbm=cf.GB2Uni(request.getParameter("wjjbm"));
String mmsbsbm=cf.GB2Uni(request.getParameter("mmsbsbm"));
String xinghao=cf.GB2Uni(request.getParameter("xinghao"));

String lrxh=request.getParameter("lrxh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	String dqbm=null;
	double wjzkl=10;
	//获取保留小数参数＋＋＋＋＋＋＋＋＋＋＋开始
	int jcddblxs=-100;//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	int jcddmxblxs=-100;//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	ls_sql="select sq_dwxx.dqbm,jc_mmydd.wjzkl,NVL(sq_dwxx.jcddblxs,-100) jcddblxs,NVL(sq_dwxx.jcddmxblxs,-100) jcddmxblxs";
	ls_sql+=" from  jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
		wjzkl=rs.getDouble("wjzkl");
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

	String wjmc=null;
	String jldw=null;
	ls_sql="select wjmc,jldw";
	ls_sql+=" from  jc_wjjbj";
	ls_sql+=" where xh="+xh+" and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjmc=rs.getString("wjmc");
		jldw=rs.getString("jldw");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update jc_wjjddmx set xh=?,bzdj=?,dj=ROUND(?,"+jcddmxblxs+"),sl=?,zjhsl=?,bz=?,wjjbm=?,mmsbsbm=?,xinghao=?,wjmc=?,jldw=? ";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setDouble(2,dj);
	ps.setDouble(3,dj*wjzkl/10);
	ps.setDouble(4,sl);
	ps.setDouble(5,sl);
	ps.setString(6,bz);
	ps.setString(7,wjjbm);
	ps.setString(8,mmsbsbm);
	ps.setString(9,xinghao);
	ps.setString(10,wjmc);
	ps.setString(11,jldw);
	ps.executeUpdate();
	ps.close();

	double zqwjhtje=0;
	double wjhtje=0;
	ls_sql="select sum(bzdj*sl),sum(dj*sl)";
	ls_sql+=" from  jc_wjjddmx";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqwjhtje=rs.getDouble(1);
		wjhtje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	double wdzje=0;
	double htje=0;
	ls_sql="select fwf+zqmmhtje+zqblhtje+"+zqwjhtje+",fwf+mmhtje+blhtje+"+wjhtje;
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

	ls_sql="update jc_mmydd set zqwjhtje=? ,wjhtje=ROUND(?,"+jcddblxs+") ,wdzje=?  ,htje=ROUND(?,"+jcddblxs+")";
	ls_sql+="                  ,zqzjhwjje=?,zjhwjje=ROUND(?,"+jcddblxs+"),zqzjhze=?,zjhze=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zqwjhtje);
	ps.setDouble(2,wjhtje);
	ps.setDouble(3,wdzje);
	ps.setDouble(4,htje);

	ps.setDouble(5,zqwjhtje);
	ps.setDouble(6,wjhtje);
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
	alert("存盘成功！五金合同金额=<%=wjhtje%>，合同总额=<%=htje%>");
	parent.window.close();
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