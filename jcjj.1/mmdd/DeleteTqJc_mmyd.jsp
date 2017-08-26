<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] yddbh = request.getParameterValues("yddbh");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<yddbh.length ;i++ )
	{
		//集成订单
		ls_sql="delete from jc_jcdd ";
		ls_sql+=" where ddbh='"+yddbh[i]+"' and lx='1' ";//1：木门；2：橱柜；3：家具；4：主材
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_mmydmx ";
		ls_sql+=" where yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from jc_mmydd ";
		ls_sql+=" where yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from jc_mmccd ";
		ls_sql+=" where yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from jc_mmdgdmx ";
		ls_sql+=" where yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from jc_wjjddmx ";
		ls_sql+=" where yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from jc_blddmx ";
		ls_sql+=" where yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from jc_mmzjx ";
		ls_sql+=" where yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from jc_mmzjxmx ";
		ls_sql+=" where yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from jc_blzjxmx ";
		ls_sql+=" where yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from jc_mmazfkd ";
		ls_sql+=" where yddbh='"+yddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
	}

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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>