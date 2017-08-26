<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String htbz=cf.GB2Uni(request.getParameter("htbz"));
String qhtr=cf.GB2Uni(request.getParameter("qhtr"));
java.sql.Date qhtsj=null;
java.sql.Date kjxsj=null;
java.sql.Date jhazrq=null;
ls=request.getParameter("jhazrq");
try{
	if (!(ls.equals("")))  jhazrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhazrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[安装日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qhtsj");
try{
	if (!(ls.equals("")))  qhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qhtsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签合同时间]类型转换发生意外:"+e);
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

double jjzkl=0;
ls=request.getParameter("jjzkl");
try{
	if (!(ls.equals("")))  jjzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jjzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订单折扣]类型转换发生意外:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String fgsbh=null;
	String clzt=null;
	ls_sql="select fgsbh,clzt";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("13"))
	{
		out.println("！错误，处理状态不正确");
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

	ls_sql="update jc_gtbjmx set khdj=bzdj*?/10,je=ROUND(zqje*?/10,"+jcddmxblxs+") ";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jjzkl);
	ps.setDouble(2,jjzkl);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_gtpjmx set khdj=bzdj*?/10,je=ROUND(zqje*?/10,"+jcddmxblxs+") ";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jjzkl);
	ps.setDouble(2,jjzkl);
	ps.executeUpdate();
	ps.close();

	//柜体＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String gtxh=null;
	ls_sql =" select gtxh";
	ls_sql+=" from jc_jjgtmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		gtxh=rs1.getString("gtxh");

		//板材部分金额
		double bcbfje=0;
		double zqbcbfje=0;
		ls_sql="select sum(je),sum(zqje)";
		ls_sql+=" from  jc_gtbjmx";
		ls_sql+=" where gtxh='"+gtxh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			bcbfje=rs.getDouble(1);
			zqbcbfje=rs.getDouble(2);
		}
		rs.close();
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

		double zj=bcbfje+pjbfje;
		double zqzj=zqbcbfje+zqpjbfje;

		ls_sql="update jc_jjgtmx set bcbfje=ROUND(?,"+jcddmxblxs+"),zqbcbfje=?,pjbfje=ROUND(?,"+jcddmxblxs+"),zqpjbfje=?";
		ls_sql+=" ,zj=ROUND(?,"+jcddmxblxs+"),zqzj=?";
		ls_sql+=" where gtxh='"+gtxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,bcbfje);
		ps.setDouble(2,zqbcbfje);
		ps.setDouble(3,pjbfje);
		ps.setDouble(4,zqpjbfje);

		ps.setDouble(5,zj);
		ps.setDouble(6,zqzj);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();

	//柜体＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	ls_sql="update jc_jjxcmmx set khdj1=bzdj1*?/10,khdj2=bzdj2*?/10,zj=ROUND(zqzj*?/10,"+jcddmxblxs+") ";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jjzkl);
	ps.setDouble(2,jjzkl);
	ps.setDouble(3,jjzkl);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_cpjjddmx set khdj=bzdj*?/10,zj=ROUND(zqzj*?/10,"+jcddmxblxs+"),zjhzj=ROUND(zqzjhzj*?/10,"+jcddmxblxs+") ";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jjzkl);
	ps.setDouble(2,jjzkl);
	ps.setDouble(3,jjzkl);
	ps.executeUpdate();
	ps.close();

	//计算金额总计＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	double jjje=0;
	double cpjjje=0;
	double xcmje=0;
	double htze=0;

	double zqjjje=0;
	double zqcpjjje=0;
	double zqxcmje=0;
	double wdzje=0;

	//家具合同金额
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjje=rs.getDouble(1);
		zqjjje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//成品家具合同金额
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_cpjjddmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpjjje=rs.getDouble(1);
		zqcpjjje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//型材门合同金额
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_jjxcmmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xcmje=rs.getDouble(1);
		zqxcmje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//合同总额
	htze=jjje+xcmje+cpjjje;
	wdzje=zqjjje+zqxcmje+zqcpjjje;


	ls_sql="update jc_jjdd set qhtsj=?,jhazrq=?,kjxsj=?,qhtr=?,htbz=?,jjzkl=?,dzyy=?";
	ls_sql+=" ,jjje=ROUND(?,"+jcddmxblxs+"),xcmje=ROUND(?,"+jcddmxblxs+"),cpjjje=ROUND(?,"+jcddmxblxs+"),htze=ROUND(?,"+jcddblxs+")   ,zqjjje=?,zqxcmje=?,zqcpjjje=?,wdzje=? ";
	ls_sql+=" ,jjzjje=ROUND(?,"+jcddmxblxs+"),xcmzjje=ROUND(?,"+jcddmxblxs+"),cpjjzjje=ROUND(?,"+jcddmxblxs+"),zjhze=ROUND(?,"+jcddblxs+")   ,zqjjzjje=?,zqxcmzjje=?,zqcpjjzjje=?,zqzjhze=?";
    ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qhtsj);
	ps.setDate(2,jhazrq);
	ps.setDate(3,kjxsj);
	ps.setString(4,qhtr);
	ps.setString(5,htbz);
	ps.setDouble(6,jjzkl);
	ps.setString(7,dzyy);


	ps.setDouble(8,jjje);
	ps.setDouble(9,xcmje);
	ps.setDouble(10,cpjjje);
	ps.setDouble(11,htze);

	ps.setDouble(12,zqjjje);
	ps.setDouble(13,zqxcmje);
	ps.setDouble(14,zqcpjjje);
	ps.setDouble(15,wdzje);

	ps.setDouble(16,jjje);
	ps.setDouble(17,xcmje);
	ps.setDouble(18,cpjjje);
	ps.setDouble(19,htze);

	ps.setDouble(20,zqjjje);
	ps.setDouble(21,zqxcmje);
	ps.setDouble(22,zqcpjjje);
	ps.setDouble(23,wdzje);

	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="update jc_jcdd set zqje=?,zhje=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where ddbh='"+ddbh+"' and lx='3' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wdzje);
	ps.setDouble(2,htze);
	ps.executeUpdate();
	ps.close();

	//计算金额总计＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

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
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>