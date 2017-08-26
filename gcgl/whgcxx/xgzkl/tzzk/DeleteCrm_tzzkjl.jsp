<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] tzjlh = request.getParameterValues("tzjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<tzjlh.length ;i++ )
	{
		String clzt=null;
		ls_sql="select clzt";
		ls_sql+=" from  crm_tzzkjl";
		ls_sql+=" where tzjlh='"+tzjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clzt=cf.fillNull(rs.getString("clzt"));
		}
		rs.close();
		ps.close();

		if (clzt.equals("2") || clzt.equals("4") || clzt.equals("5"))//1：未改折扣；2：直接修改折扣成功；3：需审批；4：审批通过已改折扣；5：审批未通过
		{
			conn.rollback();
			out.println("错误！调整折扣已完成，不能再修改:"+tzjlh[i]);
			return;
		}

		ls_sql="delete from crm_tzzkjl  ";
		ls_sql+=" where tzjlh='"+tzjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_bfxmtzk  ";
		ls_sql+=" where tzjlh='"+tzjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_gcdxtzk  ";
		ls_sql+=" where tzjlh='"+tzjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_qtxmtzk  ";
		ls_sql+=" where tzjlh='"+tzjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_tzbffyzk  ";
		ls_sql+=" where tzjlh='"+tzjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_tzzjxzk  ";
		ls_sql+=" where tzjlh='"+tzjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_tctzk  ";
		ls_sql+=" where tzjlh='"+tzjlh[i]+"'";
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