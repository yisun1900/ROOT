<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertOa_bgypbz.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��λ</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
	}
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xm" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ְλ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zw" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="je" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ȡ��Χ</td>
              <td width="35%"> 
                <select name="flbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="4" multiple>
<%
	cf.selectItem(out,"select flbm,flmc from oa_flbm order by flbm","");
%> 
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[��λ]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("������[����]��");
		FormName.xm.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("������[ְλ]��");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("������[���]��");
		FormName.je.focus();
		return false;
	}
	if(!(isNumber(FormName.je, "���"))) {
		return false;
	}
	if(!selectChecked(FormName.flbm)) {
		alert("������[��ȡ��Χ]��");
		FormName.flbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
