<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_jrsgdjsList.jsp" name="selectform">
<div align="center">�����ѣ��޸�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����¼��</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrbgf_jsjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrbgf_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ�����</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">���ݵ�ַ</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ͬ��</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">ʩ����</td> 
  <td width="32%"> 
    <select name="cw_jrbgf_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','') from sq_sgd","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʩ���೤</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrbgf_sgbz" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������� ��</td>
  <td><input type="text" name="cw_jrbgf_jsrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_jrbgf_jsrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td colspan="3"><%
	cf.radioToken(out, "cw_jrbgf_lx","2+һ�β�����&5+���β�����&8+�깤����","2");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����״̬</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "cw_jrbgf_clzt","1+����&2+����ͬ��&3+������ͬ��","");
%>  </td>
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrbgf_spr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʱ�� ��</td>
  <td><input type="text" name="cw_jrbgf_spsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_jrbgf_spsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"><input type="text" name="cw_jrbgf_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"><select name="cw_jrbgf_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ���</td> 
  <td width="32%"><input type="text" name="cw_jrbgf_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="cw_jrbgf_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
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
	if(!(isDatetime(FormName.cw_jrbgf_jsrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrbgf_jsrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrbgf_spsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrbgf_spsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrbgf_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrbgf_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
