<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bjbbh=null;
	String dqbm=null;

	bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
	dqbm=request.getParameter("dqbm");

	ls_sql="SELECT tcsjflmc,a.bjjbmc,b.bjjbmc bjjbmc1,bj_tcsjcjb.jldw,bj_tcsjcjb.sjcj,DECODE(sjsfycx,'1','�޴���','2','<font color=\"#FF0000\">���������ƴ���</font>','3','<font color=\"#0000FF\">���������ƴ���</font>') sjsfycx,cxsjcj,cxkssj,cxjssj  ";
	ls_sql+=" FROM bj_tcsjcjb,bdm_bjjbbm a,bdm_bjjbbm b,bj_tcsjflbm  ";
    ls_sql+=" where bj_tcsjcjb.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and bj_tcsjcjb.bjjbbm1=b.bjjbbm(+)";
    ls_sql+=" and bj_tcsjcjb.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and bj_tcsjcjb.bjbbh='"+bjbbh+"' and bj_tcsjcjb.dqbm='"+dqbm+"'";
    ls_sql+=" order by bj_tcsjcjb.tcsjflbm,bj_tcsjcjb.bjjbbm,bj_tcsjcjb.bjjbbm1";
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
	<td  width="20%">�ײ���������</td>
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