<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String dqbm=null;

	dqbm=request.getParameter("dqbm");

	ls_sql="SELECT clxlmc,a.bjjbmc,b.bjjbmc bjjbmc1,tckd_tcsjcjb.jldw,tckd_tcsjcjb.sjcj,DECODE(sjsfycx,'1','�޴���','2','<font color=\"#FF0000\">���������ƴ���</font>','3','<font color=\"#0000FF\">���������ƴ���</font>') sjsfycx,cxsjcj,cxkssj,cxjssj  ";
	ls_sql+=" FROM tckd_tcsjcjb,jdm_bjjbbm a,jdm_bjjbbm b,jxc_clxlbm  ";
    ls_sql+=" where tckd_tcsjcjb.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and tckd_tcsjcjb.bjjbbm1=b.bjjbbm(+)";
    ls_sql+=" and tckd_tcsjcjb.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tcsjcjb.dqbm='"+dqbm+"'";
    ls_sql+=" order by tckd_tcsjcjb.tccplbbm,tckd_tcsjcjb.bjjbbm,tckd_tcsjcjb.bjjbbm1";
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
	<td  width="20%">��Ʒ���</td>
	<td  width="10%">ԭ���ۼ���</td>
	<td  width="10%">�������ۼ���</td>
	<td  width="10%">������λ</td>
	<td  width="10%">�������</td>
	<td  width="12%">�����Ƿ��д���</td>
	<td  width="10%">�����������</td>
	<td  width="9%">������ʼʱ��</td>
	<td  width="9%">��������ʱ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 

</body>
</html>