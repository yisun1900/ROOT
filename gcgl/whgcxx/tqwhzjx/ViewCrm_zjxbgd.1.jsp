<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
%>


<html>
<head>
<title>增减项变更单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
  <div align="center">增减项变更单（增减项序号：<%=zjxxh%>）</div>
<table border="1" cellspacing="0" cellpadding="1" width="120%" style='FONT-SIZE: 12px'>

    <tr bgcolor="#CCCCCC"  align="center"> 
		<td width="3%">类型</td>
		<td width="3%">序号</td>
		<td width="7%">预算编号</td>
		<td width="6%">房间</td>
		<td width="15%">变更项目</td>
		<td width="6%">单价</td>
		<td width="5%">计量单位</td>
		<td width="5%">数量</td>
		<td width="7%">金额</td>
		<td width="6%">审计增加金额</td>
		<td width="6%">审计增加差额</td>
		<td width="6%">预算漏项增加金额</td>
		<td width="6%">预算增加差额</td>
		<td width="19%">说明</td>
    </tr>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String xh=null;
	String xmbh=null;
	String fj=null;
	String bgxm=null;
	String jldw=null;
	double dj=0;
	double sl=0;
	double je=0;
	double sjzjje=0;
	double sjzjce=0;
	double yslxje=0;
	double yszjce=0;

	String lx=null;
	String lxmc=null;
	String sm=null;

	int row=0;
	double allje=0;
	double xj=0;

	double xjsjzjje=0;
	double xjsjzjce=0;
	double xjyslxje=0;
	double xjyszjce=0;
	double allsjzjje=0;
	double allsjzjce=0;
	double allyslxje=0;
	double allyszjce=0;

	ls_sql="select xh,xmbh,fj,jldw,dj,sl,je,lx,DECODE(lx,'1','增项','2','减项') lxmc,sm ";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='1'";
	ls_sql+=" order by lx,fj,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=cf.fillHtml(rs.getString("xh"));
		xmbh=cf.fillHtml(rs.getString("xmbh"));
		fj=cf.fillHtml(rs.getString("fj"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));
		sm=cf.fillHtml(rs.getString("sm"));

		xj+=je;
		allje+=je;

		xjsjzjje+=sjzjje;
		xjsjzjce+=sjzjce;
		xjyslxje+=yslxje;
		xjyszjce+=yszjce;

		allsjzjje+=sjzjje;
		allsjzjce+=sjzjce;
		allyslxje+=yslxje;
		allyszjce+=yszjce;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=lxmc%></td>
		  <td><%=row%>
		  </td>
		  <td><%=xmbh%></td>
		  <td><%=fj%></td>
		  <td><%=bgxm%></td>
		  <td><%=dj%></td>
		  <td><%=jldw%> 
		  </td>
		  <td><%=sl%></td>
		  <td><%=je%></td>
		  <td><%=sjzjje%></td>
		  <td><%=sjzjce%></td>
		  <td><%=yslxje%></td>
		  <td><%=yszjce%></td>
		  <td> <%=sm%>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
	<tr bgcolor="#FFFFF"  align="center"> 
	  <td colspan="3">增项小计</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xj)%></td>
	  <td><%=cf.formatDouble(xjsjzjje)%></td>
	  <td><%=cf.formatDouble(xjsjzjce)%></td>
	  <td><%=cf.formatDouble(xjyslxje)%></td>
	  <td><%=cf.formatDouble(xjyszjce)%></td>
	  <td>&nbsp;</td>
	</tr>

</table>
<P>
<table border="1" cellspacing="0" cellpadding="1" width="120%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
		<td width="3%">类型</td>
		<td width="3%">序号</td>
		<td width="7%">预算编号</td>
		<td width="6%">房间</td>
		<td width="15%">变更项目</td>
		<td width="6%">单价</td>
		<td width="5%">计量单位</td>
		<td width="5%">数量</td>
		<td width="7%">金额</td>
		<td width="6%">审计增加金额</td>
		<td width="6%">审计增加差额</td>
		<td width="6%">预算漏项增加金额</td>
		<td width="6%">预算增加差额</td>
		<td width="19%">说明</td>
    </tr>
<%
	xj=0;	
	xjsjzjje=0;
	xjsjzjce=0;
	xjyslxje=0;
	xjyszjce=0;
	ls_sql="select xh,xmbh,fj,jldw,dj,sl,je,lx,DECODE(lx,'1','增项','2','减项') lxmc,sm ";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='2'";
	ls_sql+=" order by lx,fj,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=cf.fillHtml(rs.getString("xh"));
		xmbh=cf.fillHtml(rs.getString("xmbh"));
		fj=cf.fillHtml(rs.getString("fj"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));
		sm=cf.fillHtml(rs.getString("sm"));

		xj+=je;
		allje-=je;

		xjsjzjje+=sjzjje;
		xjsjzjce+=sjzjce;
		xjyslxje+=yslxje;
		xjyszjce+=yszjce;

		allsjzjje+=sjzjje;
		allsjzjce+=sjzjce;
		allyslxje+=yslxje;
		allyszjce+=yszjce;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=lxmc%></td>
		  <td><%=row%>
		  </td>
		  <td><%=xmbh%></td>
		  <td><%=fj%></td>
		  <td><%=bgxm%></td>
		  <td><%=dj%></td>
		  <td><%=jldw%> 
		  </td>
		  <td><%=sl%></td>
		  <td> <%=je%></td>
		  <td><%=sjzjje%></td>
		  <td><%=sjzjce%></td>
		  <td><%=yslxje%></td>
		  <td><%=yszjce%></td>
		  <td> <%=sm%>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
	<tr bgcolor="#FFFFF"  align="center"> 
	  <td colspan="3">减项小计</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xj)%></td>
	  <td><%=cf.formatDouble(xjsjzjje)%></td>
	  <td><%=cf.formatDouble(xjsjzjce)%></td>
	  <td><%=cf.formatDouble(xjyslxje)%></td>
	  <td><%=cf.formatDouble(xjyszjce)%></td>
	  <td>&nbsp;</td>
	</tr>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td colspan="3">总计</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><%=cf.formatDouble(allje)%></td>
		  <td><%=cf.formatDouble(allsjzjje)%></td>
		  <td><%=cf.formatDouble(allsjzjce)%></td>
		  <td><%=cf.formatDouble(allyslxje)%></td>
		  <td><%=cf.formatDouble(allyszjce)%></td>
		  <td>&nbsp;</td>
		</tr>
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

