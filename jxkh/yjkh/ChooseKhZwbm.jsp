<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String khzq=cf.GB2Uni(request.getParameter("khzq"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khqssj=null;
String khjzsj=null;

//店长、业务员、设计师、材料员、客户经理、小区主管、小区组长、小区专员、网络营销主管、网站推广员
int dzrs=0;
int ywyrs=0;
int clyrs=0;
int zjrs=0;
int xqzgrs=0;
int xqzzrs=0;
int xqzyrs=0;
int wlyxzgrs=0;
int wztgyrs=0;

int dzrsKh=0;
int ywyrsKh=0;
int clyrsKh=0;
int zjrsKh=0;
int xqzgrsKh=0;
int xqzzrsKh=0;
int xqzyrsKh=0;
int wlyxzgrsKh=0;
int wztgyrsKh=0;

try {
	conn=cf.getConnection();

	ls_sql="select khqssj,khjzsj ";
	ls_sql+=" from  cw_jrkhzq";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khqssj=cf.fillNull(rs.getDate("khqssj"));
		khjzsj=cf.fillNull(rs.getDate("khjzsj"));
	}
	rs.close();
	ps.close();

//店长、业务员、设计师、材料员、客户经理、小区主管、小区组长、小区专员、网络营销主管、网站推广员
	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='41'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dzrs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='41' and sfkh='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dzrsKh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='03'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ywyrs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='03' and sfkh='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ywyrsKh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='08'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clyrs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='08' and sfkh='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clyrsKh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjrs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='05' and sfkh='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjrsKh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='42'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqzgrs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='42' and sfkh='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqzgrsKh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='43'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqzzrs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='43' and sfkh='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqzzrsKh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='44'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqzyrs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='44' and sfkh='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqzyrsKh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='45'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wlyxzgrs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='45' and sfkh='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wlyxzgrsKh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='46'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wztgyrs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='46' and sfkh='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wztgyrsKh=rs.getInt(1);
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#FFFFFF">

<center>业绩考核（周期:<%=khqssj%>到<%=khjzsj%>）</center>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="25%" height="28" align="center"><strong>职务</strong></td>
  <td width="25%" align="center"><strong>考核任务初始化</strong></td>
  <td width="25%" align="center"><strong>已初始化人数</strong></td>
  <td width="25%" align="center"><strong>考核人数</strong></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">店长</td>
  <td align="center"><A HREF="ChooseKhDzYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=41" target="_balnk">考核</A></td>
  <td width="25%" align="center"><%=dzrs%></td>
  <td width="25%" align="center"><%=dzrsKh%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">店面业务</td>
  <td align="center"><A HREF="ChooseKhYwyYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=03" target="_balnk">考核</A></td>
  <td width="25%" align="center"><%=ywyrs%></td>
  <td width="25%" align="center"><%=ywyrsKh%></td>
  </tr>

<tr bgcolor="#FFFFFF" height="28">
  <td align="center">材料员</td>
  <td align="center"><A HREF="ChooseKhClyYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=08" target="_balnk">考核</A></td>
  <td align="center"><%=clyrs%></td>
  <td align="center"><%=clyrsKh%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">小区主管</td>
  <td align="center"><A HREF="ChooseKhXqzgYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=42" target="_balnk">考核</A></td>
  <td align="center"><%=xqzgrs%></td>
  <td align="center"><%=xqzgrsKh%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">小区组长</td>
  <td align="center"><A HREF="ChooseKhXqzzYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=43" target="_balnk">考核</A></td>
  <td align="center"><%=xqzzrs%></td>
  <td align="center"><%=xqzzrsKh%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">小区专员</td>
  <td align="center"><A HREF="ChooseKhXqzyYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=44" target="_balnk">考核</A></td>
  <td align="center"><%=xqzyrs%></td>
  <td align="center"><%=xqzyrsKh%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">网络营销主管</td>
  <td align="center"><A HREF="ChooseKhYxzgYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=45" target="_balnk">考核</A></td>
  <td align="center"><%=wlyxzgrs%></td>
  <td align="center"><%=wlyxzgrsKh%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">网站推广员</td>
  <td align="center"><A HREF="ChooseKhTgyYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=46" target="_balnk">考核</A></td>
  <td align="center"><%=wztgyrs%></td>
  <td align="center"><%=wztgyrsKh%></td>
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


