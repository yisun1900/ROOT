<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String fgsbh=null;
	String clzt=null;
	double jjzkl=0;
	ls_sql="select fgsbh,clzt,jjzkl";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
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
	if (!clzt.equals("00"))
	{
		out.println("错误！增减项已完成");
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

	String gtxh=null;
	String lx=null;
	int ysl=0;
	int xsl=0;
	ls_sql="select gtxh,lx,ysl,xsl";
	ls_sql+=" from  jc_gtzjxmx";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gtxh=rs.getString("gtxh");
		lx=rs.getString("lx");
		ysl=rs.getInt("ysl");
		xsl=rs.getInt("xsl");

		if (lx.equals("1"))//1：减项；2：增项
		{
			ls_sql="update jc_jjgtmx set zjhsl="+xsl;
			ls_sql+=" where  gtxh='"+gtxh+"' and ddbh='"+ddbh+"' ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
	}
	rs.close();
	ps.close();

	String xcmxh=null;
	ysl=0;
	xsl=0;
	ls_sql="select xcmxh,lx,ysl,xsl";
	ls_sql+=" from  jc_xcmzjxmx";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xcmxh=rs.getString("xcmxh");
		lx=rs.getString("lx");
		ysl=rs.getInt("ysl");
		xsl=rs.getInt("xsl");

		if (lx.equals("1"))//1：减项；2：增项
		{
			ls_sql="update jc_jjxcmmx set zjhsl="+xsl;
			ls_sql+=" where  xcmxh='"+xcmxh+"' and ddbh='"+ddbh+"'  ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
	}
	rs.close();
	ps.close();

	String cpjjbh=null;
	ysl=0;
	xsl=0;
	ls_sql="select cpjjbh,lx,ysl,xsl";
	ls_sql+=" from  jc_cpjjzjxmx";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cpjjbh=rs.getString("cpjjbh");
		lx=rs.getString("lx");
		ysl=rs.getInt("ysl");
		xsl=rs.getInt("xsl");

		if (lx.equals("1"))//1：减项；2：增项
		{
			ls_sql="update jc_cpjjddmx set zjhsl=?,zjhzj=ROUND(khdj*?,"+jcddmxblxs+"),zqzjhzj=bzdj*?";
			ls_sql+=" where  ddbh='"+ddbh+"' and cpjjbh='"+cpjjbh+"' ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setInt(1,xsl);
			ps1.setInt(2,xsl);
			ps1.setInt(3,xsl);
			ps1.executeUpdate();
			ps1.close();
 		}
	}
	rs.close();
	ps.close();
 
