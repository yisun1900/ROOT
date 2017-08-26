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

	String khzq=null;
	String ssfgs=null;

	ls_sql="select khzq,ssfgs";
	ls_sql+=" from  cw_jrtcph";
	ls_sql+=" where "+chooseitem;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khzq=rs1.getString("khzq");
		ssfgs=rs1.getString("ssfgs");

		ls_sql =" delete from cw_jrtcph ";
		ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		String khbh=null;
		String lx=null;
		ls_sql="select khbh,lx";
		ls_sql+=" from  cw_jrtcmx";
		ls_sql+=" where khzq='"+khzq+"' and ssfgs='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			khbh=rs.getString("khbh");
			lx=rs.getString("lx");

			String sjsjsbz=null;//0：未提成；1：签单提成；2：结算提成
			if (lx.equals("1"))//1：签单提成；2：结算提成
			{
				sjsjsbz="0";
			}
			else {
				sjsjsbz="1";
			}

			ls_sql="update crm_khxx  set sjsjsbz='"+sjsjsbz+"'";
			ls_sql+=" where khbh='"+khbh+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();

			ls_sql="delete from cw_jrtcmx";
			ls_sql+=" where khzq='"+khzq+"' and khbh='"+khbh+"'";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();
		}
		rs.close();
		ps.close();

	}
	rs1.close();
	ps1.close();
	
	
	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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