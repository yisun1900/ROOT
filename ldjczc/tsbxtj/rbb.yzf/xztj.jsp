<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�ձ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14">
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">Ͷ�߱����ձ���</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">�ͻ��ֹ�˾</td>
      <td width="58%" height="39"> 
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> 
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">¼�벿��</td>
      <td width="58%" height="39"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N'  order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">¼��ʱ�� ��</td>
      <td width="58%" height="39"> 
        <input type="text" name="lrsj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">��</td>
      <td width="58%" height="40"> 
        <input type="text" name="lrsj2" size="20" maxlength="10"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr>
      <td align="right" width="42%" height="40">�Ƿ�᰸</td>
      <td width="58%" height="40">
        <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <option value="2">δ�᰸</option>
          <option value="3">�ѽ᰸</option>
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">��ʾ���</td>
      <td width="58%" height="40"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="2"> 
        <input type="button"  value="Ͷ�߱��޼�¼" onClick="f_xzts(selectform)">
        <input type="button"  value="Ͷ�߱��޻طü�¼" onClick="f_xzhf(selectform)">
        <input type="button"  value="δ�᰸Ͷ�߱��ޱ���" onClick="f_new(selectform)" >
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
function f_xzts(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ�� ]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ�� "))) {
		return false;
	}
	if(	javaTrim(FormName.lrsj2)=="") {
		alert("������[¼��ʱ�� ]��");
		FormName.lrsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ�� "))) {
		return false;
	}

	FormName.action="Crm_tsjlCxList.jsp";
	FormName.submit();
	return true;
}

function f_xzhf(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ�� ]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ�� "))) {
		return false;
	}
	if(	javaTrim(FormName.lrsj2)=="") {
		alert("������[¼��ʱ�� ]��");
		FormName.lrsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ�� "))) {
		return false;
	}

	FormName.action="Crm_tshfjlCxList.jsp";
	FormName.submit();
	return true;
}

function f_new(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ�� ]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ�� "))) {
		return false;
	}
	if(	javaTrim(FormName.lrsj2)=="") {
		alert("������[¼��ʱ�� ]��");
		FormName.lrsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ�� "))) {
		return false;
	}

	FormName.action="TsbxCxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
