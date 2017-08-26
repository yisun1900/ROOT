<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,oracle.sql.*,oracle.jdbc.driver.*  ' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%


String ysshyj=null;
String ysshjl=null;
ysshjl=cf.GB2Uni(request.getParameter("ysshjl"));
ysshyj=cf.GB2Uni(request.getParameter("ysshyj"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
oracle.sql.CLOB   clob=null; 
try {
	conn=cf.getConnection();
	
	conn.setAutoCommit(false);
	
	ls_sql="delete from  bj_ysshjlyj ";
	ls_sql+=" where  ysshjl='"+ysshjl+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	ls_sql=" insert into bj_ysshjlyj ( ysshjl,ysshyj ) ";
	ls_sql+=" values (?,EMPTY_CLOB() ) ";
	ps= conn.prepareStatement(ls_sql);
	//ps.setClob(1,ysshyj);
	ps.setString(1,ysshjl);
	
	ps.executeUpdate();
	ps.close();
   

	ls_sql="select ysshyj";
	ls_sql+=" from  bj_ysshjlyj";
	ls_sql+=" where  ysshjl='"+ysshjl+"' " ;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("ysshyj");
	}
	rs.close();
	ps.close();

 
	clob.putString(1,ysshyj);
	
	

	ls_sql="update bj_ysshjlyj set ysshyj=? ";
	ls_sql+=" where  ysshjl='"+ysshjl+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setClob(1,clob);
	
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>