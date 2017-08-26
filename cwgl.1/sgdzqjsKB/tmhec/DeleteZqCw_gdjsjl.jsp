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

	String jsjd=null;
	String spjl=null;
	String khbh=null;
	String sgd=null;
	String khxm=null;


	conn.setAutoCommit(false);

	for (int i=0;i<jsjlh.length ;i++ )
	{
		ls_sql="select khbh,sgd";
		ls_sql+=" from  cw_sgdzqjsjlKB";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			sgd=rs.getString("sgd");
		}
		else{
			conn.rollback();
			out.println("错误！结算记录号["+jsjlh[i]+"]不存在");
			return;
		}
		rs.close();
		ps.close();

		String gdjsjd=null;
		ls_sql="select gdjsjd";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();
		if (!gdjsjd.equals("B"))//B:钛马赫二次结算
		{
			conn.rollback();
			out.println("<BR>！！！错误，结算进度不正确");
			return;
		}


		
		ls_sql="update crm_khxx set gdjsjd='A',gdjsjlh=null";//A：交齐二次结算资料
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_sgdzqjsjlKB ";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>