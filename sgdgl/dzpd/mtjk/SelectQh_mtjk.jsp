<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String dqbm=(String)session.getAttribute("dqbm");

%>
<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Qh_mtjkList.jsp" name="selectform">
<table width="100%" border="0" style="font-size: 12" bgcolor="#999999" cellpadding="2" cellspacing="2" height="130">
<tr bgcolor="#FFFFFF">
  <td width="15%" height="25"> 
    <div align="right">����ع�˾����</div>
  </td>
  <td width="35%" height="25"> 
  <select name="bjkgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjkgsbh,bjkgsmc from qh_bjkgsdm where dqbm='"+dqbm+"' order by bjkgsbh","");
%>
    </select>
  </td>
  <td width="15%" height="25"> 
    <div align="right">�����ʽ</div>
  </td>
  <td width="35%" height="25"> 
    <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" height="29"> 
    <div align="right">����ʱ�� ��</div>
  </td>
  <td width="35%" height="29"> 
    <input type="text" name="bcsj" size="20" maxlength="10" >
  </td>
  <td width="15%" height="29"> 
    <div align="right">��</div>
  </td>
  <td width="35%" height="29"> 
  <input type="text" name="bcsj2" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" height="25"> 
    <div align="right">��湫˾</div>
  </td>
  <td width="35%" height="25"> 
    <input type="text" name="gggs" size="20" maxlength="30" >
  </td>
  <td width="15%" height="25"> 
    <div align="right">���λ����</div>
  </td>
  <td width="35%" height="25"> 
    <!--<input type="text" name="dwbh" size="20" maxlength="30" >-->
   <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
   <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
  %> 
   </select>  
  </td>
</tr>
<tr align="center"> 
  <td colspan="4" height="27"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
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
	if(!(isDatetime(FormName.bcsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bcsj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
