<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='DSDX' scope='page' class='dxxt.DSDX'/><!-- ���ŷ��Ͱ� -->
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>������ʱ�����߳�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%  
try 
{
DSDX.qdxc();
out.println("���ų�������!!!");//�����ͽ����ʾ��ҳ����
}
catch (Exception e) 
{
	out.println("�߳���������!!!!!!!");//�����ͽ����ʾ��ҳ����
}
//boolean a=true;
//if (a)
//{
//	out.print("aaaaaaa");
//}
%>
</body>
</html>

