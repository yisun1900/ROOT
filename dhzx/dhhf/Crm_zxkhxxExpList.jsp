<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
pageObj.setType("EXCEL",response);

String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String sfyywy=null;
	sfyywy=request.getParameter("sfyywy");
	if (sfyywy!=null)
	{
		sfyywy=cf.GB2Uni(sfyywy);
		if (sfyywy.equals("Y"))
		{
			wheresql+=" and  (crm_zxkhxx.ywy is not null)";
		}
		else if (sfyywy.equals("N"))
		{
			wheresql+=" and  (crm_zxkhxx.ywy is null)";
		}
	}

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	}
	
	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}
	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
	}
	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
	}

	String khbh=null;
	
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}


	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_zxkhxx.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}


	String sfxhf=null;
	String hfrq=null;

	sfxhf=request.getParameter("sfxhf");
	if (sfxhf!=null)
	{
		sfxhf=cf.GB2Uni(sfxhf);
		if (!(sfxhf.equals("")))	wheresql+=" and  (crm_zxkhxx.sfxhf='"+sfxhf+"')";
	}
	hfrq=request.getParameter("hfrq");
	if (hfrq!=null)
	{
		hfrq=hfrq.trim();
		if (!(hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq>=TO_DATE('"+hfrq+"','YYYY/MM/DD'))";
	}
	hfrq=request.getParameter("hfrq2");
	if (hfrq!=null)
	{
		hfrq=hfrq.trim();
		if (!(hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq<=TO_DATE('"+hfrq+"','YYYY/MM/DD'))";
	}
	String zxhfsj=null;
	zxhfsj=request.getParameter("zxhfsj");
	if (zxhfsj!=null)
	{
		zxhfsj=zxhfsj.trim();
		if (!(zxhfsj.equals("")))	wheresql+="  and (crm_zxkhxx.zxhfsj>=TO_DATE('"+zxhfsj+"','YYYY/MM/DD'))";
	}
	zxhfsj=request.getParameter("zxhfsj2");
	if (zxhfsj!=null)
	{
		zxhfsj=zxhfsj.trim();
		if (!(zxhfsj.equals("")))	wheresql+="  and (crm_zxkhxx.zxhfsj<=TO_DATE('"+zxhfsj+"','YYYY/MM/DD'))";
	}

	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}

	String xqlx=null;
	xqlx=request.getParameter("xqlx");
	if (xqlx!=null)
	{
		xqlx=cf.GB2Uni(xqlx);
		if (!(xqlx.equals("")))	wheresql+=" and  (crm_zxkhxx.xqlx='"+xqlx+"')";
	}
	String khzyxz=null;
	khzyxz=request.getParameter("khzyxz");
	if (khzyxz!=null)
	{
		khzyxz=cf.GB2Uni(khzyxz);
		if (!(khzyxz.equals("")))	wheresql+=" and  (crm_zxkhxx.khzyxz='"+khzyxz+"')";
	}

	ls_sql="SELECT crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.lxfs,xqlx,khzyxz,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') as zxzt,crm_zxkhxx.hfrq,crm_zxkhxx.zxhfsj,crm_zxkhxx.smcs,khjl,sjs,ywy,sbyymc,sbsj,lrsj,dwmc";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx,dm_sbyybm ";
    ls_sql+=" where  crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
    ls_sql+=" and crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) ";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	if (yhjs.equals("F2"))//����
	{
		ls_sql+=" and zxzt in('0','1','5')";//0��δ������棻1: ������棻2: ���ʦ�ύ�ɵ���3����ǩԼ��4���ɵ���5���ɵ����δͨ��
	}
	else{
		ls_sql+=" and zxzt in('0','1','5')";
	}
	ls_sql+=wheresql;
    ls_sql+=" order by crm_zxkhxx.khbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="8%">��ϵ��ʽ</td>
	<td  width="5%">С������</td>
	<td  width="5%">�ͻ���Դ����</td>
	<td  width="7%">��ѯ״̬</td>
	<td  width="6%">���ûط�����</td>
	<td  width="6%">�ϴλط�����</td>
	<td  width="4%">�������</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">ҵ��Ա</td>
	<td  width="7%">ʧ��ԭ��</td>
	<td  width="6%">ʧ��ʱ��</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="8%">��ѯ����</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>

</body>
</html>