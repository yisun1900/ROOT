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
	String cw_gckkjl_kkjlh=null;
	String cw_gckkjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_dwbh=null;
	String cw_gckkjl_lrr=null;
	String cw_gckkjl_lrsj=null;
	String cw_gckkjl_lrbm=null;
	String cw_gckkjl_spbz=null;
	String cw_gckkjl_spr=null;
	String cw_gckkjl_spsj=null;
	String cw_gckkjl_jsbz=null;
	String cw_gckkjl_jsjlh=null;
	String cw_gckkjl_sjsjsbz=null;
	String cw_gckkjl_sjsjsjlh=null;
	String cw_gckkjl_zjjsbz=null;
	String cw_gckkjl_zjjsjlh=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	
	cw_gckkjl_kkjlh=request.getParameter("cw_gckkjl_kkjlh");
	if (cw_gckkjl_kkjlh!=null)
	{
		cw_gckkjl_kkjlh=cf.GB2Uni(cw_gckkjl_kkjlh);
		if (!(cw_gckkjl_kkjlh.equals("")))	wheresql+=" and  (cw_gckkjl.kkjlh='"+cw_gckkjl_kkjlh+"')";
	}
	cw_gckkjl_khbh=request.getParameter("cw_gckkjl_khbh");
	if (cw_gckkjl_khbh!=null)
	{
		cw_gckkjl_khbh=cf.GB2Uni(cw_gckkjl_khbh);
		if (!(cw_gckkjl_khbh.equals("")))	wheresql+=" and  (cw_gckkjl.khbh='"+cw_gckkjl_khbh+"')";
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
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
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
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	cw_gckkjl_lrr=request.getParameter("cw_gckkjl_lrr");
	if (cw_gckkjl_lrr!=null)
	{
		cw_gckkjl_lrr=cf.GB2Uni(cw_gckkjl_lrr);
		if (!(cw_gckkjl_lrr.equals("")))	wheresql+=" and  (cw_gckkjl.lrr='"+cw_gckkjl_lrr+"')";
	}
	cw_gckkjl_lrsj=request.getParameter("cw_gckkjl_lrsj");
	if (cw_gckkjl_lrsj!=null)
	{
		cw_gckkjl_lrsj=cw_gckkjl_lrsj.trim();
		if (!(cw_gckkjl_lrsj.equals("")))	wheresql+="  and (cw_gckkjl.lrsj>=TO_DATE('"+cw_gckkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_gckkjl_lrsj=request.getParameter("cw_gckkjl_lrsj2");
	if (cw_gckkjl_lrsj!=null)
	{
		cw_gckkjl_lrsj=cw_gckkjl_lrsj.trim();
		if (!(cw_gckkjl_lrsj.equals("")))	wheresql+="  and (cw_gckkjl.lrsj<=TO_DATE('"+cw_gckkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_gckkjl_lrbm=request.getParameter("cw_gckkjl_lrbm");
	if (cw_gckkjl_lrbm!=null)
	{
		cw_gckkjl_lrbm=cf.GB2Uni(cw_gckkjl_lrbm);
		if (!(cw_gckkjl_lrbm.equals("")))	wheresql+=" and  (cw_gckkjl.lrbm='"+cw_gckkjl_lrbm+"')";
	}
	cw_gckkjl_spbz=request.getParameter("cw_gckkjl_spbz");
	if (cw_gckkjl_spbz!=null)
	{
		cw_gckkjl_spbz=cf.GB2Uni(cw_gckkjl_spbz);
		if (!(cw_gckkjl_spbz.equals("")))	wheresql+=" and  (cw_gckkjl.spbz='"+cw_gckkjl_spbz+"')";
	}
	cw_gckkjl_spr=request.getParameter("cw_gckkjl_spr");
	if (cw_gckkjl_spr!=null)
	{
		cw_gckkjl_spr=cf.GB2Uni(cw_gckkjl_spr);
		if (!(cw_gckkjl_spr.equals("")))	wheresql+=" and  (cw_gckkjl.spr='"+cw_gckkjl_spr+"')";
	}
	cw_gckkjl_spsj=request.getParameter("cw_gckkjl_spsj");
	if (cw_gckkjl_spsj!=null)
	{
		cw_gckkjl_spsj=cw_gckkjl_spsj.trim();
		if (!(cw_gckkjl_spsj.equals("")))	wheresql+="  and (cw_gckkjl.spsj>=TO_DATE('"+cw_gckkjl_spsj+"','YYYY/MM/DD'))";
	}
	cw_gckkjl_spsj=request.getParameter("cw_gckkjl_spsj2");
	if (cw_gckkjl_spsj!=null)
	{
		cw_gckkjl_spsj=cw_gckkjl_spsj.trim();
		if (!(cw_gckkjl_spsj.equals("")))	wheresql+="  and (cw_gckkjl.spsj<=TO_DATE('"+cw_gckkjl_spsj+"','YYYY/MM/DD'))";
	}
	cw_gckkjl_jsbz=request.getParameter("cw_gckkjl_jsbz");
	if (cw_gckkjl_jsbz!=null)
	{
		cw_gckkjl_jsbz=cf.GB2Uni(cw_gckkjl_jsbz);
		if (!(cw_gckkjl_jsbz.equals("")))	wheresql+=" and  (cw_gckkjl.jsbz='"+cw_gckkjl_jsbz+"')";
	}
	cw_gckkjl_jsjlh=request.getParameter("cw_gckkjl_jsjlh");
	if (cw_gckkjl_jsjlh!=null)
	{
		cw_gckkjl_jsjlh=cf.GB2Uni(cw_gckkjl_jsjlh);
		if (!(cw_gckkjl_jsjlh.equals("")))	wheresql+=" and  (cw_gckkjl.jsjlh='"+cw_gckkjl_jsjlh+"')";
	}
	cw_gckkjl_sjsjsbz=request.getParameter("cw_gckkjl_sjsjsbz");
	if (cw_gckkjl_sjsjsbz!=null)
	{
		cw_gckkjl_sjsjsbz=cf.GB2Uni(cw_gckkjl_sjsjsbz);
		if (!(cw_gckkjl_sjsjsbz.equals("")))	wheresql+=" and  (cw_gckkjl.sjsjsbz='"+cw_gckkjl_sjsjsbz+"')";
	}
	cw_gckkjl_sjsjsjlh=request.getParameter("cw_gckkjl_sjsjsjlh");
	if (cw_gckkjl_sjsjsjlh!=null)
	{
		cw_gckkjl_sjsjsjlh=cf.GB2Uni(cw_gckkjl_sjsjsjlh);
		if (!(cw_gckkjl_sjsjsjlh.equals("")))	wheresql+=" and  (cw_gckkjl.sjsjsjlh='"+cw_gckkjl_sjsjsjlh+"')";
	}
	cw_gckkjl_zjjsbz=request.getParameter("cw_gckkjl_zjjsbz");
	if (cw_gckkjl_zjjsbz!=null)
	{
		cw_gckkjl_zjjsbz=cf.GB2Uni(cw_gckkjl_zjjsbz);
		if (!(cw_gckkjl_zjjsbz.equals("")))	wheresql+=" and  (cw_gckkjl.zjjsbz='"+cw_gckkjl_zjjsbz+"')";
	}
	cw_gckkjl_zjjsjlh=request.getParameter("cw_gckkjl_zjjsjlh");
	if (cw_gckkjl_zjjsjlh!=null)
	{
		cw_gckkjl_zjjsjlh=cf.GB2Uni(cw_gckkjl_zjjsjlh);
		if (!(cw_gckkjl_zjjsjlh.equals("")))	wheresql+=" and  (cw_gckkjl.zjjsjlh='"+cw_gckkjl_zjjsjlh+"')";
	}
	ls_sql="SELECT cw_gckkjl.kkjlh,DECODE(cw_gckkjl.spbz,'2','δ����','3','����ͨ��','4','����δͨ��'),DECODE(cw_gckkjl.jsbz,'N','δ����','Y','�ѽ���'),crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.qyrq,sgdmc,crm_khxx.zjxm,b.dwmc qydm,cw_gckkjl.gckk,cw_gckkjl.sjsfy,cw_gckkjl.sgdfy,cw_gckkjl.zjfy,cw_gckkjl.gsfy,cw_gckkjl.qtfy,cw_gckkjl.spgckk,cw_gckkjl.spsjsfy,cw_gckkjl.spsgdfy,cw_gckkjl.spzjfy,cw_gckkjl.spgsfy,cw_gckkjl.spqtfy,cw_gckkjl.lrr,cw_gckkjl.lrsj,a.dwmc lrbm,cw_gckkjl.spyj,cw_gckkjl.spr,cw_gckkjl.spsj,cw_gckkjl.bz,cw_gckkjl.khbh  ";
	ls_sql+=" FROM crm_khxx,cw_gckkjl,sq_dwxx a,sq_dwxx b,sq_sgd  ";
    ls_sql+=" where cw_gckkjl.lrbm=a.dwbh and cw_gckkjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.dwbh=b.dwbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_gckkjl.lrsj desc";
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("Cw_gckkjlSpList.jsp","SelectSpCw_gckkjl.jsp","SpCw_gckkjl.jsp","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kkjlh","cw_gckkjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","crm_khxx_dwbh","cw_gckkjl_gckk","cw_gckkjl_sjsfy","cw_gckkjl_sgdfy","cw_gckkjl_zjfy","cw_gckkjl_gsfy","cw_gckkjl_qtfy","cw_gckkjl_spgckk","cw_gckkjl_spsjsfy","cw_gckkjl_spsgdfy","cw_gckkjl_spzjfy","cw_gckkjl_spgsfy","cw_gckkjl_spqtfy","cw_gckkjl_lrr","cw_gckkjl_lrsj","sq_dwxx_dwmc","cw_gckkjl_spbz","cw_gckkjl_spyj","cw_gckkjl_spr","cw_gckkjl_spsj","cw_gckkjl_jsbz","cw_gckkjl_jsjlh","cw_gckkjl_sjsjsbz","cw_gckkjl_sjsjsjlh","cw_gckkjl_zjjsbz","cw_gckkjl_zjjsjlh","cw_gckkjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kkjlh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("����");


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
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
  <B><font size="3">�������̿ۿ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(370);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">�ۿ��¼��</td>
	<td  width="2%">������־</td>
	<td  width="2%">�����־</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">���ʦ</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">���̿ۿ�</td>
	<td  width="2%">���ʦ�е�����</td>
	<td  width="2%">ʩ���ӳе�����</td>
	<td  width="2%">�ʼ�е�����</td>
	<td  width="2%">��˾�е�����</td>
	<td  width="2%">�������е�����</td>
	<td  width="3%">�����󹤳̿ۿ�</td>
	<td  width="2%">���������ʦ�е�����</td>
	<td  width="2%">������ʩ���ӳе�����</td>
	<td  width="2%">�������ʼ�е�����</td>
	<td  width="2%">������˾�е�����</td>
	<td  width="2%">�������������е�����</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="9%">�������</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="9%">��ע</td>
	<td  width="2%">�ͻ����</td>
</tr>
<%
	pageObj.displayDateSum();
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