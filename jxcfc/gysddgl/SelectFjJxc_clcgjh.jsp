<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_clcgjhFjList.jsp" name="selectform">
<div align="center">���ݲɹ��ƻ���>���ɹ�Ӧ�̶���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�����ֹ�˾</td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right">�ƻ���״̬</td>
  <td><select name="jhdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="2">������</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ɹ��ƻ�����</td> 
  <td width="32%"> 
    <input type="text" name="cgjhph" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ɹ����</td>
  <td><select name="cglb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="J">���Ųɹ�</option>
  </select></td>
  <td align="right">�������</td>
  <td><select name="cllb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="1">����</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ƻ���ʼʱ�� ��</td> 
  <td width="32%"><input type="text" name="jhkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="jhkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ�����ʱ�� ��</td>
  <td><input type="text" name="jhjssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jhjssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ƻ���� ��</td> 
  <td width="32%"><input type="text" name="jhje" size="20" maxlength="17" ></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="jhje2" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"><input type="text" name="lrr" value="" size="20" maxlength="20"></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ƻ�����</td> 
  <td colspan="3"><input type="text" name="jhnr" size="73" maxlength="50" ></td>
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
	if(!(isDatetime(FormName.jhkssj, "�ƻ���ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhkssj2, "�ƻ���ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjssj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjssj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.jhje, "�ƻ����"))) {
		return false;
	}
	if(!(isFloat(FormName.jhje2, "�ƻ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
