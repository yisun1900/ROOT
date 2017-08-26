<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String dqbm=null;
	String clbm=null;		
	String lrsj=null;		
	String xgzt=null;		
	double cbj=0;
	double dfgsjg=0;
	double dgzjg=0;

	ls_sql=" select dqbm,clbm,lrsj,xgzt,sxsj,cbj,dfgsjg,dgzjg";
	ls_sql+=" from jxc_tzcljgjl ";
	ls_sql+=" where xgzt='N' and ("+chooseitem+")";
	ls_sql+=" order by dqbm,clbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2=ps2.executeQuery();
	while (rs2.next())//检查材料编码
	{
		dqbm=rs2.getString("dqbm");
		clbm=rs2.getString("clbm");
		lrsj=cf.fillNull(rs2.getDate("lrsj"));
		xgzt=rs2.getString("xgzt");
		cbj=rs2.getDouble("cbj");
		dfgsjg=rs2.getDouble("dfgsjg");
		dgzjg=rs2.getDouble("dgzjg");

		ls_sql="update jxc_cljgb set cbj="+cbj+",dfgsjg="+dfgsjg+",dgzjg="+dgzjg;
		ls_sql+=" where  clbm='"+clbm+"' and dqbm='"+dqbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jxc_tzcljgjl set xgzt='Y',xgsj=SYSDATE";
		ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' and lrsj=TO_DATE('"+lrsj+"','YYYY-MM-DD')";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		String nbbm=null;
		ls_sql="select nbbm";
		ls_sql+=" from  jxc_clbm";
		ls_sql+=" where clbm='"+clbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			nbbm=rs.getString("nbbm");
		}
		rs.close();
		ps.close();

		//更新工料分析成本＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql="update bj_jzglfxb set dj=? ";
		ls_sql+=" where glfxclbm='"+nbbm+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cbj);
		ps.executeUpdate();
		ps.close();

		String bjbbh=null;
		dqbm=null;
		String bjjbbm=null;
		String xmbh=null;
		ls_sql="select distinct bjbbh,dqbm,bjjbbm,xmbh";
		ls_sql+=" from  bj_jzglfxb";
		ls_sql+=" where glfxclbm='"+nbbm+"' and dqbm='"+dqbm+"'";
		ls_sql+=" order by bjbbh,dqbm,bjjbbm,xmbh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			bjbbh=rs1.getString("bjbbh");
			dqbm=rs1.getString("dqbm");
			bjjbbm=rs1.getString("bjjbbm");
			xmbh=rs1.getString("xmbh");


			double clcb=0;//材料成本
			double rgcb=0;//人工成本
			double jxcb=0;//机械成本
			double cbenj=0;//成本价
			ls_sql="select ROUND(sum(dj*xhl),2)";
			ls_sql+=" from  bj_jzglfxb";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='1'";//1:材料
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				clcb=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="select ROUND(sum(dj*xhl),2)";
			ls_sql+=" from  bj_jzglfxb";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='2'";//2:人工
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				rgcb=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="select ROUND(sum(dj*xhl),2)";
			ls_sql+=" from  bj_jzglfxb";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"' and glflbm='3'";//3:机械
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				jxcb=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			cbenj=cf.round(clcb+rgcb+jxcb,2);

			ls_sql="update bj_jzbjb set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,clcb);
			ps.setDouble(2,rgcb);
			ps.setDouble(3,jxcb);
			ps.setDouble(4,cbenj);
			ps.executeUpdate();
			ps.close();

			ls_sql="update bj_jzbjb1 set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,clcb);
			ps.setDouble(2,rgcb);
			ps.setDouble(3,jxcb);
			ps.setDouble(4,cbenj);
			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();

		//更新工料分析成本＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	}
	rs2.close();
	ps2.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("更新成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
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
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 

		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>