<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bjjbbm=null;
	String dqbm=null;

	bjjbbm=request.getParameter("bjjbbm");
	dqbm=request.getParameter("dqbm");


	ls_sql="SELECT xmmc,ppmc,xh,jdm_jldwbm.jldwbm,bhsl,bz ";
	ls_sql+=" FROM tc_bzxm,jdm_jldwbm  ";
    ls_sql+=" WHERE tc_bzxm.dqbm='"+dqbm+"' and tc_bzxm.bjjbbm='"+bjjbbm+"'";
	ls_sql+=" and tc_bzxm.jldw=jdm_jldwbm.jldwbm(+)" ;
    ls_sql+=" and tc_bzxm.bjjbbm='"+bjjbbm+"' and tc_bzxm.dqbm='"+dqbm+"'";
    ls_sql+=" order by tc_bzxm.xmmc ";
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
      <td width="20%">��Ŀ����</td>
      <td width="20%">Ʒ��</td>
	  <td width="18%">�ͺ�</td>
      <td width="12%">������λ</td>
      <td width="10%">��������</td>
      <td width="20%">��ע������˵��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>