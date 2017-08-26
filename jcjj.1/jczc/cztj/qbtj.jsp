<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ls_sql=null;
String wheresql="";



//	String hy_hyxxb_yxrq=null;


String tj1=cf.GB2Uni(request.getParameter("tj1"));
String tj2=cf.GB2Uni(request.getParameter("tj2"));
String tj3=cf.GB2Uni(request.getParameter("tj3"));
String tj1name=cf.GB2Uni(request.getParameter("tj1name"));
String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
String tj3name=cf.GB2Uni(request.getParameter("tj3name"));

String groupsql="";
String selectgroupsql="";
int groupsl=0;
if (tj1!=null)
{
	if (!(tj1.equals("")))
	{
		groupsql+=","+tj1;
		selectgroupsql+=","+tj1;
		groupsl++;
	}
}
if (tj2!=null)
{
	if (!(tj2.equals("")))
	{
		groupsql+=","+tj2;
		selectgroupsql+=","+tj2;
		groupsl++;
	}
}
if (tj3!=null)
{
	if (!(tj3.equals("")))
	{
		groupsql+=","+tj3;
		selectgroupsql+=","+tj3;
		groupsl++;
	}
}
if (groupsl==0)
{
	out.println("请选择统计列");
	return;
}
else{
	groupsql=" group by "+groupsql.substring(1);
	selectgroupsql=" select "+selectgroupsql.substring(1)+",count(distinct hy_hyxxb.hybh)";
}
%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<%
	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj3name+"</td>");
	}

%>
	<td  width="10%">数量</td>
</tr>


<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1 = null;
PreparedStatement ps2=null;
ResultSet rs2 = null;
String bgcolor="#FFFFFF";

String c1=null;
String c2=null;
String c3=null;

int sl=0;
int allsl=0;

try {
	conn=cf.getConnection();

	int row=0;
	ls_sql=selectgroupsql;
	ls_sql+=" FROM hy_hyxxb,hy_hyjbb,sq_dwxx,hy_zydmb,hy_ysrdmb,hy_hyxfjlb,hy_gmyydmb,dm_gmyj";
	ls_sql+=" ,hy_xxqd,hy_vip,hy_shfw,hy_cxhd,hy_gjjy";
	ls_sql+=" where hy_hyxxb.dwbh=sq_dwxx.dwbh(+) and hy_hyxxb.hyjb=HY_HYJBB.hyjbbh(+)";
	ls_sql+=" and hy_hyxxb.zydm=hy_zydmb.xh(+) and hy_hyxxb.ysrdm=hy_ysrdmb.xh(+)";
	ls_sql+=" and hy_hyxxb.hybh=hy_hyxfjlb.hybh(+) and hy_hyxfjlb.ywxh=dm_gmyj.ywxh(+)";
	ls_sql+=" and hy_hyxfjlb.gmyy=hy_gmyydmb.xh(+)";
	ls_sql+=" and hy_hyxxb.hybh=hy_xxqd.hybh(+) and hy_hyxxb.hybh=hy_vip.hybh(+)";
	ls_sql+=" and hy_hyxxb.hybh=hy_shfw.hybh(+) and hy_hyxxb.hybh=hy_cxhd.hybh(+)";
	ls_sql+=" and hy_hyxxb.hybh=hy_gjjy.hybh(+) ";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		if (groupsl==1)
		{
			c1=cf.fillHtml(rs.getString(1));
		}
		else if (groupsl==2)
		{
			c1=cf.fillHtml(rs.getString(1));
			c2=cf.fillHtml(rs.getString(2));
		}
		else if (groupsl==3)
		{
			c1=cf.fillHtml(rs.getString(1));
			c2=cf.fillHtml(rs.getString(2));
			c3=cf.fillHtml(rs.getString(3));
		}

		sl=rs.getInt(groupsl+1);
		allsl+=sl;


		row++;
		if (row%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		out.println("<tr bgcolor=\""+bgcolor+"\"  align=\"center\">");
		if (groupsl==1)
		{
			out.println("<td>"+c1+"</td>");
		}
		else if (groupsl==2)
		{
			out.println("<td>"+c1+"</td>");
			out.println("<td>"+c2+"</td>");
		}
		else if (groupsl==3)
		{
			out.println("<td>"+c1+"</td>");
			out.println("<td>"+c2+"</td>");
			out.println("<td>"+c3+"</td>");
		}
		out.println("<td>"+sl+"</td>");

	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

	out.println("<tr bgcolor=\""+bgcolor+"\"  align=\"center\">");
	if (groupsl==1)
	{
		out.println("<td>合计</td>");
	}
	else if (groupsl==2)
	{
		out.println("<td>合计</td>");
		out.println("<td>&nbsp;</td>");
	}
	else if (groupsl==3)
	{
		out.println("<td>合计</td>");
		out.println("<td>&nbsp;</td>");
		out.println("<td>&nbsp;</td>");
	}
	out.println("<td>"+allsl+"</td>");
%>

</table>
</body>
</html>