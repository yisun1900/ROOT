<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");

	String ls_sql=null;

	ls_sql="SELECT cw_gdjkjl.gdjkjlh as gdjkjlh,cw_gdjkjl.khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.zjxm as crm_khxx_zjxm,sgdmc as sgd, DECODE(cw_gdjkjl.jklx,'1','�����','2','���Ͽ�','9','����') as cw_gdjkjl_jklx,cw_gdjkjl.jkje as cw_gdjkjl_jkje,cw_gdjkjl.jkblr as cw_gdjkjl_jkblr,cw_gdjkjl.jkblsj as cw_gdjkjl_jkblsj,cw_gdjkjl.lrr,cw_gdjkjl.lrsj,dwmc,DECODE(cw_gdjkjl.gdjsjd,'0','δ����','1','�ѽ���') gdjsjd,cw_gdjkjl.gdjsjlh,cw_gdjkjl.bz as cw_gdjkjl_bz  ";
	ls_sql+=" FROM crm_khxx,cw_gdjkjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjkjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and cw_gdjkjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and cw_gdjkjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_khxx.sgd,cw_gdjkjl.gdjkjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"sgd","crm_khxx_khxm","gdjkjlh","cw_gdjkjl_jklx","cw_gdjkjl_jkje","cw_gdjkjl_jkblr","cw_gdjkjl_jkblsj","lrr","lrsj","dwmc","gdjsjd","gdjsjlh","cw_gdjkjl_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"gdjkjlh"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sgd","1");//�в����������Hash��
	spanColHash.put("crm_khxx_khxm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">ʩ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="5%">ʩ���ӽ���¼��</td>
	<td  width="5%">�������</td>
	<td  width="6%">�����</td>
	<td  width="4%">������</td>
	<td  width="6%">����ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
	<td  width="4%">�����־</td>
	<td  width="5%">�����¼��</td>
	<td  width="10%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>