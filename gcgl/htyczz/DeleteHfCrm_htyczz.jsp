<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh = request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		String getclzt=null;
		String ygcjdbm=null;
		ls_sql="select clzt,ygcjdbm";
		ls_sql+=" from  crm_htyczz";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getclzt=cf.fillNull(rs.getString("clzt"));
			ygcjdbm=cf.fillNull(rs.getString("ygcjdbm"));
		}
		rs.close();
		ps.close();

		if (!getclzt.equals("4"))//1：未审批；2：审批同意；3：审批不同意
		{
			conn.rollback();
			out.println("错误！未回访："+khbh[i]);
			return;
		}

		
		ls_sql="update crm_htyczz set hfsm=null,hfr=null,hfsj=null,clzt='2' ";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
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
	out.print("<BR>出错:" + e);
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