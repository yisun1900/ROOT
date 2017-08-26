<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String xmzy=cf.GB2Uni(request.getParameter("xmzy"));

String wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set xmzy=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmzy);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmydd set xmzy=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmzy);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmzjx set xmzy=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmzy);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_cgdd set xmzy=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmzy);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_cgzjx set xmzy=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmzy);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_jjdd set xmzy=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmzy);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_jjzjx set xmzy=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmzy);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcdd set xmzy=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmzy);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_zczjx set xmzy=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmzy);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_jcdd set xmzy=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmzy);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("´æÅÌ³É¹¦£¡");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>