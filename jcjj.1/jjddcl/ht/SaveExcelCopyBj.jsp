<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] bclx=request.getParameterValues("bclx");
String[] bjmc=request.getParameterValues("bjmc");
String[] bchd=request.getParameterValues("bchd");
String[] cd=request.getParameterValues("cd");
String[] kd=request.getParameterValues("kd");
String[] sl=request.getParameterValues("sl");
String[] bzdj=request.getParameterValues("bzdj");
String[] zqje=request.getParameterValues("zqje");
String[] bz=request.getParameterValues("bz");

String czfs=cf.GB2Uni(request.getParameter("czfs"));
String gtxh=cf.GB2Uni(request.getParameter("gtxh"));
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

try {
	conn=cf.getConnection();

	String fgsbh=null;
	String clzt=null;
	double jjzkl=0;
	ls_sql="select fgsbh,clzt,jjzkl";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
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

	if (czfs.equals("1"))//1:替换原报价
	{
		ls_sql="delete from jc_gtbjmx ";
		ls_sql+=" where gtxh='"+gtxh+"' and ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	long maxbjxh=0;
	ls_sql="select NVL(max(bjxh),0)";
	ls_sql+=" from  jc_gtbjmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxbjxh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	maxbjxh++;

	for (int i=0;i<bjmc.length ;i++ )
	{
		double dj=java.lang.Double.parseDouble(bzdj[i].trim());
		double je=java.lang.Double.parseDouble(zqje[i].trim());

		ls_sql="insert into jc_gtbjmx ( bjxh,gtxh,ddbh,bjmc,bcpp,bchd,bzdj,khdj,cd,kd,sl,zqje,je,bz,pxxh ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,ROUND(?,"+jcddmxblxs+"),?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,maxbjxh);
		ps.setString(2,gtxh);
		ps.setString(3,ddbh);
		ps.setString(4,cf.GB2Uni(bjmc[i]));
		ps.setString(5,cf.GB2Uni(bclx[i]));
		ps.setString(6,bchd[i]);
		ps.setDouble(7,dj);
		ps.setDouble(8,dj*jjzkl/10);
		ps.setString(9,cd[i]);
		ps.setString(10,kd[i]);
		ps.setString(11,sl[i]);
		ps.setDouble(12,je);
		ps.setDouble(13,je*jjzkl/10);
		ps.setString(14,cf.GB2Uni(bz[i]));
		ps.setInt(15,(i+1));
		ps.executeUpdate();
		ps.close();

		maxbjxh++;
	}



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

	ls_sql="update jc_jjgtmx set bcbfje=ROUND(?,"+jcddmxblxs+"),zqbcbfje=?,zj=pjbfje+ROUND(?,"+jcddmxblxs+"),zqzj=zqpjbfje+? ";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,bcbfje);
	ps.setDouble(2,zqbcbfje);
	ps.setDouble(3,bcbfje);
	ps.setDouble(4,zqbcbfje);
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

	ls_sql="update jc_jjdd set jjje=ROUND(?,"+jcddmxblxs+"),xcmje=ROUND(?,"+jcddmxblxs+"),cpjjje=ROUND(?,"+jcddmxblxs+"),htze=ROUND(?,"+jcddblxs+")   ,zqjjje=?,zqxcmje=?,zqcpjjje=?,wdzje=? ";
	ls_sql+="          ,jjzjje=ROUND(?,"+jcddmxblxs+"),xcmzjje=ROUND(?,"+jcddmxblxs+"),cpjjzjje=ROUND(?,"+jcddmxblxs+"),zjhze=ROUND(?,"+jcddblxs+")   ,zqjjzjje=?,zqxcmzjje=?,zqcpjjzjje=?,zqzjhze=?";
    ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jjje);
	ps.setDouble(2,xcmje);
	ps.setDouble(3,cpjjje);
	ps.setDouble(4,htze);

	ps.setDouble(5,zqjjje);
	ps.setDouble(6,zqxcmje);
	ps.setDouble(7,zqcpjjje);
	ps.setDouble(8,wdzje);

	ps.setDouble(9,jjje);
	ps.setDouble(10,xcmje);
	ps.setDouble(11,cpjjje);
	ps.setDouble(12,htze);

	ps.setDouble(13,zqjjje);
	ps.setDouble(14,zqxcmje);
	ps.setDouble(15,zqcpjjje);
	ps.setDouble(16,wdzje);

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
	alert("拷贝成功！");
	window.close();
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>