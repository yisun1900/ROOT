<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>����Excel�ļ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
       <b>����Excel�ļ�����&gt;�Ͳ��ţ������ţ�<%=ddbh%>��</b>
		  <input name="ddbh" type="hidden" value="<%=ddbh%>">
		  <table width="100%" border="0" style="FONT-SIZE:14">
          <tr>
            <td width="16%" height="25">&nbsp;</td>
            <td width="84%"><strong>��һ��</strong>��<a href="�����Ͳ���ģ��.xls"><b>����Ҽ����Ϊ�������Ͳ��ſ���ģ��</b></a> </td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>�ڶ���</strong>������Excelģ���ʽ��¼���Ͳ�����ϸ��<b><font color="#FF0000">ע�⣺��֮�伴ʹ������ͬҲ��Ҫ�ϲ�</font></b></td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>������</strong>���������༭������ʾ����</td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>���Ĳ�</strong>��ȫѡExcel�ļ�������</td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>���岽</strong>���ѿ�������ճ��������༭����</td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>������</strong>�����
            <input name="button" type="button" onClick="f_do(editform)"  value="��һ��"></td>
          </tr>
      </table></td>
    </tr>
    <tr> 
      <td width="68%" align="center"> 
        <textarea name="dataStr" cols="137" rows="27">
�Ͳ�������	�Ͳ�������	��װλ��	�����ţ��߿��ͺţ� ���ܣ����ͣ����������ͣ�������ţ�����	�߿���ɫ	�����շ�	�ܸ߶�(mm)	�ܿ��(mm)	���һ����/��ɫ	���һо������	���һ�߶�(mm)	���һ���(mm)	��������/��ɫ	����о������	�����߶�(mm)	�������(mm)	��ע
������	�������	�����	�߿�ϵ���ͺ�1	��ɫ	12	1000	500	������1	о������	1000	300	������3		1000	200	
����	������	����	70A	��ɫ	0	1000	300	p108��ӣ�ң�̨�壩	��͹о��/��ͨ����	1000	200	p109��ӣ�ң�̨�壩	��͹о��/��ͨ����	1000	100	�������Ű�
�������	������	����	���Ͻ���ƽ����	��ɫ	0	1000	500	�����谷��		1000	500					
����	�¹���	�¹�	70A	��ɫ	0	1000	300	p108��ӣ�ң�̨�壩	��͹о��/��ͨ����	1000	200	p109��ӣ�ң�̨�壩	��͹о��/��ͨ����	1000	100	�������Ű�
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
	if(	javaTrim(FormName.dataStr)=="") {
		alert("�뿽��[�������]��");
		FormName.dataStr.focus();
		return false;
	}

	FormName.action="DisplayExcelCopyXcm.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
