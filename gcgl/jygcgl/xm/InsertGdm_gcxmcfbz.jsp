<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String xmbm=cf.GB2Uni(request.getParameter("xmbm"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertGdm_gcxmcfbz.jsp" name="insertform" >
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ŀ����</td> 
  <td width="32%"> 
    <input type="text" name="xmbm" value="<%=xmbm%>" size="20" maxlength="5" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">Υ�漶��</td>
  <td><select name="wgjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select wgjbbm,wgjbmc from gdm_wgjbbm order by wgjbbm","");
%>
  </select></td>
  <td align="right">����Ҫ��</td>
  <td><select name="zgyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select zgyq c1,zgyq c2 from gdm_zgyq order by zgyq","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������Աְ��</td> 
  <td width="32%"> 
    <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xzzwbm c1,xzzwbm c2 from gdm_cfry order by xzzwbm","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">Ա��������</td>
  <td><input type="text" name="ygfkje" value="0" size="20" maxlength="17" ></td>
  <td align="right">Ա���۷�</td>
  <td><input type="text" name="ygkf" value="0" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʩ���ӷ�����</td> 
  <td width="32%"><input type="text" name="sgdfkje" value="0" size="20" maxlength="17" ></td>
  <td align="right" width="18%">ʩ���ӿ۷�</td> 
  <td width="32%"><input type="text" name="sgdkf" value="0" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.xmbm)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wgjbbm)=="") {
		alert("��ѡ��[Υ�漶��]��");
		FormName.wgjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xzzwbm)=="") {
		alert("��ѡ��[������Աְ��]��");
		FormName.xzzwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdkf)=="") {
		alert("������[ʩ���ӿ۷�]��");
		FormName.sgdkf.focus();
		return false;
	}
	if(!(isNumber(FormName.sgdkf, "ʩ���ӿ۷�"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfkje)=="") {
		alert("������[ʩ���ӷ�����]��");
		FormName.sgdfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfkje, "ʩ���ӷ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.ygkf)=="") {
		alert("������[Ա���۷�]��");
		FormName.ygkf.focus();
		return false;
	}
	if(!(isNumber(FormName.ygkf, "Ա���۷�"))) {
		return false;
	}
	if(	javaTrim(FormName.ygfkje)=="") {
		alert("������[Ա��������]��");
		FormName.ygfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.ygfkje, "Ա��������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
