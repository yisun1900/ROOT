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
	String wheresql="";
	String crm_cpgzjl_khbh=null;
	String crm_cpgzjl_cpflbm=null;
	String crm_cpgzjl_cplx=null;
	String crm_cpgzjl_cpazlx=null;
	String crm_cpgzjl_ghf=null;
	String crm_cpgzjl_jgpp=null;
	String crm_cpgzjl_ghfhzsj=null;
	String crm_cpgzjl_sfxdd=null;
	String crm_cpgzjl_sfxhxgl=null;
	String crm_cpgzjl_zxsfwz=null;
	String crm_cpgzjl_cpsjs=null;
	String crm_cpgzjl_sfxfb=null;
	String crm_cpgzjl_sfxwx=null;
	String crm_cpgzjl_sfyyc=null;
	String crm_cpgzjl_sfxtx=null;
	String crm_cpgzjl_txrq=null;
	String crm_cpgzjl_txxs=null;
	String crm_cpgzjl_cpztbm=null;
	String crm_cpgzjl_lrr=null;
	String crm_cpgzjl_lrsj=null;
	String crm_cpgzjl_lrbm=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_cpgzjl_fbdbh=null;
	String crm_cpgzjl_wxdbh=null;
	String crm_cpgzjl_ycdbh=null;
	crm_cpgzjl_khbh=request.getParameter("crm_cpgzjl_khbh");
	if (crm_cpgzjl_khbh!=null)
	{
		crm_cpgzjl_khbh=cf.GB2Uni(crm_cpgzjl_khbh);
		if (!(crm_cpgzjl_khbh.equals("")))	wheresql+=" and  (crm_cpgzjl.khbh='"+crm_cpgzjl_khbh+"')";
	}
	crm_cpgzjl_cpflbm=request.getParameter("crm_cpgzjl_cpflbm");
	if (crm_cpgzjl_cpflbm!=null)
	{
		crm_cpgzjl_cpflbm=cf.GB2Uni(crm_cpgzjl_cpflbm);
		if (!(crm_cpgzjl_cpflbm.equals("")))	wheresql+=" and  (crm_cpgzjl.cpflbm='"+crm_cpgzjl_cpflbm+"')";
	}
	crm_cpgzjl_cplx=request.getParameter("crm_cpgzjl_cplx");
	if (crm_cpgzjl_cplx!=null)
	{
		crm_cpgzjl_cplx=cf.GB2Uni(crm_cpgzjl_cplx);
		if (!(crm_cpgzjl_cplx.equals("")))	wheresql+=" and  (crm_cpgzjl.cplx='"+crm_cpgzjl_cplx+"')";
	}
	crm_cpgzjl_cpazlx=request.getParameter("crm_cpgzjl_cpazlx");
	if (crm_cpgzjl_cpazlx!=null)
	{
		crm_cpgzjl_cpazlx=cf.GB2Uni(crm_cpgzjl_cpazlx);
		if (!(crm_cpgzjl_cpazlx.equals("")))	wheresql+=" and  (crm_cpgzjl.cpazlx='"+crm_cpgzjl_cpazlx+"')";
	}
	crm_cpgzjl_ghf=request.getParameter("crm_cpgzjl_ghf");
	if (crm_cpgzjl_ghf!=null)
	{
		crm_cpgzjl_ghf=cf.GB2Uni(crm_cpgzjl_ghf);
		if (!(crm_cpgzjl_ghf.equals("")))	wheresql+=" and  (crm_cpgzjl.ghf='"+crm_cpgzjl_ghf+"')";
	}
	crm_cpgzjl_jgpp=request.getParameter("crm_cpgzjl_jgpp");
	if (crm_cpgzjl_jgpp!=null)
	{
		crm_cpgzjl_jgpp=cf.GB2Uni(crm_cpgzjl_jgpp);
		if (!(crm_cpgzjl_jgpp.equals("")))	wheresql+=" and  (crm_cpgzjl.jgpp='"+crm_cpgzjl_jgpp+"')";
	}
	crm_cpgzjl_ghfhzsj=request.getParameter("crm_cpgzjl_ghfhzsj");
	if (crm_cpgzjl_ghfhzsj!=null)
	{
		crm_cpgzjl_ghfhzsj=crm_cpgzjl_ghfhzsj.trim();
		if (!(crm_cpgzjl_ghfhzsj.equals("")))	wheresql+="  and (crm_cpgzjl.ghfhzsj=TO_DATE('"+crm_cpgzjl_ghfhzsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_sfxdd=request.getParameter("crm_cpgzjl_sfxdd");
	if (crm_cpgzjl_sfxdd!=null)
	{
		crm_cpgzjl_sfxdd=cf.GB2Uni(crm_cpgzjl_sfxdd);
		if (!(crm_cpgzjl_sfxdd.equals("")))	wheresql+=" and  (crm_cpgzjl.sfxdd='"+crm_cpgzjl_sfxdd+"')";
	}
	crm_cpgzjl_sfxhxgl=request.getParameter("crm_cpgzjl_sfxhxgl");
	if (crm_cpgzjl_sfxhxgl!=null)
	{
		crm_cpgzjl_sfxhxgl=cf.GB2Uni(crm_cpgzjl_sfxhxgl);
		if (!(crm_cpgzjl_sfxhxgl.equals("")))	wheresql+=" and  (crm_cpgzjl.sfxhxgl='"+crm_cpgzjl_sfxhxgl+"')";
	}
	crm_cpgzjl_zxsfwz=request.getParameter("crm_cpgzjl_zxsfwz");
	if (crm_cpgzjl_zxsfwz!=null)
	{
		crm_cpgzjl_zxsfwz=cf.GB2Uni(crm_cpgzjl_zxsfwz);
		if (!(crm_cpgzjl_zxsfwz.equals("")))	wheresql+=" and  (crm_cpgzjl.zxsfwz='"+crm_cpgzjl_zxsfwz+"')";
	}
	crm_cpgzjl_cpsjs=request.getParameter("crm_cpgzjl_cpsjs");
	if (crm_cpgzjl_cpsjs!=null)
	{
		crm_cpgzjl_cpsjs=cf.GB2Uni(crm_cpgzjl_cpsjs);
		if (!(crm_cpgzjl_cpsjs.equals("")))	wheresql+=" and  (crm_cpgzjl.cpsjs='"+crm_cpgzjl_cpsjs+"')";
	}
	crm_cpgzjl_sfxfb=request.getParameter("crm_cpgzjl_sfxfb");
	if (crm_cpgzjl_sfxfb!=null)
	{
		crm_cpgzjl_sfxfb=cf.GB2Uni(crm_cpgzjl_sfxfb);
		if (!(crm_cpgzjl_sfxfb.equals("")))	wheresql+=" and  (crm_cpgzjl.sfxfb='"+crm_cpgzjl_sfxfb+"')";
	}
	crm_cpgzjl_sfxwx=request.getParameter("crm_cpgzjl_sfxwx");
	if (crm_cpgzjl_sfxwx!=null)
	{
		crm_cpgzjl_sfxwx=cf.GB2Uni(crm_cpgzjl_sfxwx);
		if (!(crm_cpgzjl_sfxwx.equals("")))	wheresql+=" and  (crm_cpgzjl.sfxwx='"+crm_cpgzjl_sfxwx+"')";
	}
	crm_cpgzjl_sfyyc=request.getParameter("crm_cpgzjl_sfyyc");
	if (crm_cpgzjl_sfyyc!=null)
	{
		crm_cpgzjl_sfyyc=cf.GB2Uni(crm_cpgzjl_sfyyc);
		if (!(crm_cpgzjl_sfyyc.equals("")))	wheresql+=" and  (crm_cpgzjl.sfyyc='"+crm_cpgzjl_sfyyc+"')";
	}
	crm_cpgzjl_sfxtx=request.getParameter("crm_cpgzjl_sfxtx");
	if (crm_cpgzjl_sfxtx!=null)
	{
		crm_cpgzjl_sfxtx=cf.GB2Uni(crm_cpgzjl_sfxtx);
		if (!(crm_cpgzjl_sfxtx.equals("")))	wheresql+=" and  (crm_cpgzjl.sfxtx='"+crm_cpgzjl_sfxtx+"')";
	}
	crm_cpgzjl_txrq=request.getParameter("crm_cpgzjl_txrq");
	if (crm_cpgzjl_txrq!=null)
	{
		crm_cpgzjl_txrq=crm_cpgzjl_txrq.trim();
		if (!(crm_cpgzjl_txrq.equals("")))	wheresql+="  and (crm_cpgzjl.txrq=TO_DATE('"+crm_cpgzjl_txrq+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_txxs=request.getParameter("crm_cpgzjl_txxs");
	if (crm_cpgzjl_txxs!=null)
	{
		crm_cpgzjl_txxs=crm_cpgzjl_txxs.trim();
		if (!(crm_cpgzjl_txxs.equals("")))	wheresql+=" and (crm_cpgzjl.txxs="+crm_cpgzjl_txxs+") ";
	}
	crm_cpgzjl_cpztbm=request.getParameter("crm_cpgzjl_cpztbm");
	if (crm_cpgzjl_cpztbm!=null)
	{
		crm_cpgzjl_cpztbm=cf.GB2Uni(crm_cpgzjl_cpztbm);
		if (!(crm_cpgzjl_cpztbm.equals("")))	wheresql+=" and  (crm_cpgzjl.cpztbm='"+crm_cpgzjl_cpztbm+"')";
	}
	crm_cpgzjl_lrr=request.getParameter("crm_cpgzjl_lrr");
	if (crm_cpgzjl_lrr!=null)
	{
		crm_cpgzjl_lrr=cf.GB2Uni(crm_cpgzjl_lrr);
		if (!(crm_cpgzjl_lrr.equals("")))	wheresql+=" and  (crm_cpgzjl.lrr='"+crm_cpgzjl_lrr+"')";
	}
	crm_cpgzjl_lrsj=request.getParameter("crm_cpgzjl_lrsj");
	if (crm_cpgzjl_lrsj!=null)
	{
		crm_cpgzjl_lrsj=crm_cpgzjl_lrsj.trim();
		if (!(crm_cpgzjl_lrsj.equals("")))	wheresql+="  and (crm_cpgzjl.lrsj=TO_DATE('"+crm_cpgzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpgzjl_lrbm=request.getParameter("crm_cpgzjl_lrbm");
	if (crm_cpgzjl_lrbm!=null)
	{
		crm_cpgzjl_lrbm=cf.GB2Uni(crm_cpgzjl_lrbm);
		if (!(crm_cpgzjl_lrbm.equals("")))	wheresql+=" and  (crm_cpgzjl.lrbm='"+crm_cpgzjl_lrbm+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_cpgzjl_fbdbh=request.getParameter("crm_cpgzjl_fbdbh");
	if (crm_cpgzjl_fbdbh!=null)
	{
		crm_cpgzjl_fbdbh=cf.GB2Uni(crm_cpgzjl_fbdbh);
		if (!(crm_cpgzjl_fbdbh.equals("")))	wheresql+=" and  (crm_cpgzjl.fbdbh='"+crm_cpgzjl_fbdbh+"')";
	}
	crm_cpgzjl_wxdbh=request.getParameter("crm_cpgzjl_wxdbh");
	if (crm_cpgzjl_wxdbh!=null)
	{
		crm_cpgzjl_wxdbh=cf.GB2Uni(crm_cpgzjl_wxdbh);
		if (!(crm_cpgzjl_wxdbh.equals("")))	wheresql+=" and  (crm_cpgzjl.wxdbh='"+crm_cpgzjl_wxdbh+"')";
	}
	crm_cpgzjl_ycdbh=request.getParameter("crm_cpgzjl_ycdbh");
	if (crm_cpgzjl_ycdbh!=null)
	{
		crm_cpgzjl_ycdbh=cf.GB2Uni(crm_cpgzjl_ycdbh);
		if (!(crm_cpgzjl_ycdbh.equals("")))	wheresql+=" and  (crm_cpgzjl.ycdbh='"+crm_cpgzjl_ycdbh+"')";
	}
	ls_sql="SELECT crm_cpgzjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,cpflmc,cpztmc,crm_cpgzjl.ztfssj, DECODE(crm_cpgzjl.cplx,'1','����Ʒ','2','��Ʒ'), DECODE(crm_cpgzjl.cpazlx,'1','ʩ����','2','��װ��'), DECODE(crm_cpgzjl.ghf,'�׹�','�׹�','��˾��','��˾��','δȷ��','δȷ��'),crm_cpgzjl.jgpp,crm_cpgzjl.ghfhzsj, DECODE(crm_cpgzjl.sfxdd,'Y','��','N','��'), DECODE(crm_cpgzjl.sfxhxgl,'Y','��','N','��'), DECODE(crm_cpgzjl.zxsfwz,'Y','��','N','��'),crm_cpgzjl.cpsjs, DECODE(crm_cpgzjl.sfxfb,'N','�޷���','Y','�ȴ�����','W','�������'),crm_cpgzjl.fbdbh, DECODE(crm_cpgzjl.sfxwx,'N','��ά��','Y','�ȴ�ά��','W','ά�����'),crm_cpgzjl.wxdbh, DECODE(crm_cpgzjl.sfyyc,'N','���쳣','Y','�ȴ�����','W','�쳣���'),crm_cpgzjl.ycdbh , DECODE(crm_cpgzjl.sfxtx,'Y','������','N','��'),crm_cpgzjl.txrq,crm_cpgzjl.txxs,crm_cpgzjl.txnr,crm_cpgzjl.zwyjcrq,crm_cpgzjl.jhrksj,crm_cpgzjl.jhshsj,crm_cpgzjl.jhazsj,crm_cpgzjl.lrr,crm_cpgzjl.lrsj,dwmc,crm_cpgzjl.bz,crm_cpgzjl.cpflbm";
	ls_sql+=" FROM crm_cpgzjl,crm_khxx,dm_cpflbm,dm_cpztbm,sq_dwxx  ";
    ls_sql+=" where crm_cpgzjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_cpgzjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpgzjl.cpztbm=dm_cpztbm.cpztbm";
    ls_sql+=" and crm_cpgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_cpgzjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_cpgzjlQdAzList.jsp","","","QdAzCrm_cpgzjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","cpflbm","crm_cpgzjl_cplx","crm_cpgzjl_cpazlx","crm_cpgzjl_ghf","crm_cpgzjl_jgpp","crm_cpgzjl_ghfhzsj","crm_cpgzjl_sfxdd","crm_cpgzjl_sfxhxgl","crm_cpgzjl_zxsfwz","crm_cpgzjl_cpsjs","crm_cpgzjl_sfxfb","crm_cpgzjl_sfxwx","crm_cpgzjl_sfyyc","crm_cpgzjl_sfxtx","crm_cpgzjl_txrq","crm_cpgzjl_txxs","crm_cpgzjl_txnr","crm_cpgzjl_cpztbm","crm_cpgzjl_lrr","crm_cpgzjl_lrsj","crm_cpgzjl_lrbm","crm_cpgzjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_cpgzjl_fbdbh","crm_cpgzjl_wxdbh","crm_cpgzjl_ycdbh"};
	pageObj.setDisColName(disColName);
//��������
*/
	String[] keyName={"khbh","cpflbm"};
	pageObj.setKey(keyName);


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
  <B><font size="3">ȷ�Ͽɰ�װ����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="5%">���ݵ�ַ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">���ʦ</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="3%">��Ʒ״̬</td>
	<td  width="3%">״̬����ʱ��</td>
	<td  width="2%">��Ʒ����</td>
	<td  width="2%">��Ʒ��װ����</td>
	<td  width="2%">������</td>
	<td  width="5%">�׹�Ʒ��</td>
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