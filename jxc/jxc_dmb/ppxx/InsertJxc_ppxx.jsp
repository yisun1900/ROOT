<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_ppxx.jsp" name="insertform" target="_blank">
<div align="center">��¼����Ʒ����Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ʒ�����</td>
  <td>
  <select name="pplb" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changePplb(insertform)">
    <option value=""></option>
    <option value="1">����</option>
    <option value="2">����</option>
  </select></td>
  <td width="18%" rowspan="7" align="right"><font color="#FF0000">*</font>�����ֹ�˾</td>
  <td width="32%" rowspan="7">
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="13" multiple>
    <%
	cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwlx='F0' order by cxbz,dwbh","");
%>
  </select>
   </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����С��</td>
  <td>
  <select name="clxl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange=";insertform.ppmc.value=insertform.scsmc.value+this.value">
    <option value=""></option>
    <%
	out.print("<optgroup label=\"������\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='1'  order by clxlmc","");
	out.print("<optgroup label=\"������\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='2'  order by clxlmc","");
	out.print("<optgroup label=\"ͨ����\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='3'  order by clxlmc","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>Ʒ��</td> 
  <td width="32%">
  
  <select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="insertform.ppmc.value=this.value+insertform.clxl.value">
    <option value=""></option>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ʒ��</td>
  <td><input type="text" name="ppmc" value="" size="20" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ�Ƹ�����</td>
  <td><input name="ppfzr" type="text" id="ppfzr" value="" size="20" maxlength="20" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><input type="text" name="cwdm" size="20" maxlength="20" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ÿ�հ�װ��������</td> 
  <td width="32%"><input type="text" name="mrazhs" value="" size="20" maxlength="8" ></td>
  </tr>
<tr bgcolor="#CCCCFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ����Ż�</td>
  <td><input type="radio" name="sfyyh" value="N">
    ��
    <input type="radio" name="sfyyh" value="Y">
    �� </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">�Żݿ�ʼʱ��</td>
  <td><input type="text" name="yhkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">�Żݽ���ʱ��</td>
  <td><input type="text" name="yhjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">�Ż�����</td>
  <td colspan="3"><textarea name="yhnr" cols="70" rows="3"></textarea>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
      <textarea name="bz" cols="71" rows="2"></textarea>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset"></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//����AJAX
%>

function changePplb(FormName) 
{
	FormName.scsmc.length=1;

	if (FormName.pplb.value=="")
	{
		return;
	}


	var sql;
	sql="select scsmc from jxc_scsxx where scslb in ('3','"+FormName.pplb.value+"') order by scsmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToItem2(insertform.scsmc,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.pplb)=="") {
		alert("��ѡ��[��Ʒ�����]��");
		FormName.pplb.focus();
		return false;
	}

	if(	javaTrim(FormName.clxl)=="") {
		alert("������[����С��]��");
		FormName.clxl.focus();
		return false;
	}


	if(	javaTrim(FormName.scsmc)=="") {
		alert("������[Ʒ��]��");
		FormName.scsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("������[��Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(!(isNumber(FormName.mrazhs, "ÿ�հ�װ��������"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
		return false;
	}
	if (FormName.sfyyh[1].checked)
	{
		if(	javaTrim(FormName.yhkssj)=="") {
			alert("������[�Żݿ�ʼʱ��]��");
			FormName.yhkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhkssj, "�Żݿ�ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.yhjzsj)=="") {
			alert("������[�Żݽ���ʱ��]��");
			FormName.yhjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhjzsj, "�Żݽ���ʱ��"))) {
			return false;
		}
		if (FormName.yhkssj.value>FormName.yhjzsj.value)
		{
			alert("[�Żݿ�ʼʱ��]���ܴ���[�Żݽ���ʱ��]��");
			FormName.yhjzsj.select();
			return false;
		}
		if(	javaTrim(FormName.yhnr)=="") {
			alert("������[�Ż�����]��");
			FormName.yhnr.focus();
			return false;
		}
	}
	else{
		FormName.yhkssj.value="";
		FormName.yhjzsj.value="";
		FormName.yhnr.value="";
	}

	if(	!selectChecked(FormName.ssfgs)) {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