//计算增减金额
	double jjzjxje=0;
	double cpjjzjxje=0;
	double xcmzjxje=0;
	double zjxze=0;

	double zqjjzjxje=0;
	double zqcpjjzjxje=0;
	double zqxcmzjxje=0;
	double zqzjxze=0;

	ls_sql="select sum((jc_gtzjxmx.xsl-jc_gtzjxmx.ysl)*jc_jjgtmx.zj),sum((jc_gtzjxmx.xsl-jc_gtzjxmx.ysl)*jc_jjgtmx.zqzj)";
	ls_sql+=" FROM jc_jjgtmx,jc_gtzjxmx  ";
    ls_sql+=" where jc_jjgtmx.gtxh=jc_gtzjxmx.gtxh and jc_gtzjxmx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjzjxje=rs.getDouble(1);
		zqjjzjxje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="select sum((jc_cpjjzjxmx.xsl-jc_cpjjzjxmx.ysl)*jc_cpjjddmx.khdj),sum((jc_cpjjzjxmx.xsl-jc_cpjjzjxmx.ysl)*jc_cpjjddmx.bzdj)";
	ls_sql+=" FROM jc_cpjjddmx,jc_cpjjzjxmx  ";
    ls_sql+=" where jc_cpjjddmx.ddbh=jc_cpjjzjxmx.ddbh and jc_cpjjddmx.cpjjbh=jc_cpjjzjxmx.cpjjbh and jc_cpjjzjxmx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cpjjzjxje=rs.getDouble(1);
		zqcpjjzjxje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="select sum((jc_xcmzjxmx.xsl-jc_xcmzjxmx.ysl)*jc_jjxcmmx.zj),sum((jc_xcmzjxmx.xsl-jc_xcmzjxmx.ysl)*jc_jjxcmmx.zqzj)";
	ls_sql+=" FROM jc_xcmzjxmx,jc_jjxcmmx  ";
    ls_sql+=" where jc_xcmzjxmx.xcmxh=jc_jjxcmmx.xcmxh and jc_xcmzjxmx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xcmzjxje=rs.getDouble(1);
		zqxcmzjxje=rs.getDouble(2);
	}
	rs.close();
	ps.close();


	zjxze=jjzjxje+xcmzjxje+cpjjzjxje;
	zqzjxze=zqjjzjxje+zqxcmzjxje+zqcpjjzjxje;

	ls_sql="update jc_jjzjx set clzt='01',jjzjxje=ROUND(?,"+jcddmxblxs+"),xcmzjxje=ROUND(?,"+jcddmxblxs+"),cpjjzjxje=ROUND(?,"+jcddmxblxs+"),zjxze=ROUND(?,"+jcddblxs+") ";
	ls_sql+=" ,zqjjzjxje=?,zqxcmzjxje=?,zqcpjjzjxje=?,zqzjxze=?";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jjzjxje);
	ps.setDouble(2,xcmzjxje);
	ps.setDouble(3,cpjjzjxje);
	ps.setDouble(4,zjxze);

	ps.setDouble(5,zqjjzjxje);
	ps.setDouble(6,zqxcmzjxje);
	ps.setDouble(7,zqcpjjzjxje);
	ps.setDouble(8,zqzjxze);
	ps.executeUpdate();
	ps.close();


//修改订单增减项
	ls_sql="select sum(jjzjxje),sum(xcmzjxje),sum(cpjjzjxje),sum(zjxze)  ,sum(zqjjzjxje),sum(zqxcmzjxje),sum(zqcpjjzjxje),sum(zqzjxze)";
	ls_sql+=" from  jc_jjzjx";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjzjxje=rs.getDouble(1);
		xcmzjxje=rs.getDouble(2);
		cpjjzjxje=rs.getDouble(3);
		zjxze=rs.getDouble(4);

		zqjjzjxje=rs.getDouble(5);
		zqxcmzjxje=rs.getDouble(6);
		zqcpjjzjxje=rs.getDouble(7);
		zqzjxze=rs.getDouble(8);
	}
	rs.close();
	ps.close();


	ls_sql="update jc_jjdd set jjzjje=ROUND(jjje+?,"+jcddmxblxs+"),xcmzjje=ROUND(xcmje+?,"+jcddmxblxs+"),cpjjzjje=ROUND(cpjjje+?,"+jcddmxblxs+"),zjhze=ROUND(htze+?,"+jcddblxs+")";
	ls_sql+=" ,zqjjzjje=zqjjje+?,zqxcmzjje=zqxcmje+?,zqcpjjzjje=zqcpjjje+?,zqzjhze=wdzje+?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jjzjxje);
	ps.setDouble(2,xcmzjxje);
	ps.setDouble(3,cpjjzjxje);
	ps.setDouble(4,zjxze);
	ps.setDouble(5,zqjjzjxje);
	ps.setDouble(6,zqxcmzjxje);
	ps.setDouble(7,zqcpjjzjxje);
	ps.setDouble(8,zqzjxze);
	ps.executeUpdate();
	ps.close();


	//集成订单
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,jjsjs ,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc     ,pdgc1,pdgcmc1,gys1,ppmc1     ,zqje   ,zhje ,cbje,fssj)";
	ls_sql+=" select zjxxh,'3','2',ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,jjsjs           ,'',''        ,pdgc,pdgcmc,jjgys,jjppmc ,xcmgc,xcmgcmc,xcmgys,xcmppmc ,zqzjxze,zjxze,0   ,zjxfssj";
	ls_sql+=" from jc_jjzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>