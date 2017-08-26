<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jsjlh = request.getParameterValues("jsjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<jsjlh.length ;i++ )
	{
		String khbh=null;
		ls_sql="select khbh";
		ls_sql+=" from cw_jrbgf";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
		}
		else{
			conn.rollback();
			out.println("<BR>！！！错误，记录号不存在");
			return;
		}
		rs.close();
		ps.close();

		String gdjsjd=null;
		ls_sql="select gdjsjd";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals("5"))//A:可以第一次拨工费
		{
			conn.rollback();
			out.println("<BR>！！！错误，拨工费状态不正确:"+gdjsjd);
			return;
		}


		ls_sql="update crm_khxx set gdjsjd='2',gdjsjlh=null";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		
		ls_sql="delete from cw_jrbgf  ";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>