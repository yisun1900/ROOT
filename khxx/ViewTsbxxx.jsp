<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;
%>
<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">Ͷ�߱��޼�¼���ͻ����:<%=khbh%>��</div>
<table width="270%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">Ͷ�߼�¼��</td>
	<td  width="2%">�᰸״̬</td>
	<td  width="2%">����</td>
	<td  width="3%">ά�޷���</td>
	<td  width="2%">�Ƿ�������</td>
	<td  width="3%">Ͷ�߱���ʱ��</td>
	<td  width="2%">����ʽ</td>
	<td  width="2%">�������</td>
	<td  width="2%">����רԱ</td>
	<td  width="2%">���س̶�</td>
	<td  width="19%">Ͷ�߱�������</td>
	<td  width="3%">�ͻ�Ҫ����ʱ��</td>
	<td  width="2%">�Ƿ���ط�</td>
	<td  width="3%">����ʱ��</td>
	<td  width="4%">Ͷ�߱���С��</td>
	<td  width="8%">Ͷ�߱���ԭ��</td>
	<td  width="4%">���β���</td>
	<td  width="3%">����״̬</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">�طý��</td>
	<td  width="19%">�������</td>
	<td  width="5%">Ͷ��Ʒ��</td>
</tr>

<%
	ls_sql="SELECT crm_tsjl.tsjlh, DECODE(crm_tsjl.clzt,'0','δ����','1','������','2','�ڴ���','3','�᰸','9','������') jazt ";
	ls_sql+=" ,DECODE(crm_tsjl.lx,'1','Ͷ��','2','����') lx,DECODE(crm_tsjl.wxfl,'1','����ά��','2','������ά��') wxfl";
	ls_sql+=" ,DECODE(crm_tsjl.sfpz,'Y','��','N','��') sfpz,tsbxsj,slfsmc,khldcs,kszy,yzcdmc,crm_tsjl.tsnr,crm_tsjl.yqjjsj ";
	ls_sql+=" ,DECODE(crm_tsjl.sfxhf,'Y','��ط�','N','����ط�') sfxhf,crm_tsjl.slsj,tsxlmc,tsyymc,b.dwmc zrbm";
	ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','��δ����','2','�ڴ���','3','���') clzt,crm_tsbm.clr,crm_tsbm.clsj,hfjgmc ";
	ls_sql+=" ,crm_tsbm.clqk,crm_tsbm.tspp ";
	ls_sql+=" FROM crm_khxx,crm_tsbm,crm_tsjl,dm_tsxlbm,dm_tsyybm,dm_slfsbm,dm_yzcdbm,sq_dwxx b,dm_hfjgbm ";
    ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh(+)";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+)";
    ls_sql+=" and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) ";
    ls_sql+=" and crm_tsbm.dwbh=b.dwbh(+) ";
	ls_sql+=" and crm_tsjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_tsjl.khbh,crm_tsjl.tsjlh,crm_tsbm.tsxlbm,crm_tsbm.tsyybm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("tsjlh","1");//�в����������Hash��
	spanColHash.put("jazt","1");//�в����������Hash��
	spanColHash.put("lx","1");//�в����������Hash��
	spanColHash.put("wxfl","1");//�в����������Hash��
	spanColHash.put("sfpz","1");//�в����������Hash��
	spanColHash.put("tsbxsj","1");//�в����������Hash��
	spanColHash.put("slfsmc","1");//�в����������Hash��
	spanColHash.put("khldcs","1");//�в����������Hash��
	spanColHash.put("kszy","1");//�в����������Hash��

	
	spanColHash.put("yzcdmc","1");//�в����������Hash��
	spanColHash.put("tsnr","1");//�в����������Hash��
	spanColHash.put("yqjjsj","1");//�в����������Hash��
	spanColHash.put("sfxhf","1");//�в����������Hash��
	spanColHash.put("slsj","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>
</body>
</html>
