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
	String cw_gdjsjl_khbh=null;
	String cw_gdjsjl_sgd=null;
	String cw_gdjsjl_jzbz=null;
	String cw_gdjsjl_zkl=null;
	String cw_gdjsjl_tdjs=null;
	String cw_gdjsjl_glftd=null;
	String cw_gdjsjl_jsr=null;
	String cw_gdjsjl_jssj=null;
	String cw_gdjsjl_jsdw=null;
	String cw_gdjsjl_jsjd=null;
	String cw_gdjsjl_gdjsjlh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_sjs=null;
	String crm_khxx_hth=null;
	String crm_khxx_zjxm=null;
	String cw_gdjsjl_spjl=null;
	String cw_gdjsjl_spr=null;
	String cw_gdjsjl_spsj=null;
	String cw_gdjsjl_cwjsr=null;
	String cw_gdjsjl_cwjssj=null;
	String crm_khxx_qyrq=null;
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	cw_gdjsjl_khbh=request.getParameter("cw_gdjsjl_khbh");
	if (cw_gdjsjl_khbh!=null)
	{
		cw_gdjsjl_khbh=cf.GB2Uni(cw_gdjsjl_khbh);
		if (!(cw_gdjsjl_khbh.equals("")))	wheresql+=" and  (cw_gdjsjl.khbh='"+cw_gdjsjl_khbh+"')";
	}
	cw_gdjsjl_sgd=request.getParameter("cw_gdjsjl_sgd");
	if (cw_gdjsjl_sgd!=null)
	{
		cw_gdjsjl_sgd=cf.GB2Uni(cw_gdjsjl_sgd);
		if (!(cw_gdjsjl_sgd.equals("")))	wheresql+=" and  (cw_gdjsjl.sgd='"+cw_gdjsjl_sgd+"')";
	}
	cw_gdjsjl_jzbz=request.getParameter("cw_gdjsjl_jzbz");
	if (cw_gdjsjl_jzbz!=null)
	{
		cw_gdjsjl_jzbz=cf.GB2Uni(cw_gdjsjl_jzbz);
		if (!(cw_gdjsjl_jzbz.equals("")))	wheresql+=" and  (cw_gdjsjl.jzbz='"+cw_gdjsjl_jzbz+"')";
	}
	cw_gdjsjl_zkl=request.getParameter("cw_gdjsjl_zkl");
	if (cw_gdjsjl_zkl!=null)
	{
		cw_gdjsjl_zkl=cw_gdjsjl_zkl.trim();
		if (!(cw_gdjsjl_zkl.equals("")))	wheresql+=" and  (cw_gdjsjl.zkl="+cw_gdjsjl_zkl+") ";
	}
	cw_gdjsjl_tdjs=request.getParameter("cw_gdjsjl_tdjs");
	if (cw_gdjsjl_tdjs!=null)
	{
		cw_gdjsjl_tdjs=cf.GB2Uni(cw_gdjsjl_tdjs);
		if (!(cw_gdjsjl_tdjs.equals("")))	wheresql+=" and  (cw_gdjsjl.tdjs='"+cw_gdjsjl_tdjs+"')";
	}
	cw_gdjsjl_glftd=request.getParameter("cw_gdjsjl_glftd");
	if (cw_gdjsjl_glftd!=null)
	{
		cw_gdjsjl_glftd=cw_gdjsjl_glftd.trim();
		if (!(cw_gdjsjl_glftd.equals("")))	wheresql+=" and  (cw_gdjsjl.glftd="+cw_gdjsjl_glftd+") ";
	}
	cw_gdjsjl_jsr=request.getParameter("cw_gdjsjl_jsr");
	if (cw_gdjsjl_jsr!=null)
	{
		cw_gdjsjl_jsr=cf.GB2Uni(cw_gdjsjl_jsr);
		if (!(cw_gdjsjl_jsr.equals("")))	wheresql+=" and  (cw_gdjsjl.jsr='"+cw_gdjsjl_jsr+"')";
	}
	cw_gdjsjl_jssj=request.getParameter("cw_gdjsjl_jssj");
	if (cw_gdjsjl_jssj!=null)
	{
		cw_gdjsjl_jssj=cw_gdjsjl_jssj.trim();
		if (!(cw_gdjsjl_jssj.equals("")))	wheresql+="  and (cw_gdjsjl.jssj>=TO_DATE('"+cw_gdjsjl_jssj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_jssj=request.getParameter("cw_gdjsjl_jssj2");
	if (cw_gdjsjl_jssj!=null)
	{
		cw_gdjsjl_jssj=cw_gdjsjl_jssj.trim();
		if (!(cw_gdjsjl_jssj.equals("")))	wheresql+="  and (cw_gdjsjl.jssj<=TO_DATE('"+cw_gdjsjl_jssj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_jsdw=request.getParameter("cw_gdjsjl_jsdw");
	if (cw_gdjsjl_jsdw!=null)
	{
		cw_gdjsjl_jsdw=cf.GB2Uni(cw_gdjsjl_jsdw);
		if (!(cw_gdjsjl_jsdw.equals("")))	wheresql+=" and  (cw_gdjsjl.jsdw='"+cw_gdjsjl_jsdw+"')";
	}
	cw_gdjsjl_jsjd=request.getParameter("cw_gdjsjl_jsjd");
	if (cw_gdjsjl_jsjd!=null)
	{
		cw_gdjsjl_jsjd=cf.GB2Uni(cw_gdjsjl_jsjd);
		if (!(cw_gdjsjl_jsjd.equals("")))	wheresql+=" and  (cw_gdjsjl.jsjd='"+cw_gdjsjl_jsjd+"')";
	}
	cw_gdjsjl_gdjsjlh=request.getParameter("cw_gdjsjl_gdjsjlh");
	if (cw_gdjsjl_gdjsjlh!=null)
	{
		cw_gdjsjl_gdjsjlh=cf.GB2Uni(cw_gdjsjl_gdjsjlh);
		if (!(cw_gdjsjl_gdjsjlh.equals("")))	wheresql+=" and  (cw_gdjsjl.gdjsjlh='"+cw_gdjsjl_gdjsjlh+"')";
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
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	cw_gdjsjl_spjl=request.getParameter("cw_gdjsjl_spjl");
	if (cw_gdjsjl_spjl!=null)
	{
		cw_gdjsjl_spjl=cf.GB2Uni(cw_gdjsjl_spjl);
		if (!(cw_gdjsjl_spjl.equals("")))	wheresql+=" and  (cw_gdjsjl.spjl='"+cw_gdjsjl_spjl+"')";
	}
	cw_gdjsjl_spr=request.getParameter("cw_gdjsjl_spr");
	if (cw_gdjsjl_spr!=null)
	{
		cw_gdjsjl_spr=cf.GB2Uni(cw_gdjsjl_spr);
		if (!(cw_gdjsjl_spr.equals("")))	wheresql+=" and  (cw_gdjsjl.spr='"+cw_gdjsjl_spr+"')";
	}
	cw_gdjsjl_spsj=request.getParameter("cw_gdjsjl_spsj");
	if (cw_gdjsjl_spsj!=null)
	{
		cw_gdjsjl_spsj=cw_gdjsjl_spsj.trim();
		if (!(cw_gdjsjl_spsj.equals("")))	wheresql+="  and (cw_gdjsjl.spsj>=TO_DATE('"+cw_gdjsjl_spsj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_spsj=request.getParameter("cw_gdjsjl_spsj2");
	if (cw_gdjsjl_spsj!=null)
	{
		cw_gdjsjl_spsj=cw_gdjsjl_spsj.trim();
		if (!(cw_gdjsjl_spsj.equals("")))	wheresql+="  and (cw_gdjsjl.spsj<=TO_DATE('"+cw_gdjsjl_spsj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_cwjsr=request.getParameter("cw_gdjsjl_cwjsr");
	if (cw_gdjsjl_cwjsr!=null)
	{
		cw_gdjsjl_cwjsr=cf.GB2Uni(cw_gdjsjl_cwjsr);
		if (!(cw_gdjsjl_cwjsr.equals("")))	wheresql+=" and  (cw_gdjsjl.cwjsr='"+cw_gdjsjl_cwjsr+"')";
	}
	cw_gdjsjl_cwjssj=request.getParameter("cw_gdjsjl_cwjssj");
	if (cw_gdjsjl_cwjssj!=null)
	{
		cw_gdjsjl_cwjssj=cw_gdjsjl_cwjssj.trim();
		if (!(cw_gdjsjl_cwjssj.equals("")))	wheresql+="  and (cw_gdjsjl.cwjssj>=TO_DATE('"+cw_gdjsjl_cwjssj+"','YYYY/MM/DD'))";
	}
	cw_gdjsjl_cwjssj=request.getParameter("cw_gdjsjl_cwjssj2");
	if (cw_gdjsjl_cwjssj!=null)
	{
		cw_gdjsjl_cwjssj=cw_gdjsjl_cwjssj.trim();
		if (!(cw_gdjsjl_cwjssj.equals("")))	wheresql+="  and (cw_gdjsjl.cwjssj<=TO_DATE('"+cw_gdjsjl_cwjssj+"','YYYY/MM/DD'))";
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
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	ls_sql="SELECT cw_gdjsjl.gdjsjlh, DECODE(cw_gdjsjl.jsjd,'1','���㲿����','2','��������','3','�������'), DECODE(cw_gdjsjl.spjl,'3','ͨ��','4','δͨ��'),crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,crm_khxx.sjs,crm_khxx.zjxm, DECODE(cw_gdjsjl.jzbz,'1','��װ','2','��װ'),cw_gdjsjl.wdzgce,cw_gdjsjl.qye,cw_gdjsjl.zkl,cw_gdjsjl.zjxje,cw_gdjsjl.khjskze,cw_gdjsjl.khsskze,cw_gdjsjl.sjcb,cw_gdjsjl.gckk,cw_gdjsjl.sjsfy,cw_gdjsjl.sgdfy,cw_gdjsjl.zjfy,cw_gdjsjl.gsfy,cw_gdjsjl.qtfy, DECODE(cw_gdjsjl.tdjs,'1','�ͻ�������','2','ʵ�տ�','3','ǩԼ��','4','ʵ�ʳɱ�','9','����'),cw_gdjsjl.tdjsje,cw_gdjsjl.glftd,cw_gdjsjl.glf,cw_gdjsjl.wxj,cw_gdjsjl.bk,cw_gdjsjl.sj,cw_gdjsjl.clf,cw_gdjsjl.zgclf,cw_gdjsjl.jkje,cw_gdjsjl.fakuan,cw_gdjsjl.kwxf,cw_gdjsjl.ksdf,cw_gdjsjl.kqtk,cw_gdjsjl.gdjskze,cw_gdjsjl.sqgz,cw_gdjsjl.jsr,cw_gdjsjl.jssj,dwmc,cw_gdjsjl.bz,cw_gdjsjl.spyj,cw_gdjsjl.spr,cw_gdjsjl.spsj,cw_gdjsjl.cwjsr,cw_gdjsjl.cwjssj,cw_gdjsjl.cwjssm,cw_gdjsjl.khbh  ";
	ls_sql+=" FROM cw_gdjsjl,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjsjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gdjsjl.sgd=sq_sgd.sgd(+) and cw_gdjsjl.jsdw=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by cw_gdjsjl.jssj desc ";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_gdjsjlCxList.jsp","SelectCxCw_gdjsjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cw_gdjsjl_khbh","cw_gdjsjl_sgd","cw_gdjsjl_jzbz","cw_gdjsjl_wdzgce","cw_gdjsjl_qye","cw_gdjsjl_zkl","cw_gdjsjl_zjxje","cw_gdjsjl_khjskze","cw_gdjsjl_khsskze","cw_gdjsjl_sjcb","cw_gdjsjl_sj","cw_gdjsjl_tdjs","cw_gdjsjl_glftd","cw_gdjsjl_glf","cw_gdjsjl_wxj","cw_gdjsjl_clf","cw_gdjsjl_zgclf","cw_gdjsjl_jkje","cw_gdjsjl_fakuan","cw_gdjsjl_kwxf","cw_gdjsjl_gckk","cw_gdjsjl_ksdf","cw_gdjsjl_kqtk","cw_gdjsjl_bk","cw_gdjsjl_gdjskze","cw_gdjsjl_jsr","cw_gdjsjl_jssj","cw_gdjsjl_jsdw","cw_gdjsjl_jsjd","cw_gdjsjl_bz","gdjsjlh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_sjs","crm_khxx_hth","crm_khxx_zjxm","cw_gdjsjl_spjl","cw_gdjsjl_spyj","cw_gdjsjl_spr","cw_gdjsjl_spsj","cw_gdjsjl_hbssk","cw_gdjsjl_tdjsje","cw_gdjsjl_cwjsr","cw_gdjsjl_cwjssj","cw_gdjsjl_cwjssm","cw_gdjsjl_sqgz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gdjsjlh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gdjsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_gdjsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gdjsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(600);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">�����¼��</td>
	<td  width="2%">�������</td>
	<td  width="1%">��������</td>
	<td  width="1%">��ͬ��</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="4%">���ݵ�ַ</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">���ʦ</td>
	<td  width="1%">�ʼ�</td>
	<td  width="1%">��װ��־</td>
	<td  width="2%">δ���۹��̶�</td>
	<td  width="2%">����ǩԼ��</td>
	<td  width="1%">�ۿ���</td>
	<td  width="2%">��������</td>
	<td  width="2%">�ͻ�������</td>
	<td  width="2%">����ʵ�տ��ܶ�</td>
	<td  width="2%">ʵ�ʳɱ�</td>
	<td  width="2%">���̿ۿ�</td>
	<td  width="2%">���ʦ�е��ۿ�</td>
	<td  width="2%">ʩ���ӳе��ۿ�</td>
	<td  width="1%">�ʼ�е��ۿ�</td>
	<td  width="1%">��˾�е��ۿ�</td>
	<td  width="2%">�������е��ۿ�</td>
	<td  width="2%">������</td>
	<td  width="2%">���������</td>
	<td  width="1%">��������</td>
	<td  width="2%">�����</td>
	<td  width="2%">ά�޽�</td>
	<td  width="2%">����</td>
	<td  width="2%">˰��</td>
	<td  width="2%">�������Ϸ�</td>
	<td  width="2%">�Թ����Ϸ�</td>
	<td  width="2%">�����</td>
	<td  width="2%">������</td>
	<td  width="2%">��ά�޷�</td>
	<td  width="2%">��ˮ���</td>
	<td  width="2%">��������</td>
	<td  width="2%">���ӽ�����ܶ�</td>
	<td  width="2%">˰ǰ����</td>
	<td  width="1%">���㲿������</td>
	<td  width="2%">���㲿����ʱ��</td>
	<td  width="2%">���㵥λ</td>
	<td  width="4%">��ע</td>
	<td  width="4%">�������</td>
	<td  width="1%">������</td>
	<td  width="2%">����ʱ��</td>
	<td  width="1%">���������</td>
	<td  width="2%">�������ʱ��</td>
	<td  width="4%">�������˵��</td>
	<td  width="1%">�ͻ����</td>
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