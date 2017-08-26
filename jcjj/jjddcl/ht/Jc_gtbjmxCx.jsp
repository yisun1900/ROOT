<%@ page contentType="text/html;charset=GBK" %>
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
String row = request.getParameter("row");//序号
String bcpp = cf.unescape(request.getParameter("bcpp"));//板材品牌
String bchd = request.getParameter("bchd");//板材厚度
if (bchd==null)
{
	return;
}

double dj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

try {
	conn=cf.getConnection();    //得到连接

	if (bcpp!=null && bchd!=null)
	{
		ls_sql="select dj";
		ls_sql+=" from jc_jjbjbj";
		ls_sql+=" where  bclx='"+bcpp+"' and bchd="+bchd;
//		out.println(ls_sql);
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next()){  
			dj=rs.getDouble("dj");
		}
		rs.close();
		ps.close();
	}


	if (dj!=0)//单价不为0
	{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.bzdj[<%=row%>].value="<%=cf.doubleTrimStr(dj,2)%>";
		parent.main.f_wdzje(parent.main.insertform,<%=row%>);
		//-->
		</SCRIPT>
		<%
	}
	else{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.bzdj.value="";
		parent.main.insertform.je.value="";
//		alert("错误！价格信息不完整，未查到价格信息");
		//-->
		</SCRIPT>
		<%
	}
}
catch(Exception e){
	out.print("查询失败,发生意外: " + e);
}
finally{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}
%>

