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
<form method="post" action="Jxc_fcxsdXgShList.jsp" name="selectform">
<div align="center">���۵������ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_fcxsd_xsph" size="20" maxlength="11" >  </td>
  <td align="right" width="18%">���۵�״̬</td> 
  <td width="32%">
  <select name="jxc_fcxsd_xsdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value=""></option>
	<option value="2">�ȴ�����</option>
	<option value="9">ȡ��</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><select name="jxc_fcxsd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
  </select></td>
  <td align="right">�����ֹ�˾</td>
  <td><select name="jxc_fcxsd_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���۵�����</td> 
  <td width="32%"> 
    <select name="jxc_fcxsd_xsdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
<%
	cf.selectItem(out,"select xsdlx,xsdlxmc from dm_xsdlx order by xsdlx","");
%>
    </select>	</td>
  <td align="right" width="18%">�տ�����</td> 
  <td width="32%"> 
    <select name="jxc_fcxsd_sklx" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
		<option value="1">�ֽ�</option>
		<option value="2">ת��</option>
		<option value="3">֧Ʊ</option>
		<option value="9">����</option>
    </select>	</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ�ȫ��</td> 
  <td width="32%"> 
    <INPUT type="radio" name="jxc_fcxsd_sfqk" value="1">ȫ��
    <INPUT type="radio" name="jxc_fcxsd_sfqk" value="2">���ֿ�
    <INPUT type="radio" name="jxc_fcxsd_sfqk" value="3">δ����  </td>
  <td align="right" width="18%">�ջ�������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_fcxsd_shfmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ջ�����ϵ��ʽ</td> 
  <td width="32%"> 
    <input type="text" name="jxc_fcxsd_shrlxfs" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">�ջ�����ַ</td> 
  <td width="32%"> 
    <input type="text" name="jxc_fcxsd_shfdz" size="20" maxlength="2000" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����Ա</td> 
  <td width="32%"> 
    <input type="text" name="jxc_fcxsd_xsy" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������� ��</td>
  <td><input type="text" name="jxc_fcxsd_xsrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_fcxsd_xsrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="jxc_fcxsd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_fcxsd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"><input type="text" name="jxc_fcxsd_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"> 
    <select name="jxc_fcxsd_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
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
	if(!(isDatetime(FormName.jxc_fcxsd_xsrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_fcxsd_xsrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_fcxsd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_fcxsd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
