<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String fgsbh=(String)session.getAttribute("ssfgs");
%>

<form method="post" action="Cw_czbjsqjlCxList.jsp" name="selectform">
  <div align="center">�������ۣ���ѯ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�����ֹ�˾</td>
      <td width="31%"> 
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx='F2' order by ssfgs,dwbh");
        out.println("        <select name=\"cw_czbjsqjl_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(cw_czbjsqjl_fgsbh,crm_khxx_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"cw_czbjsqjl_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
        out.println("        </select>");
	}
%>
      </td>
      <td align="right" width="18%">ǩԼ����</td>
      <td width="32%"> 
        <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+fgsbh+"' order by dwbh","");
	}
	else {
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh='"+dwbh+"' ","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ͻ����</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">��ͬ��</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ͻ�����</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_khxm" size="20" maxlength="50" >
      </td>
      <td align="right" width="18%">���ݵ�ַ</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ǩԼ���� ��</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���ʦ</td>
      <td width="31%"> 
        <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ȩʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_sqsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_sqsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ȩ��</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_sqr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">�����</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_wcr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_wcsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_wcsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ҵ����תʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="cw_czbjsqjl_yjjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="cw_czbjsqjl_yjjzsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�Ƿ���Ҫҵ����ת</td>
      <td width="31%">
		<INPUT type="radio" name="cw_czbjsqjl_sfxyjjz" value="Y">��Ҫ
		<INPUT type="radio" name="cw_czbjsqjl_sfxyjjz" value="N">����Ҫ	  
      </td>
      <td align="right" width="18%">��ɱ�־</td>
      <td width="32%"> 
        <select name="cw_czbjsqjl_wcbz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+δ���&2+���&3+ҵ����ת","");
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.cw_czbjsqjl_sqsj, "��Ȩʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_sqsj2, "��Ȩʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_wcsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_wcsj2, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_yjjzsj, "ҵ����תʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_czbjsqjl_yjjzsj2, "ҵ����תʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "ǩԼ����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
