<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>主材展厅</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String getdwbh=request.getParameter("dwbh");
String getdqbm=request.getParameter("dqbm");
String getzclbbm=request.getParameter("zclbbm");
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

String zcbm=null;
String zcmc=null;
String zclbbm=null;
String xh=null;
String gg=null;
String zcysbm=null;
String jldwbm=null;
String yhj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String sfyh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int row=0;

String bgcolor="#FFFFFF";

try {
	conn=cf.getConnection();

%>
<body bgcolor="#FFFFFF" style='FONT-SIZE: 13px'>
<div align="center">
  产品明细（<%=getdwbh%>）－已选择单品
	<BR><font color="#CC0000"><b><font color="#FF99FF">红色：代表无货</font></b></font>；<b><font color="#9999FF">蓝色：代表有促销</font></b>
</div>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'> 
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="16%">型号</td>
	<td  width="19%">规格</td>
	<td  width="13%">颜色</td>
	<td  width="13%">单价</td>
	<td  width="12%">促销价</td>
	<td  width="27%">类别系列</td>
</tr>
<%
	if (getzclbbm.equals(""))
	{
		ls_sql="SELECT zcbm,zcmc,zclbbm,xh,gg,zcysbm,jldwbm,yhj,sfycx,cxj,cxkssj,cxjzsj,sfyh  ";
		ls_sql+=" FROM jc_zcjgb  ";
		ls_sql+=" where jc_zcjgb.dwbh='"+getdwbh+"' and jc_zcjgb.dqbm='"+getdqbm+"' and jc_zcjgb.zclbbm is null";
		ls_sql+=" and zcbm in(select zcbm from jc_zcddmx where ddbh='"+ddbh+"')";
		ls_sql+=" order by xh";
	}
	else{
		ls_sql="SELECT zcbm,zcmc,zclbbm,xh,gg,zcysbm,jldwbm,yhj,sfycx,cxj,cxkssj,cxjzsj,sfyh  ";
		ls_sql+=" FROM jc_zcjgb  ";
		ls_sql+=" where jc_zcjgb.dwbh='"+getdwbh+"' and jc_zcjgb.dqbm='"+getdqbm+"' and jc_zcjgb.zclbbm='"+getzclbbm+"'";
		ls_sql+=" and zcbm in(select zcbm from jc_zcddmx where ddbh='"+ddbh+"')";
		ls_sql+=" order by xh";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zclbbm=cf.fillHtml(rs.getString("zclbbm"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		zcysbm=cf.fillHtml(rs.getString("zcysbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		yhj=cf.fillNull(rs.getString("yhj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		sfyh=cf.fillNull(rs.getString("sfyh"));

		row++;

		if (row%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else 
		{
			bgcolor="#E8E8FF";
		}

		if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 && cxjzsj.compareTo(cf.today())>=0)
		{
			bgcolor="#9999FF";
		}
		else{
			cxj="&nbsp;";
		}
		if (sfyh.equals("N"))
		{
			bgcolor="#FF99FF";
			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=zcysbm%></td>
				<td><%=yhj%></td>
				<td><%=cxj%></td>
				<td><%=zclbbm%></td>
			</tr>
			<%
		}
		else{
			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td><A target="insertmain" HREF="InsertJc_zcddmx.jsp?ddbh=<%=ddbh%>&zcbm=<%=zcbm%>"><%=xh%></A></td>
				<td><%=gg%></td>
				<td><%=zcysbm%></td>
				<td><%=yhj%></td>
				<td><%=cxj%></td>
				<td><%=zclbbm%></td>
			</tr>
			<%
		}

	}
	rs.close();
	ps.close();
%>
</table>


<div align="center">未选择单品</div>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'> 
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="16%">型号</td>
	<td  width="19%">规格</td>
	<td  width="13%">颜色</td>
	<td  width="13%">单价</td>
	<td  width="12%">促销价</td>
	<td  width="27%">类别系列</td>
</tr>
<%
	if (getzclbbm.equals(""))
	{
		ls_sql="SELECT zcbm,zcmc,zclbbm,xh,gg,zcysbm,jldwbm,yhj,sfycx,cxj,cxkssj,cxjzsj,sfyh  ";
		ls_sql+=" FROM jc_zcjgb  ";
		ls_sql+=" where jc_zcjgb.dwbh='"+getdwbh+"' and jc_zcjgb.dqbm='"+getdqbm+"' and jc_zcjgb.zclbbm is null";
		ls_sql+=" and zcbm not in(select zcbm from jc_zcddmx where ddbh='"+ddbh+"')";
		ls_sql+=" order by xh";
	}
	else{
		ls_sql="SELECT zcbm,zcmc,zclbbm,xh,gg,zcysbm,jldwbm,yhj,sfycx,cxj,cxkssj,cxjzsj,sfyh  ";
		ls_sql+=" FROM jc_zcjgb  ";
		ls_sql+=" where jc_zcjgb.dwbh='"+getdwbh+"' and jc_zcjgb.dqbm='"+getdqbm+"' and jc_zcjgb.zclbbm='"+getzclbbm+"'";
		ls_sql+=" and zcbm not in(select zcbm from jc_zcddmx where ddbh='"+ddbh+"')";
		ls_sql+=" order by xh";
	}
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zclbbm=cf.fillHtml(rs.getString("zclbbm"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		zcysbm=cf.fillHtml(rs.getString("zcysbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		yhj=cf.fillNull(rs.getString("yhj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		sfyh=cf.fillNull(rs.getString("sfyh"));

		row++;

		if (row%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else 
		{
			bgcolor="#E8E8FF";
		}

		if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 && cxjzsj.compareTo(cf.today())>=0)
		{
			bgcolor="#9999FF";
		}
		else{
			cxj="&nbsp;";
		}
		if (sfyh.equals("N"))
		{
			bgcolor="#FF99FF";
			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=zcysbm%></td>
				<td><%=yhj%></td>
				<td><%=cxj%></td>
				<td><%=zclbbm%></td>
			</tr>
			<%
		}
		else{
			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td><A target="insertmain" HREF="InsertJc_zcddmx.jsp?ddbh=<%=ddbh%>&zcbm=<%=zcbm%>"><%=xh%></A></td>
				<td><%=gg%></td>
				<td><%=zcysbm%></td>
				<td><%=yhj%></td>
				<td><%=cxj%></td>
				<td><%=zclbbm%></td>
			</tr>
			<%
		}

	}
	rs.close();
	ps.close();
%>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>