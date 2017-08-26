<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_cx_fgs=null;
String yy_cxzjzk_qnpj=null;
String yy_cxzjzk_bzzs=null;
String yy_cxzpzq_qnpj=null;
String yy_cxzpzq_bzzs=null;
String yy_cxgcfx_qnpj=null;
String yy_cxgcfx_bzzs=null;
String yy_cxrlhj_qnpj=null;
String yy_cxrlhj_bzzs=null;
String yy_cx_lrsj=null;
String lrr=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String whereyy_cx_fgs=cf.GB2Uni(request.getParameter("yy_cx_fgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_cx_fgs,yy_cxzjzk_qnpj,yy_cxzjzk_bzzs,yy_cxzpzq_qnpj,yy_cxzpzq_bzzs,yy_cxgcfx_qnpj,yy_cxgcfx_bzzs,yy_cxrlhj_qnpj,yy_cxrlhj_bzzs,yy_cx_lrsj,lrr ";
	ls_sql+=" from  yy_cx";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_cx_fgs='"+whereyy_cx_fgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_cx_fgs=cf.fillNull(rs.getString("yy_cx_fgs"));
		yy_cxzjzk_qnpj=cf.fillNull(rs.getString("yy_cxzjzk_qnpj"));
		yy_cxzjzk_bzzs=cf.fillNull(rs.getString("yy_cxzjzk_bzzs"));
		yy_cxzpzq_qnpj=cf.fillNull(rs.getString("yy_cxzpzq_qnpj"));
		yy_cxzpzq_bzzs=cf.fillNull(rs.getString("yy_cxzpzq_bzzs"));
		yy_cxgcfx_qnpj=cf.fillNull(rs.getString("yy_cxgcfx_qnpj"));
		yy_cxgcfx_bzzs=cf.fillNull(rs.getString("yy_cxgcfx_bzzs"));
		yy_cxrlhj_qnpj=cf.fillNull(rs.getString("yy_cxrlhj_qnpj"));
		yy_cxrlhj_bzzs=cf.fillNull(rs.getString("yy_cxrlhj_bzzs"));
		yy_cx_lrsj=cf.fillNull(rs.getDate("yy_cx_lrsj"));
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
<form method="post" action="SaveEditYy_cx.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">������</span></td> 
  <td width="31%"> 
    <input type="text" name="zqs" size="20" maxlength="8"  value="<%=zqs%>" readonly>
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">�����ֹ�˾</span></td> 
  <td width="31%"> 
    <select name="yy_cx_fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yy_cx_fgs+"'",yy_cx_fgs);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>ֱ���ۿ�ȥ��ƽ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cxzjzk_qnpj" size="20" maxlength="17"  value="<%=yy_cxzjzk_qnpj%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>ֱ���ۿ۱���ָ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cxzjzk_bzzs" size="20" maxlength="17"  value="<%=yy_cxzjzk_bzzs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>��Ʒ��ȯȥ��ƽ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cxzpzq_qnpj" size="20" maxlength="17"  value="<%=yy_cxzpzq_qnpj%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��Ʒ��ȯ����ָ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cxzpzq_bzzs" size="20" maxlength="17"  value="<%=yy_cxzpzq_bzzs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>���̷���ȥ��ƽ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cxgcfx_qnpj" size="20" maxlength="17"  value="<%=yy_cxgcfx_qnpj%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>���̷��ֱ���ָ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cxgcfx_bzzs" size="20" maxlength="17"  value="<%=yy_cxgcfx_bzzs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>�����ϼ�ȥ��ƽ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cxrlhj_qnpj" size="20" maxlength="17"  value="<%=yy_cxrlhj_qnpj%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>�����ϼƱ���ָ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cxrlhj_bzzs" size="20" maxlength="17"  value="<%=yy_cxrlhj_bzzs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_lrsj" size="20" maxlength="10"  value="<%=yy_cx_lrsj%>" readonly>
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="31%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
  </td>
</tr>
<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
<input type="hidden" name="whereyy_cx_fgs"  value="<%=whereyy_cx_fgs%>" >
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
	if(	javaTrim(FormName.yy_cx_fgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.yy_cx_fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_cxzjzk_qnpj)=="") {
		alert("������[ֱ���ۿ�ȥ��ƽ��(%)]��");
		FormName.yy_cxzjzk_qnpj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_cxzjzk_qnpj, "ֱ���ۿ�ȥ��ƽ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_cxzjzk_bzzs)=="") {
		alert("������[ֱ���ۿ۱���ָ��(%)]��");
		FormName.yy_cxzjzk_bzzs.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_cxzjzk_bzzs, "ֱ���ۿ۱���ָ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_cxzpzq_qnpj)=="") {
		alert("������[��Ʒ��ȯȥ��ƽ��(%)]��");
		FormName.yy_cxzpzq_qnpj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_cxzpzq_qnpj, "��Ʒ��ȯȥ��ƽ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_cxzpzq_bzzs)=="") {
		alert("������[��Ʒ��ȯ����ָ��(%)]��");
		FormName.yy_cxzpzq_bzzs.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_cxzpzq_bzzs, "��Ʒ��ȯ����ָ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_cxgcfx_qnpj)=="") {
		alert("������[���̷���ȥ��ƽ��(%)]��");
		FormName.yy_cxgcfx_qnpj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_cxgcfx_qnpj, "���̷���ȥ��ƽ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_cxgcfx_bzzs)=="") {
		alert("������[���̷��ֱ���ָ��(%)]��");
		FormName.yy_cxgcfx_bzzs.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_cxgcfx_bzzs, "���̷��ֱ���ָ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_cxrlhj_qnpj)=="") {
		alert("������[�����ϼ�ȥ��ƽ��(%)]��");
		FormName.yy_cxrlhj_qnpj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_cxrlhj_qnpj, "�����ϼ�ȥ��ƽ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_cxrlhj_bzzs)=="") {
		alert("������[�����ϼƱ���ָ��(%)]��");
		FormName.yy_cxrlhj_bzzs.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_cxrlhj_bzzs, "�����ϼƱ���ָ��(%)"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_cx_lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.yy_cx_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_cx_lrsj, "¼��ʱ��"))) {
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
