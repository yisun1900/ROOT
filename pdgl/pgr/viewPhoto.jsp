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
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();

	String ssfgs=null;
	ls_sql="select fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

%>
<body bgcolor="#FFFFFF">
<CENTER><B>工人照片：<%=khbh%></B><BR><HR>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF" align="center"> 
  <td width="6%">工种</td>
  <td width="6%">姓名</td>
  <td width="6%">派单人</td>
  <td width="9%">派单时间</td>
  <td width="6%">审核人</td>
  <td width="9%">审核时间</td>
  <td width="35%">公司登记照片</td>
  <td width="35%">审核照片</td>
</tr>
<%

	String grgz=null;
	String grxm=null;
	String zpmc=null;
	String grpdr=null;
	String grpdsj=null;
	String shr=null;
	String shsj=null;
	ls_sql="select grgz,grxm,zpmc,pdr,pdsj,shr,shsj";
	ls_sql+=" from  crm_grxx";
	ls_sql+=" where khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		grgz=cf.fillNull(rs.getString("grgz"));
		grxm=cf.fillNull(rs.getString("grxm"));
		zpmc=cf.fillNull(rs.getString("zpmc"));
		grpdr=cf.fillNull(rs.getString("pdr"));
		grpdsj=cf.fillNull(rs.getString("pdsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getString("shsj"));

		if (grgz.equals("泥瓦工"))
		{
			grgz="瓦工";
		}

		String zp="";
		ls_sql="select zp";
		ls_sql+=" from  sq_grxxb";
		ls_sql+=" where xm='"+grxm+"'";
		ls_sql+=" and gz='"+grgz+"'";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zp=cf.fillNull(rs1.getString("zp"));
		}
		rs1.close();
		ps1.close();

		%>
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td><%=grgz%></td>
		  <td><%=grxm%></td>
		  <td><%=grpdr%></td>
		  <td><%=grpdsj%></td>
		  <td><%=shr%></td>
		  <td><%=shsj%></td>
		  <%
			if (zp.equals(""))
			{
				%>
				<td>无照片</td>
				<%
			}
			else{
				%>
				<td><img src="/yblimg/grxx/<%=zp%>"  ></td>
				<%
			}
		  %>
		  <%
			if (zpmc.equals(""))
			{
				%>
				<td>无照片</td>
				<%
			}
			else{
				%>
				<td><img src="/yblimg/grsh/<%=zpmc%>" ></td>
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
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
