<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='FSDX' scope='page' class='dxxt.FSDX'/><!-- ���ŷ��Ͱ� -->

<html>
<head>
<title>���ŷ���ҳ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<%  

String jssj = request.getParameter("jssj");//���մ��ݹ������ֻ�����
String dxnr=cf.GB2Uni(request.getParameter("dxnr"));//���մ��ݹ����Ķ�������

String dxcs=FSDX.DXSX(jssj,dxnr);//���÷��Ͷ��ź���
out.println(dxcs);//�����ͽ����ʾ��ҳ����

%>

</body>
</html>
