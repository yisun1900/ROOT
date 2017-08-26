<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String gtmc=cf.GB2Uni(request.getParameter("gtmc"));
String jjazwz=cf.GB2Uni(request.getParameter("jjazwz"));
String guige=cf.GB2Uni(request.getParameter("guige"));
String jjlx=cf.GB2Uni(request.getParameter("jjlx"));
String bcpp=cf.GB2Uni(request.getParameter("bcpp"));
String gtbclx=cf.GB2Uni(request.getParameter("gtbclx"));
String bcys=cf.GB2Uni(request.getParameter("bcys"));
String gtbz=cf.GB2Uni(request.getParameter("gtbz"));

String[] bclx=request.getParameterValues("bclx");
String[] bjmc=request.getParameterValues("bjmc");
String[] bchd=request.getParameterValues("bchd");
String[] cd=request.getParameterValues("cd");
String[] kd=request.getParameterValues("kd");
String[] bjsl=request.getParameterValues("bjsl");
String[] bjbzdj=request.getParameterValues("bjbzdj");
String[] bjzqje=request.getParameterValues("bjzqje");
String[] bjbz=request.getParameterValues("bjbz");

String[] gtpjbh=request.getParameterValues("gtpjbh");
String[] pjsl=request.getParameterValues("pjsl");
String[] pjbzdj=request.getParameterValues("pjbzdj");
String[] pjzqje=request.getParameterValues("pjzqje");
String[] pjbz=request.getParameterValues("pjbz");

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxxh=request.getParameter("zjxxh");

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

	String gtxh=null;
	ls_sql="select NVL(max(substr(gtxh,10,2)),0)";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gtxh=ddbh+cf.addZero(count+1,2);
	
	conn.setAutoCommit(false);

	
	//柜体板件明细＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
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
		double dj=java.lang.Double.parseDouble(bjbzdj[i].trim());
		double je=java.lang.Double.parseDouble(bjzqje[i].trim());

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
		ps.setString(11,bjsl[i]);
		ps.setDouble(12,je);
		ps.setDouble(13,je*jjzkl/10);
		ps.setString(14,cf.GB2Uni(bjbz[i]));
		ps.setInt(15,(i+1));
		ps.executeUpdate();
		ps.close();

		maxbjxh++;
	}
	//柜体板件明细＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//柜体配件明细＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	long pjxh=0;
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

	for (int i=0;i<gtpjbh.length ;i++ )
	{
		double dj=java.lang.Double.parseDouble(pjbzdj[i].trim());
		double je=java.lang.Double.parseDouble(pjzqje[i].trim());

		ls_sql="insert into jc_gtpjmx ( pjxh,ddbh,gtxh,gtpjbh,gtpjmc,xinghao,guige,bzdj,khdj,sl,zqje,je,bz,jjpjflbm,jldwbm ) ";
		ls_sql+=" select ?,?,?,gtpjbh,gtpjmc,xinghao,guige,?,?,?,?,ROUND(?,"+jcddmxblxs+"),?,jjpjflbm,jldwbm";
		ls_sql+=" from  jc_jjpjbj";
		ls_sql+=" where gtpjbh='"+gtpjbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,pjxh);
		ps.setString(2,ddbh);
		ps.setString(3,gtxh);
		ps.setDouble(4,dj);
		ps.setDouble(5,dj*jjzkl/10);
		ps.setString(6,pjsl[i]);
		ps.setDouble(7,je);
		ps.setDouble(8,je*jjzkl/10);
		ps.setString(9,cf.GB2Uni(pjbz[i]));
		ps.executeUpdate();
		ps.close();

		pjxh++;
	}
	//柜体配件明细＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//柜体＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
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


	ls_sql="insert into jc_jjgtmx ( gtxh,ddbh,gtmc,jjazwz,guige,jjlx,bcpp,bclx,bcys,bz   ,zqbcbfje,zqpjbfje,zqzj,bcbfje,pjbfje,zj,sl,zjhsl ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,ROUND(?,"+jcddmxblxs+"),ROUND(?,"+jcddmxblxs+"),ROUND(?,"+jcddmxblxs+"),1,1 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gtxh);
	ps.setString(2,ddbh);
	ps.setString(3,gtmc);
	ps.setString(4,jjazwz);
	ps.setString(5,guige);
	ps.setString(6,jjlx);
	ps.setString(7,bcpp);
	ps.setString(8,gtbclx);
	ps.setString(9,bcys);
	ps.setString(10,gtbz);

	ps.setDouble(11,zqbcbfje);
	ps.setDouble(12,zqpjbfje);
	ps.setDouble(13,zqzj);
	ps.setDouble(14,bcbfje);
	ps.setDouble(15,pjbfje);
	ps.setDouble(16,zj);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_gtzjxmx (zjxxh,gtxh,ddbh,lx,ysl,xsl)";
	ls_sql+=" values('"+zjxxh+"','"+gtxh+"','"+ddbh+"','2',0,1)  ";//1：已有项目；2：新增项目
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//柜体＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


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