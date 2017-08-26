<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改申购单</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");


String fgsbh=request.getParameter("fgsbh");
String lydh=request.getParameter("lydh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;

String sgph="";


String dqbm=null;
try {
	conn=cf.getConnection();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select sgph";
	ls_sql+=" from  jxc_clsgd";
	ls_sql+=" where ddbh='"+lydh+"' and sgdlx='2'";//1：录入；2：主材订单
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgph=rs.getString(1);
	}
	rs.close();
	ps.close();

	
	if (sgph.equals(""))
	{
		//生成申购批号：F（Z）+fgsbh+2位年+5位流水
		String nian=cf.today("YY");
		int count=0;
		ls_sql="select NVL(max(substr(sgph,10,4)),0)";
		ls_sql+=" from  jxc_clsgd";
		ls_sql+=" where ssfgs='"+fgsbh+"' and sglb='0' and nian='"+nian+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		sgph="ZS"+fgsbh+nian+cf.addZero(count+1,4);

		ls_sql="insert into jxc_clsgd ( sgph,psfs,jhshsj,sgr,sgrq,ssfgs,ssbm,bz,sglb,nian  ,lrr,lrsj,sgzsl,sgzje,sfsk,sfzcgd,sgdzt,sfrksgdw,sgdlx,ddbh ) ";
		ls_sql+=" values ( ?,?,?,?,TRUNC(SYSDATE),?,?,?,?,?  ,?,SYSDATE,0,0,'N','N','0','N','2',? ) ";//1：录入；2：主材订单
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sgph);
		ps.setString(2,"1");//1:配送；2：自取；9：其他
		ps.setDate(3,null);
		ps.setString(4,yhmc);

		ps.setString(5,fgsbh);
		ps.setString(6,lrbm);
		ps.setString(7,"");
		ps.setString(8,"0");//0：主材；1：辅材
		ps.setString(9,nian);

		ps.setString(10,yhmc);
		ps.setString(11,lydh);
		ps.executeUpdate();
		ps.close();

		//录入明细
		String zcbm="";
		double sgsl=0;
		int sgxh=0;
		ls_sql="select zcbm,sl";
		ls_sql+=" from  jc_zcddmx";
		ls_sql+=" where ddbh='"+lydh+"' ";
		ls_sql+=" order by xh ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			zcbm=rs.getString("zcbm");
			sgsl=rs.getDouble("sl");

			sgxh++;

			ls_sql="insert into jxc_clsgmx (sgph,sgxh,clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm  ,sgsl,sgjg         ,sgje           ,shsl,shjg         ,shje           ,ycksl)";
			ls_sql+=" select         ?,?   ,jxc_cljgb.clbm,clmc,xh,gg,nbbm,ppmc,gysmc,cldlbm,clxlbm,jldwbm  ,?   ,jxc_cljgb.xsj,jxc_cljgb.xsj*?,?   ,jxc_cljgb.xsj,jxc_cljgb.xsj*?,0 ";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_cljgb.clbm='"+zcbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
//			out.println(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			ps1.setString(1,sgph);
			ps1.setInt(2,sgxh);
			ps1.setDouble(3,sgsl);
			ps1.setDouble(4,sgsl);
			ps1.setDouble(5,sgsl);
			ps1.setDouble(6,sgsl);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();


	}


	response.sendRedirect("EditJxc_clsgd.jsp?lx=2&sgph="+sgph);

}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

