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


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	String gj=null;
	gj=request.getParameter("gj");
	if (gj!=null)
	{
		gj=cf.GB2Uni(gj);
		if (!(gj.equals("")))	wheresql+=" and  (crm_khxx.gj='"+gj+"')";
	}
	String dd=null;
	dd=request.getParameter("dd");
	if (dd!=null)
	{
		dd=cf.GB2Uni(dd);
		if (!(dd.equals("")))	wheresql+=" and  (crm_khxx.dd='"+dd+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}

	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=sgd.trim();
		if (!(sgd.equals("")))	wheresql+=" and  (crm_aqsgjl.sgd='"+sgd+"')";
	}

	String crm_aqsgjl_fssj=null;
	String crm_aqsgjl_gsrs=null;
	String crm_aqsgjl_gwrs=null;
	String crm_aqsgjl_lrr=null;
	String crm_aqsgjl_lrsj=null;
	String crm_aqsgjl_lrbm=null;
	crm_aqsgjl_fssj=request.getParameter("crm_aqsgjl_fssj");
	if (crm_aqsgjl_fssj!=null)
	{
		crm_aqsgjl_fssj=crm_aqsgjl_fssj.trim();
		if (!(crm_aqsgjl_fssj.equals("")))	wheresql+="  and (crm_aqsgjl.fssj>=TO_DATE('"+crm_aqsgjl_fssj+"','YYYY/MM/DD'))";
	}
	crm_aqsgjl_fssj=request.getParameter("crm_aqsgjl_fssj2");
	if (crm_aqsgjl_fssj!=null)
	{
		crm_aqsgjl_fssj=crm_aqsgjl_fssj.trim();
		if (!(crm_aqsgjl_fssj.equals("")))	wheresql+="  and (crm_aqsgjl.fssj<=TO_DATE('"+crm_aqsgjl_fssj+"','YYYY/MM/DD'))";
	}
	crm_aqsgjl_gsrs=request.getParameter("crm_aqsgjl_gsrs");
	if (crm_aqsgjl_gsrs!=null)
	{
		crm_aqsgjl_gsrs=crm_aqsgjl_gsrs.trim();
		if (!(crm_aqsgjl_gsrs.equals("")))	wheresql+=" and (crm_aqsgjl.gsrs>="+crm_aqsgjl_gsrs+") ";
	}
	crm_aqsgjl_gsrs=request.getParameter("crm_aqsgjl_gsrs2");
	if (crm_aqsgjl_gsrs!=null)
	{
		crm_aqsgjl_gsrs=crm_aqsgjl_gsrs.trim();
		if (!(crm_aqsgjl_gsrs.equals("")))	wheresql+=" and (crm_aqsgjl.gsrs<="+crm_aqsgjl_gsrs+") ";
	}
	crm_aqsgjl_gwrs=request.getParameter("crm_aqsgjl_gwrs");
	if (crm_aqsgjl_gwrs!=null)
	{
		crm_aqsgjl_gwrs=crm_aqsgjl_gwrs.trim();
		if (!(crm_aqsgjl_gwrs.equals("")))	wheresql+=" and (crm_aqsgjl.gwrs>="+crm_aqsgjl_gwrs+") ";
	}
	crm_aqsgjl_gwrs=request.getParameter("crm_aqsgjl_gwrs2");
	if (crm_aqsgjl_gwrs!=null)
	{
		crm_aqsgjl_gwrs=crm_aqsgjl_gwrs.trim();
		if (!(crm_aqsgjl_gwrs.equals("")))	wheresql+=" and (crm_aqsgjl.gwrs<="+crm_aqsgjl_gwrs+") ";
	}
	crm_aqsgjl_lrr=request.getParameter("crm_aqsgjl_lrr");
	if (crm_aqsgjl_lrr!=null)
	{
		crm_aqsgjl_lrr=cf.GB2Uni(crm_aqsgjl_lrr);
		if (!(crm_aqsgjl_lrr.equals("")))	wheresql+=" and  (crm_aqsgjl.lrr='"+crm_aqsgjl_lrr+"')";
	}
	crm_aqsgjl_lrsj=request.getParameter("crm_aqsgjl_lrsj");
	if (crm_aqsgjl_lrsj!=null)
	{
		crm_aqsgjl_lrsj=crm_aqsgjl_lrsj.trim();
		if (!(crm_aqsgjl_lrsj.equals("")))	wheresql+="  and (crm_aqsgjl.lrsj>=TO_DATE('"+crm_aqsgjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_aqsgjl_lrsj=request.getParameter("crm_aqsgjl_lrsj2");
	if (crm_aqsgjl_lrsj!=null)
	{
		crm_aqsgjl_lrsj=crm_aqsgjl_lrsj.trim();
		if (!(crm_aqsgjl_lrsj.equals("")))	wheresql+="  and (crm_aqsgjl.lrsj<=TO_DATE('"+crm_aqsgjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_aqsgjl_lrbm=request.getParameter("crm_aqsgjl_lrbm");
	if (crm_aqsgjl_lrbm!=null)
	{
		crm_aqsgjl_lrbm=cf.GB2Uni(crm_aqsgjl_lrbm);
		if (!(crm_aqsgjl_lrbm.equals("")))	wheresql+=" and  (crm_aqsgjl.lrbm='"+crm_aqsgjl_lrbm+"')";
	}

	ls_sql="SELECT crm_aqsgjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_aqsgjl.fssj,crm_aqsgjl.gsrs,crm_aqsgjl.gwrs,crm_aqsgjl.sgsm,crm_aqsgjl.lrr,crm_aqsgjl.lrsj,a.dwmc lrbm,b.dwmc fgs  ";
	ls_sql+=" FROM crm_aqsgjl,crm_khxx,sq_sgd,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where crm_aqsgjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_aqsgjl.sgd=sq_sgd.sgd(+) and crm_aqsgjl.lrbm=a.dwbh(+) and crm_khxx.dwbh=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_aqsgjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_aqsgjlList.jsp","","","EditCrm_aqsgjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","fssj","crm_aqsgjl_sgd","crm_aqsgjl_gsrs","crm_aqsgjl_gwrs","crm_aqsgjl_sgsm","crm_aqsgjl_lrr","crm_aqsgjl_lrsj","crm_aqsgjl_lrbm","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh","fssj"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_aqsgjlList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from crm_aqsgjl where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ȫ�¹ʼ�¼��ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">�ͻ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">ʩ����</td>
	<td  width="5%">����ʱ��</td>
	<td  width="4%">��������</td>
	<td  width="4%">��������</td>
	<td  width="27%">�¹�˵��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="7%">¼�벿��</td>
	<td  width="7%">����</td>
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