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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%  
String jsrssfgs = request.getParameter("jsrssfgs");
String jsrssbm = request.getParameter("jsrssbm");

if ( (jsrssfgs==null || jsrssfgs.equals("")) && (jsrssbm==null || jsrssbm.equals("")) )
{
	return ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String gedwbh=null;
String getdwmc=null;
String getygbh=null;
String getyhmc=null;

String outStr="";
try {
	conn=cf.getConnection();

	int count=0;

	if (jsrssbm!=null)
	{
		ls_sql="select ygbh,yhmc ";
		ls_sql+=" from sq_yhxx";
		ls_sql+=" where  sfzszg in('Y','N') and dwbh='"+jsrssbm+"'";
		ls_sql+=" order by yhmc";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getygbh=rs.getString(1);
			getyhmc=rs.getString(2);

			%>
				parent.main.addOption(parent.main.insertform.jsrxh,"<%=getygbh%>","<%=getyhmc%>");
			<%
		}
		rs.close();
		ps.close();
	}
	else if (jsrssfgs!=null)
	{
		ls_sql=" select dwbh,dwmc  ";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' and ssfgs='"+jsrssfgs+"'";
		ls_sql+=" order by dwbh";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			gedwbh=rs.getString(1);
			getdwmc=rs.getString(2);

			%>
				parent.main.addOption(parent.main.insertform.jsrssbm,"<%=gedwbh%>","<%=getdwmc%>");
			<%
		}
		rs.close();
		ps.close();
	}

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
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

//-->
</SCRIPT>

