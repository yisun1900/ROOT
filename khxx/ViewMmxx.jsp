<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">ľ��Ԥ���� </div>
<table width="130%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">Ԥ�������</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="5%">��ͬ��</td>
	<td  width="6%">������</td>
	<td  width="6%">��ȡ����</td>
	<td  width="6%">Ԥ�����ܶ�</td>
	<td  width="7%">��ʽ��ͬ���</td>
	<td  width="6%">���Ϲ���</td>
	<td  width="7%">����״̬</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="11%">¼�벿��</td>
	<td  width="23%">��ע</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT jc_mmydd.yddbh as yddbh,khxm,hth, DECODE(jc_mmydd.wjqk,'1','�ͻ��Թ�','2','��˾����') as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.yddze as jc_mmydd_yddze,jc_mmydd.zshtje as jc_mmydd_zshtje,jc_mmydd.clgw as jc_mmydd_clgw, DECODE(jc_mmydd.clzt,'00','¼��δ���','01','����Ǽ�','02','�ۺϾ�Ӫ�������','03','��ȷ������ʱ��','04','����ɳ���','05','ǩ����ͬ','06','����ɸ���','07','�����','08','����װ֪ͨ','09','��װ֪ͨ��ȷ��','10','��װ���','11','ȡ������') as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz  ";
	ls_sql+=" FROM sq_dwxx,jc_mmydd,crm_khxx  ";
    ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_mmydd.khbh='"+khbh+"'";
    ls_sql+=" order by jc_mmydd.lrsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"yddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
</body>
</html>
