<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ssfgs=null;
String cglb=null;
String cllb=null;
String psfs=null;
java.sql.Date yqdhsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
cglb=cf.GB2Uni(request.getParameter("cglb"));
cllb=cf.GB2Uni(request.getParameter("cllb"));
psfs=cf.GB2Uni(request.getParameter("psfs"));
ls=request.getParameter("yqdhsj");
try{
	if (!(ls.equals("")))  yqdhsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yqdhsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[要求到货时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String sgph=cf.GB2Uni(request.getParameter("sgph"));
String sfrksgdw=cf.GB2Uni(request.getParameter("sfrksgdw"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	String sfzcgd=null;
	ls_sql="select sfzcgd";
	ls_sql+=" from  jxc_clsgd";
	ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfzcgd=cf.fillNull(rs.getString("sfzcgd"));
	}
	rs.close();
	ps.close();

	if (sfzcgd.equals("Y"))//N：未转；Y：转为采购计划；M：转为供应商订单
	{
		conn.rollback();
		out.println("错误！已转为采购计划");
		return;
	}
	else if (sfzcgd.equals("M"))//N：未转；Y：转为采购计划；M：转为供应商订单
	{
		conn.rollback();
		out.println("错误！已转为供应商订单");
		return;
	}

	ls_sql=" update  jxc_clsgd set sfzcgd='M',sfrksgdw=?";
	ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfrksgdw);
	ps.executeUpdate();
	ps.close();

	String gysmc=null;
	ls_sql="select distinct jxc_cljgb.gysmc ";
	ls_sql+=" from  jxc_clsgmx,jxc_cljgb ";
	ls_sql+=" where jxc_clsgmx.clbm=jxc_cljgb.clbm and jxc_cljgb.dqbm='"+dqbm+"' and jxc_clsgmx.sgph='"+sgph+"'";
	ls_sql+=" order by jxc_cljgb.gysmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gysmc=cf.fillNull(rs.getString("gysmc"));

		if (gysmc.equals("0"))
		{
			conn.rollback();
			out.print("<font color=red>错误！在价格表中供应商未初始化！</font><br>");
			return;
		}

		//根据供应商名称产生供应商编号
		String gysbm=null;
		ls_sql="select jxc_gysxx.gysbm ";
		ls_sql+=" from  jxc_gysxx,jxc_ppgysdzb ";
		ls_sql+=" where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ssfgs='"+ssfgs+"' and jxc_gysxx.gysmc='"+gysmc+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gysbm=rs1.getString("gysbm");
		}
		else
		{
			conn.rollback();
			out.print("<font color=red>错误！供应商["+gysmc+"]不存在！</font><br>");
			return;
		}
		rs1.close();
		ps1.close();

		//生成编号
		String nian=cf.today("YY");
		String gysddph=null;
		int count=0;
		ls_sql="select NVL(max(substr(gysddph,10,4)),0)";
		ls_sql+=" from  jxc_gysdd";
		ls_sql+=" where ssfgs='"+ssfgs+"' and cglb='"+cglb+"' and nian='"+nian+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		gysddph="FG"+ssfgs+nian+cf.addZero(count+1,4);

		ls_sql="insert into jxc_gysdd ( gysddph,ssfgs,dqbm,gysbm,gysmc,cglb,cllb,psfs,sgph,yqdhsj   ,sfrksgdw,lrr,lrsj,lrbm,nian,bz,fhsfwc,sfjs,ddzt,dhzsl,dhzje ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,'N','N','0',0,0 ) ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,gysddph);
		ps1.setString(2,ssfgs);
		ps1.setString(3,dqbm);
		ps1.setString(4,gysbm);
		ps1.setString(5,gysmc);
		ps1.setString(6,cglb);
		ps1.setString(7,cllb);
		ps1.setString(8,psfs);
		ps1.setString(9,sgph);
		ps1.setDate(10,yqdhsj);

		ps1.setString(11,sfrksgdw);
		ps1.setString(12,lrr);
		ps1.setDate(13,lrsj);
		ps1.setString(14,lrbm);
		ps1.setString(15,nian);
		ps1.setString(16,bz);
		ps1.executeUpdate();
		ps1.close();

		//填写供应商订单明细
		ls_sql =" insert into   jxc_gysddmx(gysddph,dhxh,clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm,cbj,dhsl,dhje,pssl) ";
		ls_sql+=" select '"+gysddph+"',rownum,clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm,cbj,dhsl,cbj*dhsl,0 ";
		ls_sql+=" from  (";
		ls_sql+=" select  jxc_clsgmx.clbm,clmc,xh,gg,nbbm,ppmc,jxc_cljgb.gysmc,cldlbm,clxlbm,jldwbm,jxc_cljgb.cbj,sum(shsl) dhsl ";
		ls_sql+=" from  jxc_clsgmx,jxc_cljgb";
		ls_sql+=" where jxc_clsgmx.sgph='"+sgph+"' and jxc_cljgb.gysmc='"+gysmc+"'";
		ls_sql+=" and jxc_clsgmx.clbm=jxc_cljgb.clbm and jxc_cljgb.dqbm='"+dqbm+"'";
		ls_sql+=" group by jxc_clsgmx.clbm,clmc,xh,gg,nbbm,ppmc,jxc_cljgb.gysmc,cldlbm,clxlbm,jldwbm,jxc_cljgb.cbj ";
		ls_sql+=" order by jxc_clsgmx.clbm";
		ls_sql+=" )";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		//订货总金额
		double dhzsl=0;
		double dhzje=0;
		ls_sql=" select sum(dhsl),sum(dhje) ";
		ls_sql+=" from jxc_gysddmx ";
		ls_sql+=" where gysddph='"+gysddph+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if (rs1.next())
		{
			dhzsl=rs1.getDouble(1);
			dhzje=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		//修改采购计划单状态
		ls_sql="update jxc_gysdd set dhzsl="+dhzsl+",dhzje="+dhzje;
		ls_sql+=" where gysddph='"+gysddph+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();


	}
	rs.close();
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>