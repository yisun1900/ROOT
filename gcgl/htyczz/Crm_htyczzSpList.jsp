<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

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

	
	
	String crm_htyczz_yczzsj=null;
	String crm_htyczz_clzt=null;
	String crm_htyczz_lrr=null;
	String crm_htyczz_lrsj=null;
	String crm_htyczz_lrbm=null;
	crm_htyczz_yczzsj=request.getParameter("crm_htyczz_yczzsj");
	if (crm_htyczz_yczzsj!=null)
	{
		crm_htyczz_yczzsj=crm_htyczz_yczzsj.trim();
		if (!(crm_htyczz_yczzsj.equals("")))	wheresql+="  and (crm_htyczz.yczzsj>=TO_DATE('"+crm_htyczz_yczzsj+"','YYYY/MM/DD'))";
	}
	crm_htyczz_yczzsj=request.getParameter("crm_htyczz_yczzsj2");
	if (crm_htyczz_yczzsj!=null)
	{
		crm_htyczz_yczzsj=crm_htyczz_yczzsj.trim();
		if (!(crm_htyczz_yczzsj.equals("")))	wheresql+="  and (crm_htyczz.yczzsj<=TO_DATE('"+crm_htyczz_yczzsj+"','YYYY/MM/DD'))";
	}
	crm_htyczz_clzt=request.getParameter("crm_htyczz_clzt");
	if (crm_htyczz_clzt!=null)
	{
		crm_htyczz_clzt=cf.GB2Uni(crm_htyczz_clzt);
		if (!(crm_htyczz_clzt.equals("")))	wheresql+=" and  (crm_htyczz.clzt='"+crm_htyczz_clzt+"')";
	}
	crm_htyczz_lrr=request.getParameter("crm_htyczz_lrr");
	if (crm_htyczz_lrr!=null)
	{
		crm_htyczz_lrr=cf.GB2Uni(crm_htyczz_lrr);
		if (!(crm_htyczz_lrr.equals("")))	wheresql+=" and  (crm_htyczz.lrr='"+crm_htyczz_lrr+"')";
	}
	crm_htyczz_lrsj=request.getParameter("crm_htyczz_lrsj");
	if (crm_htyczz_lrsj!=null)
	{
		crm_htyczz_lrsj=crm_htyczz_lrsj.trim();
		if (!(crm_htyczz_lrsj.equals("")))	wheresql+="  and (crm_htyczz.lrsj>=TO_DATE('"+crm_htyczz_lrsj+"','YYYY/MM/DD'))";
	}
	crm_htyczz_lrsj=request.getParameter("crm_htyczz_lrsj2");
	if (crm_htyczz_lrsj!=null)
	{
		crm_htyczz_lrsj=crm_htyczz_lrsj.trim();
		if (!(crm_htyczz_lrsj.equals("")))	wheresql+="  and (crm_htyczz.lrsj<=TO_DATE('"+crm_htyczz_lrsj+"','YYYY/MM/DD'))";
	}
	crm_htyczz_lrbm=request.getParameter("crm_htyczz_lrbm");
	if (crm_htyczz_lrbm!=null)
	{
		crm_htyczz_lrbm=cf.GB2Uni(crm_htyczz_lrbm);
		if (!(crm_htyczz_lrbm.equals("")))	wheresql+=" and  (crm_htyczz.lrbm='"+crm_htyczz_lrbm+"')";
	}

	ls_sql="SELECT crm_htyczz.khbh, DECODE(crm_htyczz.clzt,'1','δ����','2','����ͬ��','3','������ͬ��'),crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_htyczz.yczzsj,crm_htyczz.yczzsm,crm_htyczz.lrr,crm_htyczz.lrsj,b.dwmc lrbm  ";
	ls_sql+=" FROM crm_htyczz,crm_khxx,sq_sgd,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where crm_htyczz.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_khxx.dwbh=a.dwbh(+)";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_htyczz.lrbm=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_htyczz.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_htyczzList.jsp","","","SpCrm_htyczz.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("����");
//���ð�ť����
	String[] buttonName={"����ͬ��"};//��ť����ʾ����
	String[] buttonLink={"SaveAllSpCrm_htyczz.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
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
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ͬ�쳣��ֹ��������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">�ͻ����</td>
	<td  width="4%">����״̬</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">ʩ����</td>
	<td  width="5%">�쳣��ֹʱ��</td>
	<td  width="31%">�쳣��ֹ˵��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="9%">¼�벿��</td>
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