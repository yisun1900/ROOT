<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='YZCS' scope='page' class='cs.YZCS'/><!-- ���ŷ��Ͱ� -->

<html>
<head>
<title>���ŷ���ҳ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<%  

String jssj = "200803071732";//��������
String dxnr = "2008-03-07 17:32����!";//��������

YZCS.Addtime(jssj,dxnr);//���÷��Ͷ��ź���
out.print(jssj+"<br>"+dxnr);

%>

</body>
</html>
