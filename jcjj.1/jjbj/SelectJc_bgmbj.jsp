<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">�Ͳ��ű��ۣ�ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ͳ��ű��루6λ��</td> 
  <td width="32%"> 
    <input type="text" name="xcmbm" size="20" maxlength="6" >  </td>
  <td align="right" width="15%">�Ͳ�������</td> 
  <td width="35%"> 
    <select name="xcmlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xcmlxbm,xcmlxmc from jdm_xcmlxbm order by xcmlxbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>������</strong>���߿��ͺ�<BR>
	  <strong>����</strong>������<BR>
	  <strong>����</strong>������<BR>
	  <strong>�������</strong>������</td> 
  <td colspan="3"> 
    <input type="text" name="bklxxh" size="70" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>������</strong>������<br>
    <strong>����</strong>����ɫ<br>
    <strong>����</strong>����ɫ<br>
    <strong>�������</strong>������</td>
  <td colspan="3"><input type="text" name="mbcl" size="70" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">о������</td> 
  <td colspan="3"> 
    <input type="text" name="xbpz" size="70" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">װ������</td>
  <td colspan="3"><input type="text" name="zsxt" size="70" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƽ۷�ʽ</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "jjfs","1+ƽ�׵���&2+ƽ�׵��ۣ�������׵���","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ƽ�׵���</td> 
  <td width="32%"><input type="text" name="pmdj" size="20" maxlength="17" ></td>
  <td align="right" width="15%">���׵���</td> 
  <td width="35%"><input type="text" name="ymdj" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><input type="text" name="lrr" size="20" maxlength="20" ></td>
  <td align="right">��Ƭ����</td>
  <td><input type="text" name="zpmc" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">��</td> 
  <td width="35%"><input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
    <input name="button" type="button" onClick="f_dc(selectform)"  value="��������">  
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
function f_do(FormName)//����FormName:Form������
{
	if(!(isFloat(FormName.pmdj, "ƽ�׵���"))) {
		return false;
	}
	if(!(isFloat(FormName.ymdj, "���׵���"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	FormName.target="";
	FormName.action="Jc_bgmbjList.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//����FormName:Form������
{
	if(!(isFloat(FormName.pmdj, "ƽ�׵���"))) {
		return false;
	}
	if(!(isFloat(FormName.ymdj, "���׵���"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	FormName.target="_blank";
	FormName.action="Jc_bgmbjDcList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
