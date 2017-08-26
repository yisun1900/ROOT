<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<HTML>
<HEAD>
<TITLE>期末结转</TITLE>
</HEAD>

<BODY bgColor=#ffffff>

<% 
int count=0;

String kpjlh=cf.GB2Uni(request.getParameter("kpjlh"));

//连接数据库
Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;

String ls_sql=null;


try {
	conn=cf.getConnection();




	ls_sql="delete from kp_yzfsgdkhpyd ";
	ls_sql+=" where kpjlh='"+kpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch(Exception e){
	out.print("数据库操作失败"+e);
	out.print("<BR>ls_sql="+ls_sql);
}
finally{
	try{
		if (rs!= null) rs.close();  
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);  
	}
	catch (Exception e){ 
		out.println("关闭连接发生以外,Exception:"+e.getMessage()); 
	} 
}
%>  

</BODY>
</html>




