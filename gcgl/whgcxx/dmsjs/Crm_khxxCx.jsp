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
String xghdwbh = request.getParameter("xghdwbh");//修改后签约店面
String xghfgsbh = request.getParameter("xghfgsbh");//修改后分公司

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String yhmc=null;
String c1=null;
String c2=null;
String outStr="";
try {
	conn=cf.getConnection();

	int count=0;

	if (xghfgsbh!=null)
	{
		ls_sql="select dwbh,dwmc ";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwlx='F2' and cxbz='N' and ssfgs='"+xghfgsbh+"'";
		ls_sql+=" order by dwbh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			c1=rs.getString(1);
			c2=rs.getString(2);

			outStr+="%"+c1+"+"+c2;

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
			parent.main.addItem(parent.main.insertform.xghdwbh,"<%=outStr%>");
		//-->
		</SCRIPT>
		<%
	}
	else if (xghdwbh!=null)
	{
		ls_sql="select yhmc";
		ls_sql+=" from  sq_yhxx,sq_sqbm";
		ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+xghdwbh+"' ";
		ls_sql+=" and sq_yhxx.zwbm='04' and sq_yhxx.sfzszg in('Y','N') ";
		ls_sql+=" order by yhmc";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			yhmc=rs.getString(1);

			outStr+="%"+yhmc+"+"+yhmc;

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
			parent.main.addItem(parent.main.insertform.xghsjs,"<%=outStr%>");
		//-->
		</SCRIPT>
		<%
	}

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


