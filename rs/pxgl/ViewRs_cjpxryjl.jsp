<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String pxjhbh=null;
String yhmc=null;
String bianhao=null;
String ccbm=null;
String kclx=null;
String pxkssj=null;
String pxjssj=null;
String sfhg=null;
String pxcj=null;
String pxfy=null;
String pxjs=null;
String pxcd=null;
String skxs=null;
String pxkc=null;
String kcnr=null;
String sfqdxy=null;
String pxzs=null;
String lrr=null;
String lrsj=null;
String bz=null;
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="SELECT xh,pxjhbh,yhmc,bianhao,rs_pxryccbm.ccmc ccmc,rs_pxkclxbm.lxmc lxmc,pxkssj,pxjssj,DECODE(sfhg,'0','�ϸ�','1','���ϸ�') sfhg,pxcj,pxfy,pxjs,pxcd,rs_pxskxsbm.skxsmc skxsmc,DECODE(sfqdxy,'0','��ǩ��','1','δǩ��') sfqdxy,pxzs,lrr,lrsj,kcnr,pxkc,bz  ";
	ls_sql+=" FROM rs_cjpxryjl,rs_pxryccbm,rs_pxkclxbm,rs_pxskxsbm  ";
    ls_sql+=" where rs_cjpxryjl.ccbm=rs_pxryccbm.ccbm and rs_cjpxryjl.kclx=rs_pxkclxbm.kclx and rs_pxskxsbm.skxs=rs_cjpxryjl.skxs and  (xh="+wherexh+")";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		pxjhbh=cf.fillNull(rs.getString("pxjhbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		ccbm=cf.fillNull(rs.getString("ccmc"));
		kclx=cf.fillNull(rs.getString("lxmc"));
		pxkssj=cf.fillNull(rs.getDate("pxkssj"));
		pxjssj=cf.fillNull(rs.getDate("pxjssj"));
		sfhg=cf.fillNull(rs.getString("sfhg"));
		pxcj=cf.fillNull(rs.getString("pxcj"));
		pxfy=cf.fillNull(rs.getString("pxfy"));
		pxjs=cf.fillNull(rs.getString("pxjs"));
		pxcd=cf.fillNull(rs.getString("pxcd"));
		skxs=cf.fillNull(rs.getString("skxsmc"));
		pxkc=cf.fillNull(rs.getString("pxkc"));
		kcnr=cf.fillNull(rs.getString("kcnr"));
		sfqdxy=cf.fillNull(rs.getString("sfqdxy"));
		pxzs=cf.fillNull(rs.getString("pxzs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<div align="center"> �鿴��Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ���
  </td>
  <td width="35%"> 
    <%=xh%>
  </td>
  <td align="right" width="15%"> 
    ��ѵ�ƻ����
  </td>
  <td width="35%"> 
    <%=pxjhbh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    Ա������
  </td>
  <td width="35%"> 
    <%=yhmc%>
  </td>
  <td align="right" width="15%"> 
    Ա�����
  </td>
  <td width="35%"> 
    <%=bianhao%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ѵ��ʼʱ��
  </td>
  <td width="35%"> 
    <%=pxkssj%>
  </td>
  <td align="right" width="15%"> 
    ��ѵ����ʱ��
  </td>
  <td width="35%"> 
    <%=pxjssj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �Ƿ�ϸ�
  </td>
  <td width="35%"> 
<%=sfhg%>
  </td>
  <td align="right" width="15%"> 
    ��ѵ�ɼ�
  </td>
  <td width="35%"> 
    <%=pxcj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ѵ����
  </td>
  <td width="35%"> 
    <%=pxfy%>
  </td>
  <td align="right" width="15%"> 
    ��ѵ��ʦ
  </td>
  <td width="35%"> 
    <%=pxjs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ѵ����
  </td>
  <td width="35%"> 
    <%=pxcd%>
  </td>
  <td align="right" width="15%"> 
    ��ѵ֤��
  </td>
  <td width="35%"> 
    <%=pxzs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �ڿ���ʽ
  </td>
  <td width="35%"> 
<%=skxs%>
  </td>
  <td align="right" width="15%"> 
    ��α���
  </td>
  <td width="35%"> 
<%=ccbm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �Ƿ�ǩ��Э��
  </td>
  <td width="35%"> 
<%=sfqdxy%>
  </td>
  <td align="right" width="15%"> 
    �γ�����
  </td>
  <td width="35%"> 
<%=kclx%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ¼����
  </td>
  <td width="35%"> 
    <%=lrr%>
  </td>
  <td align="right" width="15%"> 
    ¼��ʱ��
  </td>
  <td width="35%"> 
    <%=lrsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ѵ�γ�
  </td>
  <td width="35%" colspan="3"> 
    <%=pxkc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �γ�����
  </td>
  <td width="35%" colspan="3"> 
    <%=kcnr%>
  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ע
  </td>
  <td width="35%" colspan="3"> 
    <%=bz%>
  </td>
</tr>
</table>
</body>
</html>
