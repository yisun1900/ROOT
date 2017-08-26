<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] pfjlh=request.getParameterValues("pfjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<pfjlh.length ;i++ )
	{
		String pfzt="";
		String tsjlh="";
		ls_sql="select pfzt,tsjlh";
		ls_sql+=" from crm_khpfd";
		ls_sql+=" where pfjlh='"+pfjlh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			pfzt=cf.fillNull(rs.getString("pfzt"));
			tsjlh=cf.fillNull(rs.getString("tsjlh"));
		}
		rs.close();
		ps.close();

		if (!pfzt.equals("1"))//1：未审核；2：审核；3：已付款
		{
			conn.rollback();
			out.println("错误！状态不正确");
			return;
		}

		ls_sql="update crm_tsjl set sfpfkh='2'";//1：不需赔付；2：发生赔付；3：录入赔付；4：已赔付
		ls_sql+=" where tsjlh='"+tsjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_khpfd   ";
		ls_sql+=" where pfjlh='"+pfjlh[i]+"' ";
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