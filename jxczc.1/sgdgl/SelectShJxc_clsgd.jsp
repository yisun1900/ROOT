<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_clsgdShList.jsp" name="selectform">
<div align="center">�깺�������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�깺��˾</td>
  <td><select name="jxc_clsgd_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
		%> 
  </select></td>
  <td align="right">�깺��״̬</td>
  <td><select name="jxc_clsgd_sgdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="1">���ύ</option>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�깺����</td> 
  <td width="32%"><input type="text" name="jxc_clsgd_sgph" size="20" maxlength="13" ></td>
  <td align="right" width="18%">�깺��</td> 
  <td width="32%"><input type="text" name="jxc_clsgd_sgr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�깺���� ��</td>
  <td><input type="text" name="jxc_clsgd_sgrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_clsgd_sgrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�깺������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clsgd_sgzsl" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">�깺�ܽ��</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clsgd_sgzje" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ��ͻ�ʱ�� ��</td>
  <td><input type="text" name="jxc_clsgd_jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_clsgd_jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ͷ�ʽ</td>
  <td><INPUT type="radio" name="jxc_clsgd_psfs" value="1">
    ����
    <INPUT type="radio" name="jxc_clsgd_psfs" value="2">
    ��ȡ
    <INPUT type="radio" name="jxc_clsgd_psfs" value="9">
    ���� </td>
  <td align="right">�����</td>
  <td><input type="text" name="jxc_clsgd_shr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">������� ��</td>
  <td><input type="text" name="jxc_clsgd_shrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_clsgd_shrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ��տ�</td> 
  <td width="32%"> 
    <INPUT type="radio" name="jxc_clsgd_sfsk" value="Y">���տ�
    <INPUT type="radio" name="jxc_clsgd_sfsk" value="N">δ�տ�  </td>
  <td align="right" width="18%">�տ�ȷ����</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clsgd_skqrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�տ�ȷ��ʱ�� ��</td>
  <td><input type="text" name="jxc_clsgd_skqrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_clsgd_skqrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ���ת�ɹ���</td> 
  <td width="32%"><input type="radio" name="jxc_clsgd_sfzcgd" value="Y">
    ��ת
      <input type="radio" name="jxc_clsgd_sfzcgd" value="N">
      δת </td>
  <td align="right" width="18%">�깺���</td> 
  <td width="32%"><input type="radio" name="jxc_clsgd_sglb" value="0">
����
  <input type="radio" name="jxc_clsgd_sglb" value="1">
���� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clsgd_ckph" size="20" maxlength="11" >  </td>
  <td align="right" width="18%">�������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clsgd_rkph" size="20" maxlength="11" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"><input type="text" name="jxc_clsgd_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"><select name="jxc_clsgd_ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="jxc_clsgd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_clsgd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isDatetime(FormName.jxc_clsgd_sgrq, "�깺����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_sgrq2, "�깺����"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_clsgd_sgzsl, "�깺������"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_clsgd_sgzje, "�깺�ܽ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_jhshsj, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_jhshsj2, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_shrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_shrq2, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_skqrsj, "�տ�ȷ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_skqrsj2, "�տ�ȷ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_clsgd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
