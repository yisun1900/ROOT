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
	String jc_cgdd_ddbh=null;
	String jc_cgdd_khbh=null;
	String jc_cgdd_clgw=null;
	String jc_cgdd_jhccsj=null;
	String jc_cgdd_cgsjs=null;
	String jc_cgdd_sccsj=null;
	String jc_cgdd_kfcbz=null;
	String jc_cgdd_jhfcsj=null;
	String jc_cgdd_sfcsj=null;
	String jc_cgdd_qhtsj=null;
	String jc_cgdd_tdbz=null;
	String jc_cgdd_cgtdyybm=null;
	String jc_cgdd_jhazrq=null;
	String jc_cgdd_sazrq=null;
	String jc_cgdd_clzt=null;
	String jc_cgdd_khlx=null;
	String jc_cgdd_jsjd=null;
	String jc_cgdd_sfxhf=null;
	String jc_cgdd_hfrq=null;
	String jc_cgdd_hflxbm=null;
	String jc_cgdd_lrr=null;
	String jc_cgdd_lrsj=null;
	String jc_cgdd_dwbh=null;
	String jc_cgdd_khxm=null;
	String jc_cgdd_fwdz=null;
	String jc_cgdd_lxfs=null;
	String jc_cgdd_hth=null;
	jc_cgdd_ddbh=request.getParameter("jc_cgdd_ddbh");
	if (jc_cgdd_ddbh!=null)
	{
		jc_cgdd_ddbh=cf.GB2Uni(jc_cgdd_ddbh);
		if (!(jc_cgdd_ddbh.equals("")))	wheresql+=" and  (jc_cgdd.ddbh='"+jc_cgdd_ddbh+"')";
	}
	jc_cgdd_khbh=request.getParameter("jc_cgdd_khbh");
	if (jc_cgdd_khbh!=null)
	{
		jc_cgdd_khbh=cf.GB2Uni(jc_cgdd_khbh);
		if (!(jc_cgdd_khbh.equals("")))	wheresql+=" and  (jc_cgdd.khbh='"+jc_cgdd_khbh+"')";
	}
	jc_cgdd_clgw=request.getParameter("jc_cgdd_clgw");
	if (jc_cgdd_clgw!=null)
	{
		jc_cgdd_clgw=cf.GB2Uni(jc_cgdd_clgw);
		if (!(jc_cgdd_clgw.equals("")))	wheresql+=" and  (jc_cgdd.clgw='"+jc_cgdd_clgw+"')";
	}
	jc_cgdd_jhccsj=request.getParameter("jc_cgdd_jhccsj");
	if (jc_cgdd_jhccsj!=null)
	{
		jc_cgdd_jhccsj=jc_cgdd_jhccsj.trim();
		if (!(jc_cgdd_jhccsj.equals("")))	wheresql+="  and (jc_cgdd.jhccsj>=TO_DATE('"+jc_cgdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhccsj=request.getParameter("jc_cgdd_jhccsj2");
	if (jc_cgdd_jhccsj!=null)
	{
		jc_cgdd_jhccsj=jc_cgdd_jhccsj.trim();
		if (!(jc_cgdd_jhccsj.equals("")))	wheresql+="  and (jc_cgdd.jhccsj<=TO_DATE('"+jc_cgdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_cgsjs=request.getParameter("jc_cgdd_cgsjs");
	if (jc_cgdd_cgsjs!=null)
	{
		jc_cgdd_cgsjs=cf.GB2Uni(jc_cgdd_cgsjs);
		if (!(jc_cgdd_cgsjs.equals("")))	wheresql+=" and  (jc_cgdd.cgsjs='"+jc_cgdd_cgsjs+"')";
	}
	jc_cgdd_sccsj=request.getParameter("jc_cgdd_sccsj");
	if (jc_cgdd_sccsj!=null)
	{
		jc_cgdd_sccsj=jc_cgdd_sccsj.trim();
		if (!(jc_cgdd_sccsj.equals("")))	wheresql+="  and (jc_cgdd.sccsj>=TO_DATE('"+jc_cgdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sccsj=request.getParameter("jc_cgdd_sccsj2");
	if (jc_cgdd_sccsj!=null)
	{
		jc_cgdd_sccsj=jc_cgdd_sccsj.trim();
		if (!(jc_cgdd_sccsj.equals("")))	wheresql+="  and (jc_cgdd.sccsj<=TO_DATE('"+jc_cgdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_kfcbz=request.getParameter("jc_cgdd_kfcbz");
	if (jc_cgdd_kfcbz!=null)
	{
		jc_cgdd_kfcbz=cf.GB2Uni(jc_cgdd_kfcbz);
		if (!(jc_cgdd_kfcbz.equals("")))	wheresql+=" and  (jc_cgdd.kfcbz='"+jc_cgdd_kfcbz+"')";
	}
	jc_cgdd_jhfcsj=request.getParameter("jc_cgdd_jhfcsj");
	if (jc_cgdd_jhfcsj!=null)
	{
		jc_cgdd_jhfcsj=jc_cgdd_jhfcsj.trim();
		if (!(jc_cgdd_jhfcsj.equals("")))	wheresql+="  and (jc_cgdd.jhfcsj>=TO_DATE('"+jc_cgdd_jhfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhfcsj=request.getParameter("jc_cgdd_jhfcsj2");
	if (jc_cgdd_jhfcsj!=null)
	{
		jc_cgdd_jhfcsj=jc_cgdd_jhfcsj.trim();
		if (!(jc_cgdd_jhfcsj.equals("")))	wheresql+="  and (jc_cgdd.jhfcsj<=TO_DATE('"+jc_cgdd_jhfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sfcsj=request.getParameter("jc_cgdd_sfcsj");
	if (jc_cgdd_sfcsj!=null)
	{
		jc_cgdd_sfcsj=jc_cgdd_sfcsj.trim();
		if (!(jc_cgdd_sfcsj.equals("")))	wheresql+="  and (jc_cgdd.sfcsj>=TO_DATE('"+jc_cgdd_sfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sfcsj=request.getParameter("jc_cgdd_sfcsj2");
	if (jc_cgdd_sfcsj!=null)
	{
		jc_cgdd_sfcsj=jc_cgdd_sfcsj.trim();
		if (!(jc_cgdd_sfcsj.equals("")))	wheresql+="  and (jc_cgdd.sfcsj<=TO_DATE('"+jc_cgdd_sfcsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_qhtsj=request.getParameter("jc_cgdd_qhtsj");
	if (jc_cgdd_qhtsj!=null)
	{
		jc_cgdd_qhtsj=jc_cgdd_qhtsj.trim();
		if (!(jc_cgdd_qhtsj.equals("")))	wheresql+="  and (jc_cgdd.qhtsj>=TO_DATE('"+jc_cgdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_qhtsj=request.getParameter("jc_cgdd_qhtsj2");
	if (jc_cgdd_qhtsj!=null)
	{
		jc_cgdd_qhtsj=jc_cgdd_qhtsj.trim();
		if (!(jc_cgdd_qhtsj.equals("")))	wheresql+="  and (jc_cgdd.qhtsj<=TO_DATE('"+jc_cgdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_tdbz=request.getParameter("jc_cgdd_tdbz");
	if (jc_cgdd_tdbz!=null)
	{
		jc_cgdd_tdbz=cf.GB2Uni(jc_cgdd_tdbz);
		if (!(jc_cgdd_tdbz.equals("")))	wheresql+=" and  (jc_cgdd.tdbz='"+jc_cgdd_tdbz+"')";
	}
	jc_cgdd_cgtdyybm=request.getParameter("jc_cgdd_cgtdyybm");
	if (jc_cgdd_cgtdyybm!=null)
	{
		jc_cgdd_cgtdyybm=cf.GB2Uni(jc_cgdd_cgtdyybm);
		if (!(jc_cgdd_cgtdyybm.equals("")))	wheresql+=" and  (jc_cgdd.cgtdyybm='"+jc_cgdd_cgtdyybm+"')";
	}
	jc_cgdd_jhazrq=request.getParameter("jc_cgdd_jhazrq");
	if (jc_cgdd_jhazrq!=null)
	{
		jc_cgdd_jhazrq=jc_cgdd_jhazrq.trim();
		if (!(jc_cgdd_jhazrq.equals("")))	wheresql+="  and (jc_cgdd.jhazrq>=TO_DATE('"+jc_cgdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhazrq=request.getParameter("jc_cgdd_jhazrq2");
	if (jc_cgdd_jhazrq!=null)
	{
		jc_cgdd_jhazrq=jc_cgdd_jhazrq.trim();
		if (!(jc_cgdd_jhazrq.equals("")))	wheresql+="  and (jc_cgdd.jhazrq<=TO_DATE('"+jc_cgdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sazrq=request.getParameter("jc_cgdd_sazrq");
	if (jc_cgdd_sazrq!=null)
	{
		jc_cgdd_sazrq=jc_cgdd_sazrq.trim();
		if (!(jc_cgdd_sazrq.equals("")))	wheresql+="  and (jc_cgdd.sazrq>=TO_DATE('"+jc_cgdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_sazrq=request.getParameter("jc_cgdd_sazrq2");
	if (jc_cgdd_sazrq!=null)
	{
		jc_cgdd_sazrq=jc_cgdd_sazrq.trim();
		if (!(jc_cgdd_sazrq.equals("")))	wheresql+="  and (jc_cgdd.sazrq<=TO_DATE('"+jc_cgdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_clzt=request.getParameter("jc_cgdd_clzt");
	if (jc_cgdd_clzt!=null)
	{
		jc_cgdd_clzt=cf.GB2Uni(jc_cgdd_clzt);
		if (!(jc_cgdd_clzt.equals("")))	wheresql+=" and  (jc_cgdd.clzt='"+jc_cgdd_clzt+"')";
	}
	jc_cgdd_khlx=request.getParameter("jc_cgdd_khlx");
	if (jc_cgdd_khlx!=null)
	{
		jc_cgdd_khlx=cf.GB2Uni(jc_cgdd_khlx);
		if (!(jc_cgdd_khlx.equals("")))	wheresql+=" and  (jc_cgdd.khlx='"+jc_cgdd_khlx+"')";
	}
	jc_cgdd_jsjd=request.getParameter("jc_cgdd_jsjd");
	if (jc_cgdd_jsjd!=null)
	{
		jc_cgdd_jsjd=cf.GB2Uni(jc_cgdd_jsjd);
		if (!(jc_cgdd_jsjd.equals("")))	wheresql+=" and  (jc_cgdd.jsjd='"+jc_cgdd_jsjd+"')";
	}
	jc_cgdd_sfxhf=request.getParameter("jc_cgdd_sfxhf");
	if (jc_cgdd_sfxhf!=null)
	{
		jc_cgdd_sfxhf=cf.GB2Uni(jc_cgdd_sfxhf);
		if (!(jc_cgdd_sfxhf.equals("")))	wheresql+=" and  (jc_cgdd.sfxhf='"+jc_cgdd_sfxhf+"')";
	}
	jc_cgdd_hfrq=request.getParameter("jc_cgdd_hfrq");
	if (jc_cgdd_hfrq!=null)
	{
		jc_cgdd_hfrq=jc_cgdd_hfrq.trim();
		if (!(jc_cgdd_hfrq.equals("")))	wheresql+="  and (jc_cgdd.hfrq>=TO_DATE('"+jc_cgdd_hfrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_hfrq=request.getParameter("jc_cgdd_hfrq2");
	if (jc_cgdd_hfrq!=null)
	{
		jc_cgdd_hfrq=jc_cgdd_hfrq.trim();
		if (!(jc_cgdd_hfrq.equals("")))	wheresql+="  and (jc_cgdd.hfrq<=TO_DATE('"+jc_cgdd_hfrq+"','YYYY/MM/DD'))";
	}
	jc_cgdd_hflxbm=request.getParameter("jc_cgdd_hflxbm");
	if (jc_cgdd_hflxbm!=null)
	{
		jc_cgdd_hflxbm=cf.GB2Uni(jc_cgdd_hflxbm);
		if (!(jc_cgdd_hflxbm.equals("")))	wheresql+=" and  (jc_cgdd.hflxbm='"+jc_cgdd_hflxbm+"')";
	}
	jc_cgdd_lrr=request.getParameter("jc_cgdd_lrr");
	if (jc_cgdd_lrr!=null)
	{
		jc_cgdd_lrr=cf.GB2Uni(jc_cgdd_lrr);
		if (!(jc_cgdd_lrr.equals("")))	wheresql+=" and  (jc_cgdd.lrr='"+jc_cgdd_lrr+"')";
	}
	jc_cgdd_lrsj=request.getParameter("jc_cgdd_lrsj");
	if (jc_cgdd_lrsj!=null)
	{
		jc_cgdd_lrsj=jc_cgdd_lrsj.trim();
		if (!(jc_cgdd_lrsj.equals("")))	wheresql+="  and (jc_cgdd.lrsj>=TO_DATE('"+jc_cgdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_lrsj=request.getParameter("jc_cgdd_lrsj2");
	if (jc_cgdd_lrsj!=null)
	{
		jc_cgdd_lrsj=jc_cgdd_lrsj.trim();
		if (!(jc_cgdd_lrsj.equals("")))	wheresql+="  and (jc_cgdd.lrsj<=TO_DATE('"+jc_cgdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_dwbh=request.getParameter("jc_cgdd_dwbh");
	if (jc_cgdd_dwbh!=null)
	{
		jc_cgdd_dwbh=cf.GB2Uni(jc_cgdd_dwbh);
		if (!(jc_cgdd_dwbh.equals("")))	wheresql+=" and  (jc_cgdd.dwbh='"+jc_cgdd_dwbh+"')";
	}
	jc_cgdd_khxm=request.getParameter("jc_cgdd_khxm");
	if (jc_cgdd_khxm!=null)
	{
		jc_cgdd_khxm=cf.GB2Uni(jc_cgdd_khxm);
		if (!(jc_cgdd_khxm.equals("")))	wheresql+=" and  (jc_cgdd.khxm='"+jc_cgdd_khxm+"')";
	}
	jc_cgdd_fwdz=request.getParameter("jc_cgdd_fwdz");
	if (jc_cgdd_fwdz!=null)
	{
		jc_cgdd_fwdz=cf.GB2Uni(jc_cgdd_fwdz);
		if (!(jc_cgdd_fwdz.equals("")))	wheresql+=" and  (jc_cgdd.fwdz='"+jc_cgdd_fwdz+"')";
	}
	jc_cgdd_lxfs=request.getParameter("jc_cgdd_lxfs");
	if (jc_cgdd_lxfs!=null)
	{
		jc_cgdd_lxfs=cf.GB2Uni(jc_cgdd_lxfs);
		if (!(jc_cgdd_lxfs.equals("")))	wheresql+=" and  (jc_cgdd.lxfs='"+jc_cgdd_lxfs+"')";
	}
	jc_cgdd_hth=request.getParameter("jc_cgdd_hth");
	if (jc_cgdd_hth!=null)
	{
		jc_cgdd_hth=cf.GB2Uni(jc_cgdd_hth);
		if (!(jc_cgdd_hth.equals("")))	wheresql+=" and  (jc_cgdd.hth='"+jc_cgdd_hth+"')";
	}
	ls_sql="SELECT jc_cgdd.ddbh as ddbh,DECODE(sfxhf,'Y','��ط�','N','����ط�') sfxhf,hflxmc,hfrq,jc_cgdd.khbh as khbh,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.yddze as jc_cgdd_yddze,jc_cgdd.cgsjs as jc_cgdd_cgsjs, DECODE(jc_cgdd.kfcbz,'Y','�ɸ���','N','���ɸ���') as jc_cgdd_kfcbz,jc_cgdd.ssje as jc_cgdd_ssje, DECODE(jc_cgdd.clzt,'00','Ԥ����δ���','01','Ԥ���������','11','��Ʋ������','12','�ۺϾ�Ӫ�������','21','��ȷ������ʱ��','22','�ѳ���','23','���������','24','��ȷ������ʱ��','25','�Ѹ���','26','���۷��������','31','ǩ����ͬ','41','�������µ�','42','ԭ�ϲɹ�','43','��������','44','���','51','��ȷ����װʱ��','52','��װ���') as jc_cgdd_clzt, DECODE(jc_cgdd.khlx,'1','װ�޿ͻ�','2','����ͻ�') as jc_cgdd_khlx,jc_cgdd.khxm as jc_cgdd_khxm,jc_cgdd.fwdz as jc_cgdd_fwdz,jc_cgdd.hth as jc_cgdd_hth";
	ls_sql+=" FROM jc_cgdd,dm_hflxbm ";
    ls_sql+=" where jc_cgdd.hflxbm=dm_hflxbm.hflxbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_cgdd.lrsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_cgddCxList.jsp","SelectCxJc_cgdd.jsp","www","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.setViewStr("�ط�");
//������ʾ��
	String[] disColName={"ddbh","sfxhf","hflxmc","hfrq","jc_cgdd_clzt","jc_cgdd_khxm","jc_cgdd_fwdz","jc_cgdd_yddze","jc_cgdd_kfcbz","jc_cgdd_khlx"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jc_cgdd_khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
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
  <B><font size="3">����ط�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp</td>
	<td  width="8%">�������</td>
	<td  width="9%">�Ƿ���ط�</td>
	<td  width="11%">�ط�����</td>
	<td  width="9%">Ӧ�ط�����</td>
	<td  width="11%">����״̬</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="19%">���ݵ�ַ</td>
	<td  width="6%">Ԥ�����ܶ�</td>
	<td  width="9%">�ɸ����־</td>
	<td  width="8%">�ͻ�����</td>
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