<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");


String xsph=cf.GB2Uni(request.getParameter("xsph"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String gsmc="";

String ssfgs="";
String shbm="";
double xszsl=0;
double xszje=0;
String xsdlxmc="";
String xsy="";
String xsrq="";
String bz="";
String shfmc="";
String shrlxfs="";
String shfdz="";

double xjxssl=0;
double xjxsje=0;

try {
	conn=cf.getConnection();

	ls_sql="select a.dwmc ssfgs,b.dwmc shbm,xszsl,xszje,xsdlxmc,jxc_fcxsd.xsy,jxc_fcxsd.xsrq,jxc_fcxsd.bz,shfmc,shrlxfs,shfdz ";
	ls_sql+=" from jxc_fcxsd,sq_dwxx a,sq_dwxx b,dm_xsdlx ";
	ls_sql+=" where jxc_fcxsd.xsph='"+xsph+"'";
	ls_sql+=" and jxc_fcxsd.ssfgs=a.dwbh(+) ";
	ls_sql+=" and jxc_fcxsd.shbm=b.dwbh(+) ";
	ls_sql+=" and jxc_fcxsd.xsdlx=dm_xsdlx.xsdlx(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		shbm=cf.fillNull(rs.getString("shbm"));
		xszsl=rs.getDouble("xszsl");
		xszje=rs.getDouble("xszje");

		xsdlxmc=cf.fillNull(rs.getString("xsdlxmc"));
		xsy=cf.fillNull(rs.getString("xsy"));
		xsrq=cf.fillNull(rs.getDate("xsrq"));
		bz=cf.fillNull(rs.getString("bz"));
		shfmc=cf.fillHtml(rs.getString("shfmc"));
		shrlxfs=cf.fillHtml(rs.getString("shrlxfs"));
		shfdz=cf.fillHtml(rs.getString("shfdz"));
	}
	rs.close();
	ps.close();

	ls_sql="select csz";
	ls_sql+=" from sq_xtcsb ";
	ls_sql+=" where csbm='gsmc'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gsmc=cf.fillNull(rs.getString("csz"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>材料出库单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><strong><font size="5"><%=gsmc%>－－销售单</font></strong></div>
<BR>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td width="31%" height="26"><strong>销售批号</strong>：<%=xsph%></td>
  <td width="31%"><strong>销售单类型</strong>：<%=xsdlxmc%></td>
  <td width="38%"><strong>销 售 员</strong>：<%=xsy%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td height="26"><strong>销售公司</strong>：<%=ssfgs%></td>
  <td><strong>收货部门</strong>：<%=shbm%></td>
  <td><strong>销售日期</strong>：<%=xsrq%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td height="26"><strong>收 货 方</strong>：<%=shfmc%></td>
  <td><strong>联系方式</strong>：<%=shrlxfs%></td>
  <td><strong>收货方地址</strong>：<%=shfdz%></td>
</tr>
</table>


<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF" align="center">
	<td width="4%"><b>序号</b></td>
	<td width="10%"><b>内部编码</b></td>
	<td width="20%"><b>材料名称</b></td>
	<td width="15%"><b>材料规格</b></td>
	<td width="6%"><b>单位</b></td>
	<td width="7%"><b>单价</b></td>
	<td width="8%"><b>数量</b></td>
	<td width="9%"><b>金额</b></td>
	<td width="21%"><b>备注</b></td>
</tr>
<%
	String nbbm=null;
	String clmc=null;
	String gg=null;
	String jldwbm=null;
	double xsj=0;
	double xssl=0;
	double xsje=0;

	int row=0;

	ls_sql="select nbbm,clmc,gg,jldwbm,xsj,xssl,xsje ";
	ls_sql+=" from jxc_fcxsmx ";
	ls_sql+=" where xsph='"+xsph+"'";
	ls_sql+=" order by xsxh";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;

		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		xsj=rs.getDouble("xsj");
		xssl=rs.getDouble("xssl");
		xsje=rs.getDouble("xsje");

		xjxssl+=xssl;
		xjxsje+=xsje;

		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td><%=row%></td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=xsj%></td>
			<td><%=xssl%></td>
			<td><%=xsje%></td>
			<td>&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<tr bgcolor="#FFFFFF" align="center">
	<td colspan="5">合计</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(xjxssl) %></td>
	<td><%=cf.formatDouble(xjxsje) %></td>
	<td>&nbsp;</td>
</tr>

		
</table>


<table width="100%" border="0">
<tr>
    <td width="33%"><font size="-1"><b>主&nbsp;&nbsp;管：</b></font></td>
    <td width="33%"><font size="-1"><b>库&nbsp;&nbsp;管：</b></font></td>
    <td width="33%"><font size="-1"><b>制&nbsp;&nbsp;表：<%=yhmc%></b></font></td>
  </tr>
  
  <tr>
    <td colspan="2"><font size="-1"><b>备注：</b></font><%=bz%></td>
	<td colspan="2" align="right"><font size="-1"><b>打印日期：<%=cf.today("YYYY-MM-DD")%></b></font></td>
  </tr>
</table>

</body>
</html>


