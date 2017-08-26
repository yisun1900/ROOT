<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1 = null;
PreparedStatement ps2=null;
ResultSet rs2 = null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String khzq=null;
	String ssfgs=null;
	ls_sql="select khzq,ssfgs";
	ls_sql+=" from  rs_gzb";
	ls_sql+=" where "+chooseitem;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khzq=rs.getString("khzq");
		ssfgs=rs.getString("ssfgs");

		ls_sql="delete from rs_gzb ";
		ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from rs_gzmxb ";
		ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from rs_qdtcmx ";
		ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from rs_jstcmx ";
		ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from rs_tdtcmx ";
		ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from rs_sjftcmx ";
		ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from rs_zctcmx ";
		ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="delete from rs_tcmxb ";
		ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		String ygbh=null;
		ls_sql="select ygbh";
		ls_sql+=" from  rs_ygzbjtzjl";
		ls_sql+=" where jlh='"+khzq+"' and ssfgs='"+ssfgs+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			ygbh=rs1.getString(1);

			ls_sql="delete from rs_ygzbjtzjl ";
			ls_sql+=" where jlh='"+khzq+"' and ssfgs='"+ssfgs+"' and ygbh='"+ygbh+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();

			double allje=0;
			ls_sql="select sum(je)";
			ls_sql+=" from  rs_ygzbjtzjl";
			ls_sql+=" where ygbh="+ygbh;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				allje=rs2.getDouble(1);
			}
			rs2.close();
			ps2.close();

			//员工社保信息
			ls_sql="update sq_yhxx set zbj="+allje;
			ls_sql+=" where ygbh="+ygbh;
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();
		}
		rs1.close();
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
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>