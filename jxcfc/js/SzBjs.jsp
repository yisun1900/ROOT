<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
	String yhmc=(String)session.getAttribute("yhmc");
	String[] ddbh=request.getParameterValues("ddbh");
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">���ò�����ԭ��
</div>
<form method="post" action="" name="editform" >
<table width="100%" border="0" cellpadding="2" cellspacing="2" bgcolor="#999999" style="FONT-SIZE:12">
  
  <tr bgcolor="#FFFFFF">
    <td width="21%" align="right"><font color="#CC0000">*</font><font color="#0000FF">������������</font></td>
    <td width="29%"><input type="text" name="bjsszr" value="<%=yhmc%>" size="20" maxlength="10" readonly></td>
    <td width="21%" align="right"><font color="#CC0000">*</font><font color="#0000FF">����������ʱ��</font></td>
    <td width="29%"><input type="text" name="bjsszsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="21%" align="right"><font color="#CC0000">*</font>������ԭ��</td>
    <td colspan="3">
		<select name="bjsyy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
			<option value=""></option>
			<option value="δ����������">δ����������</option>
			<option value="�����ѽ���">�����ѽ���</option>
			<option value="�����޵��ݲ�����">�����޵��ݲ�����</option>
			<option value="���ҿۿ����">���ҿۿ����</option>
		</select>
	</td>
  </tr>
  <tr>
    <td height="2" colspan="4" align="center"> 
	<%
	for (int i=0;i<ddbh.length ;i++ )
	{
		%>
		<input type="hidden" name="ddbh" value="<%=ddbh[i]%>">
		<%
	}
	%>
	
        <input name="button" type="button" onClick="f_plxg(editform)"  value="����"></td>
  </tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_plxg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.bjsyy)=="") {
		alert("������[������ԭ��]��");
		FormName.bjsyy.focus();
		return false;
	}
	if(	javaTrim(FormName.bjsszr)=="") {
		alert("������[������������]��");
		FormName.bjsszr.focus();
		return false;
	}
	if(	javaTrim(FormName.bjsszsj)=="") {
		alert("������[����������ʱ��]��");
		FormName.bjsszsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.bjsszsj, "����������ʱ��"))) {
		return false;
	}

	FormName.action="SaveSzBjs.jsp";
	FormName.submit();
	return true;
}



//-->
</SCRIPT>



