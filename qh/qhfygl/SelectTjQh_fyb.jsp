<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
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

<form method="post" action="Qh_fybTjList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�ϱ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qh_fyb_sbxh" size="20" maxlength="7" >
  </td>
  <td width="15%"> 
    <div align="right">�걨����</div>
  </td>
  <td width="35%"> 
    <select name="qh_fyb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
 String kb="";
 if (yhjs.equals("A0"))
{ 
	
    out.print("\n <OPTION  value=\""+kb+"\">"+kb+"</OPTION>");	
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where (dwlx='F1'  ) order by dwbh","");
 }
 else if (yhjs.equals("F0")||yhjs.equals("F1"))
{ 
	
    out.print("\n <OPTION  value=\""+kb+"\">"+kb+"</OPTION>");	
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where (dwlx='F1' ) and ssdw='"+ssfgs+"' order by dwbh","");
 }
 else
 {

	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
 }
 %>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
                <div align="right">�걨���ڴ�</div>
  </td>
              <td width="35%"> 
                <input type="text" name="qh_fyb_sbrq" size="20" value=<%=cf.firstDayDate()%> maxlength="10" >
  <BR>
              </td>
  <td width="15%"> 
                <div align="right">��</div>
  </td>
              <td width="35%">
                <input type="text" name="qh_fyb_sbrq2" size="20" value=<%=cf.today()%>
 maxlength="10" >
              </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����</div>
  </td>
  <td width="35%"> 
    <select name="qh_fyb_zl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fyzlmc,fyzlmc from qh_qhfyzlb order by fyzldm","");
%>
                </select>
  </td>
  <td width="15%"> 
    <div align="right">�Ƿ�ƻ���</div>
  </td>
  <td width="35%"> 
<%
	cf.radioToken(out, "qh_fyb_sfjhn","Y+��&N+��","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��ͬ�Ƿ�����</div>
  </td>
  <td width="35%"> 
<%
	cf.radioToken(out, "qh_fyb_htsfsp","Y+��&N+��","");
%>
  </td>
  <td width="15%"> 
                <div align="right">����ý��&nbsp;</div>
  </td>
  <td width="35%">
                <select name="qh_fyb_xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");
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
	if(!(isDatetime(FormName.qh_fyb_sbrq, "�걨����"))) {
		return false;
	}
	if(!(isDatetime(FormName.qh_fyb_sbrq2, "�걨����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
