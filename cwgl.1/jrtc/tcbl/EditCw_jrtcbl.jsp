<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
double dzsjftcbl=0;
double dzzxftcbl=0;
double wyzxftcbl=0;
double khjlsjftcbl=0;
double khjlzxftcbl=0;
double sjssjftcbl=0;
double sjszxftcbl=0;
double sjsycftcbl=0;
double zjzxftcbl=0;
double zjycftcbl=0;
double xqzgzxftcbl=0;
double xqzzzxftcbl=0;
double xqzyzxftcbl=0;
double wlyxzgzxftcbl=0;
double yxzyzxftcbl=0;
double wzchzxftcbl=0;
double wysjzxftcbl=0;
double wzcxyzxftcbl=0;
double dhzyzxftcbl=0;
double wztgyzxftcbl=0;
double sjzxftcbl=0;
double clyzxftcbl=0;
String lrr=null;
String lrsj=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,dzsjftcbl,dzzxftcbl,wyzxftcbl,khjlsjftcbl,khjlzxftcbl,sjssjftcbl,sjszxftcbl,sjsycftcbl,zjzxftcbl,zjycftcbl,xqzgzxftcbl,xqzzzxftcbl,xqzyzxftcbl,wlyxzgzxftcbl,yxzyzxftcbl,wzchzxftcbl,wysjzxftcbl,wzcxyzxftcbl,dhzyzxftcbl,wztgyzxftcbl,sjzxftcbl,clyzxftcbl,lrr,lrsj ";
	ls_sql+=" from  cw_jrtcbl";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dzsjftcbl=rs.getDouble("dzsjftcbl");
		dzzxftcbl=rs.getDouble("dzzxftcbl");
		wyzxftcbl=rs.getDouble("wyzxftcbl");
		khjlsjftcbl=rs.getDouble("khjlsjftcbl");
		khjlzxftcbl=rs.getDouble("khjlzxftcbl");
		sjssjftcbl=rs.getDouble("sjssjftcbl");
		sjszxftcbl=rs.getDouble("sjszxftcbl");
		sjsycftcbl=rs.getDouble("sjsycftcbl");
		zjzxftcbl=rs.getDouble("zjzxftcbl");
		zjycftcbl=rs.getDouble("zjycftcbl");
		xqzgzxftcbl=rs.getDouble("xqzgzxftcbl");
		xqzzzxftcbl=rs.getDouble("xqzzzxftcbl");
		xqzyzxftcbl=rs.getDouble("xqzyzxftcbl");
		wlyxzgzxftcbl=rs.getDouble("wlyxzgzxftcbl");
		yxzyzxftcbl=rs.getDouble("yxzyzxftcbl");
		wzchzxftcbl=rs.getDouble("wzchzxftcbl");
		wysjzxftcbl=rs.getDouble("wysjzxftcbl");
		wzcxyzxftcbl=rs.getDouble("wzcxyzxftcbl");
		dhzyzxftcbl=rs.getDouble("dhzyzxftcbl");
		wztgyzxftcbl=rs.getDouble("wztgyzxftcbl");
		sjzxftcbl=rs.getDouble("sjzxftcbl");
		clyzxftcbl=rs.getDouble("clyzxftcbl");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jrtcbl.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">�ֹ�˾</td> 
  <td width="28%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx",fgsbh);
%>
    </select>  </td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�곤��Ʒ���ɱ���</td>
  <td><input type="text" name="dzsjftcbl" size="10" maxlength="17"  value="<%=dzsjftcbl%>" >
    %</td>
  <td align="right">�곤װ�޷���ɱ���</td>
  <td><input type="text" name="dzzxftcbl" size="10" maxlength="17"  value="<%=dzzxftcbl%>" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">��Աװ�޷���ɱ���</td> 
  <td width="28%"><input type="text" name="wyzxftcbl" size="10" maxlength="17"  value="<%=wyzxftcbl%>" >
    %</td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">ҵ��Ա��Ʒ���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="khjlsjftcbl" size="10" maxlength="17"  value="<%=khjlsjftcbl%>" >
    % </td>
  <td align="right" width="22%">ҵ��Աװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="khjlzxftcbl" size="10" maxlength="17"  value="<%=khjlzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">���ʦ��Ʒ���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="sjssjftcbl" size="10" maxlength="17"  value="<%=sjssjftcbl%>" >
    % </td>
  <td align="right" width="22%">���ʦװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="sjszxftcbl" size="10" maxlength="17"  value="<%=sjszxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">���ʦԶ�̷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="sjsycftcbl" size="10" maxlength="17"  value="<%=sjsycftcbl%>" >
    % </td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͻ�����װ�޷���ɱ���</td>
  <td><input type="text" name="zjzxftcbl" size="10" maxlength="17"  value="<%=zjzxftcbl%>" >
% </td>
  <td align="right">�ͻ�����Զ�̷���ɱ���</td>
  <td><input type="text" name="zjycftcbl" size="10" maxlength="17"  value="<%=zjycftcbl%>" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">����Աװ�޷���ɱ���</td> 
  <td width="28%"><input type="text" name="clyzxftcbl" size="10" maxlength="17"  value="<%=clyzxftcbl%>" >
