<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String khbh=request.getParameter("khbh");
	String hfsj=request.getParameter("hfsj");
	String hfsj2=request.getParameter("hfsj2");
	
	ls_sql="SELECT khxm,hflxmc,jglxmc,DECODE(sjshfnr,null,'',sjshfnr,'[��]��'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>[��]��'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>[��]��'||sgdhfnr)||DECODE(jchfnr,null,'',jchfnr,'<BR>[����]��'||jchfnr) as hfnr,hfsj,DECODE(clfs,'0','���账��','1','������ز���'),hfr,a.dwmc hfbm,crm_hfjl.hfjlh";
	ls_sql+=" FROM crm_hfjl,dm_hflxbm,crm_khxx,sq_dwxx a,dm_jglxbm  ";
    ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_hfjl.hfbm=a.dwbh";
	ls_sql+=" and crm_hfjl.hflxbm=dm_hflxbm.hflxbm(+) and crm_hfjl.jglxbm=dm_jglxbm.jglxbm(+)";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+hfsj+"','YYYY-MM-DD') and crm_hfjl.hfsj<=TO_DATE('"+hfsj2+"','YYYY-MM-DD')";
	ls_sql+=" and crm_hfjl.khbh='"+khbh+"'";
	ls_sql+=" order by crm_hfjl.hfsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
   pageObj.setPageRow(500);//����ÿҳ��ʾ��¼��


//��������
	pageObj.alignStr[3]="align='left'";
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ǩ�����ط�ͳ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�ͻ�����</td>
	<td  width="10%">�ط�����</td>
	<td  width="9%">�طý��</td>
	<td  width="32%">�ط�����</td>
	<td  width="8%">�ط�ʱ��</td>
	<td  width="10%">����ʽ</td>
	<td  width="7%">�ط���</td>
	<td  width="10%">�طò���</td>
	<td  width="7%">�طü�¼��</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>
