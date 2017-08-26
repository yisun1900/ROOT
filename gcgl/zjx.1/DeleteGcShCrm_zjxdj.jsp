<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxxh=request.getParameterValues("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxxh.length ;i++ )
	{
		String getshbz="";

		ls_sql="select shbz ";
		ls_sql+=" from  crm_zjxdj";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getshbz=cf.fillNull(rs.getString("shbz"));
		}
		rs.close();
		ps.close();

		if (!getshbz.equals("1") && !getshbz.equals("2"))//M：不需审核；N：未审核；Y：审核通过；S：审核未通过；1：工程部审核通过；2：工程部审核未通过；3：监理部审核通过；4：监理部审核未通过；5：财务部审核通过6：财务部审核未通过
		{
			conn.rollback();
			out.println("错误！状态不正确:"+getshbz);
			return;
		}


		ls_sql="update crm_zjxdj set shbz='N',shr=null,shsj=null,shyj=null";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
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