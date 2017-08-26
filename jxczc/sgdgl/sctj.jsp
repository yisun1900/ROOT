<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] sgph=request.getParameterValues("sgph");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<sgph.length ;i++ )
	{

		String sgdzt=null;
		ls_sql=" SELECT sgdzt ";
		ls_sql+=" FROM jxc_clsgd ";
		ls_sql+=" where sgph='"+sgph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sgdzt=cf.fillNull(rs.getString("sgdzt"));
		}
		rs.close();
		ps.close();

		if (!sgdzt.equals("1"))//0：未提交；1：已提交；2：审核通过；5：部分出库；3：已出库；4：已入库
		{
			conn.rollback();
			out.print("错误！申购单["+sgph[i]+"]未提交");
			return;
		}

		//修改状态
		ls_sql="update jxc_clsgd set sgdzt='0',sgzsl=0,sgzje=0";
		ls_sql+=" where sgph='"+sgph[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除提交成功！");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>