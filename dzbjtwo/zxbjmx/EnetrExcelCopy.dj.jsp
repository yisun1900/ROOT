<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ά��ģ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String khbh=request.getParameter("khbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>����Excel�ļ�����&gt;���ӱ���</b>
		<input name="khbh" type="hidden" value="<%=khbh%>">
          <input name="button" type="button" onClick="f_do(editform)"  value="��һ��">
     </td>
    </tr>
    <tr>
      <td width="68%" height="57"> <b><font color="#FF0000">��Excel�ļ��������༭���У���ʽ���£�ע�⣺��֮�伴ʹ������ͬҲ��Ҫ�ϲ��������������滻�༭������ʾ����</font></b>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
          <tr align="center" bgcolor="#FFFFFF">
            <td width="13%"><strong>����</strong></td>
            <td width="19%"><strong>��Ŀ���</strong></td>
            <td width="35%"><strong>��Ŀ����</strong></td>
            <td width="11%"><strong>������λ</strong></td>
            <td width="11%"><strong>����</strong></td>
            <td width="11%"><strong>������</strong></td>
          </tr>
		<tr align="center" bgcolor="#FFFFFF"> 
            <td>����</td>
            <td>JC-03-16</td>
            <td>�������һ��ǽ��</td>
            <td>�O</td>
            <td>38.76</td>
            <td>6.71</td>
          </tr>
			<tr align="center" bgcolor="#FFFFFF"> 
            <td>����</td>
            <td>JC-12-08</td>
            <td>ǽ��������ˮ���Ӵ���</td>
            <td>�O</td>
            <td>3.51</td>
            <td>9</td>
          </tr>
			<tr align="center" bgcolor="#FFFFFF">
              <td>����</td>
			  <td>JC-03-16</td>
			  <td>�������һ��ǽ��</td>
			  <td>�O</td>
			  <td>38.76</td>
			  <td>21.71</td>
		  </tr>
		<tr align="center" bgcolor="#FFFFFF"> 
            <td>����</td>
            <td>PT-01-13</td>
            <td>��ͨʯ����</td>
            <td>��</td>
            <td>5</td>
            <td>12.5</td>
          </tr>
      </table></td>
    </tr>
    <tr> 
      <td width="68%" height="57" align="center"> 
        <textarea name="dzbj" cols="112" rows="27">����	��Ŀ���	��Ŀ����	������λ	����	������
����	JC-03-16	�������һ��ǽ��	�O	38.76	6.71
����	JC-12-08	ǽ��������ˮ���Ӵ���	�O	3.51	9
����	JC-03-16	�������һ��ǽ��	�O	38.76	21.71
����	PT-01-13	��ͨʯ����	��	5	12.5
</textarea></td>
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
	if(	javaTrim(FormName.dzbj)=="") {
		alert("�뿽��[��������]��");
		FormName.dzbj.focus();
		return false;
	}

	FormName.action="DisplayExcelCopy.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
