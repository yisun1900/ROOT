<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<%
	String ls_sql=request.getParameter("sql");

	ls_sql=cf.SQLJM(ls_sql);

	if (ls_sql==null || ls_sql.equals(""))
	{
		out.print("");  
		return ;
	}

	
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;

	String c1=null;
	String c2=null;
	String retStr="";

	try {
		conn=cf.getConnection();

		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		while (rs.next())
		{
			c1=rs.getString(1);
			c2=rs.getString(2);

			retStr+="%"+c1+"+"+c2;
		}
		rs.close();
		ps.close();

		if (!retStr.equals(""))
		{
			retStr=retStr.substring(1);
		}


	}
	catch (Exception e) {
		try{
			System.out.println("Exception: " + e);
			System.out.println("<BR>sql=" + ls_sql);
		}
		catch (Exception e1){}
	}
	finally 
	{
		try{
			if (rs != null) rs.close(); 
			if (ps != null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){}
	}

	
	out.print(retStr);  
%>