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
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_yglkgsjlList.jsp" name="selectform">
<div align="center">�뿪��˾���룭ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">������˾</td>
  <td>
  <select name="crm_yglkgsjl_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
  </select>
  </td>
  <td align="right">��Ա����</td>
  <td><select name="crm_yglkgsjl_rylx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rylx c1,rylx c2 from dm_rylx order by rylx","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��¼��</td> 
  <td width="32%"> 
    <input type="text" name="crm_yglkgsjl_jlh" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">Ա�����</td> 
  <td width="32%"> 
    <input type="text" name="crm_yglkgsjl_ygbh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">Ա������</td> 
  <td width="32%"> 
    <input type="text" name="crm_yglkgsjl_yhmc" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">Ա������</td> 
  <td width="32%"> 
    <select name="crm_yglkgsjl_ygbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ��뿪���� ��</td>
  <td><input type="text" name="crm_yglkgsjl_jhlkrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_yglkgsjl_jhlkrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ƻ��뿪ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="crm_yglkgsjl_jhlksj" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">�ƻ�����ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="crm_yglkgsjl_jhfhsj" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�뿪��˾Ŀ��</td> 
  <td width="32%"> 
    <select name="crm_yglkgsjl_lkgsmd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select lkgsmd c1,lkgsmd c2 from dm_lkgsmd order by lkgsmd","");
%>
    </select>  </td>
  <td align="right" width="18%">״̬</td> 
  <td width="32%"> 
    <select name="crm_yglkgsjl_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="1">¼������</option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="crm_yglkgsjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_yglkgsjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<%
if (yhjs.equals("A0"))
{
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right" width="18%">¼����</td> 
	  <td width="32%"> 
		<input type="text" name="crm_yglkgsjl_lrr" size="20" maxlength="20" value="">  </td>
	  <td align="right" width="18%">¼�벿��</td> 
	  <td width="32%">
	  <select name="crm_yglkgsjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
	  </select></td>
	</tr>
	<%
}
else {
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right" width="18%">¼����</td> 
	  <td width="32%"> 
		<input type="text" name="crm_yglkgsjl_lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
	  <td align="right" width="18%">¼�벿��</td> 
	  <td width="32%">
	  <select name="crm_yglkgsjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
	%>
	  </select></td>
	</tr>
	<%
}
%>
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
	if(!(isNumber(FormName.crm_yglkgsjl_jlh, "��¼��"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_yglkgsjl_ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yglkgsjl_jhlkrq, "�ƻ��뿪����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yglkgsjl_jhlkrq2, "�ƻ��뿪����"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_yglkgsjl_jhlksj, "�ƻ��뿪ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_yglkgsjl_jhfhsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yglkgsjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yglkgsjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
