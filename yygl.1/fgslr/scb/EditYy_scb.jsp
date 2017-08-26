<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_scb_ygmc=null;
String ssbm=null;
String ssfgs=null;
String yy_scbkh_byjh=null;
String yy_scbkh_bylj=null;
String yy_scbkh_szjh=null;
String yy_scbkh_szwc=null;
String yy_scbkh_bzyj=null;
String yy_scbdj_byjh=null;
String yy_scbdj_bylj=null;
String yy_scbdj_szjh=null;
String yy_scbdj_szwc=null;
String yy_scbdj_bzjh=null;
String yy_scb_lrr=null;
String yy_scb_lrsj=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String whereyy_scb_ygmc=cf.getParameter(request,"yy_scb_ygmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_scb_ygmc,ssbm,ssfgs,yy_scbkh_byjh,yy_scbkh_bylj,yy_scbkh_szjh,yy_scbkh_szwc,yy_scbkh_bzyj,yy_scbdj_byjh,yy_scbdj_bylj,yy_scbdj_szjh,yy_scbdj_szwc,yy_scbdj_bzjh,yy_scb_lrr,yy_scb_lrsj ";
	ls_sql+=" from  yy_scb";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_scb_ygmc='"+whereyy_scb_ygmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_scb_ygmc=cf.fillNull(rs.getString("yy_scb_ygmc"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yy_scbkh_byjh=cf.fillNull(rs.getString("yy_scbkh_byjh"));
		yy_scbkh_bylj=cf.fillNull(rs.getString("yy_scbkh_bylj"));
		yy_scbkh_szjh=cf.fillNull(rs.getString("yy_scbkh_szjh"));
		yy_scbkh_szwc=cf.fillNull(rs.getString("yy_scbkh_szwc"));
		yy_scbkh_bzyj=cf.fillNull(rs.getString("yy_scbkh_bzyj"));
		yy_scbdj_byjh=cf.fillNull(rs.getString("yy_scbdj_byjh"));
		yy_scbdj_bylj=cf.fillNull(rs.getString("yy_scbdj_bylj"));
		yy_scbdj_szjh=cf.fillNull(rs.getString("yy_scbdj_szjh"));
		yy_scbdj_szwc=cf.fillNull(rs.getString("yy_scbdj_szwc"));
		yy_scbdj_bzjh=cf.fillNull(rs.getString("yy_scbdj_bzjh"));
		yy_scb_lrr=cf.fillNull(rs.getString("yy_scb_lrr"));
		yy_scb_lrsj=cf.fillNull(rs.getDate("yy_scb_lrsj"));
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
<form method="post" action="SaveEditYy_scb.jsp" name="editform">
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
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">�г���Ա������</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_scb_ygmc" size="20" maxlength="20"  value="<%=yy_scb_ygmc%>" readonly>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ��������¼ƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbkh_byjh" size="20" maxlength="8"  value="<%=yy_scbkh_byjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ����������ۼ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbkh_bylj" size="20" maxlength="8"  value="<%=yy_scbkh_bylj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ��������ܼƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbkh_szjh" size="20" maxlength="8"  value="<%=yy_scbkh_szjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ������������</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbkh_szwc" size="20" maxlength="8"  value="<%=yy_scbkh_szwc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ���������Ԥ��</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbkh_bzyj" size="20" maxlength="8"  value="<%=yy_scbkh_bzyj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ�����¼ƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbdj_byjh" size="20" maxlength="8"  value="<%=yy_scbdj_byjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ�������ۼ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbdj_bylj" size="20" maxlength="8"  value="<%=yy_scbdj_bylj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ�������ܼƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbdj_szjh" size="20" maxlength="8"  value="<%=yy_scbdj_szjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ�����������</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbdj_szwc" size="20" maxlength="8"  value="<%=yy_scbdj_szwc%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ������Ԥ��</td> 
  <td width="31%"> 
    <input type="text" name="yy_scbdj_bzjh" size="20" maxlength="8"  value="<%=yy_scbdj_bzjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_scb_lrr" size="20" maxlength="20"  value="<%=yy_scb_lrr%>" readonly>  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_scb_lrsj" size="20" maxlength="10"  value="<%=yy_scb_lrsj%>" readonly>  </td>
</tr>
<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
<input type="hidden" name="whereyy_scb_ygmc"  value="<%=whereyy_scb_ygmc%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
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
	if(	javaTrim(FormName.yy_scb_ygmc)=="") {
		alert("������[�г���Ա������]��");
		FormName.yy_scb_ygmc.focus();
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
	if(	javaTrim(FormName.yy_scbkh_byjh)=="") {
		alert("������[Ŀ��ͻ��������¼ƻ�]��");
		FormName.yy_scbkh_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbkh_byjh, "Ŀ��ͻ��������¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbkh_bylj)=="") {
		alert("������[Ŀ��ͻ����������ۼ�]��");
		FormName.yy_scbkh_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbkh_bylj, "Ŀ��ͻ����������ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbkh_szjh)=="") {
		alert("������[Ŀ��ͻ��������ܼƻ�]��");
		FormName.yy_scbkh_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbkh_szjh, "Ŀ��ͻ��������ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbkh_szwc)=="") {
		alert("������[Ŀ��ͻ������������]��");
		FormName.yy_scbkh_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbkh_szwc, "Ŀ��ͻ������������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbkh_bzyj)=="") {
		alert("������[Ŀ��ͻ���������Ԥ��]��");
		FormName.yy_scbkh_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbkh_bzyj, "Ŀ��ͻ���������Ԥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbdj_byjh)=="") {
		alert("������[��ȡ�����¼ƻ�]��");
		FormName.yy_scbdj_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbdj_byjh, "��ȡ�����¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbdj_bylj)=="") {
		alert("������[��ȡ�������ۼ�]��");
		FormName.yy_scbdj_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbdj_bylj, "��ȡ�������ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbdj_szjh)=="") {
		alert("������[��ȡ�������ܼƻ�]��");
		FormName.yy_scbdj_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbdj_szjh, "��ȡ�������ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbdj_szwc)=="") {
		alert("������[��ȡ�����������]��");
		FormName.yy_scbdj_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbdj_szwc, "��ȡ�����������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scbdj_bzjh)=="") {
		alert("������[��ȡ������Ԥ��]��");
		FormName.yy_scbdj_bzjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_scbdj_bzjh, "��ȡ������Ԥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_scb_lrr)=="") {
		alert("������[¼����]��");
		FormName.yy_scb_lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_scb_lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.yy_scb_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_scb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
