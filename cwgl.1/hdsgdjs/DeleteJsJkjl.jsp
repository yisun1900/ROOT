<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] gdjkjlh = request.getParameterValues("gdjkjlh");
String gdjsjlh=request.getParameter("gdjsjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String ls_sql=null;
if (gdjkjlh==null)
{
	out.println("错误！请选择结算记录");
	return;
}

try {
	conn=cf.getConnection();

	String gdjsjd=null;
	double allfy=0;

	conn.setAutoCommit(false);

	for (int i=0;i<gdjkjlh.length ;i++ )
	{
		ls_sql="select gdjsjd,jkje";
		ls_sql+=" from  cw_gdjkjl";
		ls_sql+=" where gdjkjlh='"+gdjkjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gdjsjd=rs.getString("gdjsjd");
			allfy+=rs.getDouble("jkje");
		}
		else{
			conn.rollback();
			out.println("错误！借款记录号["+gdjkjlh[i]+"]不存在");
			return;
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals("1"))
		{
			conn.rollback();
			out.println("错误！财务未结算："+gdjkjlh[i]);
			return;
		}

		//扣维修费
		ls_sql=" update cw_gdjkjl set gdjsjd='0',gdjsjlh=null";
		ls_sql+=" where gdjsjd='1' and gdjkjlh='"+gdjkjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！总金额：<%=allfy%>");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>