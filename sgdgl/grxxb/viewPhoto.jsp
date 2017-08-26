<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>工人照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String ssfgs=request.getParameter("ssfgs");
String xm=cf.GB2Uni(cf.getParameter(request,"xm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();

%>
<body bgcolor="#FFFFFF">
<CENTER><B>工人照片：<%=ssfgs%></B><BR><HR>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF" align="center"> 
  <td width="18%">施工队</td>
  <td width="18%">姓名</td>
  <td width="18%">照片</td>
</tr>
<%

	String sgdmc=null;
	String zp=null;
	ls_sql="select sgdmc,xm,zp";
	ls_sql+=" from  sq_grxxb,sq_sgd";
	ls_sql+=" where  sq_grxxb.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and sq_grxxb.ssfgs='"+ssfgs+"'";
	ls_sql+=" and sq_grxxb.xm='"+xm+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		xm=cf.fillNull(rs.getString("xm"));
		zp=cf.fillNull(rs.getString("zp"));


		%>
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td><%=sgdmc%></td>
		  <td><%=xm%></td>
		  <%
			if (zp.equals(""))
			{
				%>
				<td>无照片</td>
				<%
			}
			else{
				%>
				<td><img src="/yblimg/grxx/<%=zp%>" width="300"></td>
				<%
			}
		  %>
		</tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("Exception:" + e);
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
</table>
</CENTER>
</body>
</html>
