<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_sjb_ygmc=null;
String ssbm=null;
String ssfgs=null;
String yy_sjbdj_sydjcb=null;
String yy_sjbdj_byjh=null;
String yy_sjbdj_bylj=null;
String yy_sjbdj_szjh=null;
String yy_sjbdj_szwc=null;
String yy_sjbdj_bzyj=null;
String yy_sjbdj_bztdj=null;
String yy_sjbdj_byljtdj=null;
String yy_sjbsjf_byjh=null;
String yy_sjbsjf_bylj=null;
String yy_sjbsjf_szjh=null;
String yy_sjbsjf_szwc=null;
String yy_sjbsjf_bzyj=null;
String yy_sjbgccz_byjh=null;
String yy_sjbgccz_bylj=null;
String yy_sjbgccz_szjh=null;
String yy_sjbgccz_szwc=null;
String yy_sjbgccz_bzyj=null;
String yy_sjbzccz_byjh=null;
String yy_sjbzccz_bylj=null;
String yy_sjbzccz_szjh=null;
String yy_sjbzccz_szwc=null;
String yy_sjbzccz_bzyj=null;
String yy_sjb_lrr=null;
String yy_sjb_lrsj=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String wheressbm=cf.GB2Uni(request.getParameter("ssbm"));
String whereyy_sjb_ygmc=cf.getParameter(request,"yy_sjb_ygmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_sjb_ygmc,ssbm,ssfgs,yy_sjbdj_sydjcb,yy_sjbdj_byjh,yy_sjbdj_bylj,yy_sjbdj_szjh,yy_sjbdj_szwc,yy_sjbdj_bzyj,yy_sjbdj_bztdj,yy_sjbdj_byljtdj,yy_sjbsjf_byjh,yy_sjbsjf_bylj,yy_sjbsjf_szjh,yy_sjbsjf_szwc,yy_sjbsjf_bzyj,yy_sjbgccz_byjh,yy_sjbgccz_bylj,yy_sjbgccz_szjh,yy_sjbgccz_szwc,yy_sjbgccz_bzyj,yy_sjbzccz_byjh,yy_sjbzccz_bylj,yy_sjbzccz_szjh,yy_sjbzccz_szwc,yy_sjbzccz_bzyj,yy_sjb_lrr,yy_sjb_lrsj ";
	ls_sql+=" from  yy_sjb";
	ls_sql+=" where  (zqs="+wherezqs+") and  (ssbm='"+wheressbm+"') and  (yy_sjb_ygmc='"+whereyy_sjb_ygmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_sjb_ygmc=cf.fillNull(rs.getString("yy_sjb_ygmc"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yy_sjbdj_sydjcb=cf.fillNull(rs.getString("yy_sjbdj_sydjcb"));
		yy_sjbdj_byjh=cf.fillNull(rs.getString("yy_sjbdj_byjh"));
		yy_sjbdj_bylj=cf.fillNull(rs.getString("yy_sjbdj_bylj"));
		yy_sjbdj_szjh=cf.fillNull(rs.getString("yy_sjbdj_szjh"));
		yy_sjbdj_szwc=cf.fillNull(rs.getString("yy_sjbdj_szwc"));
		yy_sjbdj_bzyj=cf.fillNull(rs.getString("yy_sjbdj_bzyj"));
		yy_sjbdj_bztdj=cf.fillNull(rs.getString("yy_sjbdj_bztdj"));
		yy_sjbdj_byljtdj=cf.fillNull(rs.getString("yy_sjbdj_byljtdj"));
		yy_sjbsjf_byjh=cf.fillNull(rs.getString("yy_sjbsjf_byjh"));
		yy_sjbsjf_bylj=cf.fillNull(rs.getString("yy_sjbsjf_bylj"));
		yy_sjbsjf_szjh=cf.fillNull(rs.getString("yy_sjbsjf_szjh"));
		yy_sjbsjf_szwc=cf.fillNull(rs.getString("yy_sjbsjf_szwc"));
		yy_sjbsjf_bzyj=cf.fillNull(rs.getString("yy_sjbsjf_bzyj"));
		yy_sjbgccz_byjh=cf.fillNull(rs.getString("yy_sjbgccz_byjh"));
		yy_sjbgccz_bylj=cf.fillNull(rs.getString("yy_sjbgccz_bylj"));
		yy_sjbgccz_szjh=cf.fillNull(rs.getString("yy_sjbgccz_szjh"));
		yy_sjbgccz_szwc=cf.fillNull(rs.getString("yy_sjbgccz_szwc"));
		yy_sjbgccz_bzyj=cf.fillNull(rs.getString("yy_sjbgccz_bzyj"));
		yy_sjbzccz_byjh=cf.fillNull(rs.getString("yy_sjbzccz_byjh"));
		yy_sjbzccz_bylj=cf.fillNull(rs.getString("yy_sjbzccz_bylj"));
		yy_sjbzccz_szjh=cf.fillNull(rs.getString("yy_sjbzccz_szjh"));
		yy_sjbzccz_szwc=cf.fillNull(rs.getString("yy_sjbzccz_szwc"));
		yy_sjbzccz_bzyj=cf.fillNull(rs.getString("yy_sjbzccz_bzyj"));
		yy_sjb_lrr=cf.fillNull(rs.getString("yy_sjb_lrr"));
		yy_sjb_lrsj=cf.fillNull(rs.getDate("yy_sjb_lrsj"));
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
<form method="post" action="SaveEditYy_sjb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�����ֹ�˾</span></td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">��������</span></td>
  <td><select name="ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'",ssbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">������</span></td> 
  <td width="31%"> 
    <input type="text" name="zqs" size="20" maxlength="8"  value="<%=zqs%>" readonly>  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">��Ʋ�Ա������</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_sjb_ygmc" size="20" maxlength="20"  value="<%=yy_sjb_ygmc%>" readonly>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>����(�Ǳ���)����</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_sydjcb" size="20" maxlength="8"  value="<%=yy_sjbdj_sydjcb%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>���¼ƻ���ȡ����</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_byjh" size="20" maxlength="8"  value="<%=yy_sjbdj_byjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>�����ۼ���ȡ����</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_bylj" size="20" maxlength="8"  value="<%=yy_sjbdj_bylj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>���ܼƻ���ȡ����</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_szjh" size="20" maxlength="8"  value="<%=yy_sjbdj_szjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>���������ȡ����</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_szwc" size="20" maxlength="8"  value="<%=yy_sjbdj_szwc%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>����Ԥ����ȡ����</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_bzyj" size="20" maxlength="8"  value="<%=yy_sjbdj_bzyj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>�����˶���</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_bztdj" size="20" maxlength="8"  value="<%=yy_sjbdj_bztdj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>�����ۼ��˶���</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbdj_byljtdj" size="20" maxlength="8"  value="<%=yy_sjbdj_byljtdj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>��Ʒѱ��¼ƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbsjf_byjh" size="20" maxlength="17"  value="<%=yy_sjbsjf_byjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��Ʒѱ����ۼ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbsjf_bylj" size="20" maxlength="17"  value="<%=yy_sjbsjf_bylj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>��Ʒ����ܼƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbsjf_szjh" size="20" maxlength="17"  value="<%=yy_sjbsjf_szjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��Ʒ��������</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbsjf_szwc" size="20" maxlength="17"  value="<%=yy_sjbsjf_szwc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>��Ʒѱ���Ԥ��</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbsjf_bzyj" size="20" maxlength="17"  value="<%=yy_sjbsjf_bzyj%>" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���̲�ֵ���¼ƻ�</td>
  <td><input type="text" name="yy_sjbgccz_byjh" size="20" maxlength="17"  value="<%=yy_sjbgccz_byjh%>" ></td>
  <td align="right"><span class="STYLE1">*</span>���̲�ֵ�����ۼ�</td>
  <td><input type="text" name="yy_sjbgccz_bylj" size="20" maxlength="17"  value="<%=yy_sjbgccz_bylj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>���̲�ֵ���ܼƻ�</td> 
  <td width="31%"><input type="text" name="yy_sjbgccz_szjh" size="20" maxlength="17"  value="<%=yy_sjbgccz_szjh%>" ></td>
  <td align="right" width="19%"><span class="STYLE1">*</span>���̲�ֵ�������</td> 
  <td width="31%"><input type="text" name="yy_sjbgccz_szwc" size="20" maxlength="17"  value="<%=yy_sjbgccz_szwc%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>���̲�ֵ����Ԥ��</td> 
  <td width="31%"><input type="text" name="yy_sjbgccz_bzyj" size="20" maxlength="17"  value="<%=yy_sjbgccz_bzyj%>" ></td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>���Ĳ�ֵ���¼ƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbzccz_byjh" size="20" maxlength="17"  value="<%=yy_sjbzccz_byjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>���Ĳ�ֵ�����ۼ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbzccz_bylj" size="20" maxlength="17"  value="<%=yy_sjbzccz_bylj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>���Ĳ�ֵ���ܼƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbzccz_szjh" size="20" maxlength="17"  value="<%=yy_sjbzccz_szjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>���Ĳ�ֵ�������</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbzccz_szwc" size="20" maxlength="17"  value="<%=yy_sjbzccz_szwc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>���Ĳ�ֵ����Ԥ��</td> 
  <td width="31%"> 
    <input type="text" name="yy_sjbzccz_bzyj" size="20" maxlength="17"  value="<%=yy_sjbzccz_bzyj%>" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="31%"><input type="text" name="yy_sjb_lrr" size="20" maxlength="20"  value="<%=yy_sjb_lrr%>" readonly></td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span> </td>
  <td width="31%"><input type="text" name="yy_sjb_lrsj" size="20" maxlength="10"  value="<%=yy_sjb_lrsj%>" readonly></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
		<input type="hidden" name="wheressbm"  value="<%=wheressbm%>" >
		<input type="hidden" name="whereyy_sjb_ygmc"  value="<%=whereyy_sjb_ygmc%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(	javaTrim(FormName.yy_sjb_ygmc)=="") {
		alert("������[��Ʋ�Ա������]��");
		FormName.yy_sjb_ygmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ssbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.ssbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_sydjcb)=="") {
		alert("������[����(�Ǳ���)����]��");
		FormName.yy_sjbdj_sydjcb.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_sydjcb, "����(�Ǳ���)����"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_byjh)=="") {
		alert("������[���¼ƻ���ȡ����]��");
		FormName.yy_sjbdj_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_byjh, "���¼ƻ���ȡ����"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_bylj)=="") {
		alert("������[�����ۼ���ȡ����]��");
		FormName.yy_sjbdj_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_bylj, "�����ۼ���ȡ����"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_szjh)=="") {
		alert("������[���ܼƻ���ȡ����]��");
		FormName.yy_sjbdj_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_szjh, "���ܼƻ���ȡ����"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_szwc)=="") {
		alert("������[���������ȡ����]��");
		FormName.yy_sjbdj_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_szwc, "���������ȡ����"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_bzyj)=="") {
		alert("������[����Ԥ����ȡ����]��");
		FormName.yy_sjbdj_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_bzyj, "����Ԥ����ȡ����"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_bztdj)=="") {
		alert("������[�����˶���]��");
		FormName.yy_sjbdj_bztdj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_bztdj, "�����˶���"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbdj_byljtdj)=="") {
		alert("������[�����ۼ��˶���]��");
		FormName.yy_sjbdj_byljtdj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_sjbdj_byljtdj, "�����ۼ��˶���"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbsjf_byjh)=="") {
		alert("������[��Ʒѱ��¼ƻ�]��");
		FormName.yy_sjbsjf_byjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbsjf_byjh, "��Ʒѱ��¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbsjf_bylj)=="") {
		alert("������[��Ʒѱ����ۼ�]��");
		FormName.yy_sjbsjf_bylj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbsjf_bylj, "��Ʒѱ����ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbsjf_szjh)=="") {
		alert("������[��Ʒ����ܼƻ�]��");
		FormName.yy_sjbsjf_szjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbsjf_szjh, "��Ʒ����ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbsjf_szwc)=="") {
		alert("������[��Ʒ��������]��");
		FormName.yy_sjbsjf_szwc.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbsjf_szwc, "��Ʒ��������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbsjf_bzyj)=="") {
		alert("������[��Ʒѱ���Ԥ��]��");
		FormName.yy_sjbsjf_bzyj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbsjf_bzyj, "��Ʒѱ���Ԥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbgccz_byjh)=="") {
		alert("������[���̲�ֵ���¼ƻ�]��");
		FormName.yy_sjbgccz_byjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbgccz_byjh, "���̲�ֵ���¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbgccz_bylj)=="") {
		alert("������[���̲�ֵ�����ۼ�]��");
		FormName.yy_sjbgccz_bylj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbgccz_bylj, "���̲�ֵ�����ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbgccz_szjh)=="") {
		alert("������[���̲�ֵ���ܼƻ�]��");
		FormName.yy_sjbgccz_szjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbgccz_szjh, "���̲�ֵ���ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbgccz_szwc)=="") {
		alert("������[���̲�ֵ�������]��");
		FormName.yy_sjbgccz_szwc.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbgccz_szwc, "���̲�ֵ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbgccz_bzyj)=="") {
		alert("������[���̲�ֵ����Ԥ��]��");
		FormName.yy_sjbgccz_bzyj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbgccz_bzyj, "���̲�ֵ����Ԥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbzccz_byjh)=="") {
		alert("������[���Ĳ�ֵ���¼ƻ�]��");
		FormName.yy_sjbzccz_byjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbzccz_byjh, "���Ĳ�ֵ���¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbzccz_bylj)=="") {
		alert("������[���Ĳ�ֵ�����ۼ�]��");
		FormName.yy_sjbzccz_bylj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbzccz_bylj, "���Ĳ�ֵ�����ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbzccz_szjh)=="") {
		alert("������[���Ĳ�ֵ���ܼƻ�]��");
		FormName.yy_sjbzccz_szjh.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbzccz_szjh, "���Ĳ�ֵ���ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbzccz_szwc)=="") {
		alert("������[���Ĳ�ֵ�������]��");
		FormName.yy_sjbzccz_szwc.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbzccz_szwc, "���Ĳ�ֵ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjbzccz_bzyj)=="") {
		alert("������[���Ĳ�ֵ����Ԥ��]��");
		FormName.yy_sjbzccz_bzyj.focus();
		return false;
	}
	if(!(isFloat(FormName.yy_sjbzccz_bzyj, "���Ĳ�ֵ����Ԥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_sjb_lrr)=="") {
		alert("������[¼����]��");
		FormName.yy_sjb_lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_sjb_lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.yy_sjb_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_sjb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