%</td>
  <td align="right" width="22%">С������װ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="xqzgzxftcbl" size="10" maxlength="17"  value="<%=xqzgzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">С���鳤װ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="xqzzzxftcbl" size="10" maxlength="17"  value="<%=xqzzzxftcbl%>" >
    % </td>
  <td align="right" width="22%">С��רԱװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="xqzyzxftcbl" size="10" maxlength="17"  value="<%=xqzyzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">����Ӫ������װ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="wlyxzgzxftcbl" size="10" maxlength="17"  value="<%=wlyxzgzxftcbl%>" >
    % </td>
  <td align="right" width="22%">Ӫ��רԱװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="yxzyzxftcbl" size="10" maxlength="17"  value="<%=yxzyzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">��վ�߻�װ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="wzchzxftcbl" size="10" maxlength="17"  value="<%=wzchzxftcbl%>" >
    % </td>
  <td align="right" width="22%">��ҳ���װ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="wysjzxftcbl" size="10" maxlength="17"  value="<%=wysjzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">��վ����Աװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="wzcxyzxftcbl" size="10" maxlength="17"  value="<%=wzcxyzxftcbl%>" >
    % </td>
  <td align="right" width="22%">�绰רԱװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="dhzyzxftcbl" size="10" maxlength="17"  value="<%=dhzyzxftcbl%>" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">��վ�ƹ�Աװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="wztgyzxftcbl" size="10" maxlength="17"  value="<%=wztgyzxftcbl%>" >
    % </td>
  <td align="right" width="22%">˾��װ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="sjzxftcbl" size="10" maxlength="17"  value="<%=sjzxftcbl%>" >
    % </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">¼����</td> 
  <td width="28%"><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" ></td>
  <td align="right" width="22%">¼��ʱ�� </td>
  <td width="28%"><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" ></td>
</tr>
<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dzsjftcbl)=="") {
		alert("������[�곤��Ʒ���ɱ���]��");
		FormName.dzsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzsjftcbl, "�곤��Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dzzxftcbl)=="") {
		alert("������[�곤װ�޷���ɱ���]��");
		FormName.dzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzzxftcbl, "�곤װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wyzxftcbl)=="") {
		alert("������[��Աװ�޷���ɱ���]��");
		FormName.wyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wyzxftcbl, "��Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlsjftcbl)=="") {
		alert("������[ҵ��Ա��Ʒ���ɱ���]��");
		FormName.khjlsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlsjftcbl, "ҵ��Ա��Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlzxftcbl)=="") {
		alert("������[ҵ��Աװ�޷���ɱ���]��");
		FormName.khjlzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlzxftcbl, "ҵ��Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjssjftcbl)=="") {
		alert("������[���ʦ��Ʒ���ɱ���]��");
		FormName.sjssjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjssjftcbl, "���ʦ��Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjszxftcbl)=="") {
		alert("������[���ʦװ�޷���ɱ���]��");
		FormName.sjszxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjszxftcbl, "���ʦװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsycftcbl)=="") {
		alert("������[���ʦԶ�̷���ɱ���]��");
		FormName.sjsycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsycftcbl, "���ʦԶ�̷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zjzxftcbl)=="") {
		alert("������[�ͻ�����װ�޷���ɱ���]��");
		FormName.zjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjzxftcbl, "�ͻ�����װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zjycftcbl)=="") {
		alert("������[�ͻ�����Զ�̷���ɱ���]��");
		FormName.zjycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycftcbl, "�ͻ�����Զ�̷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgzxftcbl)=="") {
		alert("������[С������װ�޷���ɱ���]��");
		FormName.xqzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgzxftcbl, "С������װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzzxftcbl)=="") {
		alert("������[С���鳤װ�޷���ɱ���]��");
		FormName.xqzzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzzxftcbl, "С���鳤װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyzxftcbl)=="") {
		alert("������[С��רԱװ�޷���ɱ���]��");
		FormName.xqzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyzxftcbl, "С��רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgzxftcbl)=="") {
		alert("������[����Ӫ������װ�޷���ɱ���]��");
		FormName.wlyxzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgzxftcbl, "����Ӫ������װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yxzyzxftcbl)=="") {
		alert("������[Ӫ��רԱװ�޷���ɱ���]��");
		FormName.yxzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yxzyzxftcbl, "Ӫ��רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wzchzxftcbl)=="") {
		alert("������[��վ�߻�װ�޷���ɱ���]��");
		FormName.wzchzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzchzxftcbl, "��վ�߻�װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wysjzxftcbl)=="") {
		alert("������[��ҳ���װ�޷���ɱ���]��");
		FormName.wysjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wysjzxftcbl, "��ҳ���װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wzcxyzxftcbl)=="") {
		alert("������[��վ����Աװ�޷���ɱ���]��");
		FormName.wzcxyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcxyzxftcbl, "��վ����Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dhzyzxftcbl)=="") {
		alert("������[�绰רԱװ�޷���ɱ���]��");
		FormName.dhzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dhzyzxftcbl, "�绰רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyzxftcbl)=="") {
		alert("������[��վ�ƹ�Աװ�޷���ɱ���]��");
		FormName.wztgyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyzxftcbl, "��վ�ƹ�Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzxftcbl)=="") {
		alert("������[˾��װ�޷���ɱ���]��");
		FormName.sjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzxftcbl, "˾��װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.clyzxftcbl)=="") {
		alert("������[����Աװ�޷���ɱ���]��");
		FormName.clyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.clyzxftcbl, "����Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
