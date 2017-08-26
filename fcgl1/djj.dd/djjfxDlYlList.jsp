<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>


<html>
<head>
</head>
<body >

<table width="100%" >
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String cldlmc=null;
double sjje=0;


try {
	conn=cf.getConnection();

	ls_sql="select sum(cl_djjflmx.sjje)";
	ls_sql+=" from cl_djjflmx,cl_djj  ";
	ls_sql+=" where cl_djjflmx.czxh=cl_djj.czxh and cl_djjflmx.cldlmc in('澳松板','松下亿达专用PPR管') ";
	ls_sql+=" and cl_djj.czzt='3'  and cl_djj.dwbh='FBJ00' ";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjje=rs.getDouble(1);

		out.print(sjje);
	
	}
	rs.close();
	ps.close();

//	out.println(ls_sql);

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


</table>
</body>
</html>