<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>培训审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">培训审核</div>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="4%">&nbsp;</td>
	<td  width="5%">培训明细编号</td>
	<td  width="3%">培训类型</td>
	<td  width="3%">授课形式</td>
	<td  width="4%">课程类型</td>
	<td  width="3%">培训人数</td>
	<td  width="3%">培训费用</td>
	<td  width="3%">高层人数</td>
	<td  width="3%">中层人数</td>
	<td  width="3%">基层人数</td>
	<td  width="5%">计划开始时间</td>
	<td  width="5%">计划结束时间</td>
	<td  width="5%">培训讲师</td>
	<td  width="10%">培训场地</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="17%">备注</td>
  </tr>
<%
String pxjhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
String pxjhmc=cf.GB2Uni(request.getParameter("pxjhmc"));
String shbh=cf.GB2Uni(request.getParameter("shbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int row=0;
String pxmxbh=null;
String pxlx=null;
String skxs=null;
String kclx=null;
long pxrs=0;
double pxfy=0;
long gcrs=0;
long zcrs=0;
long jcrs=0;
String pxkssj=null;
String pxjssj=null;
String pxjs=null;
String pxcd=null;
String lrr=null;
String lrsj=null;
String bz=null;

String ys=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT pxmxbh,DECODE(pxlx,'0','内训','1','外训') pxlx,rs_pxskxsbm.skxsmc skxs,rs_pxkclxbm.lxmc kclx,pxrs,pxfy,gcrs,zcrs,jcrs,TO_CHAR(pxkssj,'YYYY-MM-DD') pxkssj,TO_CHAR(pxjssj,'YYYY-MM-DD') pxjssj,pxjs,pxcd,lrr,lrsj,bz  ";
	ls_sql+=" FROM rs_pxjhmx,rs_pxskxsbm,rs_pxkclxbm  ";
    ls_sql+=" where rs_pxjhmx.skxs=rs_pxskxsbm.skxs and rs_pxjhmx.kclx=rs_pxkclxbm.kclx and pxjhbh='"+pxjhbh+"'";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		pxmxbh=rs.getString("pxmxbh");
		pxlx=rs.getString("pxlx");
		skxs=rs.getString("skxs");
		kclx=rs.getString("kclx");
		pxrs=rs.getLong("pxrs");
		pxfy=rs.getDouble("pxfy");
		gcrs=rs.getLong("gcrs");
		zcrs=rs.getLong("zcrs");
		jcrs=rs.getLong("jcrs");
		pxkssj=rs.getString("pxkssj");
		pxjssj=rs.getString("pxjssj");
		pxjs=cf.fillHtml(rs.getString("pxjs"));
		pxcd=cf.fillHtml(rs.getString("pxcd"));
		lrr=rs.getString("lrr");
		lrsj=rs.getString("lrsj");
		bz=cf.fillHtml(rs.getString("bz"));

		row++;

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}
%> 
  <tr align="center" bgcolor="<%=ys%>">
	<td><A HREF="ViewRs_pxjhmx.jsp?pxmxbh=<%=pxmxbh%>&shbh=<%=shbh%>" target="_blank">修改</A></td>
    <td><%=pxmxbh%></td>
	<td><%=pxlx%></td>
    <td><%=skxs%></td>
    <td><%=kclx%></td>
    <td><%=pxrs%></td>
    <td><%=cf.formatDouble(pxfy)%></td>
    <td><%=gcrs%></td>
    <td><%=zcrs%></td>
    <td><%=jcrs%></td>
    <td><%=pxkssj%></td>
    <td><%=pxjssj%></td>
    <td><%=pxjs%></td>
    <td><%=pxcd%></td>
    <td><%=lrr%></td>
    <td><%=lrsj%></td>
    <td><%=bz%></td>
  </tr>
  <%
		}
		rs.close();
		ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e+"<br>");
	out.print("<font color=red>请选择可审核状态!</font>");
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
</table>
</body>
</html>
