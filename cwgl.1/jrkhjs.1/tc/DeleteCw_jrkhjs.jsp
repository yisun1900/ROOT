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
		String khjsbz=null;
		ls_sql="select khjsbz";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khjsbz=cf.fillNull(rs.getString("khjsbz"));
		}
		rs.close();
		ps.close();


		if (!khjsbz.equals("Y"))
		{
			conn.rollback();
			out.println("错误！客户未结算或已审批:"+khbh[i]);
			return;
		}

		ls_sql="update crm_khxx set khjsbz='N',khjsje=0,khjssj=null";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_jrkhjs ";
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