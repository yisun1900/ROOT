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
int zjrs=0;

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


	ls_sql="select count(*) ";
	ls_sql+=" from  cw_jrzjyjkh";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjrs=rs.getInt(1);
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#FFFFFF">

<center>�ͻ�����ҵ�����ˣ�����:<%=khqssj%>��<%=khjzsj%>��</center>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="28%" height="28" align="center"><strong>ְ��</strong></td>
  <td width="32%" align="center"><strong>���������ʼ��</strong></td>
  <td width="40%" align="center"><strong>�ѳ�ʼ������</strong></td>
  </tr>
<tr bgcolor="#FFFFFF" height="28">
  <td align="center">�ͻ�����</td>
  <td align="center"><A HREF="ChooseYhmc.jsp?fgsbh=<%=fgsbh%>&khzq=<%=khzq%>&zwbm=05" target="_balnk">��ʼ��</A></td>
  <td width="40%" align="center"><%=zjrs%></td>
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


