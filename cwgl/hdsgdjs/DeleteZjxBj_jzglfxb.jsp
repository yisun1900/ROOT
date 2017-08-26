<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String gdjsjlh=request.getParameter("gdjsjlh");
String zjxxh=request.getParameter("zjxxh");

String[] scglbxh=request.getParameterValues("scglbxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<scglbxh.length ;i++ )
	{
		//家装工料分析表
		ls_sql="delete from bj_khglfxbh ";
		ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and xmbh='"+xmbh+"' and glbxh="+scglbxh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	//【基价单价】发生变化需重新计算
	ls_sql="update cw_gdjsjl set jsjd='0'";
	ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>