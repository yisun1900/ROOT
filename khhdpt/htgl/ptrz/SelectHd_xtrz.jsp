<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>
<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Hd_xtrzList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#FFFFCC"> 
   <td align="right" width="18%">�ֹ�˾</td>
      <td width="32%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_khxx_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      <td align="right" width="18%">ǩԼ����</td>
      <td width="32%"> 
        <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
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
      <td align="right" width="15%">IP��ַ</td>
      <td width="35%"> <input type="text" name="ip" size="20" maxlength="30" > 
      </td>
      <td align="right" width="15%">�û���½��</td>
      <td width="35%"> <input type="text" name="yhdlm" size="20" maxlength="16" > 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�û�����</td>
      <td width="35%"> <input type="text" name="yhkl" size="20" maxlength="20" > 
      </td>
      <td align="right" width="15%">�ͻ����</td>
      <td width="35%"> <input type="text" name="khbh" size="20" maxlength="20" > 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�ͻ�����</td>
      <td width="35%"> <input type="text" name="khxm" size="20" maxlength="50" > 
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">��½ʱ��</td>
      <td><input type="text" name="dlsj" size="20" maxlength="10" ></td>
      <td align="right">��</td>
      <td><input type="text" name="dlsj2" size="20" maxlength="10" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�˳�ʱ��</td>
      <td width="35%"> <input type="text" name="tcsj" size="20" maxlength="10" > 
      </td>
      <td align="right" width="15%">�� </td>
      <td width="35%"><input type="text" name="tcsj2" size="20" maxlength="10" > 
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> <input type="button"  value="��ѯ" onClick="f_do(selectform)"> 
        <input type="reset"  value="����"> </td>
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
	if(!(isDatetime(FormName.dlsj, "��½ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tcsj, "�˳�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
