<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String kpjlh=null;
	kpjlh=request.getParameter("kpjlh");

	ls_sql="SELECT kpjlh,zjxm,jcf,xjykf,gscckf,gchfdf,tssgdkf,tszjkf,bxkf,zf,bqpm  ";
	ls_sql+=" FROM kp_zjpfb  ";
    ls_sql+=" where kpjlh="+kpjlh;
    ls_sql+=" order by bqpm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���̵������ֽ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">������¼��</td>
	<td  width="9%">���̵���</td>
	<td  width="9%">������</td>
	<td  width="9%">Ѳ��Ա�۷�</td>
	<td  width="9%">��˾���۷�</td>
	<td  width="9%">���̻طõ÷�</td>
	<td  width="9%">Ͷ��ʩ���ӿ۷�</td>
	<td  width="9%">Ͷ�߹��̵����۷�</td>
	<td  width="9%">���޿۷�</td>
	<td  width="9%">�ܷ�</td>
	<td  width="9%">��������</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>