<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jzssk=null;
String cxhddj=null;
String jrhdje=null;
String ybkje=null;
String yfkje=null;
String lrr=null;
String lrsj=null;
String bz=null;
String blr=null;
String blsj=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));


String khxm=null;
String hth=null;
String lxfs=null;
String qtdh=null;
String sjs=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jzssk,cxhddj,jrhdje,ybkje,yfkje,lrr,lrsj,bz,blr,blsj ";
	ls_sql+=" from  cw_jcfkd";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jzssk=cf.fillNull(rs.getString("jzssk"));
		cxhddj=cf.fillNull(rs.getString("cxhddj"));
		jrhdje=cf.fillNull(rs.getString("jrhdje"));
		ybkje=cf.fillNull(rs.getString("ybkje"));
		yfkje=cf.fillNull(rs.getString("yfkje"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		blr=cf.fillNull(rs.getString("blr"));
		blsj=cf.fillNull(rs.getDate("blsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,hth,lxfs,qtdh,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		hth=cf.fillNull(rs.getString("hth"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		sjs=cf.fillNull(rs.getString("sjs"));
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
<title>���ɼҾ��Żݻ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<table width="90%" border="0" style="FONT-SIZE:16" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="41%"><span lang=EN-US><img src="/images/tubiao.jpg" v:shapes="_x0000_i1025"></span></td>
    <td width="59%"><span class="STYLE1">���ɼҾ��Żݻ���</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>�������ڣ�<%=blsj%></td>
    <td align="right"> ��һʽ���ݣ�</td>
  </tr>
</table>

<table width="90%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr align="center" bgcolor="#FFFFFF">
    <td height="30"><strong>�ͻ�����</strong></td>
    <td width="16%"><%=khxm%></td>
    <td width="14%"><strong>��ͬ��</strong></td>
    <td width="18%"><%=hth%></td>
    <td><strong>��װ���ʦ</strong></td>
    <td><%=sjs%></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF">
    <td><strong>��ϵ�绰</strong></td>
    <td colspan="3"><%=lxfs%>��<%=qtdh%></td>
    <td><p align="center"><strong>�����<BR>������</strong></td>
    <td><%=cxhddj%></td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="18%" height="30"><strong>��װʵ�տ�</strong></td> 
  <td colspan="3"><%=jzssk%> </td>
  <td width="16%"><strong>������ǩ��</strong></td> 
  <td width="18%">&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="18%"><strong>���ɼҾӿɼ���<BR>����</strong></td> 
  <td colspan="3"><%=jrhdje%>  </td>
  <td><strong>������ǩ��</strong></td>
  <td>&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FFFFFF">
  <td height="30"><strong>Ӧ�����ۣ���</strong></td>
  <td colspan="3"><%=ybkje%></td>
  <td><strong>�����ǩ��</strong></td>
  <td>&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="18%" rowspan="2"><p align="center"><strong>����Ӧ����<BR>����д��</strong></td>
  <td colspan="3"><%=yfkje%></td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr align="center" bgcolor="#FFFFFF">
  <td colspan="3"><%=yfkje%> </td>
  <td><strong>������ǩ��</strong></td>
  <td>&nbsp;</td>
</tr>


<tr align="center" bgcolor="#FFFFFF">
  <td width="18%" align="center" valign="middle">
    &nbsp;<BR>
    <strong>��ע</strong><BR>
    &nbsp;
    </td> 
  <td colspan="5" align="left"><%=bz%>  </td>
  </tr>
</table>
<BR>
<table width="90%" border="0" style="FONT-SIZE:16" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="25%">�ܾ���</td>
    <td width="25%">������</td>
    <td width="25%">¼���ˣ�<%=lrr%></td>
    <td width="25%">����ˣ�</td>
  </tr>
</table>

</body>
</html>

