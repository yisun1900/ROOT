<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
double fwmj=0;
String bjbbh=null;
String bjjb=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,fwdz,fwmj,bjbbh,bjjb";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		fwmj=rs.getDouble("fwmj");
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px;' >
<center>水、电气布线安装价格表</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="3%" >序号</td>
    <td  width="8%" >项目编号</td>
    <td  width="18%" >项目名称</td>
	<td  width="5%" >单位</td>
    <td  width="5%" >工程量</td>
    <td  width="7%" >单价(元)</td>
    <td  width="9%" >金额</td>
    <td  width="30%" >用材、工艺及说明</td>
  </tr>
  <%
			
	String xh=null;
	String xmbh=null;
	String xmmc=null;

	String jgwzmc=null;
	String jldwmc=null;
	double bj=0;
	String gycl=null;

	int row=0;

	//输出项目明细
	ls_sql="SELECT xmbh,xmmc,bj,jldwmc,gycl ";
	ls_sql+=" FROM bj_jzbjb,jdm_jldwbm ";
	ls_sql+=" where bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and xmflbm='01'";
    ls_sql+=" and bjbbh='2014新版报价'";
	ls_sql+=" order by xmbh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=cf.fillHtml(rs.getString("xmbh"));
		xmmc=cf.fillHtml(rs.getString("xmmc"));

		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		bj=rs.getDouble("bj");
		gycl=cf.fillHtml(rs.getString("gycl"));

		row++;
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=xmbh%></td>
			<td ><%=xmmc%></td>
			<td ><%=jldwmc%></td>
			<td >&nbsp;</td>
			<td ><%=bj%></td>
			<td >&nbsp;</td>
			<td align="left"><%=gycl%></td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();
	
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
</table>
<BR>
</body>
</html>

