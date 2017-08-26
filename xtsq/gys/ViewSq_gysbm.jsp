<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sq_gysbm_gysbm=null;
String sq_gysbm_gys=null;
String dm_dqbm_dqmc=null;
String sq_gysbm_gyslb=null;
String jdm_zcdlbm_zcdlmc=null;
String sq_gysbm_gysdz=null;
String sq_gysbm_gysfzr=null;
String sq_gysbm_gysdh=null;
String sq_gysbm_gyscz=null;
String sq_gysbm_email=null;
String sq_gysbm_cxbz=null;
String sq_gysbm_bz=null;
String yhdlm=null;
String yhkl=null;
String yhmc=null;

String yhzmc="";

String gysbm=request.getParameter("gysbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select yhdlm,yhkl,yhmc,sq_gysbm.gysbm as sq_gysbm_gysbm,sq_gysbm.gys as sq_gysbm_gys,dm_dqbm.dqmc as dm_dqbm_dqmc,sq_gysbm.gysdz as sq_gysbm_gysdz,sq_gysbm.gysfzr as sq_gysbm_gysfzr,sq_gysbm.gysdh as sq_gysbm_gysdh,sq_gysbm.gyscz as sq_gysbm_gyscz,sq_gysbm.email as sq_gysbm_email,sq_gysbm.bz as sq_gysbm_bz ";
	ls_sql+=" from  dm_dqbm,sq_gysbm";
	ls_sql+=" where sq_gysbm.dqbm=dm_dqbm.dqbm";
	ls_sql+=" and  sq_gysbm.gysbm='"+gysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		sq_gysbm_gysbm=cf.fillNull(rs.getString("sq_gysbm_gysbm"));
		sq_gysbm_gys=cf.fillNull(rs.getString("sq_gysbm_gys"));
		dm_dqbm_dqmc=cf.fillNull(rs.getString("dm_dqbm_dqmc"));
		sq_gysbm_gysdz=cf.fillNull(rs.getString("sq_gysbm_gysdz"));
		sq_gysbm_gysfzr=cf.fillNull(rs.getString("sq_gysbm_gysfzr"));
		sq_gysbm_gysdh=cf.fillNull(rs.getString("sq_gysbm_gysdh"));
		sq_gysbm_gyscz=cf.fillNull(rs.getString("sq_gysbm_gyscz"));
		sq_gysbm_email=cf.fillNull(rs.getString("sq_gysbm_email"));
		sq_gysbm_bz=cf.fillNull(rs.getString("sq_gysbm_bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select yhzmc ";
	ls_sql+=" from  sq_yhssz,sq_yhz";
	ls_sql+=" where sq_yhssz.yhdlm='"+yhdlm+"' and sq_yhssz.yhzbh =sq_yhz.yhzbh(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yhzmc+=cf.fillNull(rs.getString("yhzmc"))+"��";
	}
	rs.close();
	ps.close();
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

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��Ӧ����Ϣ </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="21%"> 
      <div align="right">��Ӧ�̱��</div>
    </td>
    <td width="29%"> <%=sq_gysbm_gysbm%> </td>
    <td width="21%"> 
      <div align="right">��Ӧ������</div>
    </td>
    <td width="29%"> <%=sq_gysbm_gys%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%"> 
      <div align="right">��������</div>
    </td>
    <td width="29%"> <%=dm_dqbm_dqmc%> </td>
    <td width="21%"> 
      <div align="right">��Ӧ�̵绰</div>
    </td>
    <td width="29%"><%=sq_gysbm_gysdh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">��Ӧ�̵�ַ</td>
    <td colspan="3"><%=sq_gysbm_gysdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%"> 
      <div align="right">��Ӧ�̴���</div>
    </td>
    <td width="29%"> <%=sq_gysbm_gyscz%> </td>
    <td width="21%"> 
      <div align="right">EMail</div>
    </td>
    <td width="29%"> <%=sq_gysbm_email%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">�û���¼��</td>
    <td width="29%"><%=yhdlm%></td>
    <td width="21%" align="right">�û�����</td>
    <td width="29%"><%=cf.makejm(yhkl)%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%"> 
      <div align="right">�û�����</div>
    </td>
    <td width="29%"><%=yhmc%> </td>
    <td width="21%"> 
      <div align="right">��Ӧ�̸�����</div>
    </td>
    <td width="29%"><%=sq_gysbm_gysfzr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">�û�������</td>
    <td colspan="3"><%=yhzmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">��ע</td>
    <td colspan="3"><%=sq_gysbm_bz%></td>
  </tr>
</table>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">��ϵ������</td>
	<td  width="10%">ְ��</td>
	<td  width="14%">�ֻ�</td>
	<td  width="22%">�칫�绰</td>
	<td  width="12%">����</td>
	<td  width="8%">�Ƿ���ְ</td>
	<td  width="18%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT sq_gyslxr.lxrxm as lxrxm,sq_gyslxr.zw as sq_gyslxr_zw,sq_gyslxr.sj as sq_gyslxr_sj,sq_gyslxr.bgdh as sq_gyslxr_bgdh,sq_gyslxr.cz as sq_gyslxr_cz, DECODE(sq_gyslxr.sflz,'Y','��','N','��') as sq_gyslxr_sflz,sq_gyslxr.bz as sq_gyslxr_bz  ";
	ls_sql+=" FROM sq_gyslxr  ";
    ls_sql+=" where sq_gyslxr.gysbm='"+gysbm+"'";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">Ʒ�ƹ�Ӧ�̱��</td>
	<td  width="20%">Ʒ�ƹ�Ӧ������</td>
	<td  width="6%">ÿ�հ�װ��������</td>
	<td  width="7%">��Ӧ�����</td>
	<td  width="11%">�������</td>
	<td  width="5%">Ʒ�Ʊ���</td>
	<td  width="15%">Ʒ������</td>
	<td  width="6%">��������</td>
	<td  width="24%">��ע</td>
</tr>
<%
	ls_sql="SELECT sq_gysxx.gysbh,sq_gysxx.gysmc,mrazhs,DECODE(sq_gysxx.gyslb,'1','ľ��','2','����','3','�Ҿ�','4','����') gyslb,zclb,sq_gysxx.ppbm,sq_gysxx.ppmc,dm_dqbm.dqmc, sq_gysxx.bz  ";
	ls_sql+=" FROM dm_dqbm,sq_gysxx  ";
    ls_sql+=" where sq_gysxx.dqbm=dm_dqbm.dqbm and sq_gysxx.gysbm='"+gysbm+"'";
	ls_sql+=" order by sq_gysxx.dqbm,sq_gysxx.gyslb,sq_gysxx.zclb";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();


%>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="50%">��Ӧ�̱��</td>
	<td  width="50%">�����ֹ�˾</td>
</tr>
<%
	ls_sql="SELECT sq_gyssqfgs.gysbm,dwmc";
	ls_sql+=" FROM sq_gyssqfgs,sq_dwxx  ";
    ls_sql+=" where sq_gyssqfgs.ssfgs=sq_dwxx.dwbh and sq_gyssqfgs.gysbm='"+gysbm+"'";
	ls_sql+=" order by sq_gyssqfgs.ssfgs";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();


%>
</table>

</body>
</html>
