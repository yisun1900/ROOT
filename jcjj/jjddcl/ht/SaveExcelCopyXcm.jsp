<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] xcmlxbm=request.getParameterValues("xcmlxbm");
String[] xcmmc=request.getParameterValues("xcmmc");
String[] azwz=request.getParameterValues("azwz");
String[] bklxxh=request.getParameterValues("bklxxh");
String[] bkys=request.getParameterValues("bkys");
String[] qtsf=request.getParameterValues("qtsf");
String[] gd=request.getParameterValues("gd");
String[] kd=request.getParameterValues("kd");
String[] zsxt=request.getParameterValues("zsxt");
String[] bjbz=request.getParameterValues("bjbz");

String[] xcmbm1=request.getParameterValues("xcmbm1");
String[] mbcl1=request.getParameterValues("mbcl1");
String[] xbpz1=request.getParameterValues("xbpz1");
String[] jjfs1=request.getParameterValues("jjfs1");
String[] gd1=request.getParameterValues("gd1");
String[] kd1=request.getParameterValues("kd1");
String[] mj1=request.getParameterValues("mj1");
String[] pmdj1Str=request.getParameterValues("pmdj1");
String[] ymdj1Str=request.getParameterValues("ymdj1");

String[] xcmbm2=request.getParameterValues("xcmbm2");
String[] mbcl2=request.getParameterValues("mbcl2");
String[] xbpz2=request.getParameterValues("xbpz2");
String[] jjfs2=request.getParameterValues("jjfs2");
String[] gd2=request.getParameterValues("gd2");
String[] kd2=request.getParameterValues("kd2");
String[] mj2=request.getParameterValues("mj2");
String[] pmdj2Str=request.getParameterValues("pmdj2");
String[] ymdj2Str=request.getParameterValues("ymdj2");

String[] zqjeStr=request.getParameterValues("zqje");
String[] bz=request.getParameterValues("bz");

String czfs=cf.GB2Uni(request.getParameter("czfs"));
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

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
		ls_sql="delete from jc_jjxcmmx ";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	int count=0;
	ls_sql="select NVL(max(substr(xcmxh,10,2)),0)";
	ls_sql+=" from  jc_jjxcmmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	for (int i=0;i<bklxxh.length ;i++ )
	{
		double pmdj1=java.lang.Double.parseDouble(pmdj1Str[i].trim());
		double pmdj2=java.lang.Double.parseDouble(pmdj2Str[i].trim());
		double ymdj1=java.lang.Double.parseDouble(ymdj1Str[i].trim());
		double ymdj2=java.lang.Double.parseDouble(ymdj2Str[i].trim());
		double zqje=java.lang.Double.parseDouble(zqjeStr[i].trim());

		String xcmxh=ddbh+cf.addZero(count+1,2);

		count++;

		ls_sql="insert into jc_jjxcmmx ( xcmxh,ddbh,xcmlxbm,xcmmc,azwz,gd,kd,bklxxh,bkys,zsxt,bjbz ";
		ls_sql+=" ,xcmbm1,mbcl1,xbpz1,gd1,kd1,mj1,pmdj1,ymdj1,jjfs1  ,xcmbm2,mbcl2,xbpz2,gd2,kd2,mj2,pmdj2,ymdj2,jjfs2 ";
		ls_sql+=" ,qtsf,zj,zqzj,sl,zjhsl,bz) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?  ,?,ROUND(?,"+jcddmxblxs+"),?,1,1,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,xcmxh);
		ps.setString(2,ddbh);
		ps.setString(3,xcmlxbm[i]);
		ps.setString(4,cf.GB2Uni(xcmmc[i]));
		ps.setString(5,cf.GB2Uni(azwz[i]));
		ps.setString(6,gd[i]);
		ps.setString(7,kd[i]);
		ps.setString(8,cf.GB2Uni(bklxxh[i]));
		ps.setString(9,cf.GB2Uni(bkys[i]));
		ps.setString(10,cf.GB2Uni(zsxt[i]));
		ps.setString(11,cf.GB2Uni(bjbz[i]));

		ps.setString(12,cf.GB2Uni(xcmbm1[i]));
		ps.setString(13,cf.GB2Uni(mbcl1[i]));
		ps.setString(14,cf.GB2Uni(xbpz1[i]));
		ps.setString(15,gd1[i]);
		ps.setString(16,kd1[i]);
		ps.setString(17,mj1[i]);
		ps.setDouble(18,pmdj1);
		ps.setDouble(19,ymdj1);
		ps.setString(20,jjfs1[i]);

		ps.setString(21,cf.GB2Uni(xcmbm2[i]));
		ps.setString(22,cf.GB2Uni(mbcl2[i]));
		ps.setString(23,cf.GB2Uni(xbpz2[i]));
		ps.setString(24,gd2[i]);
		ps.setString(25,kd2[i]);
		ps.setString(26,mj2[i]);
		ps.setDouble(27,pmdj2);
		ps.setDouble(28,ymdj2);
		ps.setString(29,jjfs2[i]);

		ps.setString(30,qtsf[i]);
		ps.setDouble(31,zqje*jjzkl/10);
		ps.setDouble(32,zqje);
		ps.setString(33,cf.GB2Uni(bz[i]));
		ps.executeUpdate();
		ps.close();
	}


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