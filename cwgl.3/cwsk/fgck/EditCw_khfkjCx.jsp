<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%  
String fkxh = request.getParameter("fkxh");
String khbh = request.getParameter("khbh");
String fkcs = request.getParameter("fkcs");


try {

	if (fkcs!=null)
	{
		cwgl.Cwgl cwgl=new cwgl.Cwgl();
		double[] fkxx=cwgl.getEditFkje(khbh,fkcs,fkxh);

		 /**************************************************************************************
		/*���ܣ��޸�Ӧ������
		/*���룺String khbh //�ͻ����
		/*���룺String fkcs //��������
		/*���룺String fkxh //���θ������
		/*���أ�{�����տ����,�ۼ��տ����,Ӧ������}
		/***************************************************************************************/


		%>
			parent.main.insertform.yfkbl.value="<%=fkxx[1]%>";
			parent.main.insertform.yfkje.value="<%=fkxx[2]%>";
		<%

	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}

%>

//-->
</SCRIPT>
