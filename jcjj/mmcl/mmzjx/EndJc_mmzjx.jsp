<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
String zjxxh=request.getParameter("zjxxh");
String clzt=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String fgsbh=null;
	ls_sql="select clzt,fgsbh";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("错误！木门增减项已完成");
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


//计算增减金额
	double mmzjxje=0;
	double wjzjxje=0;
	double blzjxje=0;
	double zjxze=0;

	double zqmmzjxje=0;
	double zqwjzjxje=0;
	double zqblzjxje=0;
	double zqzjxze=0;

	ls_sql="select sum(jc_mmdgdmx.dj*(jc_mmzjxmx.xsl-jc_mmzjxmx.ysl)),sum(jc_mmdgdmx.bzdj*(jc_mmzjxmx.xsl-jc_mmzjxmx.ysl))";
	ls_sql+=" from  jc_mmdgdmx,jc_mmzjxmx";
	ls_sql+=" where jc_mmdgdmx.xh=jc_mmzjxmx.xh";
	ls_sql+=" and jc_mmzjxmx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mmzjxje=rs.getDouble(1);
		zqmmzjxje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(jc_wjjddmx.dj*(jc_wjzjxmx.xsl-jc_wjzjxmx.ysl)),sum(jc_wjjddmx.bzdj*(jc_wjzjxmx.xsl-jc_wjzjxmx.ysl))";
	ls_sql+=" from  jc_wjjddmx,jc_wjzjxmx";
	ls_sql+=" where jc_wjjddmx.lrxh=jc_wjzjxmx.lrxh";
	ls_sql+=" and jc_wjzjxmx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjzjxje=rs.getDouble(1);
		zqwjzjxje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(jc_blddmx.dj*(jc_blzjxmx.xsl-jc_blzjxmx.ysl)),sum(jc_blddmx.bzdj*(jc_blzjxmx.xsl-jc_blzjxmx.ysl))";
	ls_sql+=" from  jc_blddmx,jc_blzjxmx";
	ls_sql+=" where jc_blddmx.lrxh=jc_blzjxmx.lrxh";
	ls_sql+=" and jc_blzjxmx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		blzjxje=rs.getDouble(1);
		zqblzjxje=rs.getDouble(2);
	}
	rs.close();
	ps.close();
	

	zjxze=mmzjxje+wjzjxje+blzjxje;
	zqzjxze=zqmmzjxje+zqwjzjxje+zqblzjxje;


	conn.setAutoCommit(false);

	ls_sql="update jc_mmzjx set clzt='01',mmzjxje=ROUND(?,"+jcddblxs+"),wjzjxje=ROUND(?,"+jcddblxs+"),blzjxje=ROUND(?,"+jcddblxs+"),zjxze=ROUND(?,"+jcddblxs+")   ,zqmmzjxje=?,zqwjzjxje=?,zqblzjxje=?,zqzjxze=?";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,mmzjxje);
	ps.setDouble(2,wjzjxje);
	ps.setDouble(3,blzjxje);
	ps.setDouble(4,zjxze);
	ps.setDouble(5,zqmmzjxje);
	ps.setDouble(6,zqwjzjxje);
	ps.setDouble(7,zqblzjxje);
	ps.setDouble(8,zqzjxze);
	ps.executeUpdate();
	ps.close();


//修改订单
	ls_sql="select sum(mmzjxje),sum(wjzjxje),sum(blzjxje),sum(zjxze)  ,sum(zqmmzjxje),sum(zqwjzjxje),sum(zqblzjxje),sum(zqzjxze)";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where yddbh='"+yddbh+"' and clzt!='00'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mmzjxje=rs.getDouble(1);
		wjzjxje=rs.getDouble(2);
		blzjxje=rs.getDouble(3);
		zjxze=rs.getDouble(4);

		zqmmzjxje=rs.getDouble(5);
		zqwjzjxje=rs.getDouble(6);
		zqblzjxje=rs.getDouble(7);
		zqzjxze=rs.getDouble(8);
	}
	rs.close();
	ps.close();


	ls_sql="update jc_mmydd set zjhmmje=ROUND(mmhtje+?,"+jcddblxs+"),zjhwjje=ROUND(wjhtje+?,"+jcddblxs+"),zjhblje=ROUND(blhtje+?,"+jcddblxs+"),zjhze=ROUND(htje+?,"+jcddblxs+")";
	ls_sql+=" ,zqzjhmmje=zqmmhtje+?,zqzjhwjje=zqwjhtje+?,zqzjhblje=zqblhtje+?,zqzjhze=wdzje+?";
	ls_sql+=" where yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,mmzjxje);
	ps.setDouble(2,wjzjxje);
	ps.setDouble(3,blzjxje);
	ps.setDouble(4,zjxze);

	ps.setDouble(5,zqmmzjxje);
	ps.setDouble(6,zqwjzjxje);
	ps.setDouble(7,zqblzjxje);
	ps.setDouble(8,zqzjxze);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy ,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc  ,zqje   ,zhje ,cbje,fssj)";
	ls_sql+=" select zjxxh,'1','2',yddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy          ,'','',''           ,pdgc,pdgcmc,gys,ppmc  ,zqzjxze,zjxze,0   ,zjxfssj";
	ls_sql+=" from jc_mmzjx";
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