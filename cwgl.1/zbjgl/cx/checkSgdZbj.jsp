<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<table width="50%" border="1" >
  <tr align="center">
    <td>施工队</td>
    <td>目前质保金</td>
    <td>共增减质保金</td>
    <td>报警</td>
  </tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ls_sql=null;


	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	double allzbj=0;
	String sgd=null;
	String sgdmc=null;

	double jxje=0;
	double zjje=0;
	double jsje=0;
	double allzjzbj=0;
	
	try {
		conn=cf.getConnection();

		ls_sql="select sgd,sgdmc,zbj";
		ls_sql+=" from  sq_sgd";
		ls_sql+=" where ssfgs='FBJ00' and cxbz='N'";
		ls_sql+=" order by ssfgs";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			sgd=rs1.getString("sgd");
			sgdmc=rs1.getString("sgdmc");
			allzbj=rs1.getDouble("zbj");


			ls_sql="select sum(je)";
			ls_sql+=" from  cw_zbjjsjl";
			ls_sql+=" where sgd='"+sgd+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				jxje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="select sum(je)";
			ls_sql+=" from  cw_zbzjsjl";
			ls_sql+=" where sgd='"+sgd+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zjje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="select sum(wxj)";
			ls_sql+=" from  cw_gdjsjl";
			ls_sql+=" where sgd='"+sgd+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				jsje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			allzjzbj=zjje+jsje-jxje;

			String bj="&nbsp;";
			if (allzjzbj-allzbj>2 || allzjzbj-allzbj<-2)
			{
				bj="报警";
			}

			%>
			  <tr align="center">
				<td><%=sgdmc%></td>
				<td><%=cf.formatDouble(allzbj)%></td>
				<td><%=cf.formatDouble(allzjzbj)%></td>
				<td><%=bj%></td>
			  </tr>
			<%
		}
		rs1.close();
		ps1.close();

	}
	catch (Exception e) {
		out.print("<BR>出错:" + e);
		out.print("<BR>SQL=" + ls_sql);
		return;
	}
	finally 
	{
		try{
			if (rs != null) rs.close(); 
			if (ps != null) ps.close(); 
			if (rs1 != null) rs1.close(); 
			if (ps1 != null) ps1.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			if (conn != null) cf.close(conn); 
		}
	}


%> 
</table>
</body>
</html>
