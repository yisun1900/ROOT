<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
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

//�곤��ҵ��Ա�����ʦ������Ա���ͻ�����С�����ܡ�С���鳤��С��רԱ������Ӫ�����ܡ���վ�ƹ�Ա
int dzrs=0;
int ywyrs=0;
int clyrs=0;
int zjrs=0;
int xqzgrs=0;
int xqzzrs=0;
int xqzyrs=0;
int wlyxzgrs=0;
int wztgyrs=0;

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

//�곤��ҵ��Ա�����ʦ������Ա���ͻ�����С�����ܡ�С���鳤��С��רԱ������Ӫ�����ܡ���վ�ƹ�Ա
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
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"' and zw='46'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wztgyrs=rs.getInt(1);
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#FFFFFF">

<center>ҵ�����ˣ�����:<%=khqssj%>��<%=khjzsj%>��</center>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="28%" height="28" align="center"><strong>ְ��</strong></td>
  <td width="32%" align="center"><strong>���������ʼ��</strong></td>
  <td width="40%" align="center"><strong>�ѳ�ʼ������</strong></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">�곤</td>
  <td align="center"><A HREF="ChooseYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=41" target="_balnk">��ʼ��</A></td>
  <td width="40%" align="center"><%=dzrs%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">����ҵ��</td>
  <td align="center"><A HREF="ChooseYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=03" target="_balnk">��ʼ��</A></td>
  <td width="40%" align="center"><%=ywyrs%></td>
  </tr>

<tr bgcolor="#FFFFFF" height="28">
  <td align="center">����Ա</td>
  <td align="center"><A HREF="ChooseYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=08" target="_balnk">��ʼ��</A></td>
  <td align="center"><%=clyrs%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">С������</td>
  <td align="center"><A HREF="ChooseYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=42" target="_balnk">��ʼ��</A></td>
  <td align="center"><%=xqzgrs%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">С���鳤</td>
  <td align="center"><A HREF="ChooseYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=43" target="_balnk">��ʼ��</A></td>
  <td align="center"><%=xqzzrs%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">С��רԱ</td>
  <td align="center"><A HREF="ChooseYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=44" target="_balnk">��ʼ��</A></td>
  <td align="center"><%=xqzyrs%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">����Ӫ������</td>
  <td align="center"><A HREF="ChooseYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=45" target="_balnk">��ʼ��</A></td>
  <td align="center"><%=wlyxzgrs%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">��վ�ƹ�Ա</td>
  <td align="center"><A HREF="ChooseYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=46" target="_balnk">��ʼ��</A></td>
  <td align="center"><%=wztgyrs%></td>
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


