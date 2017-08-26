<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%  
String sql = null;
Connection conn  = null;
Statement stmt = null;
ResultSet rs = null;

String slr =cf.unescape(request.getParameter("slr"));

String dwbh = cf.GB2Uni(request.getParameter("dwbh"));

try {
	conn=cf.getConnection();    //得到连接
	stmt = conn.createStatement();

	if (!slr.equals(""))
	{
		%>
		parent.main.insertform.bgypbm[0]=new parent.main.Option("","" );;   
		<%
		int i=0;
		String bgypbm=null;
		String bgypmc=null;
		sql= "select bgypbm,bgypmc||'（'||dj||'元）' bgypmc";
		sql+=" from oa_bgypbm,oa_lqfw,oa_flbm";
		sql+=" where oa_lqfw.flbm=oa_flbm.flbm and oa_lqfw.xm='"+slr+"' and oa_lqfw.dwbh='"+dwbh+"'";
		sql+=" and oa_bgypbm.flbm=oa_flbm.flbm ";
		sql+=" and oa_bgypbm.fgsbh=(select ssfgs from sq_dwxx where dwbh='"+dwbh+"')";
		sql+=" order by oa_bgypbm.bgypbm ";
//		out.println(sql);
		rs = stmt.executeQuery(sql);
		while (rs.next())                            
		{
			i++;
			bgypbm=rs.getString("bgypbm");
			bgypmc=rs.getString("bgypmc");

			%>
			parent.main.insertform.bgypbm[<%=i%>]=new parent.main.Option("<%=bgypmc%>","<%=bgypbm%>" );   
			<%
		}
		rs.close();
	}
}
catch(Exception e){
	out.print("查询失败,发生意外: " + e);
	out.print("SQL=" + sql);
}
finally{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}
%>

//-->
</SCRIPT>

