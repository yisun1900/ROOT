<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String khbh=request.getParameter("khbh");
	String rwbm=request.getParameter("rwbm");


	ls_sql="SELECT crm_cpgzjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,cpflmc,cpztmc, DECODE(crm_cpgzjl.cplx,'1','����Ʒ','2','��Ʒ'), DECODE(crm_cpgzjl.cpazlx,'1','ʩ����','2','��װ��'), DECODE(crm_cpgzjl.ghf,'�׹�','�׹�','��˾��','��˾��','δȷ��','δȷ��'),crm_cpgzjl.jgpp,crm_cpgzjl.ghfhzsj, DECODE(crm_cpgzjl.sfxdd,'Y','��','N','��'), DECODE(crm_cpgzjl.sfxhxgl,'Y','��','N','��'), DECODE(crm_cpgzjl.zxsfwz,'Y','��','N','��'),crm_cpgzjl.cpsjs, DECODE(crm_cpgzjl.sfxfb,'N','�޷���','Y','�ȴ�����','W','�������'),crm_cpgzjl.fbdbh, DECODE(crm_cpgzjl.sfxwx,'N','��ά��','Y','�ȴ�ά��','W','ά�����'),crm_cpgzjl.wxdbh, DECODE(crm_cpgzjl.sfyyc,'N','���쳣','Y','�ȴ�����','W','�쳣���'),crm_cpgzjl.ycdbh , DECODE(crm_cpgzjl.sfxtx,'Y','������','N','��'),crm_cpgzjl.txrq,crm_cpgzjl.txxs,crm_cpgzjl.txnr,crm_cpgzjl.zwyjcrq,crm_cpgzjl.jhrksj,crm_cpgzjl.jhshsj,crm_cpgzjl.jhazsj,crm_cpgzjl.lrr,crm_cpgzjl.lrsj,dwmc,crm_cpgzjl.bz,crm_cpgzjl.cpflbm";
	ls_sql+=" FROM crm_xmrwcpfl,crm_cpgzjl,crm_khxx,dm_cpflbm,dm_cpztbm,sq_dwxx  ";
    ls_sql+=" where crm_cpgzjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_cpgzjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpgzjl.cpztbm=dm_cpztbm.cpztbm";
    ls_sql+=" and crm_cpgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and crm_xmrwcpfl.khbh='"+khbh+"'";
    ls_sql+=" and crm_xmrwcpfl.rwbm='"+rwbm+"'";
    ls_sql+=" and crm_xmrwcpfl.khbh=crm_cpgzjl.khbh";
    ls_sql+=" and crm_xmrwcpfl.cpflbm=crm_cpgzjl.cpflbm ";
    ls_sql+=" order by crm_cpgzjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","/gcgl/xmrwgl/cpgz/InsertCrm_cpazjl.jsp","/gcgl/xmrwgl/cpgz/InsertCrm_cpztgzjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","cpflbm","crm_cpgzjl_cplx","crm_cpgzjl_cpazlx","crm_cpgzjl_ghf","crm_cpgzjl_jgpp","crm_cpgzjl_ghfhzsj","crm_cpgzjl_sfxdd","crm_cpgzjl_sfxhxgl","crm_cpgzjl_zxsfwz","crm_cpgzjl_cpsjs","crm_cpgzjl_sfxfb","crm_cpgzjl_sfxwx","crm_cpgzjl_sfyyc","crm_cpgzjl_sfxtx","crm_cpgzjl_txrq","crm_cpgzjl_txxs","crm_cpgzjl_txnr","crm_cpgzjl_cpztbm","crm_cpgzjl_lrr","crm_cpgzjl_lrsj","crm_cpgzjl_lrbm","crm_cpgzjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_cpgzjl_fbdbh","crm_cpgzjl_wxdbh","crm_cpgzjl_ycdbh"};
	pageObj.setDisColName(disColName);
//��������
*/
	String[] keyName={"khbh","cpflbm"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("��װ");
	pageObj.setEditStr("״̬");


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCrm_cpztgzjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("cpflmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��Ʒ����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">���ʦ</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="3%">��Ʒ״̬</td>
	<td  width="2%">��Ʒ����</td>
	<td  width="2%">��Ʒ��װ����</td>
	<td  width="2%">������</td>
	<td  width="6%">�׹�Ʒ��</td>
	<td  width="3%">��������֪ʱ��</td>
	<td  width="2%">�Ƿ񽻵׺��¶���</td>
	<td  width="2%">�Ƿ����������</td>
	<td  width="2%">ѡ���Ƿ����</td>
	<td  width="2%">��Ʒ���ʦ</td>
	<td  width="2%">�Ƿ��践��</td>
	<td  width="2%">���������</td>
	<td  width="2%">�Ƿ���ά��</td>
	<td  width="2%">ά�޵����</td>
	<td  width="2%">�Ƿ����쳣</td>
	<td  width="2%">�쳣�����</td>
	<td  width="2%">�Ƿ�������</td>
	<td  width="3%">��������</td>
	<td  width="2%">����Сʱ</td>
	<td  width="12%">��������</td>
	<td  width="3%">����Ӧ��������</td>
	<td  width="3%">�ƻ����ʱ��</td>
	<td  width="3%">�ƻ��ͻ�ʱ��</td>
	<td  width="3%">�ƻ���װʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="62%">��ע</td>
	<td  width="2%">&nbsp;</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>