<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_lr_fgs=null;
String yy_lrglf_ysbl=null;
String yy_lrglf_sjsq=null;
String yy_lrsj_ysbl=null;
String yy_lrsj_sjsq=null;
String yy_lrgc_qnpj=null;
String yy_lrgc_bzzs=null;
String yy_lrzc_qnpj=null;
String yy_lrzc_bzzs=null;
String yy_lr_lrsj=null;
String lrr=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String whereyy_lr_fgs=cf.GB2Uni(request.getParameter("yy_lr_fgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_lr_fgs,yy_lrglf_ysbl,yy_lrglf_sjsq,yy_lrsj_ysbl,yy_lrsj_sjsq,yy_lrgc_qnpj,yy_lrgc_bzzs,yy_lrzc_qnpj,yy_lrzc_bzzs,yy_lr_lrsj,lrr ";
	ls_sql+=" from  yy_lr";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_lr_fgs='"+whereyy_lr_fgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_lr_fgs=cf.fillNull(rs.getString("yy_lr_fgs"));
		yy_lrglf_ysbl=cf.fillNull(rs.getString("yy_lrglf_ysbl"));
		yy_lrglf_sjsq=cf.fillNull(rs.getString("yy_lrglf_sjsq"));
		yy_lrsj_ysbl=cf.fillNull(rs.getString("yy_lrsj_ysbl"));
		yy_lrsj_sjsq=cf.fillNull(rs.getString("yy_lrsj_sjsq"));
		yy_lrgc_qnpj=cf.fillNull(rs.getString("yy_lrgc_qnpj"));
		yy_lrgc_bzzs=cf.fillNull(rs.getString("yy_lrgc_bzzs"));
		yy_lrzc_qnpj=cf.fillNull(rs.getString("yy_lrzc_qnpj"));
		yy_lrzc_bzzs=cf.fillNull(rs.getString("yy_lrzc_bzzs"));
		yy_lr_lrsj=cf.fillNull(rs.getDate("yy_lr_lrsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditYy_lr.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE1">*</span><span class="STYLE2">������</span></td> 
  <td width="30%"> 
    <input type="text" name="zqs" size="20" maxlength="8"  value="<%=zqs%>" readonly>
  </td>
  <td align="right" width="20%"><span class="STYLE1">*</span><span class="STYLE2">�����ֹ�˾</span></td> 
  <td width="30%"> 
    <select name="yy_lr_fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yy_lr_fgs+"'",yy_lr_fgs);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE1">*</span>�ͻ�����ѱ���Ӧ�ձ���(%)</td> 
  <td width="30%"> 
    <input type="text" name="yy_lrglf_ysbl" size="20" maxlength="17"  value="<%=yy_lrglf_ysbl%>" >
  </td>
  <td align="right" width="20%"><span class="STYLE1">*</span>�ͻ�����ѱ���ʵ����ȡ(%)</td> 
  <td width="30%"> 
    <input type="text" name="yy_lrglf_sjsq" size="20" maxlength="17"  value="<%=yy_lrglf_sjsq%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE1">*</span>˰����������Ӧ�ձ���(%)</td> 
  <td width="30%"> 
    <input type="text" name="yy_lrsj_ysbl" size="20" maxlength="17"  value="<%=yy_lrsj_ysbl%>" >
  </td>
  <td align="right" width="20%"><span class="STYLE1">*</span>˰����������ʵ����ȡ(%)</td> 
  <td width="30%"> 
    <input type="text" name="yy_lrsj_sjsq" size="20" maxlength="17"  value="<%=yy_lrsj_sjsq%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE1">*</span>����ë����ȥ��ƽ��(%)</td> 
  <td width="30%"> 
    <input type="text" name="yy_lrgc_qnpj" size="20" maxlength="17"  value="<%=yy_lrgc_qnpj%>" >
  </td>
  <td align="right" width="20%"><span class="STYLE1">*</span>����ë���ʱ���ָ��(%)</td> 
  <td width="30%"> 
    <input type="text" name="yy_lrgc_bzzs" size="20" maxlength="17"  value="<%=yy_lrgc_bzzs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE1">*</span>����ë����ȥ��ƽ��(%)</td> 
  <td width="30%"> 
    <input type="text" name="yy_lrzc_qnpj" size="20" maxlength="17"  value="<%=yy_lrzc_qnpj%>" >
  </td>
  <td align="right" width="20%"><span class="STYLE1">*</span>����ë���ʱ���ָ��(%)</td> 
  <td width="30%"> 
    <input type="text" name="yy_lrzc_bzzs" size="20" maxlength="17"  value="<%=yy_lrzc_bzzs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="30%"> 
    <input type="text" name="yy_lr_lrsj" size="20" maxlength="10"  value="<%=yy_lr_lrsj%>" readonly>
  </td>
  <td align="right" width="20%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="30%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
  </td>
</tr>
<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
<input type="hidden" name="whereyy_lr_fgs"  value="<%=whereyy_lr_fgs%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zqs)=="") {
		alert("������[������]��");
		FormName.zqs.focus();
		return false;
	}
	if(!(isNumber(FormName.zqs, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_lr_fgs)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.yy_lr_fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_lrglf_ysbl)=="") {
		alert("������[�ͻ�����ѱ���Ӧ�ձ���(%)]��");
		FormName.yy_lrglf_ysbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_lrglf_ysbl, "�ͻ�����ѱ���Ӧ�ձ���(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_lrglf_sjsq)=="") {
		alert("������[�ͻ�����ѱ���ʵ����ȡ(%)]��");
		FormName.yy_lrglf_sjsq.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_lrglf_sjsq, "�ͻ�����ѱ���ʵ����ȡ(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_lrsj_ysbl)=="") {
		alert("������[˰����������Ӧ�ձ���(%)]��");
		FormName.yy_lrsj_ysbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_lrsj_ysbl, "˰����������Ӧ�ձ���(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_lrsj_sjsq)=="") {
		alert("������[˰����������ʵ����ȡ(%)]��");
		FormName.yy_lrsj_sjsq.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_lrsj_sjsq, "˰����������ʵ����ȡ(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_lrgc_qnpj)=="") {
		alert("������[����ë����ȥ��ƽ��(%)]��");
		FormName.yy_lrgc_qnpj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_lrgc_qnpj, "����ë����ȥ��ƽ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_lrgc_bzzs)=="") {
		alert("������[����ë���ʱ���ָ��(%)]��");
		FormName.yy_lrgc_bzzs.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_lrgc_bzzs, "����ë���ʱ���ָ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_lrzc_qnpj)=="") {
		alert("������[����ë����ȥ��ƽ��(%)]��");
		FormName.yy_lrzc_qnpj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_lrzc_qnpj, "����ë����ȥ��ƽ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_lrzc_bzzs)=="") {
		alert("������[����ë���ʱ���ָ��(%)]��");
		FormName.yy_lrzc_bzzs.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_lrzc_bzzs, "����ë���ʱ���ָ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_lr_lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.yy_lr_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_lr_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
