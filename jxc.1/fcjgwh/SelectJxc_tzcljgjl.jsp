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
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_tzcljgjlList.jsp" name="selectform">
<div align="center">Ԥ�ȵ����۸�ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ϱ���</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_clbm" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <select name="jxc_tzcljgjl_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
	</select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="jxc_tzcljgjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="jxc_tzcljgjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"> 
    <select name="jxc_tzcljgjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ɱ���</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_cbj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">�г����</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_lsj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ۼ�</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_xsj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">�Էֹ�˾�۸�</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_dfgsjg" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Թ����۸�</td> 
  <td width="32%"> 
    <input type="text" name="jxc_tzcljgjl_dgzjg" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�¼۸���Чʱ�� ��</td>
  <td><input type="text" name="jxc_tzcljgjl_sxsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_tzcljgjl_sxsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�޸�״̬</td>
  <td>
	<INPUT name="jxc_tzcljgjl_xgzt" type="radio" value="N" checked>
	δ��</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʵ���޸�ʱ�� ��</td> 
  <td width="32%"><input type="text" name="jxc_tzcljgjl_xgsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="jxc_tzcljgjl_xgsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
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
	if(!(isDatetime(FormName.jxc_tzcljgjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_tzcljgjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_tzcljgjl_cbj, "�ɱ���"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_tzcljgjl_lsj, "�г����"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_tzcljgjl_xsj, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_tzcljgjl_dfgsjg, "�Էֹ�˾�۸�"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_tzcljgjl_dgzjg, "�Թ����۸�"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_tzcljgjl_sxsj, "��Чʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_tzcljgjl_sxsj2, "��Чʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_tzcljgjl_xgsj, "�޸�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_tzcljgjl_xgsj2, "�޸�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
