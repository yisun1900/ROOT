<%@ page import='ybl.upload.*'%>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ page contentType="text/html;charset=GBK" %>


<html>
<head>
<title>上载文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
int kkk=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
conn=cf.getConnection();
for (int i=0;i<500;i++)
	{
	ls_sql=" select to_char(sysdate,'YYYYMMDDHH24miss') fjmc,ygbh,to_char(sysdate,'YY') nian ";
	ls_sql+=" from sq_yhxx where 1=1 ";
	//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
		if (rs.next())
		{
			kkk++;
//			fjmc=cf.fillNull(rs.getString("fjmc"));
		}
	}
	
	out.print(kkk);
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外2: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
//		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</body>
</html>
