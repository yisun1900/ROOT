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
	
	
	String xh=null;
	String hfjg=null;
	String clfs=null;
	String hfbm=null;
	String hfsj=null;
	String zxy=null;
	String zxz=null;
	String clr=null;
	String clsj=null;
	String zdy=null;
	String clzt=null;
	String lrr=null;
	String lrsj=null;
	String lrbm=null;
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (yzf_hjzx.xh="+xh+") ";
	}
	hfjg=request.getParameter("hfjg");
	if (hfjg!=null)
	{
		hfjg=cf.GB2Uni(hfjg);
		if (!(hfjg.equals("")))	wheresql+=" and  (yzf_hjzx.hfjg='"+hfjg+"')";
	}
	clfs=request.getParameter("clfs");
	if (clfs!=null)
	{
		clfs=cf.GB2Uni(clfs);
		if (!(clfs.equals("")))	wheresql+=" and  (yzf_hjzx.clfs='"+clfs+"')";
	}
	hfbm=request.getParameter("hfbm");
	if (hfbm!=null)
	{
		hfbm=cf.GB2Uni(hfbm);
		if (!(hfbm.equals("")))	wheresql+=" and  (yzf_hjzx.hfbm='"+hfbm+"')";
	}
	hfsj=request.getParameter("hfsj");
	if (hfsj!=null)
	{
		hfsj=hfsj.trim();
		if (!(hfsj.equals("")))	wheresql+="  and (yzf_hjzx.hfsj>=TO_DATE('"+hfsj+"','YYYY/MM/DD'))";
	}
	hfsj=request.getParameter("hfsj2");
	if (hfsj!=null)
	{
		hfsj=hfsj.trim();
		if (!(hfsj.equals("")))	wheresql+="  and (yzf_hjzx.hfsj<=TO_DATE('"+hfsj+"','YYYY/MM/DD'))";
	}
	zxy=request.getParameter("zxy");
	if (zxy!=null)
	{
		zxy=cf.GB2Uni(zxy);
		if (!(zxy.equals("")))	wheresql+=" and  (yzf_hjzx.zxy='"+zxy+"')";
	}
	zxz=request.getParameter("zxz");
	if (zxz!=null)
	{
		zxz=cf.GB2Uni(zxz);
		if (!(zxz.equals("")))	wheresql+=" and  (yzf_hjzx.zxz='"+zxz+"')";
	}
	clr=request.getParameter("clr");
	if (clr!=null)
	{
		clr=cf.GB2Uni(clr);
		if (!(clr.equals("")))	wheresql+=" and  (yzf_hjzx.clr='"+clr+"')";
	}
	clsj=request.getParameter("clsj");
	if (clsj!=null)
	{
		clsj=clsj.trim();
		if (!(clsj.equals("")))	wheresql+="  and (yzf_hjzx.clsj>=TO_DATE('"+clsj+"','YYYY/MM/DD'))";
	}
	clsj=request.getParameter("clsj2");
	if (clsj!=null)
	{
		clsj=clsj.trim();
		if (!(clsj.equals("")))	wheresql+="  and (yzf_hjzx.clsj<=TO_DATE('"+clsj+"','YYYY/MM/DD'))";
	}
	zdy=request.getParameter("zdy");
	if (zdy!=null)
	{
		zdy=cf.GB2Uni(zdy);
		if (!(zdy.equals("")))	wheresql+=" and  (yzf_hjzx.zdy='"+zdy+"')";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (yzf_hjzx.clzt='"+clzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (yzf_hjzx.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (yzf_hjzx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (yzf_hjzx.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (yzf_hjzx.lrbm='"+lrbm+"')";
	}

	ls_sql="SELECT yzf_hjzx.xh, DECODE(yzf_hjzx.clzt,'1','δ����','2','����','9','���账��'),yzf_hjzx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_khxx.zjxm,sjjgrq,a.dwmc dm,yzf_hjzx.fywt,yzf_hjzx.hfjg,yzf_hjzx.clfs,yzf_hjzx.hfbm,yzf_hjzx.hfsj,yzf_hjzx.zxy,yzf_hjzx.zxz,yzf_hjzx.xgbmclqk,yzf_hjzx.clsj,yzf_hjzx.zdy,yzf_hjzx.lrr,yzf_hjzx.lrsj,b.dwmc lrbm  ";
	ls_sql+=" FROM yzf_hjzx,crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd  ";
    ls_sql+=" where yzf_hjzx.khbh=crm_khxx.khbh(+) and crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and yzf_hjzx.lrbm=b.dwbh(+)  ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by yzf_hjzx.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yzf_hjzxClList.jsp","","","EditYzf_hjzx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"xh","khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("����");

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
  <B><font size="3">����طý��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">�Զ����</td>
	<td  width="2%">����״̬</td>
	<td  width="2%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�����</td>
	<td  width="4%">ʵ���깤</td>
	<td  width="5%">ǩԼ����</td>
	<td  width="18%">��ӳ����</td>
	<td  width="3%">�طý��</td>
	<td  width="3%">����ʽ</td>
	<td  width="3%">�طò���</td>
	<td  width="3%">�ط�ʱ��</td>
	<td  width="2%">��ϯԱ</td>
	<td  width="2%">��ϯ��</td>
	<td  width="15%">��ز��Ŵ������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="2%">�Զ���</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
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