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
	String zjxxh=request.getParameter("zjxxh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>����Excel�ļ�����&gt;���壨��������ţ�<%=zjxxh%>��</b>
	  <input name="ddbh" type="hidden" value="<%=ddbh%>"></td>
		<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
    </tr>
    <tr>
      <td width="68%" height="57"> 
        <table width="100%" border="0" style="FONT-SIZE:14">
          <tr>
            <td width="16%" height="25">&nbsp;</td>
            <td width="84%"><strong>��һ��</strong>��<a href="/jcjj/jjddcl/ht/��������ģ��.xls"><b>����Ҽ�����Ϊ�����ع��忽��ģ��</b></a> </td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>�ڶ���</strong>������Excelģ���ʽ��¼�������ϸ��<b><font color="#FF0000">ע�⣺��֮�伴ʹ������ͬҲ��Ҫ�ϲ�</font></b></td>
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
����						
��������	��װλ��	���	�Ҿ�ϵ��	�������	�����ɫ	��ע
A����	�����	122*32	����ϵ��	¶ˮ��(����ľ��)	��ɫ	��ע11
������						
�������	�������	��ĺ��(mm)	��(mm)	��(mm)	����	��ע
¶ˮ��(����ľ��)	����	18	110	210	1	��ע1
¶ˮ��(��ͨľ��)	����	12	220	131	2	��ע21
¶ˮ��(����ľ��)	�߽Ű�	25	214	370	1	
¶ˮ��(����ľ��)	���װ�	36	270	319	4	
�������						
������	�������	�ͺ�	���	������λ	����	��ע
0001	����	��Ƥ	500*450*120	��	1	�����ֹ����60Ԫ
0002	�����	��Ƥ	600*450	��	2	�����ֹ����60Ԫ
0012	�����¼�	������	6174.1	��	3	����
0013	���¸�	�����ֹ��¸�		��	1	����
0017	���¸�	��Ѹ���ڡ��졢�����ʣ�	901-1000	��	1	
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

	FormName.action="DisplayExcelCopyGt.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>