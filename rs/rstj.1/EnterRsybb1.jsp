<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�±���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String dwbh=(String)session.getAttribute("dwbh");
String jzbm=(String)session.getAttribute("jzbm");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");

String nian=request.getParameter("nian");
String yue=request.getParameter("yue");


%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">��Աͳ�Ʊ� </div>
      </td>
    </tr>

    </tr>
    <tr> 
      <td align="right" width="30%" height="43"> ͳ��ʱ��</td>
      <td height="43" colspan="3" width="70%"> �� 
        <input type="text" name="sjfw" size="11" maxlength="10" value='<%=cf.firstDay(nian,yue)%>' ondblclick="JSCalendar(this)">
        ----&gt; �� 
        <input type="text" name="sjfw2" size="11" maxlength="10"  value='<%=cf.lastDay(nian,yue)%>' ondblclick="JSCalendar(this)">
      </td>
    </tr>
 <!--   <tr> 
      <td align="right" width="30%" height="46">���ᵱ��ҵ��</td>
      <td height="46" colspan="3" width="70%"> 
<%
	if (yhjs.equals("F2"))
	{
		%>
        <input type="radio" name="djyj" value="N" checked>
        ������ 
		<%
	}
	else{
		%>
        <input type="radio" name="djyj" value="Y"  >
        ���� 
        <input type="radio" name="djyj" value="N" checked>
        ������ 
		<%
	}
%>
		</td>
    </tr>-->
    <tr> 
      <td align="right" width="30%" height="46">��ʾ���</td>
      <td height="46" colspan="3" width="70%"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="4"> 
        <input type="hidden" name="nian" value="<%=nian%>"  >
        <input type="hidden" name="yue" value="<%=yue%>"  >
        <input type="button"  value="�ܲ�ͳ��" onClick="f_do(selectform,1)" name="jzcz">
		<input type="button"  value="���ܲ�ͳ��" onClick="f_do(selectform,0)" name="jzcz1">
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
function f_do(FormName,flag)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ͳ��ʱ�� ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ͳ��ʱ�� "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ͳ��ʱ�� ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ͳ��ʱ�� "))) {
		return false;
	}
		FormName.action="";
		if(flag==0){FormName.action="Rsybb.jsp";}
		if(flag==1){FormName.action="Rsybb2.jsp";}
		FormName.target="";
		FormName.submit();
		FormName.jzcz.disabled=true;
		return true;
}
//-->
</SCRIPT>
