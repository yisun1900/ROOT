<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='YZCS' scope='page' class='cs.YZCS'/><!-- ���ŷ��Ͱ� -->
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>���ŷ���ҳ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<%  
//String yhdlm=(String)session.getAttribute("yhdlm");
String yhdlm="ybl";
String jssj = request.getParameter("jssj");//���մ��ݹ������ֻ�����,���������","�ָ�
String dxnr=cf.GB2Uni(request.getParameter("dxnr"));//���մ��ݹ����Ķ�������

//String dxcs=FSDX.DXSX(jssj,dxnr,yhdlm,"1");//���÷��Ͷ��ź���
//����˵��:jssj:���պ���,����ж����","����
//dxnr:���ŵ�����
//yhdlm:�û���¼��
//"1":�̶�����,1:��ʱ����;0:��ʱ����
try 
{
YZCS.qdxc();
out.println("�߳��Ѿ�����");//�����ͽ����ʾ��ҳ����
}
catch (Exception e) 
{
	out.println("�߳���������!!!!!!!");//�����ͽ����ʾ��ҳ����
}

%>

</body>
</html>
