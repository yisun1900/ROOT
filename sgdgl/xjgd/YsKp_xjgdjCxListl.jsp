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
	String kp_xjgdjl_xjjlh=null;
	String kp_xjgdjl_khbh=null;
	String kp_xjgdjl_xjr=null;
	String kp_xjgdjl_xjsj=null;
	String xjlxbm=null;
	String kp_xjgdjl_lrr=null;
	String kp_xjgdjl_lrsj=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;

	String xjjgbm=null;
	xjjgbm=request.getParameter("xjjgbm");
	if (xjjgbm!=null)
	{
		if (!(xjjgbm.equals("")))	wheresql+=" and  (kp_xjgdjl.xjjgbm='"+xjjgbm+"')";
	}


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String cfspbz=null;
	cfspbz=request.getParameter("cfspbz");
	if (cfspbz!=null)
	{
		if (!(cfspbz.equals("")))	wheresql+=" and  (kp_xjgdjl.cfspbz='"+cfspbz+"')";
	}
	String kpbz=null;
	kpbz=request.getParameter("kpbz");
	if (kpbz!=null)
	{
		if (!(kpbz.equals("")))	wheresql+=" and  (kp_xjgdjl.kpbz='"+kpbz+"')";
	}
	String fkze=null;
	fkze=request.getParameter("fkze");
	if (fkze!=null)
	{
		if (!(fkze.equals("")))	wheresql+=" and  (kp_xjgdjl.fkze>"+fkze+")";
	}
	
	
	kp_xjgdjl_xjjlh=request.getParameter("kp_xjgdjl_xjjlh");
	if (kp_xjgdjl_xjjlh!=null)
	{
		kp_xjgdjl_xjjlh=cf.GB2Uni(kp_xjgdjl_xjjlh);
		if (!(kp_xjgdjl_xjjlh.equals("")))	wheresql+=" and  (kp_xjgdjl.xjjlh='"+kp_xjgdjl_xjjlh+"')";
	}
	kp_xjgdjl_khbh=request.getParameter("kp_xjgdjl_khbh");
	if (kp_xjgdjl_khbh!=null)
	{
		kp_xjgdjl_khbh=cf.GB2Uni(kp_xjgdjl_khbh);
		if (!(kp_xjgdjl_khbh.equals("")))	wheresql+=" and  (kp_xjgdjl.khbh='"+kp_xjgdjl_khbh+"')";
	}
	kp_xjgdjl_xjr=request.getParameter("kp_xjgdjl_xjr");
	if (kp_xjgdjl_xjr!=null)
	{
		kp_xjgdjl_xjr=cf.GB2Uni(kp_xjgdjl_xjr);
		if (!(kp_xjgdjl_xjr.equals("")))	wheresql+=" and  (kp_xjgdjl.xjr='"+kp_xjgdjl_xjr+"')";
	}
	kp_xjgdjl_xjsj=request.getParameter("kp_xjgdjl_xjsj");
	if (kp_xjgdjl_xjsj!=null)
	{
		kp_xjgdjl_xjsj=kp_xjgdjl_xjsj.trim();
		if (!(kp_xjgdjl_xjsj.equals("")))	wheresql+="  and (kp_xjgdjl.xjsj>=TO_DATE('"+kp_xjgdjl_xjsj+"','YYYY/MM/DD'))";
	}
	kp_xjgdjl_xjsj=request.getParameter("kp_xjgdjl_xjsj2");
	if (kp_xjgdjl_xjsj!=null)
	{
		kp_xjgdjl_xjsj=kp_xjgdjl_xjsj.trim();
		if (!(kp_xjgdjl_xjsj.equals("")))	wheresql+="  and (kp_xjgdjl.xjsj<=TO_DATE('"+kp_xjgdjl_xjsj+"','YYYY/MM/DD'))";
	}
	xjlxbm=request.getParameter("xjlxbm");
	if (xjlxbm!=null)
	{
		xjlxbm=cf.GB2Uni(xjlxbm);
		if (!(xjlxbm.equals("")))	wheresql+=" and  (kp_xjgdjl.xjlxbm='"+xjlxbm+"')";
	}
	kp_xjgdjl_lrr=request.getParameter("kp_xjgdjl_lrr");
	if (kp_xjgdjl_lrr!=null)
	{
		kp_xjgdjl_lrr=cf.GB2Uni(kp_xjgdjl_lrr);
		if (!(kp_xjgdjl_lrr.equals("")))	wheresql+=" and  (kp_xjgdjl.lrr='"+kp_xjgdjl_lrr+"')";
	}
	kp_xjgdjl_lrsj=request.getParameter("kp_xjgdjl_lrsj");
	if (kp_xjgdjl_lrsj!=null)
	{
		kp_xjgdjl_lrsj=kp_xjgdjl_lrsj.trim();
		if (!(kp_xjgdjl_lrsj.equals("")))	wheresql+="  and (kp_xjgdjl.lrsj>=TO_DATE('"+kp_xjgdjl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_xjgdjl_lrsj=request.getParameter("kp_xjgdjl_lrsj2");
	if (kp_xjgdjl_lrsj!=null)
	{
		kp_xjgdjl_lrsj=kp_xjgdjl_lrsj.trim();
		if (!(kp_xjgdjl_lrsj.equals("")))	wheresql+="  and (kp_xjgdjl.lrsj<=TO_DATE('"+kp_xjgdjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
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
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (kp_xjgdjl.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	ls_sql="SELECT kp_zgclgdmx.zgcljlh,kp_zggdmx.zgjlh,kp_xjgdjl.xjjlh,sgdmc,decode(kp_zggdmx.clzt,'1','δ����','2','�ѽ���','3','�ڴ���','4','���պϸ�','5','���ղ��ϸ�')  clzt,kp_zggdmx.jhjjsj,kp_zggdmx.zgsm,kp_zgclgdmx.jsr,kp_zgclgdmx.jssj,kp_zgclgdmx.jssm,crm_khxx.hth,crm_khxx.khxm,kp_xjgdjl.xjr,kp_xjgdjl.xjsj,xjlxmc,xjjgmc,kp_xjgdjl.bz,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm  ";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd,kp_xjlxbm,dm_xjjgbm,kp_zggdmx,kp_zgclgdmx  ";
    ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+) and kp_zggdmx.xjjlh=kp_xjgdjl.xjjlh and kp_zgclgdmx.zgjlh=kp_zggdmx.zgjlh ";
	//ls_sql+=" and kp_zggdmx.clzt in ('4','5')  ";
    ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm  ";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_xjgdjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("YsKp_xjgdjCxListl.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//	pageObj.setEditStr("����");
/*
//������ʾ��
	String[] disColName={"xjjlh","kp_xjgdjl_khbh","kp_xjgdjl_xjr","kp_xjgdjl_xjsj","xjlxbm","dm_xjjgbm_xjjgmc","kp_xjgdjl_lrr","kp_xjgdjl_lrsj","kp_xjgdjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zgcljlh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"xjjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewKp_xjgdjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xjjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"zgcljlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="ViewZgcljl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zgcljlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
  <B><font size="3">ʩ���Ӽ�����--��������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���Ĵ����¼��</td>
	<td  width="5%">���ļ�¼��</td>
	<td  width="5%">����¼��</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">����״̬</td>
	
	<td  width="4%">�ƻ����ʱ��</td>
	<td  width="8%">����˵��</td>
	<td  width="4%">������</td>
	<td  width="4%">����ʱ��</td>
	<td  width="8%">����˵��</td>
	
	<td  width="5%">��ͬ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="4%">�����</td>
	<td  width="5%">���ʱ��</td>
	<td  width="6%">�������</td>
	<td  width="8%">�����</td>
	<td  width="7%">���˵��</td>
	<td  width="5%">���ݵ�ַ</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">�ʼ�</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
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