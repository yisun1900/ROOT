<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String dwbh=request.getParameter("dwbh");


	ls_sql="SELECT '',cl_jgmx.clbm,cl_clbm.clmc,cl_clbm.clgg,cl_clbm.jldwmc,'' xjgsxsj,cl_jgmx.cj,cl_jgmx.cjjsj ,cl_jgmx.fgsdj,cl_jgmx.gdj, DECODE(cl_jgmx.sfrk,'Y','��','N','��') as cl_jgmx_sfrk,cl_jgmx.ckmc,DECODE(sfycx,'N','��','Y','�д���') sfycx,cxkssj,cxjzsj,cxcj,cxcjjsj,cxfgsdj,cxgdj";
	ls_sql+=" FROM cl_clbm,cl_jgmx  ";
    ls_sql+=" where cl_jgmx.clbm=cl_clbm.clbm";
    ls_sql+=" and  (cl_jgmx.dwbh='"+dwbh+"')";
    ls_sql+=" order by cl_clbm.cldlmc,cl_jgmx.clbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="4%">���ϱ���</td>
	<td  width="9%">��������</td>
	<td  width="8%">���Ϲ��</td>
	<td  width="4%">������λ</td>
	<td  width="5%">�¼۸���Чʱ��</td>
	<td  width="5%">����</td>
	<td  width="5%">�볧�ҽ����</td>
	<td  width="5%">�ֹ�˾���ϵ���</td>
	<td  width="5%">���Ӽ�</td>
	<td  width="4%">�Ƿ����</td>
	<td  width="8%">�ֿ�����</td>
	<td  width="5%">�Ƿ��д���</td>
	<td  width="5%">������ʼʱ��</td>
	<td  width="5%">��������ʱ��</td>
	<td  width="5%">�����ڳ���</td>
	<td  width="5%">�������볧�ҽ����</td>
	<td  width="5%">�����ڷֹ�˾���ϵ���</td>
	<td  width="5%">�����ڹ��Ӽ�</td>


</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printFoot();
%> 

</body>
</html>