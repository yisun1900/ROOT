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
	String wheresql1="";
	String wheresql2="";
	String cw_khfkjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String cw_khfkjl_fkxh=null;
	String cw_khfkjl_sjbh=null;
	String cw_khfkjl_jsjlh=null;
	String fklxbm=null;
	String cw_khfkjl_fkje=null;
	String cw_khfkjl_jkr=null;
	String cw_khfkjl_skr=null;
	String cw_khfkjl_sksj=null;
	String cw_khfkjl_lrdw=null;
	String cw_khfkjl_lrr=null;
	String cw_khfkjl_lrsj=null;
	String zffs=null;
	String zckx=null;
	String skdd=null;
	String dsksjbz=null;
	String skdw=null;

	String pzfl=request.getParameter("pzfl");
	String czlx=request.getParameter("czlx");
	if (pzfl.equals("1"))//�չ��̿�ֽ�
	{
		//���̿�,1�����̿2�����ɿ�
		if (czlx.equals("1"))//û�е���
		{
			wheresql+=" and cw_khfkjl.zffs in(select zffsbm from cw_zffsbm where lx='1') and cw_khfkjl.zffs!='31' ";
			wheresql+=" and cw_khfkjl.fklxbm in(select fklxbm from cw_fklxbm where pzfl='1')";
			wheresql+=" and cw_khfkjl.czlx='1'";
		}
		else if (czlx.equals("2"))//�ѵ���
		{
			wheresql+=" and cw_khfkjl.zffs in(select zffsbm from cw_zffsbm where lx='1') and cw_khfkjl.zffs!='31' ";
			wheresql+=" and cw_khfkjl.fklxbm in(select fklxbm from cw_fklxbm where pzfl='1')";
			wheresql+=" and cw_khfkjl.czlx='2'";
		}
	}
	else if (pzfl.equals("2"))//�չ��̿���ֽ�
	{
		//���̿�,1�����̿2�����ɿ� 
		if (czlx.equals("1"))//û�е���
		{
			wheresql+=" and cw_khfkjl.zffs in(select zffsbm from cw_zffsbm where lx='2') and cw_khfkjl.zffs!='31' ";
			wheresql+=" and cw_khfkjl.fklxbm in(select fklxbm from cw_fklxbm where pzfl='1')";
			wheresql+=" and cw_khfkjl.czlx='1'";
		}
		else if (czlx.equals("2"))//�ѵ���
		{
			wheresql+=" and cw_khfkjl.zffs in(select zffsbm from cw_zffsbm where lx='2') and cw_khfkjl.zffs!='31' ";
			wheresql+=" and cw_khfkjl.fklxbm in(select fklxbm from cw_fklxbm where pzfl='1')";
			wheresql+=" and cw_khfkjl.czlx='2'";
		}
	}
	else if (pzfl.equals("3"))//ת�롢ת�����̿�
	{
		//���̿�,1�����̿2�����ɿ� + ת�����̿�
		if (czlx.equals("1"))//û�е���
		{
			wheresql+=" and (";
			wheresql+="           ( cw_khfkjl.zffs in('31') ";//ת�빤�̿�
			wheresql+="             and (cw_khfkjl.czlx='1' OR (cw_khfkjl.czlx='2' and cw_khfkjl.zrkdcpz='0'))";
			wheresql+="             and  cw_khfkjl.fklxbm in( select fklxbm from cw_fklxbm where pzfl='1') )";
			wheresql+="       OR  ( cw_khfkjl.zffs in('31')";//ת�����̿�
			wheresql+="             and (cw_khfkjl.czlx='1' OR (cw_khfkjl.czlx='2' and cw_khfkjl.zckdcpz='0'))";
			wheresql+="             and cw_khfkjl.zckx   in( select fklxbm from cw_fklxbm where pzfl='1') )";
			wheresql+="     )";
		}
		else if (czlx.equals("2"))//�ѵ���
		{
			wheresql+=" and (";
			wheresql+="           ( cw_khfkjl.zffs in('31') ";//ת�빤�̿�
			wheresql+="             and cw_khfkjl.czlx='2' and cw_khfkjl.zrkdcpz='1' ";
			wheresql+="             and  cw_khfkjl.fklxbm in( select fklxbm from cw_fklxbm where pzfl='1') )";
			wheresql+="       OR  ( cw_khfkjl.zffs in('31')";//ת�����̿�
			wheresql+="             and cw_khfkjl.czlx='2' and cw_khfkjl.zckdcpz='1' ";
			wheresql+="             and cw_khfkjl.zckx   in( select fklxbm from cw_fklxbm where pzfl='1') )";
			wheresql+="     )";
		}
	}


	String sjr=null;
	sjr=request.getParameter("sjr");
	if (sjr!=null)
	{
		sjr=cf.GB2Uni(sjr);
		if (!(sjr.equals("")))	wheresql+=" and  (cw_khfkjl.sjr='"+sjr+"')";
	}
	String sjsj=null;
	sjsj=request.getParameter("sjsj");
	if (sjsj!=null)
	{
		sjsj=sjsj.trim();
		if (!(sjsj.equals("")))	wheresql+="  and (cw_khfkjl.sjsj>=TO_DATE('"+sjsj+"','YYYY/MM/DD'))";
	}
	sjsj=request.getParameter("sjsj2");
	if (sjsj!=null)
	{
		sjsj=sjsj.trim();
		if (!(sjsj.equals("")))	wheresql+="  and (cw_khfkjl.sjsj<=TO_DATE('"+sjsj+"','YYYY/MM/DD'))";
	}

	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql1+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
		if (!(crm_khxx_khxm.equals("")))	wheresql2+=" and  (crm_zxkhxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql1+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
		if (!(crm_khxx_fwdz.equals("")))	wheresql2+=" and  (crm_zxkhxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql1+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
		if (!(crm_khxx_hth.equals("")))	wheresql2+=" and   cw_khfkjl.khlx in('2','4')";
	}

	String khlx=null;
	khlx=request.getParameter("khlx");
	if (!(khlx.equals("")))	wheresql+=" and  (cw_khfkjl.khlx='"+khlx+"')";

	String scbz=null;
	scbz=request.getParameter("scbz");
	if (!(scbz.equals("")))	wheresql+=" and  (cw_khfkjl.scbz='"+scbz+"')";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cw_khfkjl.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	cw_khfkjl_khbh=request.getParameter("cw_khfkjl_khbh");
	if (cw_khfkjl_khbh!=null)
	{
		cw_khfkjl_khbh=cf.GB2Uni(cw_khfkjl_khbh);
		if (!(cw_khfkjl_khbh.equals("")))	wheresql+=" and  (cw_khfkjl.khbh='"+cw_khfkjl_khbh+"')";
	}
	cw_khfkjl_fkxh=request.getParameter("cw_khfkjl_fkxh");
	if (cw_khfkjl_fkxh!=null)
	{
		cw_khfkjl_fkxh=cw_khfkjl_fkxh.trim();
		if (!(cw_khfkjl_fkxh.equals("")))	wheresql+=" and (cw_khfkjl.fkxh="+cw_khfkjl_fkxh+") ";
	}
	cw_khfkjl_sjbh=request.getParameter("cw_khfkjl_sjbh");
	if (cw_khfkjl_sjbh!=null)
	{
		cw_khfkjl_sjbh=cf.GB2Uni(cw_khfkjl_sjbh);
		if (!(cw_khfkjl_sjbh.equals("")))	wheresql+=" and  (cw_khfkjl.sjbh='"+cw_khfkjl_sjbh+"')";
	}
	cw_khfkjl_jsjlh=request.getParameter("cw_khfkjl_jsjlh");
	if (cw_khfkjl_jsjlh!=null)
	{
		cw_khfkjl_jsjlh=cf.GB2Uni(cw_khfkjl_jsjlh);
		if (!(cw_khfkjl_jsjlh.equals("")))	wheresql+=" and  (cw_khfkjl.jsjlh='"+cw_khfkjl_jsjlh+"')";
	}
	fklxbm=request.getParameter("fklxbm");
	if (fklxbm!=null)
	{
		fklxbm=cf.GB2Uni(fklxbm);
		if (!(fklxbm.equals("")))	wheresql+=" and  (cw_khfkjl.fklxbm='"+fklxbm+"')";
	}
	cw_khfkjl_fkje=request.getParameter("cw_khfkjl_fkje");
	if (cw_khfkjl_fkje!=null)
	{
		cw_khfkjl_fkje=cw_khfkjl_fkje.trim();
		if (!(cw_khfkjl_fkje.equals("")))	wheresql+=" and  (cw_khfkjl.fkje="+cw_khfkjl_fkje+") ";
	}
	cw_khfkjl_jkr=request.getParameter("cw_khfkjl_jkr");
	if (cw_khfkjl_jkr!=null)
	{
		cw_khfkjl_jkr=cf.GB2Uni(cw_khfkjl_jkr);
		if (!(cw_khfkjl_jkr.equals("")))	wheresql+=" and  (cw_khfkjl.jkr='"+cw_khfkjl_jkr+"')";
	}
	cw_khfkjl_skr=request.getParameter("cw_khfkjl_skr");
	if (cw_khfkjl_skr!=null)
	{
		cw_khfkjl_skr=cf.GB2Uni(cw_khfkjl_skr);
		if (!(cw_khfkjl_skr.equals("")))	wheresql+=" and  (cw_khfkjl.skr='"+cw_khfkjl_skr+"')";
	}
	cw_khfkjl_sksj=request.getParameter("cw_khfkjl_sksj");
	if (cw_khfkjl_sksj!=null)
	{
		cw_khfkjl_sksj=cw_khfkjl_sksj.trim();
		if (!(cw_khfkjl_sksj.equals("")))	wheresql+="  and (cw_khfkjl.sksj>=TO_DATE('"+cw_khfkjl_sksj+"','YYYY/MM/DD'))";
	}
	cw_khfkjl_sksj=request.getParameter("cw_khfkjl_sksj2");
	if (cw_khfkjl_sksj!=null)
	{
		cw_khfkjl_sksj=cw_khfkjl_sksj.trim();
		if (!(cw_khfkjl_sksj.equals("")))	wheresql+="  and (cw_khfkjl.sksj<=TO_DATE('"+cw_khfkjl_sksj+"','YYYY/MM/DD'))";
	}
	cw_khfkjl_lrdw=request.getParameter("cw_khfkjl_lrdw");
	if (cw_khfkjl_lrdw!=null)
	{
		cw_khfkjl_lrdw=cf.GB2Uni(cw_khfkjl_lrdw);
		if (!(cw_khfkjl_lrdw.equals("")))	wheresql+=" and  (cw_khfkjl.lrdw='"+cw_khfkjl_lrdw+"')";
	}
	skdw=request.getParameter("skdw");
	if (skdw!=null)
	{
		skdw=cf.GB2Uni(skdw);
		if (!(skdw.equals("")))	wheresql+=" and  (cw_khfkjl.skdw='"+skdw+"')";
	}
	cw_khfkjl_lrr=request.getParameter("cw_khfkjl_lrr");
	if (cw_khfkjl_lrr!=null)
	{
		cw_khfkjl_lrr=cf.GB2Uni(cw_khfkjl_lrr);
		if (!(cw_khfkjl_lrr.equals("")))	wheresql+=" and  (cw_khfkjl.lrr='"+cw_khfkjl_lrr+"')";
	}
	cw_khfkjl_lrsj=request.getParameter("cw_khfkjl_lrsj");
	if (cw_khfkjl_lrsj!=null)
	{
		cw_khfkjl_lrsj=cw_khfkjl_lrsj.trim();
		if (!(cw_khfkjl_lrsj.equals("")))	wheresql+="  and (cw_khfkjl.lrsj>=TO_DATE('"+cw_khfkjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_khfkjl_lrsj=request.getParameter("cw_khfkjl_lrsj2");
	if (cw_khfkjl_lrsj!=null)
	{
		cw_khfkjl_lrsj=cw_khfkjl_lrsj.trim();
		if (!(cw_khfkjl_lrsj.equals("")))	wheresql+="  and (cw_khfkjl.lrsj<=TO_DATE('"+cw_khfkjl_lrsj+"','YYYY/MM/DD'))";
	}
	zffs=request.getParameter("zffs");
	if (zffs!=null)
	{
		zffs=cf.GB2Uni(zffs);
		if (!(zffs.equals("")))	wheresql+=" and  (cw_khfkjl.zffs='"+zffs+"')";
	}
	zckx=request.getParameter("zckx");
	if (zckx!=null)
	{
		zckx=cf.GB2Uni(zckx);
		if (!(zckx.equals("")))	wheresql+=" and  (cw_khfkjl.zckx='"+zckx+"')";
	}
	skdd=request.getParameter("skdd");
	if (skdd!=null)
	{
		skdd=cf.GB2Uni(skdd);
		if (!(skdd.equals("")))	wheresql+=" and  (cw_khfkjl.skdd='"+skdd+"')";
	}
	dsksjbz=request.getParameter("dsksjbz");
	if (dsksjbz!=null)
	{
		dsksjbz=cf.GB2Uni(dsksjbz);
		if (!(dsksjbz.equals("")))	wheresql+=" and  (cw_khfkjl.dsksjbz='"+dsksjbz+"')";
	}

	String pxzd=request.getParameter("pxzd");
	String myxssl=request.getParameter("myxssl");


	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,a.fklxmc fklxbm,fkxh,DECODE(cw_khfkjl.czlx,'1','¼��','2','����ƾ֤','3','ƾ֤����'),DECODE(cw_khfkjl.zrkdcpz,'0','��','1','��'),DECODE(cw_khfkjl.zckdcpz,'0','��','1','��'),fkcsmc,NVL2(cw_khfkjl.yfkbl,cw_khfkjl.yfkbl||'%',''),cw_khfkjl.yfkje,cw_khfkjl.fkje,cw_khfkjl.gysbh,DECODE(skdd,'1','����','2','�����'),DECODE(dsksjbz,'N','δ���','Y',' ���ͨ��','M','���δͨ��'),cw_khfkjl.sjbh,zffsmc,b.fklxmc zckx,cw_khfkjl.zcgysbh,cw_khfkjl.skr,cw_khfkjl.sksj,dwmc,DECODE(scbz,'N','δɾ��','Y','ɾ��'),sjr,sjsj,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,crm_khxx,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs  ";
    ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh(+) and cw_khfkjl.skdw=sq_dwxx.dwbh(+) and cw_khfkjl.fklxbm=a.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
    ls_sql+=" and cw_khfkjl.khlx in('2','4') and cw_khfkjl.fkcs=cw_fkcs.fkcs(+)";
    ls_sql+=wheresql;
    ls_sql+=wheresql1;

	ls_sql+=" UNION all";

	ls_sql+=" SELECT '&nbsp;',crm_zxkhxx.khxm,a.fklxmc fklxbm,cw_khfkjl.fkxh,DECODE(cw_khfkjl.czlx,'1','¼��','2','����ƾ֤','3','ƾ֤����'),DECODE(cw_khfkjl.zrkdcpz,'0','��','1','��'),DECODE(cw_khfkjl.zckdcpz,'0','��','1','��'),fkcsmc,NVL2(cw_khfkjl.yfkbl,cw_khfkjl.yfkbl||'%',''),cw_khfkjl.yfkje,cw_khfkjl.fkje,cw_khfkjl.gysbh,DECODE(skdd,'1','����','2','�����'),DECODE(dsksjbz,'N','δ���','Y',' ���ͨ��','M','���δͨ��'),cw_khfkjl.sjbh,zffsmc,b.fklxmc zckx,cw_khfkjl.zcgysbh,cw_khfkjl.skr,cw_khfkjl.sksj,dwmc,DECODE(scbz,'N','δɾ��','Y','ɾ��'),sjr,sjsj,cw_khfkjl.bz  ";
	ls_sql+=" FROM cw_khfkjl,crm_zxkhxx,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs  ";
    ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh(+) and cw_khfkjl.skdw=sq_dwxx.dwbh(+) and cw_khfkjl.fklxbm=a.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
    ls_sql+=" and cw_khfkjl.khlx in('1') and cw_khfkjl.fkcs=cw_fkcs.fkcs(+)";
    ls_sql+=wheresql;
    ls_sql+=wheresql2;

 /*
*/
    ls_sql+=" order by "+pxzd;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_khfkjlCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","fkxh","cw_khfkjl_sjbh","cw_khfkjl_jsjlh","cw_khfkjl_fklx","cw_khfkjl_fkje","cw_khfkjl_skr","cw_khfkjl_sksj","cw_khfkjl_lrdw","cw_khfkjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fkxh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"fkxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/cwgl/qyecx/ViewCw_khfkjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fkxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"fkxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/cwgl/qyecx/ViewKhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hth","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fklxbm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
  <B><font size="3">��ѯ�տ���Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">�տ�����</td>
	<td  width="3%">�տ����</td>
	<td  width="3%">��������</td>
	<td  width="2%">ת�뵼��ƾ֤</td>
	<td  width="2%">ת������ƾ֤</td>
	<td  width="2%">�տ�����</td>
	<td  width="2%">Ӧ�տ���</td>
	<td  width="3%">��װӦ�տ�</td>
	<td  width="3%">��װʵ�տ�</td>
	<td  width="4%">�տ�Ʒ��</td>
	<td  width="3%">�Ƿ������</td>
	<td  width="2%">��˱�־</td>
	<td  width="4%">�վݱ��</td>
	<td  width="3%">֧����ʽ</td>
	<td  width="4%">ת�ʿ���</td>
	<td  width="4%">ת��Ʒ��</td>
	<td  width="2%">�տ���</td>
	<td  width="3%">�տ�ʱ��</td>
	<td  width="5%">�տλ</td>
	<td  width="2%">ɾ����־</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="6%">��ע</td>
</tr>
<%
	pageObj.printDate();
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