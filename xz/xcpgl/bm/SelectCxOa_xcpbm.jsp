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
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Oa_xcpbmCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">ӡˢƷ����</td>
      <td width="35%"> 
        <input type="text" name="oa_xcpbm_xcpbm" size="20" maxlength="6" >
      </td>
      <td align="right" width="15%">ӡˢƷ����</td>
      <td width="35%"> 
        <input type="text" name="oa_xcpbm_xcpmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">������λ</td>
      <td width="35%"> 
        <input type="text" name="oa_xcpbm_jldw" size="20" maxlength="20" >
      </td>
      <td align="right" rowspan="3">ӡˢƷ����</td>
      <td rowspan="3"> 
        <select name="oa_xcpbm_xcpflbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple>
          <option value=""></option>
          <%
	cf.selectItem(out,"select xcpflbm,xcpflmc from oa_xcpflbm order by xcpflmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����</td>
      <td width="35%"> 
        <input type="text" name="oa_xcpbm_dj" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�Ƿ�������</td>
      <td width="35%"><%
	cf.radioToken(out, "oa_xcpbm_sfxsp","N+����Ҫ&Y+��Ҫ","");
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">���</td>
      <td width="35%"> 
        <input type="text" name="oa_xcpbm_xh" size="20" maxlength="8" >
      </td>
      <td align="right" width="15%">����ȡ�ֹ�˾</td>
      <td width="35%"> 
        <select name="oa_xcpbm_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' ","");
	}
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isFloat(FormName.oa_xcpbm_dj, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_xcpbm_xh, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
