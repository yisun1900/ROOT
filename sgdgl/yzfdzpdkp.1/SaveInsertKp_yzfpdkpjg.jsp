<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>


<HTML>
<HEAD>
<TITLE>�ɵ�����</TITLE>
</HEAD>

<BODY bgColor=#ffffff>

<% 
int count=0;

String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));


//�������ݿ�
dzpd.Dzpd dzpd=new dzpd.Dzpd();
dzpd.yzfDzpd(ssfgs);

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%


%>  

</BODY>
</html>




