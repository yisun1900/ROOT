<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jcjj" scope="page" class="jcjj.Jcjj"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<%  
String mmdglxbm = request.getParameter("mmdglxbm");//ľ�Ŷ������ͱ���
String mlx = request.getParameter("mlx");//1����ͨ�ţ�2����ĸ�ţ�3���Կ��ţ�4�������� 
String mmxh = request.getParameter("mmxh");//ľ���ͺ�
String ysbm = request.getParameter("ysbm");//��ɫ����
String mdk = request.getParameter("mdk");//�Ŷ���
String mdg = request.getParameter("mdg");//�Ŷ���
String qh = request.getParameter("qh");//ǽ��
String dbh = request.getParameter("dbh");//�ذ��
String tjx = request.getParameter("tjx");//�߽���/ƽ̨�Ͽ�
String ctbs = request.getParameter("ctbs");//����/���ױ���
String dsk = request.getParameter("dsk");//��˫��

double dj=0;

if (mmdglxbm==null)
{
	return ;
}

try {

	dj=jcjj.yzMmbj(mmdglxbm,mlx,mmxh,ysbm,mdk,mdg,qh,dbh,tjx,ctbs,dsk);

	if (dj!=0)//���۲�Ϊ0
	{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.dj.value="<%=cf.doubleTrimStr(dj,2)%>";
		//-->
		</SCRIPT>
		<%
	}
	else{
		%>
		<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
		<SCRIPT language=javascript >
		<!--
		parent.main.insertform.dj.value="";
//		alert("���󣡼۸���Ϣ��������δ�鵽�۸���Ϣ");
		//-->
		</SCRIPT>
		<%
	}
}
catch(Exception e){
	out.print("��������: " + e);
}
%>


