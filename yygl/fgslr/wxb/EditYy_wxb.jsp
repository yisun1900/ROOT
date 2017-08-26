<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqs=null;
String yy_wxb_ygmc=null;
String ssbm=null;
String ssfgs=null;
String yy_wxbkh_byjh=null;
String yy_wxbkh_bylj=null;
String yy_wxbkh_szjh=null;
String yy_wxbkh_szwc=null;
String yy_wxbkh_bzyj=null;
String yy_wxbdj_byjh=null;
String yy_wxbdj_bylj=null;
String yy_wxbdj_szjh=null;
String yy_wxbdj_szwc=null;
String yy_wxbdj_bzjh=null;
String yy_wxb_lrr=null;
String yy_wxb_lrsj=null;
String wherezqs=cf.GB2Uni(request.getParameter("zqs"));
String whereyy_wxb_ygmc=cf.getParameter(request,"yy_wxb_ygmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqs,yy_wxb_ygmc,ssbm,ssfgs,yy_wxbkh_byjh,yy_wxbkh_bylj,yy_wxbkh_szjh,yy_wxbkh_szwc,yy_wxbkh_bzyj,yy_wxbdj_byjh,yy_wxbdj_bylj,yy_wxbdj_szjh,yy_wxbdj_szwc,yy_wxbdj_bzjh,yy_wxb_lrr,yy_wxb_lrsj ";
	ls_sql+=" from  yy_wxb";
	ls_sql+=" where  (zqs="+wherezqs+") and  (yy_wxb_ygmc='"+whereyy_wxb_ygmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqs=cf.fillNull(rs.getString("zqs"));
		yy_wxb_ygmc=cf.fillNull(rs.getString("yy_wxb_ygmc"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yy_wxbkh_byjh=cf.fillNull(rs.getString("yy_wxbkh_byjh"));
		yy_wxbkh_bylj=cf.fillNull(rs.getString("yy_wxbkh_bylj"));
		yy_wxbkh_szjh=cf.fillNull(rs.getString("yy_wxbkh_szjh"));
		yy_wxbkh_szwc=cf.fillNull(rs.getString("yy_wxbkh_szwc"));
		yy_wxbkh_bzyj=cf.fillNull(rs.getString("yy_wxbkh_bzyj"));
		yy_wxbdj_byjh=cf.fillNull(rs.getString("yy_wxbdj_byjh"));
		yy_wxbdj_bylj=cf.fillNull(rs.getString("yy_wxbdj_bylj"));
		yy_wxbdj_szjh=cf.fillNull(rs.getString("yy_wxbdj_szjh"));
		yy_wxbdj_szwc=cf.fillNull(rs.getString("yy_wxbdj_szwc"));
		yy_wxbdj_bzjh=cf.fillNull(rs.getString("yy_wxbdj_bzjh"));
		yy_wxb_lrr=cf.fillNull(rs.getString("yy_wxb_lrr"));
		yy_wxb_lrsj=cf.fillNull(rs.getDate("yy_wxb_lrsj"));
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
<form method="post" action="SaveEditYy_wxb.jsp" name="editform">
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
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">������Ա������</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_wxb_ygmc" size="20" maxlength="20"  value="<%=yy_wxb_ygmc%>" readonly>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ��������¼ƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbkh_byjh" size="20" maxlength="8"  value="<%=yy_wxbkh_byjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ����������ۼ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbkh_bylj" size="20" maxlength="8"  value="<%=yy_wxbkh_bylj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ��������ܼƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbkh_szjh" size="20" maxlength="8"  value="<%=yy_wxbkh_szjh%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ������������</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbkh_szwc" size="20" maxlength="8"  value="<%=yy_wxbkh_szwc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>Ŀ��ͻ���������Ԥ��</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbkh_bzyj" size="20" maxlength="8"  value="<%=yy_wxbkh_bzyj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ�����������¼ƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbdj_byjh" size="20" maxlength="8"  value="<%=yy_wxbdj_byjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ�������������ۼ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbdj_bylj" size="20" maxlength="8"  value="<%=yy_wxbdj_bylj%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ�����������ܼƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbdj_szjh" size="20" maxlength="8"  value="<%=yy_wxbdj_szjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ���������������</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbdj_szwc" size="20" maxlength="8"  value="<%=yy_wxbdj_szwc%>" >  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��ȡ�����������ܼƻ�</td> 
  <td width="31%"> 
    <input type="text" name="yy_wxbdj_bzjh" size="20" maxlength="8"  value="<%=yy_wxbdj_bzjh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_wxb_lrr" size="20" maxlength="20"  value="<%=yy_wxb_lrr%>" readonly>  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="31%"> 
    <input type="text" name="yy_wxb_lrsj" size="20" maxlength="10"  value="<%=yy_wxb_lrsj%>" readonly>  </td>
</tr>
<input type="hidden" name="wherezqs"  value="<%=wherezqs%>" >
<input type="hidden" name="whereyy_wxb_ygmc"  value="<%=whereyy_wxb_ygmc%>" >
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
	if(	javaTrim(FormName.yy_wxb_ygmc)=="") {
		alert("������[������Ա������]��");
		FormName.yy_wxb_ygmc.focus();
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
	if(	javaTrim(FormName.yy_wxbkh_byjh)=="") {
		alert("������[Ŀ��ͻ��������¼ƻ�]��");
		FormName.yy_wxbkh_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbkh_byjh, "Ŀ��ͻ��������¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbkh_bylj)=="") {
		alert("������[Ŀ��ͻ����������ۼ�]��");
		FormName.yy_wxbkh_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbkh_bylj, "Ŀ��ͻ����������ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbkh_szjh)=="") {
		alert("������[Ŀ��ͻ��������ܼƻ�]��");
		FormName.yy_wxbkh_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbkh_szjh, "Ŀ��ͻ��������ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbkh_szwc)=="") {
		alert("������[Ŀ��ͻ������������]��");
		FormName.yy_wxbkh_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbkh_szwc, "Ŀ��ͻ������������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbkh_bzyj)=="") {
		alert("������[Ŀ��ͻ���������Ԥ��]��");
		FormName.yy_wxbkh_bzyj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbkh_bzyj, "Ŀ��ͻ���������Ԥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbdj_byjh)=="") {
		alert("������[��ȡ�����������¼ƻ�]��");
		FormName.yy_wxbdj_byjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbdj_byjh, "��ȡ�����������¼ƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbdj_bylj)=="") {
		alert("������[��ȡ�������������ۼ�]��");
		FormName.yy_wxbdj_bylj.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbdj_bylj, "��ȡ�������������ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbdj_szjh)=="") {
		alert("������[��ȡ�����������ܼƻ�]��");
		FormName.yy_wxbdj_szjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbdj_szjh, "��ȡ�����������ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbdj_szwc)=="") {
		alert("������[��ȡ���������������]��");
		FormName.yy_wxbdj_szwc.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbdj_szwc, "��ȡ���������������"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxbdj_bzjh)=="") {
		alert("������[��ȡ�����������ܼƻ�]��");
		FormName.yy_wxbdj_bzjh.focus();
		return false;
	}
	if(!(isNumber(FormName.yy_wxbdj_bzjh, "��ȡ�����������ܼƻ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_wxb_lrr)=="") {
		alert("������[¼����]��");
		FormName.yy_wxb_lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.yy_wxb_lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.yy_wxb_lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_wxb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
