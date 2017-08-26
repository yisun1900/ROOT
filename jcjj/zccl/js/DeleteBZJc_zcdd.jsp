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

	String sfjs=null;
	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		sfjs="";
		if (ddbh[i].length()==9)
		{
			ls_sql =" select sfjs";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfjs=rs.getString("sfjs");
			}
			rs.close();
			ps.close();

			if (!sfjs.equals("C"))
			{
				conn.rollback();
				out.println("<BR>´íÎó£¬É¾³ýÊ§°Ü£¡¶©µ¥¡¾"+ddbh[i]+"¡¿×´Ì¬²»ÕýÈ·");
				return;
			}


			ls_sql="update jc_zcdd set sfjs='N'";
			ls_sql+=" where  ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql =" select sfjs";
			ls_sql+=" from jc_zczjx";
			ls_sql+=" where zjxbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfjs=rs.getString("sfjs");
			}
			rs.close();
			ps.close();

			if (!sfjs.equals("C"))
			{
				conn.rollback();
				out.println("<BR>´íÎó£¬É¾³ýÊ§°Ü£¡¶©µ¥¡¾"+ddbh[i]+"¡¿×´Ì¬²»ÕýÈ·");
				return;
			}


			ls_sql="update jc_zczjx set sfjs='N'";
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
	alert("É¾³ý³É¹¦£¡");
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