<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ�����ɵ�ͳ��</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="8%">ʩ����</td>
    <td  width="7%">ʩ���Ӽ���</td>
    <td  width="10%">�ʱ���</td>
    <td  width="10%">�ͻ������</td>
    <td  width="8%">�೤</td>
    <td  width="7%">�೤����</td>
    <td  width="10%">�ɽӵ�����Сֵ</td>
    <td  width="10%">�ɽӵ������ֵ</td>
    <td  width="6%">��������</td>
    <td  width="6%">���ù�������</td>
    <td  width="6%">Ŀǰ��ʩ������</td>
    <td  width="6%">��С��ʩ������</td>
    <td  width="6%">�����ʩ������</td>

  </tr>
  <%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;


	ls_sql=" select sq_sgd.sgdmc,sq_sgd.sgdjbbm sgdjb,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.bzmc,sq_bzxx.sgdjbbm bzjb,sq_bzxx.kjdzxz,sq_bzxx.kjdzdz,sq_bzxx.grsl,sq_bzxx.kygrsl,sq_bzxx.mqzsgds,sq_bzxx.zxzsgds,sq_bzxx.zdzsgds ";
	ls_sql+=" from sq_sgd,sq_bzxx";
	ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";

	//��Ҫ������
	ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj<SYSDATE)) ";
	ls_sql+=" and sq_bzxx.tdbz='N' ";

	ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.khmyd desc,sq_bzxx.kygrsl desc,sq_bzxx.mqzsgds,sq_sgd.zbj desc";


//	out.println(ls_sql);
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
//������ʾ��
/*
	String[] disColName1={"sgdmc","bzs","zbj","wkgsl","wkgqye","sl","wwgqye","wwgpjde","wgsl","wgqye","wgpjde"};
	pageObj.setDisColName(disColName1);
*/


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>
</body>
</html>