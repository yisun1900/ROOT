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
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJc_bgmbj.jsp" name="insertform" target="_blank">
<div align="center">��¼���Ͳ��ű���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ͳ�������</td> 
  <td width="32%"><select name="xcmlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select xcmlxbm,xcmlxmc from jdm_xcmlxbm order by xcmlxbm","");
%>
  </select></td>
  <td align="right" width="16%">&nbsp;</td> 
  <td width="34%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>������</strong>���߿��ͺ�<BR>
    <strong>����</strong>������<BR>
    <strong>����</strong>������<BR>
    <strong>�������</strong>������</td> 
  <td colspan="3"> 
    <input type="text" name="bklxxh" value="" size="71" maxlength="50" >
    <span class="STYLE1">*</span> </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>������</strong>������<br>
    <strong>����</strong>����ɫ<br>
    <strong>����</strong>����ɫ<br>
    <strong>�������</strong>������</td>
  <td colspan="3"><input type="text" name="mbcl" value="" size="71" maxlength="50" >
    <span class="STYLE1">*</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">о������</td> 
  <td colspan="3"> 
    <input type="text" name="xbpz" value="" size="71" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">װ������</td>
  <td colspan="3"><input type="text" name="zsxt" value="" size="71" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƽ۷�ʽ</td> 
  <td width="32%"> 
    <input type="radio" name="jjfs"  value="1">ƽ�׵���
    <input type="radio" name="jjfs"  value="2">ƽ�׵��ۣ�������׵���  </td>
  <td align="right" width="16%">��Ƭ����</td> 
  <td width="34%"><input type="text" name="zpmc" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ƽ�׵���</td>
  <td><input type="text" name="pmdj" value="" size="20" maxlength="17" ></td>
  <td align="right"><span class="STYLE1">*</span>���׵���</td>
  <td><input type="text" name="ymdj" value="0" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="32%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="16%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="34%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="70" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
		<input type="button"  value="����" name="bc" onClick="f_do(insertform)">
		<input type="reset"  value="����" name="reset">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" onClick="f_drnewExcel(insertform)"  value="�����Ͳ��ű��ۣ�Excel��" >      
	  <P><A HREF="�Ͳ��ű���.xls"><B>����Ҽ����Ϊ������Excel����ģ��</B></A>      </td>
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
	if(	javaTrim(FormName.xcmlxbm)=="") {
		alert("��ѡ��[�Ͳ�������]��");
		FormName.xcmlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bklxxh)=="") {
		alert("������[�߿��ͺš����͡�����]��");
		FormName.bklxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.mbcl)=="") {
		alert("������[���ϡ���ɫ]��");
		FormName.mbcl.focus();
		return false;
	}
	if(	!radioChecked(FormName.jjfs)) {
		alert("��ѡ��[�Ƽ۷�ʽ]��");
		FormName.jjfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.pmdj)=="") {
		alert("������[ƽ�׵���]��");
		FormName.pmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmdj, "ƽ�׵���"))) {
		return false;
	}
	if(	javaTrim(FormName.ymdj)=="") {
		alert("������[���׵���]��");
		FormName.ymdj.focus();
		return false;
	}
	if(!(isFloat(FormName.ymdj, "���׵���"))) {
		return false;
	}

	if (FormName.jjfs[0].checked)
	{
		if (parseFloat(FormName.pmdj.value)==0)
		{
			alert("[ƽ�׵���]����Ϊ0��");
			FormName.pmdj.select();
			return false;
		}
		if (parseFloat(FormName.ymdj.value)!=0)
		{
			alert("[���׵���]Ӧ��Ϊ0��");
			FormName.ymdj.select();
			return false;
		}
	}
	else{
		if (parseFloat(FormName.pmdj.value)==0)
		{
			alert("[ƽ�׵���]����Ϊ0��");
			FormName.pmdj.select();
			return false;
		}
		if (parseFloat(FormName.ymdj.value)==0)
		{
			alert("[���׵���]����Ϊ0��");
			FormName.ymdj.select();
			return false;
		}
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

	FormName.action="SaveInsertJc_bgmbj.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}

function f_drnewExcel(FormName)//����FormName:Form������
{
	FormName.action="ImpAddDataBgm.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
