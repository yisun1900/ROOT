<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String rs_yggzjl_xh=null;
String rs_yggzjl_fxrq=null;
String rs_yggzjl_ssfgs=null;
String rs_yggzjl_ksrq=null;
String rs_yggzjl_zzrq=null;
String rs_yggzjl_lrr=null;
String rs_yggzjl_lrsj=null;
String sq_dwxx_dwmc=null;
String rs_yggzjl_bz=null;
String wherers_yggzjl_xh=null;
wherers_yggzjl_xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select rs_yggzjl.xh as rs_yggzjl_xh,rs_yggzjl.fxrq as rs_yggzjl_fxrq,rs_yggzjl.ssfgs as rs_yggzjl_ssfgs,rs_yggzjl.ksrq as rs_yggzjl_ksrq,rs_yggzjl.zzrq as rs_yggzjl_zzrq,rs_yggzjl.lrr as rs_yggzjl_lrr,rs_yggzjl.lrsj as rs_yggzjl_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,rs_yggzjl.bz as rs_yggzjl_bz ";
	ls_sql+=" from  sq_dwxx,rs_yggzjl";
	ls_sql+=" where rs_yggzjl.lrbm=sq_dwxx.dwbh and  (rs_yggzjl.xh='"+wherers_yggzjl_xh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rs_yggzjl_xh=cf.fillNull(rs.getString("rs_yggzjl_xh"));
		rs_yggzjl_fxrq=cf.fillNull(rs.getDate("rs_yggzjl_fxrq"));
		rs_yggzjl_ssfgs=cf.fillNull(rs.getString("rs_yggzjl_ssfgs"));
		rs_yggzjl_ksrq=cf.fillNull(rs.getDate("rs_yggzjl_ksrq"));
		rs_yggzjl_zzrq=cf.fillNull(rs.getDate("rs_yggzjl_zzrq"));
		rs_yggzjl_lrr=cf.fillNull(rs.getString("rs_yggzjl_lrr"));
		rs_yggzjl_lrsj=cf.fillNull(rs.getDate("rs_yggzjl_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		rs_yggzjl_bz=cf.fillNull(rs.getString("rs_yggzjl_bz"));
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
<div align="center">Ա������ </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">���</div>
    </td>
    <td width="35%"> <%=rs_yggzjl_xh%> </td>
    <td width="15%"> 
      <div align="right">¼�벿��</div>
    </td>
    <td width="35%"><%=sq_dwxx_dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">��н��˾</div>
    </td>
    <td width="35%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh",rs_yggzjl_ssfgs,true);
%> </td>
    <td width="15%"> 
      <div align="right">��н����</div>
    </td>
    <td width="35%"><%=rs_yggzjl_fxrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">���ʿ�ʼ����</td>
    <td width="35%"><%=rs_yggzjl_ksrq%></td>
    <td width="15%" align="right">������ֹ����</td>
    <td width="35%"><%=rs_yggzjl_zzrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">¼��ʱ��</div>
    </td>
    <td width="35%"><%=rs_yggzjl_lrsj%> </td>
    <td width="15%"> 
      <div align="right">¼����</div>
    </td>
    <td width="35%"> <%=rs_yggzjl_lrr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">��ע</td>
    <td colspan="3"><%=rs_yggzjl_bz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">��������</td>
	<td  width="5%">����</td>
	<td  width="5%">Ա������</td>
	<td  width="3%">��������</td>
	<td  width="5%">���乤��</td>
	<td  width="5%">��λ����</td>
	<td  width="5%">��н</td>
	<td  width="5%">��ͨ����</td>
	<td  width="4%">�Ͳ�</td>
	<td  width="4%">�绰��</td>
	<td  width="4%">�۱���</td>
	<td  width="5%">����</td>
	<td  width="5%">��������</td>
	<td  width="5%">�����ۿ�</td>
	<td  width="5%">���</td>
	<td  width="5%">˰ǰ����</td>
	<td  width="5%">��˰��</td>
	<td  width="5%">˰����</td>
	<td  width="12%">��ע</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT dwmc,bianhao,yhmc,cqts,glgz,gwgz,jbgz,jtbt,cb,dhbt,yjsxe,jj,qtbt,qtkk,tc,sqgz,ksk,shgz,rs_yggzb.bz";
	ls_sql+=" FROM rs_yggzb,sq_dwxx  ";
    ls_sql+=" where rs_yggzb.dwbh=sq_dwxx.dwbh and xh='"+wherers_yggzjl_xh+"'";
    ls_sql+=" order by rs_yggzb.dwbh,yhmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(20000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
	pageObj.printSum();

%>
</table>

</body>
</html>
