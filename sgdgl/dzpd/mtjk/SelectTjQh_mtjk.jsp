<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
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

<form method="post" action="Qh_mtjkTjList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��ر����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qh_mtjk_jkbbh" size="20" maxlength="6" >
  </td>
  <td width="15%"> 
    <div align="right">����ع�˾����</div>
  </td>
  <td width="35%"> 
  <select name="qh_mtjk_bjkgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjkgsbh,bjkgsmc from qh_bjkgsdm where dqbm='"+dqbm+"' order by bjkgsbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�����ʽ</div>
  </td>
  <td width="35%"> 
    <select name="qh_mtjk_xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">��ص�λ</div>
  </td>
  <td width="35%">
  <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
   
 
 <%
 String kb="";
 if (yhjs.equals("A0")||yhjs.equals("A1"))
{ 
	
    out.print("\n <OPTION  value=\""+kb+"\">"+kb+"</OPTION>");	
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwlx='F1'","");
 }
else if (yhjs.equals("F0")||yhjs.equals("F1"))
 {
	out.print("\n <OPTION  value=\""+kb+"\">"+kb+"</OPTION>");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where sq_dwxx.ssdw='"+ssfgs+"' and dwlx='F1'","");
 }
 else
 {
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
 }
 %>
</select>
 
  <BR>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��湫˾</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qh_mtjk_gggs" size="20" maxlength="30" >
  </td>
  <td width="15%"> 
    <div align="right">Ԥ�Ƽ۸�</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qh_mtjk_yjjg" size="20" maxlength="6" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <p align="right">����ʱ�� ��
  </td>
  <td width="35%"> 
    <input type="text" name="qh_mtjk_bcsj" size="20" value=<%=cf.firstDayDate()%> maxlength="10" >
  </td>
  <td width="15%"> 
    <p align="right">��
  </td>
  <td width="35%"> 
    <input type="text" name="qh_mtjk_bcsj2" size="20"  value=<%=cf.today()%> maxlength="10" >
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
	if(!(isDatetime(FormName.qh_mtjk_bcsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.qh_mtjk_bcsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.qh_mtjk_yjjg, "Ԥ�Ƽ۸�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>