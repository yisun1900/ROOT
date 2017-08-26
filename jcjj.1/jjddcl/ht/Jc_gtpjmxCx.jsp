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
String gtpjbh = cf.GB2Uni(request.getParameter("gtpjbh"));//配件编号
if (gtpjbh.equals(""))
{
	return;
}

double dj=0;
String jldwbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;

try {
	conn=cf.getConnection();    //得到连接

	if (gtpjbh!=null)
	{
		ls_sql="select dj,jldwbm";
		ls_sql+=" from jc_jjpjbj";
		ls_sql+=" where  gtpjbh='"+gtpjbh+"'";
//		out.println(ls_sql);
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();  
		if (rs.next()){  
			dj=rs.getDouble("dj");
			jldwbm=rs.getString("jldwbm");
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
		parent.main.insertform.bzdj.value="<%=cf.doubleTrimStr(dj,2)%>";
		parent.main.insertform.jldwbm.value="<%=jldwbm%>";
		parent.main.f_wdzje(parent.main.insertform);
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

