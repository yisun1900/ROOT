<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String zkl=cf.executeQuery("select zkl from sq_yhxx where yhdlm='"+yhdlm+"'");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_dzyhsqXgSpList.jsp" name="selectform">
<div align="center">�����Ż�����--�޸�����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%"> 
        <div align="right">�ͻ������ֹ�˾</div>
      </td>
      <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx='F2' and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,crm_zxkhxx_zxdm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td width="16%"> 
        <div align="right">��ѯ����</div>
      </td>
      <td width="34%"> 
        <select name="crm_zxkhxx_zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ͻ����</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="16%">�ͻ�����</td>
      <td width="34%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ݵ�ַ</td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="16%">���ʦ</td>
      <td width="34%"> 
        <input type="text" name="crm_zxkhxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_sqsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="16%">��</td>
      <td width="34%"> 
        <input type="text" name="crm_dzyhsq_sqsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_sqr" size="20" maxlength="20" >
      </td>
      <td align="right" width="16%">�Ƿ����������Ż�</td>
      <td width="34%"><%
	cf.radioToken(out, "crm_dzyhsq_sfsqqtyh","Y+��&N+��","");
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC"><b>�����ۿ��� ��</b></font></td>
      <td width="32%"> 
        <input type="text" name="sqzkl" size="20" maxlength="10" value="<%=zkl%>" readonly>
      </td>
      <td align="right" width="16%">��</td>
      <td width="34%"> 
        <input type="text" name="sqzkl2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="16%">��</td>
      <td width="34%"> 
        <input type="text" name="crm_dzyhsq_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������־</td>
      <td width="32%"> 
        <input type="radio" name="crm_dzyhsq_spbz" value="2" checked>
        ������ </td>
      <td align="right" width="16%">¼����</td>
      <td width="34%"> 
        <input type="text" name="crm_dzyhsq_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_spr" size="20" maxlength="20" >
      </td>
      <td align="right" width="16%">�������</td>
      <td width="34%"> 
        <input type="radio" name="crm_dzyhsq_spjg" value="1">
        ͬ�� 
        <input type="radio" name="crm_dzyhsq_spjg" value="2">
        ��ͬ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="crm_dzyhsq_spsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="16%">��</td>
      <td width="34%"> 
        <input type="text" name="crm_dzyhsq_spsj2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.crm_dzyhsq_sqsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_sqsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_spsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_spsj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
