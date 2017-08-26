<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		if (ddbh[i].length()==9)
		{
			String sfjs=null;
			String clzt=null;
			String khbh=null;
			ls_sql =" select sfjs,clzt,khbh";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfjs=cf.fillNull(rs.getString("sfjs"));
				clzt=rs.getString("clzt");
				khbh=rs.getString("khbh");
			}
			rs.close();
			ps.close();

			if (sfjs.equals("Y"))
			{
				conn.rollback();
				out.println("<BR>错误，订单【"+ddbh[i]+"】已结算");
				return;
			}

			ls_sql="update jc_zcdd set sfjs='C'";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			String sfjs=null;
			String clzt=null;
			String khbh=null;
			ls_sql =" select sfjs,clzt,khbh";
			ls_sql+=" from jc_zczjx";
			ls_sql+=" where zjxbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfjs=cf.fillNull(rs.getString("sfjs"));
				clzt=rs.getString("clzt");
				khbh=rs.getString("khbh");
			}
			rs.close();
			ps.close();

			if (sfjs.equals("Y"))
			{
				conn.rollback();
				out.println("<BR>错误，增减项【"+ddbh[i]+"】已结算");
				return;
			}

			ls_sql="update jc_zczjx set sfjs='C'";
			ls_sql+=" where zjxbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
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
