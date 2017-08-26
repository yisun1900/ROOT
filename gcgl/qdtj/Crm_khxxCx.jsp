<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jcjj" scope="page" class="jcjj.Jcjj"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<%  
String cqbm = request.getParameter("cqbm");//所属城区编码

if (cqbm==null)
{
	return ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String xqbm=null;
String xqmc=null;
String outStr="";
try {
	conn=cf.getConnection();

	int count=0;

	ls_sql="select xqbm,xqmc";
	ls_sql+=" from  dm_xqbm";
	ls_sql+=" where cqbm='"+cqbm+"'";
	ls_sql+=" order by xqmc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xqbm=rs.getString(1);
		xqmc=rs.getString(2);

		outStr+="%"+xqbm+"+"+xqmc;

	}
	rs.close();
	ps.close();
	if (!outStr.equals(""))
	{
		outStr=outStr.substring(1);
	}

	%>
	<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
	<SCRIPT language=javascript >
	<!--
		parent.main.addXq("<%=outStr%>");
	//-->
	</SCRIPT>
	<%
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


