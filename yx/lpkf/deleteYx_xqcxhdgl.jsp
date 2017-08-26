<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem = cf.getParameter(request,"chooseitem");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String fgsbh=null;
	String xqmc=null;
	ls_sql="select fgsbh,xqmc";
	ls_sql+=" from  yx_xqcxhdgl";
	ls_sql+=" where "+chooseitem;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		fgsbh=rs1.getString("fgsbh");
		xqmc=rs1.getString("xqmc");

		
		String dqbm=null;
		ls_sql="select dqbm";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dqbm=rs.getString("dqbm");
		}
		rs.close();
		ps.close();
	
		ls_sql="delete from yx_xqcxhdgl";
		ls_sql+=" where xqmc='"+xqmc+"' and fgsbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update yx_lsdcb set kfjd='1'";
		ls_sql+=" where xqmc='"+xqmc+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
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