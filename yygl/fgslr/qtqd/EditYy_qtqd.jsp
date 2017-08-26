<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String ssfgs=null;
String yy_qtqdkh_byjh=null;
String yy_qtqdkh_bylj=null;
String yy_qtqdkh_szjh=null;
String yy_qtqdkh_szwc=null;
String yy_qtqdkh_bzyj=null;
String yy_qtqddj_byjh=null;
String yy_qtqddj_bylj=null;
String yy_qtqddj_szjh=null;
String yy_qtqddj_szwc=null;
String yy_qtqddj_bzyj=null;
String yy_qtqd_lrsj=null;
String yy_qtqd_lrr=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String wheressfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,ssfgs,yy_qtqdkh_byjh,yy_qtqdkh_bylj,yy_qtqdkh_szjh,yy_qtqdkh_szwc,yy_qtqdkh_bzyj,yy_qtqddj_byjh,yy_qtqddj_bylj,yy_qtqddj_szjh,yy_qtqddj_szwc,yy_qtqddj_bzyj,yy_qtqd_lrsj,yy_qtqd_lrr ";
	ls_sql+=" from  yy_qtqd";
	ls_sql+=" where  (zqs="+wherezqs+") and  (ssfgs='"+wheressfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yy_qtqdkh_byjh=cf.fillNull(rs.getString("yy_qtqdkh_byjh"));
		yy_qtqdkh_bylj=cf.fillNull(rs.getString("yy_qtqdkh_bylj"));
		yy_qtqdkh_szjh=cf.fillNull(rs.getString("yy_qtqdkh_szjh"));
		yy_qtqdkh_szwc=cf.fillNull(rs.getString("yy_qtqdkh_szwc"));
		yy_qtqdkh_bzyj=cf.fillNull(rs.getString("yy_qtqdkh_bzyj"));
		yy_qtqddj_byjh=cf.fillNull(rs.getString("yy_qtqddj_byjh"));
		yy_qtqddj_bylj=cf.fillNull(rs.getString("yy_qtqddj_bylj"));
		yy_qtqddj_szjh=cf.fillNull(rs.getString("yy_qtqddj_szjh"));
		yy_qtqddj_szwc=cf.fillNull(rs.getString("yy_qtqddj_szwc"));
		yy_qtqddj_bzyj=cf.fillNull(rs.getString("yy_qtqddj_bzyj"));
		yy_qtqd_lrsj=cf.fillNull(rs.getDate("yy_qtqd_lrsj"));
		yy_qtqd_lrr=cf.fillNull(rs.getString("yy_qtqd_lrr"));
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
<form method="post" action="SaveEditYy_qtqd.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">������</span></td> 
  <td width="31%"> 
    <input type="text" name="zqs" size="20" maxlength="8"  value="<%=zqs%>" readonly>
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">�����ֹ�˾</span></td> 
  <td width="31%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ��������¼ƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqdkh_byjh" size="20" maxlength="8"  value="<%=yy_qtqdkh_byjh%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ����������ۼ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqdkh_bylj" size="20" maxlength="8"  value="<%=yy_qtqdkh_bylj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ��������ܼƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqdkh_szjh" size="20" maxlength="8"  value="<%=yy_qtqdkh_szjh%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ������������</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqdkh_szwc" size="20" maxlength="8"  value="<%=yy_qtqdkh_szwc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ���������Ԥ��</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqdkh_bzyj" size="20" maxlength="8"  value="<%=yy_qtqdkh_bzyj%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ�����������¼ƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqddj_byjh" size="20" maxlength="8"  value="<%=yy_qtqddj_byjh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ�������������ۼ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqddj_bylj" size="20" maxlength="8"  value="<%=yy_qtqddj_bylj%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ�����������ܼƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqddj_szjh" size="20" maxlength="8"  value="<%=yy_qtqddj_szjh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ���������������</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqddj_szwc" size="20" maxlength="8"  value="<%=yy_qtqddj_szwc%>" >
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ������������Ԥ��</td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqddj_bzyj" size="20" maxlength="8"  value="<%=yy_qtqddj_bzyj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqd_lrsj" size="20" maxlength="10"  value="<%=yy_qtqd_lrsj%>" readonly>
  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_qtqd_lrr" size="20" maxlength="20"  value="<%=yy_qtqd_lrr%>" readonly>
  </td>
</tr>
<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
<input type="hidden" name="wheressfgs"  value="<%=wheressfgs%>" >
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_byjh)=="") {
		alert("������[Ŀ��ͻ��������¼ƻ�]��");
		FormName.yy_qtqdkh_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_byjh, "Ŀ��ͻ��������¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_bylj)=="") {
		alert("������[Ŀ��ͻ����������ۼ�]��");
		FormName.yy_qtqdkh_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_bylj, "Ŀ��ͻ����������ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_szjh)=="") {
		alert("������[Ŀ��ͻ��������ܼƻ�]��");
		FormName.yy_qtqdkh_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_szjh, "Ŀ��ͻ��������ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_szwc)=="") {
		alert("������[Ŀ��ͻ������������]��");
		FormName.yy_qtqdkh_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_szwc, "Ŀ��ͻ������������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqdkh_bzyj)=="") {
		alert("������[Ŀ��ͻ���������Ԥ��]��");
		FormName.yy_qtqdkh_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqdkh_bzyj, "Ŀ��ͻ���������Ԥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_byjh)=="") {
		alert("������[��ȡ�����������¼ƻ�]��");
		FormName.yy_qtqddj_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_byjh, "��ȡ�����������¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_bylj)=="") {
		alert("������[��ȡ�������������ۼ�]��");
		FormName.yy_qtqddj_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_bylj, "��ȡ�������������ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_szjh)=="") {
		alert("������[��ȡ�����������ܼƻ�]��");
		FormName.yy_qtqddj_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_szjh, "��ȡ�����������ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_szwc)=="") {
		alert("������[��ȡ���������������]��");
		FormName.yy_qtqddj_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_szwc, "��ȡ���������������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqddj_bzyj)=="") {
		alert("������[��ȡ������������Ԥ��]��");
		FormName.yy_qtqddj_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_qtqddj_bzyj, "��ȡ������������Ԥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqd_lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.yy_qtqd_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_qtqd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_qtqd_lrr)=="") {
		alert("������[¼����]��");
		FormName.yy_qtqd_lrr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
