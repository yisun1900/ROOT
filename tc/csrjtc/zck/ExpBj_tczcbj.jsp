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


	ls_sql="SELECT nbbm,tc_csrjzck.tccpdlbm,tc_csrjzck.tccplbbm,bzmc,tc_csrjzck.cpmc,tc_csrjzck.xh,tc_csrjzck.gg,tc_csrjzck.ppmc,tc_csrjzck.gysmc,tc_csrjzck.jldw,tc_csrjzck.xdjldw,tc_csrjzck.xdb,tc_csrjzck.sh,DECODE(tc_csrjzck.sfxclxs,'1','����ȡ��','2','����ȡ��','3','4��5��','4','������') sfxclxs,tc_csrjzck.jsj vv,tc_csrjzck.khxsdj ggd ";
	ls_sql+=" FROM tc_csrjzck,bdm_bjjbbm a,bdm_bjjbbm b,tc_csrjzcsjcjb  ";
    ls_sql+=" where tc_csrjzck.cpbm=tc_csrjzcsjcjb.cpbm(+) ";
    ls_sql+=" and tc_csrjzck.bjjbbm=a.bjjbbm(+) ";
    ls_sql+=" and tc_csrjzcsjcjb.bjjbbm=b.bjjbbm(+) ";
    ls_sql+=" and tc_csrjzck.dqbm='"+dqbm+"'";
    ls_sql+=" order by tc_csrjzck.tccpdlbm,tc_csrjzck.tccplbbm,tc_csrjzck.bjjbbm,tc_csrjzck.cpbm";
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
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
      <td width="3%">�ڲ�����</td>
      <td width="3%">��Ʒ����</td>
	  <td width="5%">��ƷС��</td>
	  <td width="4%">��������</td>
      <td width="5%">��Ʒ����</td>
      <td width="5%">�ͺ�</td>
      <td width="5%">���</td>
	  <td width="4%">Ʒ��</td>
	  <td width="5%">��Ӧ��</td>
	  <td width="2%">������λ</td>
	  <td width="2%">�µ�������λ</td>
	  <td width="2%">�µ���</td>
	  <td width="2%">���</td>
	  <td width="3%">�Ƿ��账��С��</td>
	  <td width="3%">ԭ�����</td>
	  <td width="3%">ԭ�ͻ����۵���</td>
      <td width="3%">ԭʩ���ӵ���</td>
	  <td width="3%">�����</td>
	  <td width="3%">�ͻ����۵���</td>
      <td width="3%">ʩ���ӵ���</td>
	  <td width="3%">�Ƿ���Ч</td>
	  <td width="3%">��Ч��ʼʱ��</td>
	  <td width="3%">��Ч����ʱ��</td>
	  <td width="4%">��Ƭ����</td>
	  <td width="7%">��ע</td>
	  <td width="3%">���ļ���</td>
	  <td width="3%">����������</td>
	  <td width="3%">ԭ�����շѼ�</td>
	  <td width="3%">�����շѼ�</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>