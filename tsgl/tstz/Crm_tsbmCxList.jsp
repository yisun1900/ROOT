<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String wheresql1="";


	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (!(fgsbh.equals("")))	wheresql+=" and  (crm_tsjl.ssfgs='"+fgsbh+"')";
	if (!(fgsbh.equals("")))	wheresql1+=" and  (crm_tshfjl.hffgs='"+fgsbh+"')";


	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		if (!(lx.equals("")))	wheresql+=" and  (crm_tsjl.lx='"+lx+"')";
	}

%>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>


<B>����ǿͷ��Ǽ���Ϣ</B>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">�������</td>
	<td  width="5%">Ͷ����Դ</td>
	<td  width="4%">����</td>
	<td  width="5%">����</td>
	<td  width="11%">¼��ʱ��</td>
	<td  width="9%">¼�벿��</td>
	<td  width="35%">Ͷ�߱�������</td>
	<td  width="6%">�ͻ����</td>
	<td  width="16%">���ݵ�ַ</td>
</tr>

<%

	ls_sql="SELECT crm_tsjl.tsjlh,slfsmc,DECODE(crm_tsjl.lx,'1','Ͷ��','2','����') lx,crm_khxx.khxm,crm_tsjl.lrsj,sq_dwxx.dwmc slbm,crm_tsjl.tsnr,crm_khxx.khbh,crm_khxx.fwdz";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_dwxx";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.slbm=sq_dwxx.dwbh";
	ls_sql+=" and crm_tsjl.clzt='0'";//0��δ����1��������2���ڴ���3���᰸��9:������
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.tsjlh";
    pageObj.sql=ls_sql;

	pageObj.initPage("","","","kfsl.jsp");
	pageObj.setDateType("long");
	pageObj.setEditStr("����");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);
	pageObj.alignStr[6]="align='left'";


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.displayFoot();


%>


<P><B>Ͷ�߼�¼�������˹�֪ͨ��ز��š���Ŀǰδ֪ͨ</B>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="12%">���β���</td>
	<td  width="8%">֪ͨ״̬</td>
	<td  width="26%">Ͷ��ԭ��</td>
	<td  width="8%">Ͷ�����</td>
	<td  width="6%">����</td>
	<td  width="10%">�᰸״̬</td>
	<td  width="8%">Ͷ����Դ</td>
	<td  width="17%">¼��ʱ��</td>
</tr>
<%
	ls_sql="SELECT crm_tsjl.tsjlh as tsjlh,crm_tsjl.khbh as khbh,DECODE(crm_tsjl.clzt,0,'δ����',1,'������',2,'�ڴ���',3,'�᰸','9','������') jazt,crm_tsbm.tsyybm,'��'||tsxlmc||'��'||tsyymc tsxlmc,slfsmc,crm_khxx.khxm ,crm_tsjl.lrsj,crm_tsbm.dwbh,dwmc,DECODE(crm_tsbm.sfytz,'0','δ֪ͨ','1','��֪ͨ','2','����֪ͨ') as sfytz";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,dm_tsxlbm,dm_tsyybm,crm_tsbm,sq_dwxx";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_tsjl.lx='1' ";//1��Ͷ�ߣ�2������
	ls_sql+=" and crm_tsjl.clzt in('1','2')";//0��δ����1��������2���ڴ���3���᰸��9:������
	ls_sql+=" and crm_tsbm.sfytz='0'";//0��δ֪ͨ��1����֪ͨ��2������֪ͨ
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.tsjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","SaveCrm_tsbm.jsp");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("֪ͨ");
	pageObj.setDateType("long");

