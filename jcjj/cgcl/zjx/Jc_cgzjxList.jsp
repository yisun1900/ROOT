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


	String jc_cgzjx_khbh=null;
	String crm_khxx_hth=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_khxm2=null;
	String crm_khxx_fwdz2=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;

	String fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	jc_cgzjx_khbh=request.getParameter("jc_cgzjx_khbh");
	if (jc_cgzjx_khbh!=null)
	{
		jc_cgzjx_khbh=cf.GB2Uni(jc_cgzjx_khbh);
		if (!(jc_cgzjx_khbh.equals("")))	wheresql+=" and  (jc_cgzjx.khbh='"+jc_cgzjx_khbh+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
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

	crm_khxx_khxm2=request.getParameter("crm_khxx_khxm2");
	if (crm_khxx_khxm2!=null)
	{
		crm_khxx_khxm2=cf.GB2Uni(crm_khxx_khxm2);
		if (!(crm_khxx_khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm2+"%')";
	}
	crm_khxx_fwdz2=request.getParameter("crm_khxx_fwdz2");
	if (crm_khxx_fwdz2!=null)
	{
		crm_khxx_fwdz2=cf.GB2Uni(crm_khxx_fwdz2);
		if (!(crm_khxx_fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz2+"%')";
	}


	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}


	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+δ���&2+�����
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}



	String jc_cgzjx_zjxxh=null;
	String jc_cgzjx_ddbh=null;
	jc_cgzjx_zjxxh=request.getParameter("jc_cgzjx_zjxxh");
	if (jc_cgzjx_zjxxh!=null)
	{
		jc_cgzjx_zjxxh=jc_cgzjx_zjxxh.trim();
		if (!(jc_cgzjx_zjxxh.equals("")))	wheresql+=" and (jc_cgzjx.zjxxh='"+jc_cgzjx_zjxxh+"') ";
	}
	jc_cgzjx_ddbh=request.getParameter("jc_cgzjx_ddbh");
	if (jc_cgzjx_ddbh!=null)
	{
		jc_cgzjx_ddbh=cf.GB2Uni(jc_cgzjx_ddbh);
		if (!(jc_cgzjx_ddbh.equals("")))	wheresql+=" and  (jc_cgzjx.ddbh='"+jc_cgzjx_ddbh+"')";
	}


	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_cgzjx.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_cgzjx.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_cgzjx.xmzy='"+xmzy+"')";
	}
	String cgsjs=null;
	cgsjs=request.getParameter("cgsjs");
	if (cgsjs!=null)
	{
		cgsjs=cf.GB2Uni(cgsjs);
		if (!(cgsjs.equals("")))	wheresql+=" and  (jc_cgzjx.cgsjs='"+cgsjs+"')";
	}


	String pdgcmc=null;
	pdgcmc=request.getParameter("pdgcmc");
	if (pdgcmc!=null)
	{
		pdgcmc=cf.GB2Uni(pdgcmc);
		if (!(pdgcmc.equals("")))	wheresql+=" and  (jc_cgzjx.pdgcmc='"+pdgcmc+"')";
	}
	String pdgcmc2=null;
	pdgcmc2=request.getParameter("pdgcmc2");
	if (pdgcmc2!=null)
	{
		pdgcmc2=cf.GB2Uni(pdgcmc2);
		if (!(pdgcmc2.equals("")))	wheresql+=" and  (jc_cgzjx.pdgcmc like '%"+pdgcmc2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_cgzjx.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_cgzjx.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_cgzjx.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_cgzjx.gys like '%"+gys2+"%')";
	}





	String jc_cgzjx_cgzjxyybm=null;
	String jc_cgzjx_clzt=null;
	jc_cgzjx_cgzjxyybm=request.getParameter("jc_cgzjx_cgzjxyybm");
	if (jc_cgzjx_cgzjxyybm!=null)
	{
		jc_cgzjx_cgzjxyybm=cf.GB2Uni(jc_cgzjx_cgzjxyybm);
		if (!(jc_cgzjx_cgzjxyybm.equals("")))	wheresql+=" and  (jc_cgzjx.cgzjxyybm='"+jc_cgzjx_cgzjxyybm+"')";
	}
	jc_cgzjx_clzt=request.getParameter("jc_cgzjx_clzt");
	if (jc_cgzjx_clzt!=null)
	{
		jc_cgzjx_clzt=cf.GB2Uni(jc_cgzjx_clzt);
		if (!(jc_cgzjx_clzt.equals("")))	wheresql+=" and  (jc_cgzjx.clzt='"+jc_cgzjx_clzt+"')";
	}


	String zjxfssj=null;
	zjxfssj=request.getParameter("zjxfssj");
	if (zjxfssj!=null)
	{
		zjxfssj=zjxfssj.trim();
		if (!(zjxfssj.equals("")))	wheresql+="  and (jc_cgzjx.zjxfssj>=TO_DATE('"+zjxfssj+"','YYYY/MM/DD'))";
	}
	zjxfssj=request.getParameter("zjxfssj2");
	if (zjxfssj!=null)
	{
		zjxfssj=zjxfssj.trim();
		if (!(zjxfssj.equals("")))	wheresql+="  and (jc_cgzjx.zjxfssj<=TO_DATE('"+zjxfssj+"','YYYY/MM/DD'))";
	}

	String jc_cgzjx_jhazsj=null;
	jc_cgzjx_jhazsj=request.getParameter("jc_cgzjx_jhazsj");
	if (jc_cgzjx_jhazsj!=null)
	{
		jc_cgzjx_jhazsj=jc_cgzjx_jhazsj.trim();
		if (!(jc_cgzjx_jhazsj.equals("")))	wheresql+="  and (jc_cgzjx.jhazsj>=TO_DATE('"+jc_cgzjx_jhazsj+"','YYYY/MM/DD'))";
	}
	jc_cgzjx_jhazsj=request.getParameter("jc_cgzjx_jhazsj2");
	if (jc_cgzjx_jhazsj!=null)
	{
		jc_cgzjx_jhazsj=jc_cgzjx_jhazsj.trim();
		if (!(jc_cgzjx_jhazsj.equals("")))	wheresql+="  and (jc_cgzjx.jhazsj<=TO_DATE('"+jc_cgzjx_jhazsj+"','YYYY/MM/DD'))";
	}

	String jc_cgzjx_lrr=null;
	String jc_cgzjx_lrsj=null;
	String jc_cgzjx_dwbh=null;
	jc_cgzjx_lrr=request.getParameter("jc_cgzjx_lrr");
	if (jc_cgzjx_lrr!=null)
	{
		jc_cgzjx_lrr=cf.GB2Uni(jc_cgzjx_lrr);
		if (!(jc_cgzjx_lrr.equals("")))	wheresql+=" and  (jc_cgzjx.lrr='"+jc_cgzjx_lrr+"')";
	}
	jc_cgzjx_lrsj=request.getParameter("jc_cgzjx_lrsj");
	if (jc_cgzjx_lrsj!=null)
	{
		jc_cgzjx_lrsj=jc_cgzjx_lrsj.trim();
		if (!(jc_cgzjx_lrsj.equals("")))	wheresql+="  and (jc_cgzjx.lrsj>=TO_DATE('"+jc_cgzjx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_cgzjx_lrsj=request.getParameter("jc_cgzjx_lrsj2");
	if (jc_cgzjx_lrsj!=null)
	{
		jc_cgzjx_lrsj=jc_cgzjx_lrsj.trim();
		if (!(jc_cgzjx_lrsj.equals("")))	wheresql+="  and (jc_cgzjx.lrsj<=TO_DATE('"+jc_cgzjx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_cgzjx_dwbh=request.getParameter("jc_cgzjx_dwbh");
	if (jc_cgzjx_dwbh!=null)
	{
		jc_cgzjx_dwbh=cf.GB2Uni(jc_cgzjx_dwbh);
		if (!(jc_cgzjx_dwbh.equals("")))	wheresql+=" and  (jc_cgzjx.dwbh='"+jc_cgzjx_dwbh+"')";
	}


	ls_sql="SELECT jc_cgzjx.ddbh,jc_cgzjx.zjxxh,DECODE(jc_cgzjx.clzt,'00','¼��δ���','01','¼�����','02','������ȷ��','04','��װ���','99','�˵�'),jc_cgzjx.khbh,crm_khxx.khxm,crm_khxx.fwdz,jc_cgzjx.pdgcmc,crm_khxx.hth,mmzjxyymc,TO_CHAR(jc_cgzjx.cgzkl) cgzkl,TO_CHAR(jc_cgzjx.tmzkl) tmzkl,jc_cgzjx.dzyy,jc_cgzjx.zqzjxze,jc_cgzjx.zqgtzjxje,jc_cgzjx.zqtmzjxje,jc_cgzjx.zqwjzjxje,jc_cgzjx.zqdqzjxje,jc_cgzjx.zjxze,jc_cgzjx.gtzjxje,jc_cgzjx.tmzjxje,jc_cgzjx.wjzjxje,jc_cgzjx.dqzjxje,jc_cgzjx.zjxfssj,jc_cgzjx.jhazsj,jc_cgzjx.lrr,jc_cgzjx.lrsj,dwmc,jc_cgzjx.bz  ";
	ls_sql+=" FROM crm_khxx,jc_cgzjx,sq_dwxx,jdm_mmzjxyybm  ";
    ls_sql+=" where jc_cgzjx.dwbh=sq_dwxx.dwbh and jc_cgzjx.cgzjxyybm=jdm_mmzjxyybm.mmzjxyybm";
    ls_sql+=" and jc_cgzjx.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_cgzjx.clzt in('00','01')";
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
		ls_sql+=" and (jc_cgzjx.clgw='"+yhmc+"' OR jc_cgzjx.ztjjgw='"+yhmc+"' OR jc_cgzjx.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("12"))//12:�Ҿ����ʦ
	{
		ls_sql+=" and (jc_cgzjx.cgsjs='"+yhmc+"' OR jc_cgzjx.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("10"))//10:��ĿרԱ
	{
		ls_sql+=" and (jc_cgzjx.xmzy='"+yhmc+"' OR jc_cgzjx.lrr='"+yhmc+"')";
	}

	ls_sql+=wheresql;
    ls_sql+=" order by jc_cgzjx.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_cgzjxList.jsp","","","EditJc_cgzjx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ddbh","zjxxh","jc_cgzjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_zjxm","jc_cgzjx_cgzjxyybm","jc_cgzjx_gtzjxje","jc_cgzjx_tmzjxje","jc_cgzjx_wjzjxje","jc_cgzjx_dqzjxje","jc_cgzjx_zjxze","jc_cgzjx_qrsj","jc_cgzjx_qrr","jc_cgzjx_srksj","jc_cgzjx_rkr","jc_cgzjx_rksm","jc_cgzjx_jhazsj","jc_cgzjx_azwcsj","jc_cgzjx_clzt","jc_cgzjx_lrr","jc_cgzjx_lrsj","jc_cgzjx_dwbh","jc_cgzjx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ����ɱ�־","ɾ��������"};//��ť����ʾ����
	String[] buttonLink={"DeleteEndJc_cgzjx.jsp","DeleteJc_cgzjx.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
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
	String[] coluKey1={"zjxxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="ViewJc_cgzjx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("zjxxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
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
  <B><font size="3">���������ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">�������</td>
	<td  width="3%">���������</td>
	<td  width="3%">����״̬</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="5%">����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="4%">������ԭ��</td>
	<td  width="2%">�����ۿ���</td>
	<td  width="2%">̨���ۿ���</td>
	<td  width="8%">����ԭ��</td>

	<td  width="3%"><strong>�������ܶ��ǰ</strong></td>
	<td  width="3%"><strong>�������������ǰ</strong></td>
	<td  width="3%"><strong>̨�����������ǰ</strong></td>
	<td  width="3%"><strong>������������ǰ</strong></td>
	<td  width="3%"><strong>�������������ǰ</strong></td>

	<td  width="3%"><font color="#0000CC"><strong>�������ܶ�ۺ�</strong></font></td>
	<td  width="3%"><font color="#0000CC"><strong>������������ۺ�</strong></font></td>
	<td  width="3%"><font color="#0000CC"><strong>̨����������ۺ�</strong></font></td>
	<td  width="3%"><font color="#0000CC"><strong>�����������ۺ�</strong></font></td>
	<td  width="3%"><font color="#0000CC"><strong>������������ۺ�</strong></font></td>

	<td  width="3%">�������ʱ��</td>
	<td  width="3%">�ƻ���װʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="8%">��ע</td>
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