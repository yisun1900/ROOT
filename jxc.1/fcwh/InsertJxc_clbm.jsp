<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_clbm.jsp" name="insertform" target="_blank">
<div align="center">��¼�븨��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>���ϴ���</td>
    <td>
	<select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeCldlbm(insertform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('2','3') order by cldlmc","");
%>
    </select></td>
    <td align="right"><span class="STYLE1">*</span>����С��</td>
    <td>
	<select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeClxlbm(insertform)">
        <option value=""></option>
    </select>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>��Ʒ��</td>
    <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" >
      <option value=""></option>
      <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('2','3') order by ppmc","");
%>
    </select></td>
    <td align="right"><span class="STYLE1">*</span>�ɹ����</td>
    <td><input type="radio" name="cglb" value="J">
      ���Ųɹ�
        <input type="radio" name="cglb" value="D">
      �ط��ɹ� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td colspan="3"><input type="text" name="clmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ڲ�����</td>
  <td><input type="text" name="nbbm" value="" size="20" maxlength="100" ></td>
  <td align="right"><span class="STYLE1">*</span>������λ</td>
  <td><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͺ�</td>
  <td><input type="text" name="xh" value="" size="20" maxlength="100" ></td>
  <td align="right">���</td>
  <td><input type="text" name="gg" value="" size="20" maxlength="100" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input type="text" name="djzl" value="" size="20" maxlength="100" >
KG</td>
  <td align="right"><span class="STYLE1">*</span>��װ������λ</td>
  <td><select name="bzjldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��װ���</td>
  <td colspan="3"><input type="text" name="bzgg" value="" size="12" maxlength="8" >
    ��&gt;=1�� ��װ������λ/������λ</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">���ϳߴ�</td>
  <td colspan="3">��
    <input type="text" name="clcd" value="" size="10" maxlength="100" >
    cm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��
    <input type="text" name="clkd" value="" size="10" maxlength="100" >
    cm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��
    <input type="text" name="clgd" value="" size="10" maxlength="100" >
    cm</td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="bzq" value="" size="10" maxlength="10" >
    ��</td>
  <td align="right" width="18%">����������</td> 
  <td width="32%"> 
    <input type="text" name="bztxq" value="" size="10" maxlength="10" >
    �� </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ɹ�����</td> 
  <td width="32%"><input type="text" name="cgzq" value="" size="10" maxlength="10" >
    ��</td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000FF">¼����</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>  </td>
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>  </td>
</tr>

    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input name="button" type="button" onClick="f_dr(insertform)"  value="����">
	<input type="reset"  value="����" name="reset"> 
	
	<BR><BR> 
	<A HREF="������Ϣ.xls"><B>����Ҽ����Ϊ������Excel����ģ��</B></A>
	
	</td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//����AJAX
%>

var lx="";

function changeCldlbm(FormName) //�ı������б��ֵ������Ajax
{
	FormName.clxlbm.length=1;
	FormName.ppmc.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}

	lx="1";

	var sql;
	sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeClxlbm(FormName) //�ı������б��ֵ������Ajax
{
	FormName.ppmc.length=1;

	if (FormName.clxlbm.value=="")
	{
		return;
	}

	lx="2";

	var sql;
	sql="select ppmc from jxc_ppxx where pplb in('2','3') and cldl='"+FormName.cldlbm.value+"'  order by ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		strToItem2(insertform.clxlbm,ajaxRetStr);
	}
	else if (lx=="2")
	{
		strToItem2(insertform.ppmc,ajaxRetStr);
	}
}



function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.cldlbm)=="") {
		alert("������[���ϴ���]��");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("������[����С��]��");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[��Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.cglb)) {
		alert("��ѡ��[�ɹ����]��");
		FormName.cglb[0].focus();
		return false;
	}

	if(	javaTrim(FormName.clmc)=="") {
		alert("������[��������]��");
		FormName.clmc.focus();
		return false;
	}

	if(javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
	if(javaTrim(FormName.bzjldwbm)=="") {
		alert("��ѡ��[��װ������λ]��");
		FormName.bzjldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bzgg)=="") {
		alert("������[��װ���]��");
		FormName.bzgg.focus();
		return false;
	}
	if(!(isNumber(FormName.bzgg, "��װ���"))) {
		return false;
	}
	if (parseFloat(FormName.bzgg.value)<1)
	{
		alert("[��װ���]������ڻ��ߵ���1��");
		FormName.bzgg.select();
		return false;
	}

	if(!(isFloat(FormName.djzl, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.clcd, "��"))) {
		return false;
	}
	if(!(isFloat(FormName.clkd, "��"))) {
		return false;
	}
	if(!(isFloat(FormName.clgd, "��"))) {
		return false;
	}
	if(!(isNumber(FormName.bzq, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.bztxq, "����������"))) {
		return false;
	}
	if(!(isNumber(FormName.cgzq, "�ɹ�����"))) {
		return false;
	}

	FormName.action="SaveInsertJxc_clbm.jsp";
	FormName.submit();
	return true;
}

function f_dr(FormName)//����FormName:Form������
{
	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
