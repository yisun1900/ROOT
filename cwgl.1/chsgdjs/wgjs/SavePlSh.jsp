<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] jsjlh=request.getParameterValues("jsjlh");


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
		ls_sql+=" from  cw_chsgdjs";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
		}
		rs.close();
		ps.close();

		String gdjsjd=null;
		ls_sql="select gdjsjd";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals("Y"))//0:未结算
		{
			conn.rollback();
			out.println("<BR>！！！错误，状态不正确:"+gdjsjd);
			return;
		}

		ls_sql="update crm_khxx set gdjsjd=?";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,"Z");
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_chsgdjs set clzt=?,spr=?,spsj=SYSDATE";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,"2");//第一次拨工费已审核
		ps.setString(2,yhmc);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("审核成功！");
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