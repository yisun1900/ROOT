<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ybj_ybjsb_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_qyrq=null;
String crm_khxx_kgrq=null;
String crm_khxx_sjkgrq=null;
String crm_khxx_jgrq=null;
String crm_khxx_sjjgrq=null;
String crm_khxx_dwbh=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String ybj_ybjsb_dwbh=null;
String sq_dwxx_dwmc=null;
String ybj_ybjsb_sbr=null;
String ybj_ybjsb_sbsj=null;
String ybj_ybjsb_shr=null;
String ybj_ybjsb_shsj=null;
String ybj_ybjsb_shjl=null;
String ybj_ybjsb_shsm=null;
String ybj_ybjsb_clzt=null;
String ybj_ybjsb_bz=null;
String whereybj_ybjsb_khbh=null;
whereybj_ybjsb_khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select ybj_ybjsb.khbh as ybj_ybjsb_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.sjkgrq as crm_khxx_sjkgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sjjgrq as crm_khxx_sjjgrq,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,ybj_ybjsb.dwbh as ybj_ybjsb_dwbh,sq_dwxx.dwmc as sq_dwxx_dwmc,ybj_ybjsb.sbr as ybj_ybjsb_sbr,ybj_ybjsb.sbsj as ybj_ybjsb_sbsj,ybj_ybjsb.shr as ybj_ybjsb_shr,ybj_ybjsb.shsj as ybj_ybjsb_shsj,ybj_ybjsb.shjl as ybj_ybjsb_shjl,ybj_ybjsb.shsm as ybj_ybjsb_shsm,ybj_ybjsb.clzt as ybj_ybjsb_clzt,ybj_ybjsb.bz as ybj_ybjsb_bz ";
	ls_sql+=" from  crm_khxx,sq_dwxx,ybj_ybjsb";
	ls_sql+=" where ybj_ybjsb.khbh=crm_khxx.khbh and ybj_ybjsb.dwbh=sq_dwxx.dwbh and  (ybj_ybjsb.khbh='"+whereybj_ybjsb_khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ybj_ybjsb_khbh=cf.fillNull(rs.getString("ybj_ybjsb_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_kgrq=cf.fillNull(rs.getDate("crm_khxx_kgrq"));
		crm_khxx_sjkgrq=cf.fillNull(rs.getDate("crm_khxx_sjkgrq"));
		crm_khxx_jgrq=cf.fillNull(rs.getDate("crm_khxx_jgrq"));
		crm_khxx_sjjgrq=cf.fillNull(rs.getDate("crm_khxx_sjjgrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		ybj_ybjsb_dwbh=cf.fillNull(rs.getString("ybj_ybjsb_dwbh"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		ybj_ybjsb_sbr=cf.fillNull(rs.getString("ybj_ybjsb_sbr"));
		ybj_ybjsb_sbsj=cf.fillNull(rs.getDate("ybj_ybjsb_sbsj"));
		ybj_ybjsb_shr=cf.fillNull(rs.getString("ybj_ybjsb_shr"));
		ybj_ybjsb_shsj=cf.fillNull(rs.getDate("ybj_ybjsb_shsj"));
		ybj_ybjsb_shjl=cf.fillNull(rs.getString("ybj_ybjsb_shjl"));
		ybj_ybjsb_shsm=cf.fillNull(rs.getString("ybj_ybjsb_shsm"));
		ybj_ybjsb_clzt=cf.fillNull(rs.getString("ybj_ybjsb_clzt"));
		ybj_ybjsb_bz=cf.fillNull(rs.getString("ybj_ybjsb_bz"));
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �鿴��Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�ͻ����</div>
  </td>
  <td width="35%"> 
    <%=ybj_ybjsb_khbh%>
  </td>
  <td width="15%"> 
    <div align="right">�ͻ�����</div>
  </td>
  <td width="35%"> 
    <%=crm_khxx_khxm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���ݵ�ַ</div>
  </td>
  <td width="35%"> 
    <%=crm_khxx_fwdz%>
  </td>
  <td width="15%"> 
    <div align="right">��ϵ��ʽ</div>
  </td>
  <td width="35%"> 
    <%=crm_khxx_lxfs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��ͬ��</div>
  </td>
  <td width="35%"> 
    <%=crm_khxx_hth%>
  </td>
  <td width="15%"> 
    <div align="right">���ʦ</div>
  </td>
  <td width="35%"> 
    <%=crm_khxx_sjs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">ǩԼ����</div>
  </td>
  <td width="35%"> 
    <%=crm_khxx_qyrq%>
  </td>
  <td width="15%"> 
    <div align="right">�ƻ���������</div>
  </td>
  <td width="35%"> 
    <%=crm_khxx_kgrq%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">ʵ�ʿ�������</div>
  </td>
  <td width="35%"> 
    <%=crm_khxx_sjkgrq%>
  </td>
  <td width="15%"> 
    <div align="right">�ƻ���������</div>
  </td>
  <td width="35%"> 
    <%=crm_khxx_jgrq%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">ʵ�ʿ�������</div>
  </td>
  <td width="35%"> 
    <%=crm_khxx_sjjgrq%>
  </td>
  <td width="15%"> 
    <div align="right">ǩԼ����</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",crm_khxx_dwbh,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">ʩ����</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",crm_khxx_sgd,true);
%>
  </td>
  <td width="15%"> 
    <div align="right">�ʼ�</div>
  </td>
  <td width="35%"> 
    <%=crm_khxx_zjxm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�걨��λ</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') order by dwbh",ybj_ybjsb_dwbh,true);
%>
  </td>
  <td width="15%"> 
    <div align="right">�걨��λ</div>
  </td>
  <td width="35%"> 
    <%=sq_dwxx_dwmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�걨��</div>
  </td>
  <td width="35%"> 
    <%=ybj_ybjsb_sbr%>
  </td>
  <td width="15%"> 
    <div align="right">�걨ʱ��</div>
  </td>
  <td width="35%"> 
    <%=ybj_ybjsb_sbsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�����</div>
  </td>
  <td width="35%"> 
    <%=ybj_ybjsb_shr%>
  </td>
  <td width="15%"> 
    <div align="right">���ʱ��</div>
  </td>
  <td width="35%"> 
    <%=ybj_ybjsb_shsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��˽���</div>
  </td>
  <td width="35%"> 
<%
	cf.selectToken(out,"Y+�ϸ�&N+���ϸ�",ybj_ybjsb_shjl,true);
%>
  </td>
  <td width="15%"> 
    <div align="right">���˵��</div>
  </td>
  <td width="35%"> 
    <%=ybj_ybjsb_shsm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����״̬</div>
  </td>
  <td width="35%"> 
<%
	cf.selectToken(out,"1+�걨δ���&2+�����",ybj_ybjsb_clzt,true);
%>
  </td>
  <td width="15%"> 
    <div align="right">��ע</div>
  </td>
  <td width="35%"> 
    <%=ybj_ybjsb_bz%>
  </td>
</tr>
         </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
