<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String wheresql=cf.GB2Uni(cf.getParameter(request,"wheresql"));

	
	
	ls_sql="SELECT  crm_tsjl.tsjlh,crm_tsbm.zrr,crm_tsjl.khbh,tsxlmc,dm_slfsbm.slfsmc,crm_khxx.khxm,crm_khxx.fwdz";
	ls_sql+=" ,crm_tsjl.lrsj,crm_tsbm.dwbh,sq_dwxx.dwmc zrbm,crm_tsbm.tzsj,crm_tsbm.tsyybm,crm_tsbm.tspp";
	ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','E','����ʵ','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') as clzt,crm_khxx.sjs";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','δ����','1','������','4','�ѽ���','5','�ѳ��ֳ�','6','�ѳ�����','7','�������ͨ��','2','�ڴ���','3','�᰸','9','������') as jazt,sgdmc";

	ls_sql+=" ,crm_tsbm.jssj,crm_tsbm.jsr,crm_tsbm.jssm";
	ls_sql+=" ,crm_tsbm.jhcxcsj,crm_tsbm.kcjlh,crm_tsbm.sjcxcr,crm_tsbm.sjcxcsj,crm_tsbm.cxcsm";
	ls_sql+=" ,crm_tsbm.jhcfasj,crm_tsbm.cfajlh,crm_tsbm.sjcfar,crm_tsbm.sjcfasj,crm_tsbm.jjfa";
	ls_sql+=" ,crm_tsbm.jhjjsj,DECODE(crm_tsbm.sfpfkh,'1','��','2','�⸶') sfpfkh,crm_tsbm.khpfze,DECODE(crm_tsbm.sfnbcf,'1','��','2','����') sfnbcf,crm_tsbm.nbcfze";
	ls_sql+=" ,crm_tsbm.shbm,crm_tsbm.shr,crm_tsbm.shsj,crm_tsbm.shsm";
	ls_sql+=" ,crm_tsbm.cljlh,crm_tsbm.sjjjsj,crm_tsbm.clr,crm_tsbm.clsj,crm_tsbm.clqk";
	ls_sql+=" ,dm_tshfjgbm.hfjgmc,crm_tsbm.qrjjsj,dm_zzjgbm.zzjgmc,dm_jsxbm.jsxmc";



	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,dm_tsxlbm,crm_tsbm,sq_dwxx,sq_sgd,dm_tshfjgbm,dm_zzjgbm,dm_jsxbm ";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+)";
    ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=sq_dwxx.dwbh(+)  ";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsbm.hfjgbm=dm_tshfjgbm.hfjgbm(+) ";
    ls_sql+=" and crm_tsbm.zzjgbm=dm_zzjgbm.zzjgbm(+) ";
    ls_sql+=" and crm_tsbm.jsxbm=dm_jsxbm.jsxbm(+) ";
		ls_sql+=" and crm_tsjl.slfsbm='5'";//5:�ط�
		ls_sql+=" and crm_tsjl.lx='1'";//1��Ͷ�ߣ�2������
		ls_sql+=" and crm_tsjl.clzt!='9'";//9:������
		ls_sql+=wheresql;
		ls_sql+=" and crm_tsbm.qrjjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsbm.qrjjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		
		ls_sql+=" and crm_tsbm.clzt='5'";//5���᰸
		ls_sql+=" and crm_tsbm.sfjslx='Y'";//Y����ʱ��ϵ
    ls_sql+=" order by crm_tsjl.lrsj,crm_tsjl.tsjlh,crm_tsbm.jssj,crm_tsbm.cljlh,crm_tsbm.tsyybm" ;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"tsjlh","zrbm","zrr","tsxlmc","clzt","khxm","fwdz","jssj","jsr","jssm","jhcxcsj","kcjlh","sjcxcsj","sjcxcr","cxcsm","jhcfasj","cfajlh","sjcfasj","sjcfar","jjfa","jhjjsj","sfpfkh","khpfze","sfnbcf","nbcfze","shbm","shr","shsj","shsm","cljlh","sjjjsj","clsj","clr","clqk","hfjgmc","qrjjsj","zzjgmc","jsxmc","sjs","sgdmc","slfsmc","lrsj","jazt","tspp"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"tsjlh","tsyybm"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("����"); 




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


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�ط�����</B> 
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(530);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70px">�ط����</td>
	<td  width="2%">���β���</td>
	<td  width="1%">������</td>
	<td  width="3%">����ԭ��</td>
	<td  width="2%">����״̬</td>
	<td  width="1%">����</td>
	<td  width="5%">���ݵ�ַ</td>

	<td  width="80px">����ʱ��</td>
	<td  width="1%">������</td>
	<td  width="6%">����˵��</td>

	<td  width="80px">�ƻ����ֳ�ʱ��</td>
	<td  width="80px">���ֳ���¼��</td>
	<td  width="80px">ʵ�ʳ��ֳ�ʱ��</td>
	<td  width="1%">ʵ�ʳ��ֳ���</td>
	<td  width="7%">���ֳ�˵��</td>

	<td  width="80px">�ƻ�������ʱ��</td>
	<td  width="80px">��������¼��</td>
	<td  width="80px">ʵ�ʳ�����ʱ��</td>
	<td  width="1%">ʵ�ʳ�������</td>
	<td  width="9%">�������</td>

	<td  width="80px">�ƻ����ʱ��</td>
	<td  width="1%">�Ƿ��⸶�ͻ�</td>
	<td  width="1%">�ͻ��⸶�ܶ�</td>
	<td  width="1%">�Ƿ��ڲ�����</td>
	<td  width="1%">�ڲ������ܶ�</td>

	<td  width="2%">������˲���</td>
	<td  width="1%">���������</td>
	<td  width="80px">�������ʱ��</td>
	<td  width="6%">�������˵��</td>

	<td  width="80px">�����¼��</td>
	<td  width="80px">���β��Ž��ʱ��</td>
	<td  width="80px">���´���ʱ��</td>
	<td  width="1%">���´�����</td>
	<td  width="10%">���´������</td>

	<td  width="2%">�ͷ��طý��</td>
	<td  width="80px">�ط�ȷ�Ͻ��ʱ��</td>
	<td  width="2%">�᰸�ͻ��Ƿ�����</td>
	<td  width="2%">������⼰ʱ��</td>



	<td  width="1%">���ʦ</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">��Դ</td>
	<td  width="80px">¼��ʱ��</td>
	<td  width="2%">�᰸״̬</td>
	<td  width="3%">�漰����</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>
