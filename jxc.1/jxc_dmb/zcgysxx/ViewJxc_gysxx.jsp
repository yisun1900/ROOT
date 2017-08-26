<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gysbm=null;
String dqbm=null;
String gysmc=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String cwdm=null;
String bz=null;
String gyslx=null;
String sfhz=null;
String wheregysbm=null;
wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select gysbm,dqmc dqbm,gysmc,gysdz,gysfzr,gysdh,gyscz,email,cwdm,bz,DECODE(gyslx,'0','����Ʒ������','1','��湩����') gyslx,DECODE(sfhz,'Y','����','N','������') sfhz ";
	ls_sql+=" from  jxc_gysxx,dm_dqbm ";
	ls_sql+=" where jxc_gysxx.dqbm=dm_dqbm.dqbm and  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfhz=cf.fillNull(rs.getString("sfhz"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		gysdz=cf.fillNull(rs.getString("gysdz"));
		gysfzr=cf.fillNull(rs.getString("gysfzr"));
		gysdh=cf.fillNull(rs.getString("gysdh"));
		gyscz=cf.fillNull(rs.getString("gyscz"));
		email=cf.fillNull(rs.getString("email"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		bz=cf.fillNull(rs.getString("bz"));
		gyslx=cf.fillNull(rs.getString("gyslx"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��Ӧ�̱���<%=gysbm%></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">��Ӧ������</td>
  <td colspan="3"><%=gysmc%>&nbsp;&nbsp;[<%=sfhz%>]</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������� </td>
  <td width="35%"><%=dqbm%></td>
  <td align="right" width="15%">��Ӧ������</td>
  <td width="35%"><%=gyslx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ӧ�̵�ַ</td>
  <td colspan="3"><%=gysdz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��Ӧ�̸�����  </td>
  <td width="35%"> 
    <%=gysfzr%>  </td>
  <td align="right" width="15%"> 
    ��Ӧ�̵绰  </td>
  <td width="35%"> 
    <%=gysdh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��Ӧ�̴���  </td>
  <td width="35%"> 
    <%=gyscz%>  </td>
  <td align="right" width="15%"> 
    EMail  </td>
  <td width="35%"> 
    <%=email%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">&nbsp;</td>
  <td width="35%">&nbsp;</td>
  <td align="right" width="15%"> 
    �������  </td>
  <td width="35%"> 
    <%=cwdm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ע  </td>
  <td  colspan="3" > 
    <%=bz%>  </td>
</tr>
</table>
</body>
</html>
