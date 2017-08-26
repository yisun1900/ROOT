<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String psph=request.getParameter("psph");
String dqbm=request.getParameter("dqbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String psdzt=null;
	ls_sql=" SELECT psdzt ";
	ls_sql+=" FROM jxc_clpsd ";
    ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psdzt=cf.fillNull(rs.getString("psdzt"));
	}
	rs.close();
	ps.close();

	if (!psdzt.equals("0") && !psdzt.equals("6"))//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：审核未通过；7：作废；
	{
		out.print("错误！材料单["+psph+"]已提交，不能再修改！");
		return;
	}


	conn.setAutoCommit(false);

	//查询最大数量
	int psxh=0;
	ls_sql="select NVL(max(psxh),0)";
	ls_sql+=" from  jxc_clpsmx";
	ls_sql+=" where psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psxh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String nbbm=null;
	double pssl=0;
	ls_sql="SELECT bj_khglfxb.glfxclbm,sum(bj_khglfxb.xhl*bj_gclmx.sl) xhl";
	ls_sql+=" FROM bj_khglfxb,bj_gclmx  ";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"' and bj_khglfxb.glflbm='1'";//材料费
	ls_sql+=" and bj_gclmx.khbh=bj_khglfxb.khbh and bj_gclmx.dqbm=bj_khglfxb.dqbm and bj_gclmx.xmbh=bj_khglfxb.xmbh ";
	ls_sql+=" group by bj_khglfxb.glfxclbm";
	ls_sql+=" order by bj_khglfxb.glfxclbm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		nbbm=rs1.getString("glfxclbm").trim();
		pssl=rs1.getDouble("xhl");

		String clbm=null;
		ls_sql=" select clbm";
		ls_sql+=" from  jxc_clbm";
		ls_sql+=" where nbbm='"+nbbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clbm=rs.getString("clbm");
		}
		rs.close();
		ps.close();

		psxh++;


		int count=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from jxc_clpsmx ";
		ls_sql+=" where clbm='"+clbm+"'  and psph='"+psph+"' ";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			ls_sql="insert into jxc_clpsmx (psph,clbm,clmc,xh,gg,nbbm,jldwbm,cbj,dj   ,ppmc,gysmc,cldlbm,clxlbm,sqpssl,pssl,psje   ,cksl,psxh,xsfs)";
			ls_sql+=" select         ?,jxc_cljgb.clbm,clmc,xh,gg,nbbm,jldwbm,cbj,dgzjg,ppmc,gysmc,cldlbm,clxlbm,?     ,?   ,?*dgzjg,0   ,?   ,jxc_cljgb.xsfs ";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,psph);
			ps.setDouble(2,pssl);
			ps.setDouble(3,pssl);
			ps.setDouble(4,pssl);
			ps.setInt(5,psxh);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update jxc_clpsmx set sqpssl=?,pssl=?,psje=?*dj";
			ls_sql+=" where clbm='"+clbm+"'  and psph='"+psph+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,pssl);
			ps.setDouble(2,pssl);
			ps.setDouble(3,pssl);
			ps.executeUpdate();
			ps.close();
		}
	}
	rs1.close();
	ps1.close();


	double pszsl=0;
	double pszje=0;
	double cbze=0;
	ls_sql=" SELECT sum(pssl),sum(psje),sum(cbj*pssl) ";
	ls_sql+=" FROM jxc_clpsmx ";
	ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pszsl=rs.getDouble(1);
		pszje=rs.getDouble(2);
		cbze=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	ls_sql="update jxc_clpsd set pszsl="+pszsl+",pszje="+pszje+",cbze="+cbze;
	ls_sql+=" where psph='"+psph+"'";
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