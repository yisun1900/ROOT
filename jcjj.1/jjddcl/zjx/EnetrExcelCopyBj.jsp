<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>����Excel�ļ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String gtxh=cf.GB2Uni(request.getParameter("gtxh"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	String zjxxh=request.getParameter("zjxxh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>����Excel�ļ�����&gt;����������������ţ�<%=zjxxh%>,������ţ�<%=gtxh%>��</b>
		<input name="gtxh" type="hidden" value="<%=gtxh%>">
		<input name="ddbh" type="hidden" value="<%=ddbh%>">
		<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
     </td>
    </tr>
    <tr>
      <td width="68%" height="57"><table width="100%" border="0" style="FONT-SIZE:14">
          <tr>
            <td width="16%" height="25">&nbsp;</td>
            <td width="84%"><strong>��һ��</strong>��<a href="/jcjj/jjddcl/ht/����������ģ��.xls"><b>����Ҽ����Ϊ�����ع���������ģ��</b></a> </td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>�ڶ���</strong>������Excelģ���ʽ��¼���������ϸ��<b><font color="#FF0000">ע�⣺��֮�伴ʹ������ͬҲ��Ҫ�ϲ�</font></b></td>
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
              <input name="button2" type="button" onClick="f_do(editform)"  value="��һ��"></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td width="68%" height="57" align="center"> 
        <textarea name="dataStr" cols="137" rows="27">
�������	�������	��ĺ��(mm)	��(mm)	��(mm)	����	��ע
¶ˮ��(����ľ��)	����	18	110	210	1	��ע1
¶ˮ��(��ͨľ��)	����	12	220	131	2	��ע21
¶ˮ��(����ľ��)	�߽Ű�	25	214	370	1	
¶ˮ��(����ľ��)	���װ�	36	270	319	4	
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
		alert("�뿽��[������]��");
		FormName.dataStr.focus();
		return false;
	}

	FormName.action="DisplayExcelCopyBj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
