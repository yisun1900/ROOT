<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <div align="center">����ͳ��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�ֹ�˾</td>
      <td width="30%"><%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"> ");
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
      <td align="right" width="17%">����״̬</td>
      <td width="33%"> 
        <input type="radio" name="sfwj" value="5" checked>
         �����
        <input type="radio" name="sfwj" value="4">
        ���깤 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">ͳ��ʱ�� ��</td>
      <td width="30%"> 
        <input type="text" name="sjwjrq" size="20" value="<%=cf.firstDay()%>" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="sjwjrq2" size="20" value="<%=cf.lastDay()%>" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%" >��ʾ���</td>
      <td colspan="3" > 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
        <input type="text" name="myxssl" size="7" maxlength="13" value="100">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��������ͳ��" onClick="f_do(selectform)" name="button2">
        <input type="button"  value="�ͻ�ͳ��" onClick="f_kh(selectform)" name="button">
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
	if(	javaTrim(FormName.sjwjrq)=="") {
		alert("��ѡ��[�ͻ����ʱ��]��");
		FormName.sjwjrq.select();
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq, "�ͻ����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjwjrq2)=="") {
		alert("��ѡ��[�ͻ����ʱ��]��");
		FormName.sjwjrq2.select();
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq2, "�ͻ����ʱ��"))) {
		return false;
	}

	FormName.action="clfxList.jsp";
	FormName.submit();
	return true;
}

function f_kh(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgs)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgs.select();
		return false;
	}
	if(	javaTrim(FormName.sjwjrq)=="") {
		alert("��ѡ��[�ͻ����ʱ��]��");
		FormName.sjwjrq.select();
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq, "�ͻ����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjwjrq2)=="") {
		alert("��ѡ��[�ͻ����ʱ��]��");
		FormName.sjwjrq2.select();
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq2, "�ͻ����ʱ��"))) {
		return false;
	}

	FormName.action="clfxKhList.jsp";

	FormName.submit();
	return true;
}

//-->
</SCRIPT>

