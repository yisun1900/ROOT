<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String zwbm=(String)session.getAttribute("zwbm");//08:�Ҿӹ���;10:��ĿרԱ;12:�Ҿ����ʦ;18:ľ�Ų���ʦ
String ssfgs=(String)session.getAttribute("ssfgs");
String xmzyglbz=cf.fillNull(cf.executeQuery("select xmzyglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//��ĿרԱ����
String jjgwglbz=cf.fillNull(cf.executeQuery("select jjgwglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿӹ��ʹ���
String jjsjsglbz=cf.fillNull(cf.executeQuery("select jjsjsglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//�Ҿ����ʦ����

if (zwbm.equals("10"))//10:��ĿרԱ
{
	if (xmzyglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("08"))//08:�Ҿӹ���
{
	if (jjgwglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}
else if (zwbm.equals("12"))//12:�Ҿ����ʦ
{
	if (jjsjsglbz.equals("N"))//���˱�־
	{
		zwbm="";
	}
}


int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jc_jjdd_ddbh=null;
	String jc_jjdd_khbh=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	String jc_jjdd_jhccsj=null;
	String jc_jjdd_jjsjs=null;
	String jc_jjdd_sccsj=null;
	String jc_jjdd_qhtsj=null;
	String jctdyybm=null;
	String jc_jjdd_jhazrq=null;
	String jc_jjdd_sazrq=null;
	String jc_jjdd_clzt=null;
	String jc_jjdd_khlx=null;
	String jc_jjdd_lrr=null;
	String jc_jjdd_lrsj=null;
	String jc_jjdd_dwbh=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;


	String pdgc=null;
	pdgc=request.getParameter("pdgc");
	if (pdgc!=null)
	{
		if (!(pdgc.equals("")))	wheresql+=" and  (jc_jjdd.pdgc='"+pdgc+"')";
	}
	String pdgcmc=null;
	pdgcmc=request.getParameter("pdgcmc");
	if (pdgcmc!=null)
	{
		pdgcmc=cf.GB2Uni(pdgcmc);
		if (!(pdgcmc.equals("")))	wheresql+=" and  (jc_jjdd.pdgcmc like '%"+pdgcmc+"%')";
	}
	String jjppmc=null;
	jjppmc=request.getParameter("jjppmc");
	if (jjppmc!=null)
	{
		jjppmc=cf.GB2Uni(jjppmc);
		if (!(jjppmc.equals("")))	wheresql+=" and  (jc_jjdd.jjppmc='"+jjppmc+"')";
	}
	String jjppmc2=null;
	jjppmc2=request.getParameter("jjppmc2");
	if (jjppmc2!=null)
	{
		jjppmc2=cf.GB2Uni(jjppmc2);
		if (!(jjppmc2.equals("")))	wheresql+=" and  (jc_jjdd.jjppmc like '%"+jjppmc2+"%')";
	}
	String jjgys=null;
	jjgys=request.getParameter("jjgys");
	if (jjgys!=null)
	{
		jjgys=cf.GB2Uni(jjgys);
		if (!(jjgys.equals("")))	wheresql+=" and  (jc_jjdd.jjgys='"+jjgys+"')";
	}
	String jjgys2=null;
	jjgys2=request.getParameter("jjgys2");
	if (jjgys2!=null)
	{
		jjgys2=cf.GB2Uni(jjgys2);
		if (!(jjgys2.equals("")))	wheresql+=" and  (jc_jjdd.jjgys like '%"+jjgys2+"%')";
	}

	
	String xcmgc=null;
	xcmgc=request.getParameter("xcmgc");
	if (xcmgc!=null)
	{
		if (!(xcmgc.equals("")))	wheresql+=" and  (jc_jjdd.xcmgc='"+xcmgc+"')";
	}
	String xcmgcmc=null;
	xcmgcmc=request.getParameter("xcmgcmc");
	if (xcmgcmc!=null)
	{
		xcmgcmc=cf.GB2Uni(xcmgcmc);
		if (!(xcmgcmc.equals("")))	wheresql+=" and  (jc_jjdd.xcmgcmc like '%"+xcmgcmc+"%')";
	}
	String xcmppmc=null;
	xcmppmc=request.getParameter("xcmppmc");
	if (xcmppmc!=null)
	{
		xcmppmc=cf.GB2Uni(xcmppmc);
		if (!(xcmppmc.equals("")))	wheresql+=" and  (jc_jjdd.xcmppmc='"+xcmppmc+"')";
	}
	String xcmppmc2=null;
	xcmppmc2=request.getParameter("xcmppmc2");
	if (xcmppmc2!=null)
	{
		xcmppmc2=cf.GB2Uni(xcmppmc2);
		if (!(xcmppmc2.equals("")))	wheresql+=" and  (jc_jjdd.xcmppmc like '%"+xcmppmc2+"%')";
	}
	String xcmgys=null;
	xcmgys=request.getParameter("xcmgys");
	if (xcmgys!=null)
	{
		xcmgys=cf.GB2Uni(xcmgys);
		if (!(xcmgys.equals("")))	wheresql+=" and  (jc_jjdd.xcmgys='"+xcmgys+"')";
	}
	String xcmgys2=null;
	xcmgys2=request.getParameter("xcmgys2");
	if (xcmgys2!=null)
	{
		xcmgys2=cf.GB2Uni(xcmgys2);
		if (!(xcmgys2.equals("")))	wheresql+=" and  (jc_jjdd.xcmgys like '%"+xcmgys2+"%')";
	}


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	}

	String crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	String sfpsjs=null;
	sfpsjs=request.getParameter("sfpsjs");
	if (sfpsjs!=null)
	{
		if (!(sfpsjs.equals("")))	wheresql+=" and  (jc_jjdd.sfpsjs='"+sfpsjs+"')";
	}

	jc_jjdd_ddbh=request.getParameter("jc_jjdd_ddbh");
	if (jc_jjdd_ddbh!=null)
	{
		jc_jjdd_ddbh=cf.GB2Uni(jc_jjdd_ddbh);
		if (!(jc_jjdd_ddbh.equals("")))	wheresql+=" and  (jc_jjdd.ddbh='"+jc_jjdd_ddbh+"')";
	}
	jc_jjdd_khbh=request.getParameter("jc_jjdd_khbh");
	if (jc_jjdd_khbh!=null)
	{
		jc_jjdd_khbh=cf.GB2Uni(jc_jjdd_khbh);
		if (!(jc_jjdd_khbh.equals("")))	wheresql+=" and  (jc_jjdd.khbh='"+jc_jjdd_khbh+"')";
	}
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_jjdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_jjdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_jjdd.xmzy='"+xmzy+"')";
	}
	jc_jjdd_jhccsj=request.getParameter("jc_jjdd_jhccsj");
	if (jc_jjdd_jhccsj!=null)
	{
		jc_jjdd_jhccsj=jc_jjdd_jhccsj.trim();
		if (!(jc_jjdd_jhccsj.equals("")))	wheresql+="  and (jc_jjdd.jhccsj>=TO_DATE('"+jc_jjdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_jhccsj=request.getParameter("jc_jjdd_jhccsj2");
	if (jc_jjdd_jhccsj!=null)
	{
		jc_jjdd_jhccsj=jc_jjdd_jhccsj.trim();
		if (!(jc_jjdd_jhccsj.equals("")))	wheresql+="  and (jc_jjdd.jhccsj<=TO_DATE('"+jc_jjdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_jjsjs=request.getParameter("jc_jjdd_jjsjs");
	if (jc_jjdd_jjsjs!=null)
	{
		jc_jjdd_jjsjs=cf.GB2Uni(jc_jjdd_jjsjs);
		if (!(jc_jjdd_jjsjs.equals("")))	wheresql+=" and  (jc_jjdd.jjsjs='"+jc_jjdd_jjsjs+"')";
	}
	jc_jjdd_sccsj=request.getParameter("jc_jjdd_sccsj");
	if (jc_jjdd_sccsj!=null)
	{
		jc_jjdd_sccsj=jc_jjdd_sccsj.trim();
		if (!(jc_jjdd_sccsj.equals("")))	wheresql+="  and (jc_jjdd.sccsj>=TO_DATE('"+jc_jjdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_sccsj=request.getParameter("jc_jjdd_sccsj2");
	if (jc_jjdd_sccsj!=null)
	{
		jc_jjdd_sccsj=jc_jjdd_sccsj.trim();
		if (!(jc_jjdd_sccsj.equals("")))	wheresql+="  and (jc_jjdd.sccsj<=TO_DATE('"+jc_jjdd_sccsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_qhtsj=request.getParameter("jc_jjdd_qhtsj");
	if (jc_jjdd_qhtsj!=null)
	{
		jc_jjdd_qhtsj=jc_jjdd_qhtsj.trim();
		if (!(jc_jjdd_qhtsj.equals("")))	wheresql+="  and (jc_jjdd.qhtsj>=TO_DATE('"+jc_jjdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_qhtsj=request.getParameter("jc_jjdd_qhtsj2");
	if (jc_jjdd_qhtsj!=null)
	{
		jc_jjdd_qhtsj=jc_jjdd_qhtsj.trim();
		if (!(jc_jjdd_qhtsj.equals("")))	wheresql+="  and (jc_jjdd.qhtsj<=TO_DATE('"+jc_jjdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jctdyybm=request.getParameter("jctdyybm");
	if (jctdyybm!=null)
	{
		jctdyybm=cf.GB2Uni(jctdyybm);
		if (!(jctdyybm.equals("")))	wheresql+=" and  (jc_jjdd.jctdyybm='"+jctdyybm+"')";
	}
	jc_jjdd_jhazrq=request.getParameter("jc_jjdd_jhazrq");
	if (jc_jjdd_jhazrq!=null)
	{
		jc_jjdd_jhazrq=jc_jjdd_jhazrq.trim();
		if (!(jc_jjdd_jhazrq.equals("")))	wheresql+="  and (jc_jjdd.jhazrq>=TO_DATE('"+jc_jjdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_jjdd_jhazrq=request.getParameter("jc_jjdd_jhazrq2");
	if (jc_jjdd_jhazrq!=null)
	{
		jc_jjdd_jhazrq=jc_jjdd_jhazrq.trim();
		if (!(jc_jjdd_jhazrq.equals("")))	wheresql+="  and (jc_jjdd.jhazrq<=TO_DATE('"+jc_jjdd_jhazrq+"','YYYY/MM/DD'))";
	}
	jc_jjdd_sazrq=request.getParameter("jc_jjdd_sazrq");
	if (jc_jjdd_sazrq!=null)
	{
		jc_jjdd_sazrq=jc_jjdd_sazrq.trim();
		if (!(jc_jjdd_sazrq.equals("")))	wheresql+="  and (jc_jjdd.sazrq>=TO_DATE('"+jc_jjdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_jjdd_sazrq=request.getParameter("jc_jjdd_sazrq2");
	if (jc_jjdd_sazrq!=null)
	{
		jc_jjdd_sazrq=jc_jjdd_sazrq.trim();
		if (!(jc_jjdd_sazrq.equals("")))	wheresql+="  and (jc_jjdd.sazrq<=TO_DATE('"+jc_jjdd_sazrq+"','YYYY/MM/DD'))";
	}
	jc_jjdd_clzt=request.getParameter("jc_jjdd_clzt");
	if (jc_jjdd_clzt!=null)
	{
		jc_jjdd_clzt=cf.GB2Uni(jc_jjdd_clzt);
		if (!(jc_jjdd_clzt.equals("")))	wheresql+=" and  (jc_jjdd.clzt='"+jc_jjdd_clzt+"')";
	}
	jc_jjdd_khlx=request.getParameter("jc_jjdd_khlx");
	if (jc_jjdd_khlx!=null)
	{
		jc_jjdd_khlx=cf.GB2Uni(jc_jjdd_khlx);
		if (!(jc_jjdd_khlx.equals("")))	wheresql+=" and  (jc_jjdd.khlx='"+jc_jjdd_khlx+"')";
	}
	jc_jjdd_lrr=request.getParameter("jc_jjdd_lrr");
	if (jc_jjdd_lrr!=null)
	{
		jc_jjdd_lrr=cf.GB2Uni(jc_jjdd_lrr);
		if (!(jc_jjdd_lrr.equals("")))	wheresql+=" and  (jc_jjdd.lrr='"+jc_jjdd_lrr+"')";
	}
	jc_jjdd_lrsj=request.getParameter("jc_jjdd_lrsj");
	if (jc_jjdd_lrsj!=null)
	{
		jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
		if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj>=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_lrsj=request.getParameter("jc_jjdd_lrsj2");
	if (jc_jjdd_lrsj!=null)
	{
		jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
		if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj<=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_dwbh=request.getParameter("jc_jjdd_dwbh");
	if (jc_jjdd_dwbh!=null)
	{
		jc_jjdd_dwbh=cf.GB2Uni(jc_jjdd_dwbh);
		if (!(jc_jjdd_dwbh.equals("")))	wheresql+=" and  (jc_jjdd.dwbh='"+jc_jjdd_dwbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	ls_sql="SELECT jc_jjdd.ddbh,clztmc,crm_khxx.hth,crm_khxx.khxm khxm,crm_khxx.fwdz,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.sccsj,jc_jjdd.lrsj,jc_jjdd.lrr,sq_dwxx.dwmc,jc_jjdd.khbh,ysgcjdmc,crm_khxx.sjs,cxhdbm ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,sq_dwxx,crm_khxx,dm_gcjdbm";
    ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_jjdd.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
    ls_sql+=" and jc_jjdd.clzt not in('00','35','98','99')";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾������� 
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	if (zwbm.equals("08"))//08:�Ҿӹ���
	{
		ls_sql+=" and (jc_jjdd.clgw='"+yhmc+"' OR jc_jjdd.ztjjgw='"+yhmc+"' OR jc_jjdd.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("12"))//12:�Ҿ����ʦ
	{
		ls_sql+=" and (jc_jjdd.jjsjs='"+yhmc+"' OR jc_jjdd.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("10"))//10:��ĿרԱ
	{
		ls_sql+=" and (jc_jjdd.xmzy='"+yhmc+"' OR jc_jjdd.lrr='"+yhmc+"')";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jc_jjdd.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_jjddTqList.jsp","","","TqEditJc_jjdd.jsp");
	pageObj.setPageRow(30);
//������ʾ��
/*
	String[] disColName={"ddbh","clztmc","pdgc","pdgcmc","jjppmc","jjgys","xcmgc","xcmgcmc","xcmppmc","xcmgys","sfpsjs","jc_jjdd_khlx","hth","khxm","lxfs","sgbz","dh","fwdz","jjsjs","xmzy","clgw","ztjjgw","dj","htze","jjje","xcmje","zjhze","jjzjje","xcmzjje","lrr","lrsj","dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ","�����޸ļҾ߳�","�����޸��Ͳ��ų�"};//��ť����ʾ����
	String[] buttonLink={"DeleteTqJc_jjdd.jsp","plxgGys.jsp","plxgXcmGys.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,1,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
	String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">ά��-��Ȩ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">�������</td>
	<td  width="5%">����״̬</td>
	<td  width="5%">��ͬ��</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="13%">���ݵ�ַ</td>
	<td  width="4%">�Ҿ����ʦ</td>
	<td  width="4%">��ĿרԱ</td>
	<td  width="4%">פ��Ҿӹ���</td>
	<td  width="4%">չ���Ҿӹ���</td>
	<td  width="5%">��������</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="8%">¼�벿��</td>
	<td  width="4%">�ͻ����</td>
	<td  width="5%">���̽���</td>
	<td  width="4%">��װ���ʦ</td>
    <td  width="11%">�����</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
