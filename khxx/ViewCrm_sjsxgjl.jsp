<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">�޸ļ�¼ </div>
<table width="500%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�޸ļ�¼��</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="3%">�޸�ǰ�ֹ�˾</td>
	<td  width="3%">�޸�ǰǩԼ����</td>
	<td  width="2%">�޸�ǰ�����</td>
	<td  width="2%">�޸�ǰ���ʦ</td>
	<td  width="2%">�޸�ǰ���ʦ����</td>
	<td  width="3%">�޸�ǰ����ԭ����</td>
	<td  width="3%">�޸�ǰǩԼ��</td>
	<td  width="2%">�޸�ǰ˰��</td>
	<td  width="2%">�޸�ǰ˰��ٷֱ�</td>
	<td  width="3%">�޸�ǰ��Ʒ�</td>
	<td  width="2%">�޸�ǰ�����</td>
	<td  width="2%">�޸�ǰ�ۿ���</td>
	<td  width="3%">�޸�ǰ��˾�����</td>
	<td  width="3%">�޸�ǰС�������</td>
	<td  width="2%">�޸�ǰչ������</td>
	<td  width="2%">�޸ĺ�ֹ�˾</td>
	<td  width="2%">�޸ĺ�ǩԼ����</td>
	<td  width="2%">�޸ĺ������</td>
	<td  width="2%">�޸ĺ����ʦ</td>
	<td  width="2%">�޸ĺ����ʦ����</td>
	<td  width="3%">�޸ĺ󹤳�ԭ����</td>
	<td  width="3%">�޸ĺ�ǩԼ��</td>
	<td  width="2%">�޸ĺ�˰��</td>
	<td  width="2%">�޸ĺ�˰��ٷֱ�</td>
	<td  width="3%">�޸ĺ���Ʒ�</td>
	<td  width="2%">�޸ĺ�����</td>
	<td  width="2%">�޸ĺ��ۿ���</td>
	<td  width="3%">�޸ĺ�����</td>
	<td  width="3%">�޸ĺ�С�������</td>
	<td  width="2%">�޸ĺ�չ������</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="2%">ɾ����־</td>
	<td  width="2%">ɾ����</td>
	<td  width="2%">ɾ��ʱ��</td>
	<td  width="4%">��ע</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT crm_qyexgjl.xgjlh,crm_qyexgjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,a.dwmc xgqfgsbh,b.dwmc xgqdwbh,xgqsjsbh,xgqsjs,xgqsjsgh,xgqwdzgce,xgqqye,xgqsuijin,xgqsuijinbfb,xgqsjf,xgqglf,xgqzkl,xgqcxhd,xgqcxhdbmxq,xgqcxhdbmzh,c.dwmc xghfgsbh,d.dwmc xghdwbh,xghsjsbh,xghsjs,xghsjsgh,xghwdzgce,xghqye,xghsuijin,xghsuijinbfb,xghsjf,xghglf,xghzkl,xghcxhd,xghcxhdbmxq,xghcxhdbmzh,crm_qyexgjl.lrr,crm_qyexgjl.lrsj, DECODE(crm_qyexgjl.scbz,'N','δɾ��','Y','ɾ��'),crm_qyexgjl.scr,crm_qyexgjl.scsj,crm_qyexgjl.bz  ";
	ls_sql+=" FROM crm_qyexgjl,crm_khxx,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d  ";
    ls_sql+=" where crm_qyexgjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_qyexgjl.xgqfgsbh=a.dwbh(+) and crm_qyexgjl.xgqdwbh=b.dwbh(+)";
    ls_sql+=" and crm_qyexgjl.xghfgsbh=c.dwbh(+) and crm_qyexgjl.xghdwbh=d.dwbh(+)";
    ls_sql+=" and crm_qyexgjl.khbh='"+khbh+"'";
    ls_sql+=" order by lrsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>
</body>
</html>
