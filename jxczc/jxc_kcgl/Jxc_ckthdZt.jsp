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
	String jxc_kcb_lsh=null;
	String jxc_kcb_clmc=null;
	String jxc_kcb_cllb=null;
	String jxc_kcb_cldlbm=null;
	String jxc_kcb_clxlbm=null;
	String jxc_kcb_scsmc=null;
	String jxc_kcb_ppmc=null;
	String jxc_kcb_cllbbm=null;
	String jxc_kcb_xh=null;
	String jxc_kcb_gg=null;
	String jxc_kcb_clysbm=null;
	String jxc_kcb_jldwbm=null;
	String jxc_kcb_hwbh=null;
	String jxc_kcb_pjts=null;
	String jxc_kcb_sfyh=null;
	String jxc_kcb_cpjb=null;
	String jxc_kcb_fgsx=null;
	String jxc_kcb_cpsm=null;
	String jxc_kcb_cd=null;
	String jxc_kcb_zp=null;
	String jxc_kcb_cgzq=null;
	String jxc_kcb_bz=null;
	String jxc_kcb_clbm=null;
	String jxc_kcb_hjbh=null;
	String jxc_kcb_ckbh=null;
	String jxc_kcb_dqbm=null;
	String jxc_kcb_cbj=null;
	String jxc_kcb_kcsl=null;
	String jxc_kcb_kcje=null;
	String jxc_kcb_clmc_mh=null;
	String jxc_kcb_xh_mh=null;
	String jxc_kcb_gg_mh=null;
	String jxc_kcb_fgsx_mh=null;
	String jxc_kcb_cpsm_mh=null;
	String myxssl=request.getParameter("myxssl");//ÿҳ��ʾ����
	String sfxstp=request.getParameter("sfxstp"); //�Ƿ���ʾͼƬ
	String ordersql=request.getParameter("pxfs"); //����ʽ
	String ls="";
	if (myxssl==null || myxssl.equals(""))
	{myxssl="30";}//���û��¼�� ��ʼ����30
	jxc_kcb_lsh=request.getParameter("jxc_kcb_lsh");
	String[] clbm=request.getParameterValues("clbmlist");
	if (clbm!=null)
	{
		for (int i=clbm.length-1;i>=0 ; i--)
		{
			ls+=",'"+clbm[i]+"'";
		}
		ls=ls.substring(1);
		if (!(ls.equals("")))	wheresql+="  and (jxc_ckthd.clbm in ("+ls+"))";
	}
	if (jxc_kcb_lsh!=null)
	{
		jxc_kcb_lsh=cf.GB2Uni(jxc_kcb_lsh);
		if (!(jxc_kcb_lsh.equals("")))	wheresql+=" and  (jxc_ckthd.lsh='"+jxc_kcb_lsh+"')";
	}
	jxc_kcb_clmc=request.getParameter("jxc_kcb_clmc");
	jxc_kcb_clmc_mh=request.getParameter("jxc_kcb_clmc_mh");
	if (jxc_kcb_clmc!=null)
	{
		jxc_kcb_clmc=cf.GB2Uni(jxc_kcb_clmc);
		if (!(jxc_kcb_clmc.equals("")))	
		{
			if (jxc_kcb_clmc_mh!=null && jxc_kcb_clmc_mh!="")
				{wheresql+=" and  (jxc_ckthd.clmc like '%"+jxc_kcb_clmc+"%')";}
			else
			{wheresql+=" and  (jxc_ckthd.clmc='"+jxc_kcb_clmc+"')";}
		}
	}
	jxc_kcb_cllb=request.getParameter("jxc_kcb_cllb");
	if (jxc_kcb_cllb!=null)
	{
		jxc_kcb_cllb=cf.GB2Uni(jxc_kcb_cllb);
		if (!(jxc_kcb_cllb.equals("")))	wheresql+=" and  (jxc_ckthd.cllb='"+jxc_kcb_cllb+"')";
	}
	jxc_kcb_cldlbm=request.getParameter("jxc_kcb_cldlbm");
	if (jxc_kcb_cldlbm!=null)
	{
		jxc_kcb_cldlbm=cf.GB2Uni(jxc_kcb_cldlbm);
		if (!(jxc_kcb_cldlbm.equals("")))	wheresql+=" and  (jxc_ckthd.cldlbm='"+jxc_kcb_cldlbm+"')";
	}
	jxc_kcb_clxlbm=request.getParameter("jxc_kcb_clxlbm");
	if (jxc_kcb_clxlbm!=null)
	{
		jxc_kcb_clxlbm=cf.GB2Uni(jxc_kcb_clxlbm);
		if (!(jxc_kcb_clxlbm.equals("")))	wheresql+=" and  (jxc_ckthd.clxlbm='"+jxc_kcb_clxlbm+"')";
	}
	jxc_kcb_scsmc=request.getParameter("jxc_kcb_scsmc");
	if (jxc_kcb_scsmc!=null)
	{
		jxc_kcb_scsmc=cf.GB2Uni(jxc_kcb_scsmc);
		if (!(jxc_kcb_scsmc.equals("")))	wheresql+=" and  (jxc_ckthd.scsmc='"+jxc_kcb_scsmc+"')";
	}
	jxc_kcb_ppmc=request.getParameter("jxc_kcb_ppmc");
	if (jxc_kcb_ppmc!=null)
	{
		jxc_kcb_ppmc=cf.GB2Uni(jxc_kcb_ppmc);
		if (!(jxc_kcb_ppmc.equals("")))	wheresql+=" and  (jxc_ckthd.ppmc='"+jxc_kcb_ppmc+"')";
	}
	jxc_kcb_cllbbm=request.getParameter("jxc_kcb_cllbbm");
	if (jxc_kcb_cllbbm!=null)
	{
		jxc_kcb_cllbbm=cf.GB2Uni(jxc_kcb_cllbbm);
		if (!(jxc_kcb_cllbbm.equals("")))	wheresql+=" and  (jxc_ckthd.cllbbm='"+jxc_kcb_cllbbm+"')";
	}
	jxc_kcb_xh=request.getParameter("jxc_kcb_xh");
	jxc_kcb_xh_mh=request.getParameter("jxc_kcb_xh_mh");
	if (jxc_kcb_xh!=null)
	{
		jxc_kcb_xh=cf.GB2Uni(jxc_kcb_xh);
		if (!(jxc_kcb_xh.equals("")))	
		{
			if (jxc_kcb_xh_mh!=null && jxc_kcb_xh_mh!="") 
				{wheresql+=" and  (jxc_ckthd.xh like '%"+jxc_kcb_xh+"%')";}
			else
				{wheresql+=" and  (jxc_ckthd.xh='"+jxc_kcb_xh+"')";}
		}
	}
	jxc_kcb_gg=request.getParameter("jxc_kcb_gg");
	jxc_kcb_gg_mh=request.getParameter("jxc_kcb_gg_mh");
	if (jxc_kcb_gg!=null)
	{
		jxc_kcb_gg=cf.GB2Uni(jxc_kcb_gg);
		if (!(jxc_kcb_gg.equals("")))
		{
			if (jxc_kcb_gg_mh!=null && jxc_kcb_gg_mh!="") 
			{wheresql+=" and  (jxc_ckthd.gg like '%"+jxc_kcb_gg+"%')";}
			else
			{wheresql+=" and  (jxc_ckthd.gg='"+jxc_kcb_gg+"')";}
		}
	}
	jxc_kcb_clysbm=request.getParameter("jxc_kcb_clysbm");
	if (jxc_kcb_clysbm!=null)
	{
		jxc_kcb_clysbm=cf.GB2Uni(jxc_kcb_clysbm);
		if (!(jxc_kcb_clysbm.equals("")))	wheresql+=" and  (jxc_ckthd.clysbm='"+jxc_kcb_clysbm+"')";
	}
	jxc_kcb_jldwbm=request.getParameter("jxc_kcb_jldwbm");
	if (jxc_kcb_jldwbm!=null)
	{
		jxc_kcb_jldwbm=cf.GB2Uni(jxc_kcb_jldwbm);
		if (!(jxc_kcb_jldwbm.equals("")))	wheresql+=" and  (jxc_ckthd.jldwbm='"+jxc_kcb_jldwbm+"')";
	}
	jxc_kcb_hwbh=request.getParameter("jxc_kcb_hwbh");
	if (jxc_kcb_hwbh!=null)
	{
		jxc_kcb_hwbh=cf.GB2Uni(jxc_kcb_hwbh);
		if (!(jxc_kcb_hwbh.equals("")))	wheresql+=" and  (jxc_ckthd.hwbh='"+jxc_kcb_hwbh+"')";
	}
	jxc_kcb_pjts=request.getParameter("jxc_kcb_pjts");
	if (jxc_kcb_pjts!=null)
	{
		jxc_kcb_pjts=jxc_kcb_pjts.trim();
		if (!(jxc_kcb_pjts.equals("")))	wheresql+=" and (jxc_ckthd.pjts="+jxc_kcb_pjts+") ";
	}
	jxc_kcb_sfyh=request.getParameter("jxc_kcb_sfyh");
	if (jxc_kcb_sfyh!=null)
	{
		jxc_kcb_sfyh=cf.GB2Uni(jxc_kcb_sfyh);
		if (!(jxc_kcb_sfyh.equals("")))	wheresql+=" and  (jxc_ckthd.sfyh='"+jxc_kcb_sfyh+"')";
	}
	jxc_kcb_cpjb=request.getParameter("jxc_kcb_cpjb");
	if (jxc_kcb_cpjb!=null)
	{
		jxc_kcb_cpjb=cf.GB2Uni(jxc_kcb_cpjb);
		if (!(jxc_kcb_cpjb.equals("")))	wheresql+=" and  (jxc_ckthd.cpjb='"+jxc_kcb_cpjb+"')";
	}
	jxc_kcb_fgsx=request.getParameter("jxc_kcb_fgsx");
	jxc_kcb_fgsx_mh=request.getParameter("jxc_kcb_fgsx_mh");
	if (jxc_kcb_fgsx!=null)
	{
		jxc_kcb_fgsx=cf.GB2Uni(jxc_kcb_fgsx);
		if (!(jxc_kcb_fgsx.equals("")))	
		{
			if (jxc_kcb_fgsx_mh!=null && jxc_kcb_fgsx_mh!="") 
			{wheresql+=" and  (jxc_ckthd.fgsx like '%"+jxc_kcb_fgsx+"%')";}
			else
			{wheresql+=" and  (jxc_ckthd.fgsx='"+jxc_kcb_fgsx+"')";}
		}
	}
	jxc_kcb_cpsm=request.getParameter("jxc_kcb_cpsm");
	jxc_kcb_cpsm_mh=request.getParameter("jxc_kcb_cpsm_mh");
	if (jxc_kcb_cpsm!=null)
	{
		jxc_kcb_cpsm=cf.GB2Uni(jxc_kcb_cpsm);
		if (!(jxc_kcb_cpsm.equals("")))	
		{
			if (jxc_kcb_cpsm_mh!=null && jxc_kcb_cpsm_mh!="") 
			{wheresql+=" and  (jxc_ckthd.cpsm like '%"+jxc_kcb_cpsm+"%')";}
				else
			{wheresql+=" and  (jxc_ckthd.cpsm='"+jxc_kcb_cpsm+"')";}
		}
	}
	jxc_kcb_cd=request.getParameter("jxc_kcb_cd");
	if (jxc_kcb_cd!=null)
	{
		jxc_kcb_cd=cf.GB2Uni(jxc_kcb_cd);
		if (!(jxc_kcb_cd.equals("")))	wheresql+=" and  (jxc_ckthd.cd='"+jxc_kcb_cd+"')";
	}
	jxc_kcb_zp=request.getParameter("jxc_kcb_zp");
	if (jxc_kcb_zp!=null)
	{
		jxc_kcb_zp=cf.GB2Uni(jxc_kcb_zp);
		if (!(jxc_kcb_zp.equals("")))	wheresql+=" and  (jxc_ckthd.zp='"+jxc_kcb_zp+"')";
	}
	jxc_kcb_cgzq=request.getParameter("jxc_kcb_cgzq");
	if (jxc_kcb_cgzq!=null)
	{
		jxc_kcb_cgzq=jxc_kcb_cgzq.trim();
		if (!(jxc_kcb_cgzq.equals("")))	wheresql+=" and (jxc_ckthd.cgzq="+jxc_kcb_cgzq+") ";
	}
	jxc_kcb_bz=request.getParameter("jxc_kcb_bz");
	if (jxc_kcb_bz!=null)
	{
		jxc_kcb_bz=cf.GB2Uni(jxc_kcb_bz);
		if (!(jxc_kcb_bz.equals("")))	wheresql+=" and  (jxc_ckthd.bz='"+jxc_kcb_bz+"')";
	}
	jxc_kcb_clbm=request.getParameter("jxc_kcb_clbm");
	if (jxc_kcb_clbm!=null)
	{
		jxc_kcb_clbm=cf.GB2Uni(jxc_kcb_clbm);
		if (!(jxc_kcb_clbm.equals("")))	wheresql+=" and  (jxc_ckthd.clbm='"+jxc_kcb_clbm+"')";
	}
	jxc_kcb_hjbh=request.getParameter("jxc_kcb_hjbh");
	if (jxc_kcb_hjbh!=null)
	{
		jxc_kcb_hjbh=cf.GB2Uni(jxc_kcb_hjbh);
		if (!(jxc_kcb_hjbh.equals("")))	wheresql+=" and  (jxc_ckthd.hjbh='"+jxc_kcb_hjbh+"')";
	}
	jxc_kcb_ckbh=request.getParameter("jxc_kcb_ckbh");
	if (jxc_kcb_ckbh!=null)
	{
		jxc_kcb_ckbh=cf.GB2Uni(jxc_kcb_ckbh);
		if (!(jxc_kcb_ckbh.equals("")))	wheresql+=" and  (jxc_ckthd.ckbh='"+jxc_kcb_ckbh+"')";
	}
	jxc_kcb_dqbm=request.getParameter("jxc_kcb_dqbm");
	if (jxc_kcb_dqbm!=null)
	{
		jxc_kcb_dqbm=cf.GB2Uni(jxc_kcb_dqbm);
		if (!(jxc_kcb_dqbm.equals("")))	wheresql+=" and  (jxc_ckthd.dqbm='"+jxc_kcb_dqbm+"')";
	}
	jxc_kcb_cbj=request.getParameter("jxc_kcb_cbj");
	if (jxc_kcb_cbj!=null)
	{
		jxc_kcb_cbj=jxc_kcb_cbj.trim();
		if (!(jxc_kcb_cbj.equals("")))	wheresql+=" and  (jxc_ckthd.rkj="+jxc_kcb_cbj+") ";
	}
	jxc_kcb_kcsl=request.getParameter("jxc_kcb_kcsl");
	if (jxc_kcb_kcsl!=null)
	{
		jxc_kcb_kcsl=jxc_kcb_kcsl.trim();
		if (!(jxc_kcb_kcsl.equals("")))	wheresql+=" and (jxc_ckthd.kcsl="+jxc_kcb_kcsl+") ";
	}
	jxc_kcb_kcje=request.getParameter("jxc_kcb_kcje");
	if (jxc_kcb_kcje!=null)
	{
		jxc_kcb_kcje=jxc_kcb_kcje.trim();
		if (!(jxc_kcb_kcje.equals("")))	wheresql+=" and  (jxc_ckthd.kcje="+jxc_kcb_kcje+") ";
	}
	if (sfxstp!=null && sfxstp!="")
	{
	ls_sql="SELECT dqmc,'<a href=\"/jxczc/jxc_clck/ViewJxc_ckd.jsp?ckph='||jxc_ckd.ckph||'\" target=\"_back\">'||jxc_ckd.ckph||'</a>' ckph,DECODE(jxc_ckd.cklx,'D','��������','B','���ϳ���','T','�˻�����','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���','R','��������') cklx,jxc_ckthd.clbm clbm,jxc_ckthd.clmc clmc,DECODE(zljb,'1','<font color=green>����Ʒ</font>','2','<font color=blue>�д�Ʒ</font>','3','<font color=red>����Ʒ</font>'),jxc_ckthd.xh xh,jxc_ckthd.gg gg,jxc_ckthd.nbbm nbbm,'<img src=\"/jxc/jxc_clbm/clzp/'||jxc_ckthd.zp||'\" width=\"100px\" height=\"100px\">' zp,SUM(jxc_ckthd.cksl),jldwbm ";
	}
	else
	{
		ls_sql="SELECT dqmc,'<a href=\"/jxczc/jxc_clck/ViewJxc_ckd.jsp?ckph='||jxc_ckd.ckph||'\" target=\"_back\">'||jxc_ckd.ckph||'</a>' ckph,DECODE(jxc_ckd.cklx,'D','��������','B','���ϳ���','T','�˻�����','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���','R','��������') cklx,jxc_ckthd.clbm clbm,jxc_ckthd.clmc clmc,DECODE(zljb,'1','<font color=green>����Ʒ</font>','2','<font color=blue>�д�Ʒ</font>','3','<font color=red>����Ʒ</font>'),jxc_ckthd.xh xh,jxc_ckthd.gg gg,jxc_ckthd.nbbm nbbm,'' zp,SUM(jxc_ckthd.cksl),jldwbm ";
	}
	ls_sql+=" FROM jxc_ckthd,dm_dqbm,jxc_cljgb,jxc_ckd ";
    ls_sql+=" where jxc_ckthd.dqbm=dm_dqbm.dqbm and jxc_ckthd.dqbm=jxc_cljgb.dqbm and jxc_ckthd.clbm=jxc_cljgb.clbm ";
	 ls_sql+=" and jxc_ckd.ckph=jxc_ckthd.ckph and jxc_ckd.cklx in ('S','P','R') ";
    ls_sql+=wheresql;
	if (sfxstp!=null && sfxstp!="")
	{
	ls_sql+=" group by dqmc,'<a href=\"/jxczc/jxc_clck/ViewJxc_ckd.jsp?ckph='||jxc_ckd.ckph||'\" target=\"_back\">'||jxc_ckd.ckph||'</a>',DECODE(jxc_ckd.cklx,'D','��������','B','���ϳ���','T','�˻�����','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���','R','��������'),jxc_ckthd.clbm,jxc_ckthd.clmc,DECODE(zljb,'1','<font color=green>����Ʒ</font>','2','<font color=blue>�д�Ʒ</font>','3','<font color=red>����Ʒ</font>'),jxc_ckthd.xh,jxc_ckthd.gg,jxc_ckthd.nbbm,'<img src=\"/jxc/jxc_clbm/clzp/'||jxc_ckthd.zp||'\" width=\"100px\" height=\"100px\">',jldwbm";
	}
	else
	{ls_sql+=" group by dqmc,'<a href=\"/jxczc/jxc_clck/ViewJxc_ckd.jsp?ckph='||jxc_ckd.ckph||'\" target=\"_back\">'||jxc_ckd.ckph||'</a>',DECODE(jxc_ckd.cklx,'D','��������','B','���ϳ���','T','�˻�����','S','�깺����','P','���ͳ���','J','����ȯ����','X','���۳���','R','��������'),jxc_ckthd.clbm,jxc_ckthd.clmc,DECODE(zljb,'1','<font color=green>����Ʒ</font>','2','<font color=blue>�д�Ʒ</font>','3','<font color=red>����Ʒ</font>'),jxc_ckthd.xh,jxc_ckthd.gg,jxc_ckthd.nbbm,'',jldwbm ";}
