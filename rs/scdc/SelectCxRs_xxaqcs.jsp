<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_xxaqcsCxList.jsp" name="selectform">
<div align="center">��Ϣ��ȫ���Բ�ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_wtbh" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_wt" size="20" maxlength="400" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�𰸱��</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_dabh" size="20" maxlength="1" >  </td>
  <td align="right" width="18%">��</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_da" size="20" maxlength="400" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">Ա�����</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_ygbh" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">Ա������</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_yhmc" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_lrsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"> 
    <select name="rs_xxaqcs_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ֹ�˾</td> 
  <td width="32%"> 
    <select name="rs_xxaqcs_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" >��ʾ���</td>
  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
    ��ҳ
    <input type="radio" name="xsfg" value="2">
    EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ����
    <input type="text" name="myxssl" size="7" maxlength="13" value="220">
  </td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.rs_xxaqcs_ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_xxaqcs_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>