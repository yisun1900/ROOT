<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql=" update jxc_kcb set cllb=(SELECT cllb from jxc_clbm where jxc_clbm.clbm=jxc_kcb.clbm)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jxc_cljgb set zcpzsl=0";
	ls_sql+=" where clbm in(select clbm from jxc_clbm where cllb='2') ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	String dqbm=null;
	String clbm=null;
	String ckbh=null;
	String cllb=null;
	double kcsl=0;
	ls_sql="select dqbm,clbm,ckbh,cllb,sum(kcsl) kcsl";
	ls_sql+=" from  jxc_kcb";
	ls_sql+=" group by dqbm,clbm,ckbh,cllb";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		dqbm=cf.fillNull(rs1.getString("dqbm"));
		clbm=cf.fillNull(rs1.getString("clbm"));
		ckbh=cf.fillNull(rs1.getString("ckbh"));
		cllb=cf.fillNull(rs1.getString("cllb"));
		kcsl=rs1.getDouble("kcsl");

		if (cllb.equals("2"))//0£ºÖ÷²Ä£»1£º¸¨²Ä
		{
			ls_sql=" update jxc_cljgb set zcpzsl="+kcsl;
			ls_sql+=" where dqbm in(select sq_dwxx.dqbm from jxc_ckssfgs,sq_dwxx where jxc_ckssfgs.ssfgs=sq_dwxx.dwbh and jxc_ckssfgs.ckbh='"+ckbh+"') and clbm='"+clbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
/*
			ls_sql=" update jxc_cljgb set zcpzsl="+kcsl;
			ls_sql+=" where dqbm='"+dqbm+"' and clbm='"+clbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
*/
		}

	}
	rs1.close();
	ps1.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
//	window.close();
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


