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
String sqxh = request.getParameter("sqxh");
String fgsbh = request.getParameter("fgsbh");
String xcpflbm = request.getParameter("xcpflbm");
String xcpbm = request.getParameter("xcpbm");

if (fgsbh==null || fgsbh.equals(""))
{
	return ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String getxcpbm=null;
String getxcpmc=null;
String getjldw=null;
double getdj=0;
String getsfxsp=null;
String getsfxspmc=null;

String outStr="";
try {
	conn=cf.getConnection();

	int count=0;

	if (xcpflbm!=null)
	{
		ls_sql="select oa_xcpbm.xcpbm,oa_xcpbm.xcpmc ";
		ls_sql+=" from oa_xcpbm,oa_xcplqfw";
		ls_sql+=" where oa_xcpbm.xcpbm=oa_xcplqfw.xcpbm and oa_xcplqfw.fgsbh='"+fgsbh+"' and oa_xcpbm.xcpflbm='"+xcpflbm+"'";
		ls_sql+=" and oa_xcpbm.xcpbm not in(select xcpbm from oa_xcplqmx where sqxh="+sqxh+")";
		ls_sql+=" order by oa_xcpbm.xcpbm";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getxcpbm=rs.getString(1);
			getxcpmc=rs.getString(2);

			%>
				parent.main.addOption(parent.main.insertform.xcpbm,"<%=getxcpbm%>","<%=getxcpmc%>");
			<%
		}
		rs.close();
		ps.close();
	}
	else if (xcpbm!=null)
	{
		ls_sql="select xcpbm,xcpmc,jldw,dj,sfxsp,DECODE(sfxsp,'N','不需要','Y','需要') ";
		ls_sql+=" from oa_xcpbm";
		ls_sql+=" where xcpbm='"+xcpbm+"'";
		ls_sql+=" order by xcpbm";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getxcpbm=rs.getString(1);
			getxcpmc=rs.getString(2);
			getjldw=cf.fillNull(rs.getString(3));
			getdj=rs.getDouble(4);
			getsfxsp=rs.getString(5);
			getsfxspmc=rs.getString(6);

			%>
				parent.main.insertform.xcpmc.value="<%=getxcpmc%>"
				parent.main.insertform.jldw.value="<%=getjldw%>"
				parent.main.insertform.dj.value="<%=getdj%>"
				parent.main.insertform.sfxsp.value="<%=getsfxsp%>"
				parent.main.insertform.sfxspmc.value="<%=getsfxspmc%>"
			<%
		}
		rs.close();
		ps.close();
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

//-->
</SCRIPT>

