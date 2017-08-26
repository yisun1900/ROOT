<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");
String zjxxh=request.getParameter("zjxxh");
String clzt=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_cgzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("错误！增减项已完成");
		return;
	}


//计算增减金额
	double gtzjxje=0;
	double tmzjxje=0;
	double wjzjxje=0;
	double dqzjxje=0;
	double zjxze=0;

	double zqgtzjxje=0;
	double zqtmzjxje=0;
	double zqwjzjxje=0;
	double zqdqzjxje=0;
	double zqzjxze=0;

	ls_sql="select sum(zjje),sum(zqzjje)";
	ls_sql+=" from  jc_cgzjxmx";
	ls_sql+=" where jc_cgzjxmx.zjxxh='"+zjxxh+"' and lx='1'";//1：柜体；2：台面；3：五金；4：电器
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gtzjxje=rs.getDouble(1);
		zqgtzjxje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(zjje),sum(zqzjje)";
	ls_sql+=" from  jc_cgzjxmx";
	ls_sql+=" where jc_cgzjxmx.zjxxh='"+zjxxh+"' and lx='2'";//1：柜体；2：台面；3：五金；4：电器
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tmzjxje=rs.getDouble(1);
		zqtmzjxje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(zjje),sum(zqzjje)";
	ls_sql+=" from  jc_cgzjxmx";
	ls_sql+=" where jc_cgzjxmx.zjxxh='"+zjxxh+"' and lx='3'";//1：柜体；2：台面；3：五金；4：电器
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wjzjxje=rs.getDouble(1);
		zqwjzjxje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(zjje),sum(zqzjje)";
	ls_sql+=" from  jc_cgzjxmx";
	ls_sql+=" where jc_cgzjxmx.zjxxh='"+zjxxh+"' and lx='4'";//1：柜体；2：台面；3：五金；4：电器
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqzjxje=rs.getDouble(1);
		zqdqzjxje=rs.getDouble(2);
	}
	rs.close();
	ps.close();


	zjxze=gtzjxje+tmzjxje+wjzjxje+dqzjxje;
	zqzjxze=zqgtzjxje+zqtmzjxje+zqwjzjxje+zqdqzjxje;

	conn.setAutoCommit(false);

	ls_sql="update jc_cgzjx set gtzjxje=?,tmzjxje=?,wjzjxje=?,dqzjxje=?,zjxze=?  ,zqgtzjxje=?,zqtmzjxje=?,zqwjzjxje=?,zqdqzjxje=?,zqzjxze=?,clzt='01'";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,gtzjxje);
	ps.setDouble(2,tmzjxje);
	ps.setDouble(3,wjzjxje);
	ps.setDouble(4,dqzjxje);
	ps.setDouble(5,zjxze);

	ps.setDouble(6,zqgtzjxje);
	ps.setDouble(7,zqtmzjxje);
	ps.setDouble(8,zqwjzjxje);
	ps.setDouble(9,zqdqzjxje);
	ps.setDouble(10,zqzjxze);
	ps.executeUpdate();
	ps.close();


//修改订单
	ls_sql="select sum(gtzjxje),sum(tmzjxje),sum(wjzjxje),sum(dqzjxje),sum(zjxze)   ,sum(zqgtzjxje),sum(zqtmzjxje),sum(zqwjzjxje),sum(zqdqzjxje),sum(zqzjxze)";
	ls_sql+=" from  jc_cgzjx";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gtzjxje=rs.getDouble(1);
		tmzjxje=rs.getDouble(2);
		wjzjxje=rs.getDouble(3);
		dqzjxje=rs.getDouble(4);
		zjxze=rs.getDouble(5);

		zqgtzjxje=rs.getDouble(6);
		zqtmzjxje=rs.getDouble(7);
		zqwjzjxje=rs.getDouble(8);
		zqdqzjxje=rs.getDouble(9);
		zqzjxze=rs.getDouble(10);
	}
	rs.close();
	ps.close();


	ls_sql="update jc_cgdd set gtzjje=gtbfje+?,tmzjje=tmbfje+?,wjzjje=wjhtze+?,dqzjje=dqhtze+?,zjhze=htze+?";
	ls_sql+=" ,zqgtzjje=zqgtbfje+?,zqtmzjje=zqtmbfje+?,zqwjzjje=zqwjhtze+?,zqdqzjje=zqdqhtze+?,zqzjhze=wdzje+?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,gtzjxje);
	ps.setDouble(2,tmzjxje);
	ps.setDouble(3,wjzjxje);
	ps.setDouble(4,dqzjxje);
	ps.setDouble(5,zjxze);

	ps.setDouble(6,zqgtzjxje);
	ps.setDouble(7,zqtmzjxje);
	ps.setDouble(8,zqwjzjxje);
	ps.setDouble(9,zqdqzjxje);
	ps.setDouble(10,zqzjxze);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,jjsjs ,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc  ,zqje   ,zhje ,cbje,fssj)";
	ls_sql+=" select zjxxh,'2','2',ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,cgsjs           ,'',''        ,pdgc,pdgcmc,gys,ppmc  ,zqzjxze,zjxze,0   ,zjxfssj";
	ls_sql+=" from jc_cgzjx";
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>