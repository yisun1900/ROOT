<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<html>
<head>
<title>��Ա��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_ryzbsq.jsp" name="insertform" id="insertform" target="_blank">
<div align="center">��Ա��������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">�걨�ֹ�˾</td>
    <td width="35%"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
    </select></td>
	    <td align="right" width="15%">���벿��</td>
    <td width="35%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%>
    </select>
    </td>

  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">����ְ��</td>
    <td width="35%"><select name="zbzw" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm","");
%>
    </select>
    </td>
    <td align="right" width="15%">����Ա��</td>
    <td width="35%"><input type="text" name="zbye"  value="" size="20" maxlength="8" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">��������</td>
    <td width="35%"><select name="zbly" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="setText(this)" >
      <option value=""></option>
      <option value="1">ȱԱ����</option>
      <option value="2">�������</option>
      <option value="3">��������</option>
      <option value="4">����</option>
    </select>
    </td>
	    <td align="right" width="15%">��������</td>
    <td width="35%" ><input type="text" name="zbqt" value="" id="zbqt" size="20" maxlength="20" disabled>
    ѡ��<span class="STYLE2">������</span>��д    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">ϣ������ʱ��</td>
    <td width="35%"><input type="text" name="xwdgsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right" width="15%">�ȴ�����</td>
    <td width="35%">
		<select name="ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
			<option value=""></option>
							  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{%> 
			<option value="0150">�ܲã��ȴ����³�����</option>
			<option value="0160">���ܲã��ȴ��ܲ����</option>
			<option value="0170">�����ܼ�/�ܲ������ȴ��ֹܸ��ܲ����</option>
			<option value="0180">���ž����ȴ������ܼ����</option>
			<option value="0190">����Ա�����ȴ����ž������</option>
			<option value="0110">�ܾ����ȴ����������ܼ����</option>
			<option value="0120">���ܾ���/�ܾ��������ȴ������������</option>
			<option value="0130">���ž����ȴ������������</option>
			<option value="0140">�ֹ�˾Ա�����ȴ�������Դ�����������</option>
		<%}
		else{%> 
			<option value="0110">�ܾ����ȴ����������ܼ����</option>
			<option value="0120">���ܾ���/�ܾ��������ȴ������������</option>
			<option value="0130">���ž����ȴ������������</option>
			<option value="0140">�ֹ�˾Ա�����ȴ�������Դ�����������</option>

		<%}%>
		</select>

    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">�Ա�</td>
    <td width="35%"><select name="xb" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <option value="0">������</option>
      <option value="1">��</option>
      <option value="2">Ů</option>
    </select>
    </td>
    <td align="right" width="15%">����</td>
    <td width="35%"><select name="hy" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <option value="0">������</option>
      <option value="1">�ѻ�</option>
      <option value="2">δ��</option>
    </select>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">����</td>
    <td width="35%"><input type="text" name="nl" value="" size="20" maxlength="20" >
    </td>
    <td align="right" width="15%">ѧ��</td>
    <td width="35%"><select name="xl" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <option value="0">����</option>
      <option value="1">��ר</option>
      <option value="2">��ѧ</option>
      <option value="3">˶ʿ</option>
    </select>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">רҵ</td>
    <td width="35%"><input type="text" name="zy" value="" size="20" maxlength="40" >
    </td>
    <td align="right" width="15%">����</td>
    <td width="35%"><input type="text" name="wy" value="" size="20" maxlength="20" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">���������</td>
    <td width="35%"><input type="text" name="jsjnl" value="" size="20" maxlength="20" >
    </td>
    <td align="right" width="15%">��������</td>
    <td width="35%"><input type="text" name="gzjy" value="" size="20" maxlength="20" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">����</td>
    <td width="35%"><input type="text" name="gx" value="" size="20" maxlength="60" >
    </td>
    <td align="right" width="15%">����</td>
    <td width="35%"><input type="text" name="jn" value="" size="20" maxlength="40" >
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">����</td>
    <td width="35%" colspan="3"><input type="text" name="qt" value="" size="20" maxlength="200" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">������Ա��������</td>
    <td width="35%" colspan="3">
	<textarea name="rygznr" cols="70" rows="2"></textarea>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%"><span class="STYLE1">¼����</span></td>
    <td width="35%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
    </td>
	    <td align="right" width="15%"><span class="STYLE1">¼��ʱ��</span></td>
    <td width="35%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
    </td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">��ע</td>
    <td width="35%" colspan="3">
	<textarea name="bz" cols="70" rows="2"></textarea>
    </td>
  </tr>
  <tr align="center">
    <td colspan="4">
	    <input name="ssfgs" type="hidden" value="<%=ssfgs%>">
		<input name="button" type="button" onClick="f_do(insertform)"  value="����">
        <input type="reset"  value="����" name="reset">
    </td>
  </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function setText(obj)
{
	var valsel = obj.value;
	var textid = document.getElementById("zbqt");
	if(valsel != "4")
	 textid.disabled = true;
	else
	 textid.disabled = false;
}
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgs)=="") {
		alert("��ѡ��[�걨�ֹ�˾]��");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[���벿��]��");
		FormName.dwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.zbye)=="") {
		alert("������[����Ա��]��");
		FormName.zbye.focus();
		return false;
	}
	if(!(isNumber(FormName.zbye, "����Ա��"))) {
		return false;
	}
	if(	javaTrim(FormName.zbzw)=="") {
		alert("������[����ְ��]��");
		FormName.zbzw.focus();
		return false;
	}
	if(	javaTrim(FormName.zbly)=="") {
		alert("��ѡ��[��������]��");
		FormName.zbly.focus();
		return false;
	}
	if(	javaTrim(FormName.xwdgsj)=="") {
		alert("������[ϣ������ʱ��]��");
		FormName.xwdgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xwdgsj, "ϣ������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xb)=="") {
		alert("��ѡ��[�Ա�]��");
		FormName.xb.focus();
		return false;
	}
	if(	javaTrim(FormName.hy)=="") {
		alert("��ѡ��[����]��");
		FormName.hy.focus();
		return false;
	}
	if(	javaTrim(FormName.nl)=="") {
		alert("������[����]��");
		FormName.nl.focus();
		return false;
	}
	if(	javaTrim(FormName.xl)=="") {
		alert("��ѡ��[ѧ��]��");
		FormName.xl.focus();
		return false;
	}
	if(	javaTrim(FormName.zy)=="") {
		alert("������[רҵ]��");
		FormName.zy.focus();
		return false;
	}
	if(	javaTrim(FormName.wy)=="") {
		alert("������[����]��");
		FormName.wy.focus();
		return false;
	}
	if(	javaTrim(FormName.gzjy)=="") {
		alert("������[��������]��");
		FormName.gzjy.focus();
		return false;
	}
	if(	javaTrim(FormName.gx)=="") {
		alert("������[����]��");
		FormName.gx.focus();
		return false;
	}
	if(	javaTrim(FormName.jn)=="") {
		alert("������[����]��");
		FormName.jn.focus();
		return false;
	}
	if(	javaTrim(FormName.rygznr)=="") {
		alert("������[������Ա��������]��");
		FormName.rygznr.focus();
		return false;
	}
	if(	javaTrim(FormName.ztbm)=="") {
		alert("������[�ȴ����]��");
		FormName.ztbm.focus();
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
