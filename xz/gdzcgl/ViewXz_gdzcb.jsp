<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xz_gdzcb_gsbh=null;
String xz_gdzcb_gdzcmc=null;
String xz_gdzcb_bmbh=null;
String xz_gdzcflbm_gdzcflmc=null;
String xz_gdzcb_xh=null;
String xz_gdzcb_pp=null;
String xz_gdzcb_sl=null;
String xz_gdzcb_grsj=null;
String xz_gdzcb_grj=null;
String xz_gdzcb_gzd=null;
String xz_gdzcb_ygbh=null;
String xz_gdzcb_bgr=null;
String sq_dwxx_dwmc=null;
String xz_gdzcb_fgsbh=null;
String xz_gdzcb_sfybf=null;
String xz_gdzcb_lrr=null;
String xz_gdzcb_lrsj=null;
String xz_gdzcb_bz=null;
String yjsj=null;
String pz1=null;
String pz2=null;
String pz3=null;
String pz4=null;
String pz5=null;
String pz6=null;
String wherexz_gdzcb_gsbh=null;
wherexz_gdzcb_gsbh=cf.GB2Uni(request.getParameter("gsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String ssfgsfw="";
try {
	conn=cf.getConnection();
	ls_sql="select pz1,pz2,pz3,pz4,pz5,pz6,yjsj,xz_gdzcb.gsbh as xz_gdzcb_gsbh,xz_gdzcb.gdzcmc as xz_gdzcb_gdzcmc,xz_gdzcb.bmbh as xz_gdzcb_bmbh,xz_gdzcflbm.gdzcflmc as xz_gdzcflbm_gdzcflmc,xz_gdzcb.xh as xz_gdzcb_xh,xz_gdzcb.pp as xz_gdzcb_pp,xz_gdzcb.sl as xz_gdzcb_sl,xz_gdzcb.grsj as xz_gdzcb_grsj,xz_gdzcb.grj as xz_gdzcb_grj,xz_gdzcb.gzd as xz_gdzcb_gzd,xz_gdzcb.ygbh as xz_gdzcb_ygbh,xz_gdzcb.bgr as xz_gdzcb_bgr,sq_dwxx.dwmc as sq_dwxx_dwmc,xz_gdzcb.fgsbh as xz_gdzcb_fgsbh,xz_gdzcb.sfybf as xz_gdzcb_sfybf,xz_gdzcb.lrr as xz_gdzcb_lrr,xz_gdzcb.lrsj as xz_gdzcb_lrsj,xz_gdzcb.bz as xz_gdzcb_bz ";
	ls_sql+=" from  sq_dwxx,xz_gdzcflbm,xz_gdzcb";
	ls_sql+=" where xz_gdzcb.dwbh=sq_dwxx.dwbh and xz_gdzcb.gdzcflbm=xz_gdzcflbm.gdzcflbm and  (xz_gdzcb.gsbh='"+wherexz_gdzcb_gsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yjsj=cf.fillNull(rs.getDate("yjsj"));
		xz_gdzcb_gsbh=cf.fillNull(rs.getString("xz_gdzcb_gsbh"));
		xz_gdzcb_gdzcmc=cf.fillNull(rs.getString("xz_gdzcb_gdzcmc"));
		xz_gdzcb_bmbh=cf.fillNull(rs.getString("xz_gdzcb_bmbh"));
		xz_gdzcflbm_gdzcflmc=cf.fillNull(rs.getString("xz_gdzcflbm_gdzcflmc"));
		xz_gdzcb_xh=cf.fillNull(rs.getString("xz_gdzcb_xh"));
		xz_gdzcb_pp=cf.fillNull(rs.getString("xz_gdzcb_pp"));
		xz_gdzcb_sl=cf.fillNull(rs.getString("xz_gdzcb_sl"));
		xz_gdzcb_grsj=cf.fillNull(rs.getDate("xz_gdzcb_grsj"));
		xz_gdzcb_grj=cf.fillNull(rs.getString("xz_gdzcb_grj"));
		xz_gdzcb_gzd=cf.fillNull(rs.getString("xz_gdzcb_gzd"));
		xz_gdzcb_ygbh=cf.fillNull(rs.getString("xz_gdzcb_ygbh"));
		xz_gdzcb_bgr=cf.fillNull(rs.getString("xz_gdzcb_bgr"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		xz_gdzcb_fgsbh=cf.fillNull(rs.getString("xz_gdzcb_fgsbh"));
		xz_gdzcb_sfybf=cf.fillNull(rs.getString("xz_gdzcb_sfybf"));
		xz_gdzcb_lrr=cf.fillNull(rs.getString("xz_gdzcb_lrr"));
		xz_gdzcb_lrsj=cf.fillNull(rs.getDate("xz_gdzcb_lrsj"));
		xz_gdzcb_bz=cf.fillNull(rs.getString("xz_gdzcb_bz"));
		pz1=cf.fillNull(rs.getString("pz1"));
		pz2=cf.fillNull(rs.getString("pz2"));
		pz3=cf.fillNull(rs.getString("pz3"));
		pz4=cf.fillNull(rs.getString("pz4"));
		pz5=cf.fillNull(rs.getString("pz5"));
		pz6=cf.fillNull(rs.getString("pz6"));
	}
	rs.close();
	ps.close();

	String ls="";
	ls_sql="select dwmc";
	ls_sql+=" from xz_gdzcssfw,sq_dwxx";
	ls_sql+=" where xz_gdzcssfw.fgsbh=sq_dwxx.dwbh and gsbh='"+wherexz_gdzcb_gsbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		ls=rs.getString("dwmc");
		ssfgsfw+=ls+"��";
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
<div align="center"> �̶��ʲ���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> �̶��ʲ����</td>
    <td width="29%"> <%=xz_gdzcb_gsbh%> </td>
    <td align="right" width="19%"> �̶��ʲ����� </td>
    <td width="31%"> <%=xz_gdzcb_gdzcmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> �����ڲ���� </td>
    <td width="29%"> <%=xz_gdzcb_bmbh%> </td>
    <td align="right" width="19%"> �̶��ʲ����� </td>
    <td width="31%"> <%=xz_gdzcflbm_gdzcflmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> �ͺ� </td>
    <td width="29%"> <%=xz_gdzcb_xh%> </td>
    <td align="right" width="19%"> Ʒ�� </td>
    <td width="31%"> <%=xz_gdzcb_pp%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">����(CPU)</td>
    <td width="29%"><%=pz1%> </td>
    <td width="19%" align="right">����(�ڴ�)</td>
    <td width="31%"><%=pz2%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">����(Ӳ��)</td>
    <td width="29%"><%=pz3%> </td>
    <td width="19%" align="right">����(����)</td>
    <td width="31%"><%=pz4%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">����(�Կ�)</td>
    <td width="29%"><%=pz5%> </td>
    <td width="19%" align="right">����(��ʾ��)</td>
    <td width="31%"><%=pz6%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> ���� </td>
    <td width="29%"> <%=xz_gdzcb_sl%> </td>
    <td align="right" width="19%"> ����ʱ�� </td>
    <td width="31%"> <%=xz_gdzcb_grsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> ����� </td>
    <td width="29%"> <%=xz_gdzcb_grj%> </td>
    <td align="right" width="19%"> ���õ� </td>
    <td width="31%"> <%=xz_gdzcb_gzd%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%"> ��ǰ���ܲ��� </td>
    <td width="29%"> <%=sq_dwxx_dwmc%> </td>
    <td align="right" width="19%"> ��ǰ���ֹܷ�˾ </td>
    <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+xz_gdzcb_fgsbh+"'",xz_gdzcb_fgsbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%">������ </td>
    <td width="29%"><%=xz_gdzcb_bgr%> </td>
    <td align="right" width="19%">�ƽ�������ʱ�� </td>
    <td width="31%"><%=yjsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%">¼����</td>
    <td width="29%"><%=xz_gdzcb_lrr%></td>
    <td align="right" width="19%">¼��ʱ��</td>
    <td width="31%"><%=xz_gdzcb_lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%">�Ƿ��ѱ���</td>
    <td width="29%"><%
	cf.radioToken(out, "Y+��&N+��",xz_gdzcb_sfybf,true);
%></td>
    <td align="right" width="19%">&nbsp;</td>
    <td width="31%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%">�ʲ������ֹ�˾</td>
    <td colspan="3"><%=ssfgsfw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="21%">��ע</td>
    <td colspan="3"><%=xz_gdzcb_bz%> </td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">�ƽ�����������</td>
	<td  width="6%">�ƽ���</td>
	<td  width="7%">�ƽ�ʱ��</td>
	<td  width="10%">��������������</td>
	<td  width="6%">������</td>
	<td  width="6%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="11%">¼�벿��</td>
	<td  width="20%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT b.dwmc yjrssbm,xz_gdzcyjjl.yjr,xz_gdzcyjjl.yjsj,c.dwmc jsrssbm,xz_gdzcyjjl.jsr,xz_gdzcyjjl.lrr,xz_gdzcyjjl.lrsj,a.dwmc lrbm,xz_gdzcyjjl.bz  ";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b,sq_dwxx c,xz_gdzcyjjl  ";
    ls_sql+=" where xz_gdzcyjjl.lrbm=a.dwbh and xz_gdzcyjjl.yjrssbm=b.dwbh and xz_gdzcyjjl.jsrssbm=c.dwbh";
    ls_sql+=" and xz_gdzcyjjl.gsbh='"+wherexz_gdzcb_gsbh+"'";
    ls_sql+=" order by xz_gdzcyjjl.yjsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>
</body>
</html>
