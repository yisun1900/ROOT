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
<form method="post" action="Call_initList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="call_init_bjhm" size="20" maxlength="30" >
  </td>
  <td align="right" width="18%">Mac��ַ</td> 
  <td width="32%"> 
    <input type="text" name="call_init_mac" size="20" maxlength="30" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�û�����</td> 
  <td width="32%"> 
    <input type="text" name="call_init_yhbm" size="20" maxlength="30" >
  </td>
  <td align="right" width="18%">�����ֹ�˾</td> 
  <td width="32%"> 
    <select name="call_init_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh","");
%>
    </select> 
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼���ļ�Ŀ¼</td> 
  <td width="32%"> 
    <input type="text" name="call_init_lywjml" size="20" maxlength="100" >
  </td>
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="call_init_lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="call_init_lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"> 
    <select name="call_init_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
  </td>
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
	if(!(isDatetime(FormName.call_init_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
