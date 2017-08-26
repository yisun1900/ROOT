<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String htqdr=cf.GB2Uni(request.getParameter("htqdr"));
String htbz=cf.GB2Uni(request.getParameter("htbz"));

String ls=null;

java.sql.Date jhazsj=null;
java.sql.Date htrq=null;
java.sql.Date kjxsj=null;
ls=request.getParameter("jhazsj");
try{
	if (!(ls.equals("")))  jhazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhazsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划安装时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("htrq");
try{
	if (!(ls.equals("")))  htrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签合同日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kjxsj");
try{
	if (!(ls.equals("")))  kjxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kjxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[可减项截止时间]类型转换发生意外:"+e);
	return;
}

double fwf=0;
ls=request.getParameter("fwf");
try{
	if (!(ls.equals("")))  fwf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[服务费]类型转换发生意外:"+e);
	return;
}
double mmzkl=0;
ls=request.getParameter("mmzkl");
try{
	if (!(ls.equals("")))  mmzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mmzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订单折扣]类型转换发生意外:"+e);
	return;
}
double wjzkl=0;
ls=request.getParameter("wjzkl");
try{
	if (!(ls.equals("")))  wjzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wjzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[五金折扣率]类型转换发生意外:"+e);
	return;
}
double blzkl=0;
ls=request.getParameter("blzkl");
try{
	if (!(ls.equals("")))  blzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量blzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[玻璃折扣率]类型转换发生意外:"+e);
	return;
}

String dzyy=cf.GB2Uni(request.getParameter("dzyy"));


String wjqk=cf.GB2Uni(request.getParameter("wjqk"));
String wjsgsbz=null;
if (wjqk.equals("1"))//1：客户自购；2：公司购买
{
	wjsgsbz="N";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where yddbh='"+yddbh+"'  ";
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
		out.println("错误！本订单已发生过增减项，不能再修改");
		return;
	}

	
	String fgsbh=null;
	ls_sql="select clzt,fgsbh";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("04"))
	{
		out.println("！存盘失败，处理状态不正确。");
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

	//对小数位处理＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="update jc_mmdgdmx set dj=ROUND(bzdj*"+mmzkl+"/10,"+jcddmxblxs+")";
	ls_sql+=" where  yddbh='"+yddbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_wjjddmx set dj=ROUND(bzdj*"+wjzkl+"/10,"+jcddmxblxs+")";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_blddmx set dj=ROUND(bzdj*"+blzkl+"/10,"+jcddmxblxs+")";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//对小数位处理－－－－－－－－－－－－－－－结束

	double zqmmhtje=0;
	double mmhtje=0;
	double zqzjhmmje=0;
	double zjhmmje=0;

	double zqwjhtje=0;
	double wjhtje=0;
	double zqzjhwjje=0;
	double zjhwjje=0;

	double zqblhtje=0;
	double blhtje=0;
	double zqzjhblje=0;
	double zjhblje=0;

	double wdzje=0;
	double htje=0;
	double zqzjhze=0;
	double zjhze=0;

	ls_sql="select sum(bzdj*sl),sum(dj*sl),sum(bzdj*zjhsl),sum(dj*zjhsl)";
	ls_sql+=" from  jc_mmdgdmx";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqmmhtje=rs.getDouble(1);
		mmhtje=rs.getDouble(2);
		zqzjhmmje=rs.getDouble(3);
		zjhmmje=rs.getDouble(4);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(bzdj*sl),sum(dj*sl),sum(bzdj*zjhsl),sum(dj*zjhsl)";
	ls_sql+=" from  jc_wjjddmx";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqwjhtje=rs.getDouble(1);
		wjhtje=rs.getDouble(2);
		zqzjhwjje=rs.getDouble(3);
		zjhwjje=rs.getDouble(4);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(bzdj*sl),sum(dj*sl),sum(bzdj*zjhsl),sum(dj*zjhsl)";
	ls_sql+=" from  jc_blddmx";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqblhtje=rs.getDouble(1);
		blhtje=rs.getDouble(2);
		zqzjhblje=rs.getDouble(3);
		zjhblje=rs.getDouble(4);
	}
	rs.close();
	ps.close();


	wdzje=zqmmhtje+zqwjhtje+zqblhtje+fwf;
	htje=mmhtje+wjhtje+blhtje+fwf;
	zqzjhze=zqzjhmmje+zqzjhwjje+zqzjhblje+fwf;
	zjhze=zjhmmje+zjhwjje+zjhblje+fwf;


	ls_sql="update jc_mmydd set jhazsj=?,htrq=?,htqdr=?,htbz=?,kjxsj=?,wjqk=?,wjsgsbz=?,mmzkl=?,wjzkl=?,blzkl=?";
	ls_sql+=" ,dzyy=?,fwf=?,zqmmhtje=? ,mmhtje=ROUND(?,"+jcddblxs+")   ,zqzjhmmje=? ,zjhmmje=ROUND(?,"+jcddblxs+") ";
	ls_sql+=" ,zqwjhtje=? ,wjhtje=ROUND(?,"+jcddblxs+")   ,zqzjhwjje=? ,zjhwjje=ROUND(?,"+jcddblxs+")";
	ls_sql+=" ,zqblhtje=? ,blhtje=ROUND(?,"+jcddblxs+")   ,zqzjhblje=? ,zjhblje=ROUND(?,"+jcddblxs+") ";
	ls_sql+=" ,wdzje=?    ,htje=ROUND(?,"+jcddblxs+")     ,zqzjhze=?   ,zjhze=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where  yddbh='"+yddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jhazsj);
	ps.setDate(2,htrq);
	ps.setString(3,htqdr);
	ps.setString(4,htbz);
	ps.setDate(5,kjxsj);
	ps.setString(6,wjqk);
	ps.setString(7,wjsgsbz);
	ps.setDouble(8,mmzkl);
	ps.setDouble(9,wjzkl);
	ps.setDouble(10,blzkl);

	ps.setString(11,dzyy);
	ps.setDouble(12,fwf);
	ps.setDouble(13,zqmmhtje);
	ps.setDouble(14,mmhtje);
	ps.setDouble(15,zqzjhmmje);
	ps.setDouble(16,zjhmmje);

	ps.setDouble(17,zqwjhtje);
	ps.setDouble(18,wjhtje);
	ps.setDouble(19,zqzjhwjje);
	ps.setDouble(20,zjhwjje);

	ps.setDouble(21,zqblhtje);
	ps.setDouble(22,blhtje);
	ps.setDouble(23,zqzjhblje);
	ps.setDouble(24,zjhblje);

	ps.setDouble(25,wdzje);
	ps.setDouble(26,htje);
	ps.setDouble(27,zqzjhze);
	ps.setDouble(28,zjhze);
	ps.executeUpdate();
	ps.close();
	
	//集成订单
	ls_sql="update jc_jcdd set zqje=?,zhje=ROUND(?,"+jcddblxs+"),fssj=?";
	ls_sql+=" where gjz='"+yddbh+"' and lx='1' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wdzje);
	ps.setDouble(2,htje);
	ps.setDate(3,htrq);
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
	out.print("<BR>SQL: " + ls_sql);
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