//	ls_sql+=ordersql;
	ls_sql+=" order by dqmc,jxc_ckthd.clmc ";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_kcbT.jsp","SelectCxjxc_ckthd.jsp","","");
//	pageObj.setPageRow(Integer.parseInt(myxssl));
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"lsh","jxc_kcb_clmc","jxc_kcb_cllb","jxc_kcb_cldlbm","jxc_kcb_clxlbm","jxc_kcb_scsmc","jxc_kcb_ppmc","jxc_kcb_cllbbm","jxc_kcb_xh","jxc_kcb_gg","jxc_kcb_clysbm","jxc_kcb_jldwbm","jxc_kcb_hwbh","jxc_kcb_pjts","jxc_kcb_sfyh","jxc_kcb_cpjb","jxc_kcb_fgsx","jxc_kcb_cpsm","jxc_kcb_cd","jxc_kcb_zp","jxc_kcb_cgzq","jxc_kcb_bz","jxc_kcb_clbm","jxc_kcb_hjbh","jxc_kcb_ckbh","jxc_kcb_dqbm","jxc_kcb_rkj","jxc_kcb_kcsl","jxc_kcb_kcje"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
	//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("ckph","1");//�в����������Hash��
	spanColHash.put("cklx","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���ڵ���</td>
	<td  width="3%">��������</td>
	<td  width="3%">�����������</td>
	<td  width="2%">���ϱ���</td>
	<td  width="5%">��������</td>
	<td  width="5%">��������</td>
	<td  width="3%">�ͺ�</td>
	<td  width="3%">���</td>
	<td  width="3%">�ڲ�����</td>
	<td  width="1%">��Ƭ</td>
	<td  width="2%">���</td>
	<td  width="2%">��λ</td>	
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