//������ʾ��
	String[] disColName={"dwmc","sfytz","tsxlmc","tsjlh","khxm","jazt","slfsmc","lrsj"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName1={"tsjlh","tsyybm"};
	pageObj.setKey(keyName1);


	
	pageObj.alignStr[2]="align='left'";

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey3={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey3;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��



	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.displayFoot();
%> 
<P>
<B>���޼�¼�������˹�֪ͨ��ز��š���Ŀǰδ֪ͨ</B>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="12%">���β���</td>
	<td  width="8%">֪ͨ״̬</td>
	<td  width="26%">����ԭ��</td>
	<td  width="8%">�������</td>
	<td  width="6%">����</td>
	<td  width="10%">�᰸״̬</td>
	<td  width="8%">Ͷ����Դ</td>
	<td  width="17%">¼��ʱ��</td>
</tr>
<%
	ls_sql="SELECT crm_tsjl.tsjlh,crm_tsjl.khbh,DECODE(crm_tsjl.clzt,0,'δ����',1,'������',2,'�ڴ���',3,'�᰸','9','������') jazt,crm_tsbm.tsyybm,'��'||tsxlmc||'��'||tsyymc tsxlmc,slfsmc,crm_khxx.khxm ,crm_tsjl.lrsj,crm_tsbm.dwbh,dwmc,DECODE(crm_tsbm.sfytz,'0','δ֪ͨ','1','��֪ͨ','2','����֪ͨ') as sfytz";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,dm_tsxlbm,dm_tsyybm,crm_tsbm,sq_dwxx";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_tsjl.lx='2'";//1��Ͷ�ߣ�2������
	ls_sql+=" and crm_tsjl.clzt in('1','2')";//0��δ����1��������2���ڴ���3���᰸��9:������
	ls_sql+=" and crm_tsbm.sfytz='0'";//0��δ֪ͨ��1����֪ͨ��2������֪ͨ
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.tsjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","SaveCrm_tsbm.jsp");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("֪ͨ");
	pageObj.setDateType("long");
//������ʾ��
	String[] disColName1={"dwmc","sfytz","tsxlmc","tsjlh","khxm","jazt","slfsmc","lrsj"};
	pageObj.setDisColName(disColName1);
	pageObj.alignStr[2]="align='left'";
/*
*/

//��������
	String[] keyName2={"tsjlh","tsyybm"};
	pageObj.setKey(keyName2);

//�����г�������

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey4={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey4;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey5={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey5;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
	pageObj.displayFoot();
%> 

<P>
<B>�ط÷������⡪�����˹�֪ͨ��ز��š���Ŀǰδ֪ͨ</B>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="13%">��������</td>
	<td  width="8%">֪ͨ״̬</td>
	<td  width="9%">�طü�¼��</td>
	<td  width="7%">����</td>
	<td  width="9%">�ط�ʱ��</td>
	<td  width="27%">�ͻ��ط����</td>
	<td  width="22%">�ط��г��ֵ�������</td>
</tr>
<%
	ls_sql="SELECT crm_tshfjl.hfjlh as hfjlh,crm_tshffkbm.dwbh,dwmc,DECODE(crm_tshffkbm.clzt,'0','δ֪ͨ','1','��֪ͨδ�鿴','2','�Ѳ鿴') as clzt,crm_tshfjl.khbh as khbh,crm_khxx.khxm,crm_tshfjl.hfsj,khhfqk,cxxwt";
	ls_sql+=" FROM crm_tshffkbm,crm_tshfjl,crm_khxx,sq_dwxx";
    ls_sql+=" where crm_tshfjl.hfjlh=crm_tshffkbm.hfjlh and crm_tshffkbm.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_tshfjl.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_tshffkbm.clzt='0'";//0��δ֪ͨ��1����֪ͨδ�鿴��2���Ѳ鿴
	ls_sql+=wheresql1;
    ls_sql+=" order by crm_tshfjl.hfjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","SaveCrm_hfbm.jsp");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("֪ͨ");
//������ʾ��
	String[] disColName2={"dwmc","clzt","hfjlh","khxm","hfsj","khhfqk","cxxwt"};
	pageObj.setDisColName(disColName2);
/*
*/

//��������
	String[] keyName3={"hfjlh","dwbh"};
	pageObj.setKey(keyName3);

	pageObj.alignStr[5]="align='left'";
	pageObj.alignStr[6]="align='left'";

//�����г�������

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey6={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey6;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("crm_tsjl_khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey7={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey7;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</body>
</html>