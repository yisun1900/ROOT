<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String sgd=request.getParameter("sgd");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+sgd+"'");



	ls_sql="SELECT distinct crm_tsjl.tsjlh as tsjlh,crm_tsjl.khbh as khbh,tsnr,tsxlmc,slfsmc,tsyymc,crm_khxx.khxm,crm_khxx.fwdz,crm_tsjl.slsj,crm_tsjl.hfsj,DECODE(crm_tsjl.clzt,0,'�ǿͷ��Ǽ�',1,'�ͷ�����',2,'�ڴ���',3,'�᰸') as jazt,hfjgmc,zzjgmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_zzjgbm,dm_slfsbm,dm_tsxlbm,dm_tsyybm,crm_tsbm,dm_hfjgbm  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsbm.zzjgbm=dm_zzjgbm.zzjgbm(+)";
    ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm ";
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
    ls_sql+=" and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+) ";
	ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
	ls_sql+=" and (crm_tsbm.tslxbm='11')";//2������
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
    ls_sql+=" order by  crm_tsjl.khbh,crm_tsjl.slsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"khxm","fwdz","tsjlh","slfsmc","slsj","tsnr","tsxlmc","tsyymc","jazt","hfjgmc","zzjgmc"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("tsjlh","1");//�в����������Hash��
	spanColHash.put("slfsmc","1");//�в����������Hash��
	spanColHash.put("slsj","1");//�в����������Hash��
	spanColHash.put("tsnr","1");//�в����������Hash��
	spanColHash.put("jazt","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("crm_tsjl_khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ���ӱ�����ϸ��<%=dwmc%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="6%">���޼�¼</td>
	<td  width="5%">����ʽ</td>
	<td  width="7%">����ʱ��</td>
	<td  width="25%">��������</td>
	<td  width="6%">С��</td>
	<td  width="12%">ԭ��</td>
	<td  width="6%">�᰸״̬</td>
	<td  width="6%">�طý��</td>
	<td  width="6%">�᰸�ͻ��Ƿ�����</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>