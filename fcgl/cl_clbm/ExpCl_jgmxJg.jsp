<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String dwbh=cf.executeQuery("select dwbh from cl_jgmx where rownum<2");


	ls_sql="SELECT cldlmc,cl_jgmx.clbm,cl_clbm.clmc,cl_clbm.clgg,cl_clbm.jldwmc,cl_jgmx.gdj,cl_jgmx.cjjsj,DECODE(cl_clbm.lx,'1','����','2','�ǳ���'),bjjbmc,cl_clbm.ppmc,cl_clbm.wxr,cl_clbm.bz,cl_clbm.paixu";
	ls_sql+=" FROM cl_clbm,cl_jgmx,bdm_bjjbbm  ";
    ls_sql+=" where cl_jgmx.clbm=cl_clbm.clbm and cl_jgmx.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and  (cl_jgmx.dwbh='"+dwbh+"')";
    ls_sql+=" order by cl_clbm.cldlmc,cl_jgmx.clbm,cl_jgmx.bjjbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����</td>
	<td  width="4%">���ϱ��</td>
	<td  width="9%">��������</td>
	<td  width="8%">���Ϲ��</td>
	<td  width="4%">���ϵ�λ</td>
	<td  width="5%">���Ӽ�</td>
	<td  width="5%">�ɱ���</td>

	<td  width="4%">�Ƿ���</td>
	<td  width="4%">���ۼ���</td>
	<td  width="8%">Ʒ��</td>
	<td  width="4%">ά����</td>
	<td  width="4%">��ע</td>
	<td  width="4%">����</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>