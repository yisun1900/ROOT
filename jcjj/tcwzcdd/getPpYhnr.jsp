<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%  
String sql =cf.GB2Uni(cf.getParameter(request,"sql"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

try {
	conn=cf.getConnection();

	String c1="";
	String c2="";
	String c3="";
	String c4="";
	String retStr="";

//	out.print("SQL="+sql);

	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		c1=cf.fillNull(rs.getString(1));
		c2=cf.fillNull(rs.getDate(2));
		c3=cf.fillNull(rs.getDate(3));
		c4=cf.fillNull(rs.getString(4));
	}
	rs.close();
	ps.close();

	if (c1.equals("Y"))
	{
		retStr="（"+c2+" 到 "+c3+"）："+c4;
	}
	else {
		retStr="无优惠";
	}


	out.print(retStr);  
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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

