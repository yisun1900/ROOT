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
String dwbh=(String)session.getAttribute("dwbh");

String yhmc=(String)session.getAttribute("yhmc");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_scbkhgzjlAllCxList.jsp" name="selectform">
<div align="center">�ͻ����ټ�¼��ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC">
  <td align="right">�����ֹ�˾</td>
  <td><select name="crm_scbkhxx_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
    <%
			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5") || kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
		%>
  </select></td>
  <td align="right">����¼�벿��</td>
  <td><select name="crm_scbkhgzjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <%
			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("5") || kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
			%> 
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��¼��</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhgzjl_jlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">�г����ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhgzjl_scbkhbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ�����</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">���ݵ�ַ</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�绰</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_lxfs" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">ҵ��Ա</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_ywy" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����С��</td> 
  <td width="32%"> 
    <input type="text" name="ywyssxz" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">״̬</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "crm_scbkhxx_zt","1+����&2+ʧ��&3+�ƽ�","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����¼����</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhgzjl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����¼��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="crm_scbkhgzjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">�� </td>
  <td width="32%"><input type="text" name="crm_scbkhgzjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
<%
	//����Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.crm_scbkhgzjl_lrbm.length=1;

	if (FormName.crm_scbkhxx_ssfgs.value=="")
	{
		return;
	}


	var sql;
	sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.crm_scbkhxx_ssfgs.value+"' order by cxbz,dwbh";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.crm_scbkhgzjl_lrbm,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj, "����¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj2, "����¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
