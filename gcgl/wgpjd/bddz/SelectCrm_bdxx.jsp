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
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_bdxxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="19%"> 
        <div align="right">�ֹ�˾</div>
      </td>
      <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td width="18%"> 
        <div align="right">ǩԼ����</div>
      </td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
      <td align="right" width="19%">�ͻ����</td>
      <td width="31%"> 
        <input type="text" name="crm_bdxx_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">�ͻ�����</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���ݵ�ַ</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="18%">��ͬ��</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���ʦ</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">�ʼĵ�ַ</td>
      <td width="32%"> 
        <input type="text" name="crm_bdxx_yjdz" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ʱ�</td>
      <td width="31%"> 
        <input type="text" name="crm_bdxx_yb" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">�ռ���</td>
      <td width="32%"> 
        <input type="text" name="crm_bdxx_sjr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�绰</td>
      <td width="31%"> 
        <input type="text" name="crm_bdxx_dh" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">¼����</td>
      <td width="32%"> 
        <input type="text" name="crm_bdxx_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">¼��ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="crm_bdxx_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">�� </td>
      <td width="32%"> 
        <input type="text" name="crm_bdxx_lrsj2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.crm_bdxx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_bdxx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
