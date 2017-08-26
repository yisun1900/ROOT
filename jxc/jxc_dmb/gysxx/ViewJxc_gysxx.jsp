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
String yhdlm=null;
String yhkl=null;
String yhmc=null;
String cwdm=null;
String kdlxtbz=null;
String lxdlsbcs=null;
String mmxgsj=null;
String mmsyzq=null;
String yxdlsbcs=null;
String sfsd=null;
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
	ls_sql="select gysbm,dqmc dqbm,gysmc,gysdz,gysfzr,gysdh,gyscz,email,yhdlm,yhkl,yhmc,cwdm,DECODE(kdlxtbz,'Y','�ɵ�½','N','���ɵ�½') kdlxtbz,lxdlsbcs,mmxgsj,mmsyzq,yxdlsbcs,DECODE(sfsd,'Y','������','N','δ����') sfsd,bz,DECODE(gyslx,'0','����Ʒ������','1','��湩����') gyslx,DECODE(sfhz,'Y','����','N','������') sfhz ";
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
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		kdlxtbz=cf.fillNull(rs.getString("kdlxtbz"));
		lxdlsbcs=cf.fillNull(rs.getString("lxdlsbcs"));
		mmxgsj=cf.fillNull(rs.getDate("mmxgsj"));
		mmsyzq=cf.fillNull(rs.getString("mmsyzq"));
		yxdlsbcs=cf.fillNull(rs.getString("yxdlsbcs"));
		sfsd=cf.fillNull(rs.getString("sfsd"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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
  <td align="right" width="15%"> 
    �û���¼��  </td>
  <td width="35%"> 
    <%=yhdlm%>  </td>
  <td align="right" width="15%"> 
    �û�����  </td>
  <td width="35%"> 
   ********  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �û�����  </td>
  <td width="35%"> 
    <%=yhmc%>  </td>
  <td align="right" width="15%"> 
    �������  </td>
  <td width="35%"> 
    <%=cwdm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �ɵ�½ϵͳ��־  </td>
  <td width="35%"> 
    <%=kdlxtbz%>  </td>
  <td align="right" width="15%"> 
    �Ѿ���½ʧ�ܴ���  </td>
  <td width="35%"> 
    <%=lxdlsbcs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �����޸�ʱ��  </td>
  <td width="35%"> 
    <%=mmxgsj%>  </td>
  <td align="right" width="15%"> 
    ����ʹ������  </td>
  <td width="35%"> 
    <%=mmsyzq%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �����½ʧ�ܴ���  </td>
  <td width="35%"> 
    <%=yxdlsbcs%>  </td>
  <td align="right" width="15%"> 
    �Ƿ�����  </td>
  <td width="35%"> 
    <%=sfsd%>  </td>
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
