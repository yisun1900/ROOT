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
		if (!(ls.equals("")))	wheresql+="  and (jxc_kcb.clbm in ("+ls+"))";
	}
	if (jxc_kcb_lsh!=null)
	{
		jxc_kcb_lsh=cf.GB2Uni(jxc_kcb_lsh);
		if (!(jxc_kcb_lsh.equals("")))	wheresql+=" and  (jxc_kcb.lsh='"+jxc_kcb_lsh+"')";
	}
	jxc_kcb_clmc=request.getParameter("jxc_kcb_clmc");
	jxc_kcb_clmc_mh=request.getParameter("jxc_kcb_clmc_mh");
	if (jxc_kcb_clmc!=null)
	{
		jxc_kcb_clmc=cf.GB2Uni(jxc_kcb_clmc);
		if (!(jxc_kcb_clmc.equals("")))	
		{
			if (jxc_kcb_clmc_mh!=null && jxc_kcb_clmc_mh!="")
				{wheresql+=" and  (jxc_kcb.clmc like '%"+jxc_kcb_clmc+"%')";}
			else
			{wheresql+=" and  (jxc_kcb.clmc='"+jxc_kcb_clmc+"')";}
		}
	}
	jxc_kcb_cllb=request.getParameter("jxc_kcb_cllb");
	if (jxc_kcb_cllb!=null)
	{
		jxc_kcb_cllb=cf.GB2Uni(jxc_kcb_cllb);
		if (!(jxc_kcb_cllb.equals("")))	wheresql+=" and  (jxc_kcb.cllb='"+jxc_kcb_cllb+"')";
	}
	jxc_kcb_cldlbm=request.getParameter("jxc_kcb_cldlbm");
	if (jxc_kcb_cldlbm!=null)
	{
		jxc_kcb_cldlbm=cf.GB2Uni(jxc_kcb_cldlbm);
		if (!(jxc_kcb_cldlbm.equals("")))	wheresql+=" and  (jxc_kcb.cldlbm='"+jxc_kcb_cldlbm+"')";
	}
	jxc_kcb_clxlbm=request.getParameter("jxc_kcb_clxlbm");
	if (jxc_kcb_clxlbm!=null)
	{
		jxc_kcb_clxlbm=cf.GB2Uni(jxc_kcb_clxlbm);
		if (!(jxc_kcb_clxlbm.equals("")))	wheresql+=" and  (jxc_kcb.clxlbm='"+jxc_kcb_clxlbm+"')";
	}
	jxc_kcb_scsmc=request.getParameter("jxc_kcb_scsmc");
	if (jxc_kcb_scsmc!=null)
	{
		jxc_kcb_scsmc=cf.GB2Uni(jxc_kcb_scsmc);
		if (!(jxc_kcb_scsmc.equals("")))	wheresql+=" and  (jxc_kcb.scsmc='"+jxc_kcb_scsmc+"')";
	}
	jxc_kcb_ppmc=request.getParameter("jxc_kcb_ppmc");
	if (jxc_kcb_ppmc!=null)
	{
		jxc_kcb_ppmc=cf.GB2Uni(jxc_kcb_ppmc);
		if (!(jxc_kcb_ppmc.equals("")))	wheresql+=" and  (jxc_kcb.ppmc='"+jxc_kcb_ppmc+"')";
	}
	jxc_kcb_cllbbm=request.getParameter("jxc_kcb_cllbbm");
	if (jxc_kcb_cllbbm!=null)
	{
		jxc_kcb_cllbbm=cf.GB2Uni(jxc_kcb_cllbbm);
		if (!(jxc_kcb_cllbbm.equals("")))	wheresql+=" and  (jxc_kcb.cllbbm='"+jxc_kcb_cllbbm+"')";
	}
	jxc_kcb_xh=request.getParameter("jxc_kcb_xh");
	jxc_kcb_xh_mh=request.getParameter("jxc_kcb_xh_mh");
	if (jxc_kcb_xh!=null)
	{
		jxc_kcb_xh=cf.GB2Uni(jxc_kcb_xh);
		if (!(jxc_kcb_xh.equals("")))	
		{
			if (jxc_kcb_xh_mh!=null && jxc_kcb_xh_mh!="") 
				{wheresql+=" and  (jxc_kcb.xh like '%"+jxc_kcb_xh+"%')";}
			else
				{wheresql+=" and  (jxc_kcb.xh='"+jxc_kcb_xh+"')";}
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
			{wheresql+=" and  (jxc_kcb.gg like '%"+jxc_kcb_gg+"%')";}
			else
			{wheresql+=" and  (jxc_kcb.gg='"+jxc_kcb_gg+"')";}
		}
	}
	jxc_kcb_clysbm=request.getParameter("jxc_kcb_clysbm");
	if (jxc_kcb_clysbm!=null)
	{
		jxc_kcb_clysbm=cf.GB2Uni(jxc_kcb_clysbm);
		if (!(jxc_kcb_clysbm.equals("")))	wheresql+=" and  (jxc_kcb.clysbm='"+jxc_kcb_clysbm+"')";
	}
	jxc_kcb_jldwbm=request.getParameter("jxc_kcb_jldwbm");
	if (jxc_kcb_jldwbm!=null)
	{
		jxc_kcb_jldwbm=cf.GB2Uni(jxc_kcb_jldwbm);
		if (!(jxc_kcb_jldwbm.equals("")))	wheresql+=" and  (jxc_kcb.jldwbm='"+jxc_kcb_jldwbm+"')";
	}
	jxc_kcb_hwbh=request.getParameter("jxc_kcb_hwbh");
	if (jxc_kcb_hwbh!=null)
	{
		jxc_kcb_hwbh=cf.GB2Uni(jxc_kcb_hwbh);
		if (!(jxc_kcb_hwbh.equals("")))	wheresql+=" and  (jxc_kcb.hwbh='"+jxc_kcb_hwbh+"')";
	}
	jxc_kcb_pjts=request.getParameter("jxc_kcb_pjts");
	if (jxc_kcb_pjts!=null)
	{
		jxc_kcb_pjts=jxc_kcb_pjts.trim();
		if (!(jxc_kcb_pjts.equals("")))	wheresql+=" and (jxc_kcb.pjts="+jxc_kcb_pjts+") ";
	}
	jxc_kcb_cpjb=request.getParameter("jxc_kcb_cpjb");
	if (jxc_kcb_cpjb!=null)
	{
		jxc_kcb_cpjb=cf.GB2Uni(jxc_kcb_cpjb);
		if (!(jxc_kcb_cpjb.equals("")))	wheresql+=" and  (jxc_kcb.cpjb='"+jxc_kcb_cpjb+"')";
	}
	jxc_kcb_fgsx=request.getParameter("jxc_kcb_fgsx");
	jxc_kcb_fgsx_mh=request.getParameter("jxc_kcb_fgsx_mh");
	if (jxc_kcb_fgsx!=null)
	{
		jxc_kcb_fgsx=cf.GB2Uni(jxc_kcb_fgsx);
		if (!(jxc_kcb_fgsx.equals("")))	
		{
			if (jxc_kcb_fgsx_mh!=null && jxc_kcb_fgsx_mh!="") 
			{wheresql+=" and  (jxc_kcb.fgsx like '%"+jxc_kcb_fgsx+"%')";}
			else
			{wheresql+=" and  (jxc_kcb.fgsx='"+jxc_kcb_fgsx+"')";}
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
			{wheresql+=" and  (jxc_kcb.cpsm like '%"+jxc_kcb_cpsm+"%')";}
				else
			{wheresql+=" and  (jxc_kcb.cpsm='"+jxc_kcb_cpsm+"')";}
		}
	}
	jxc_kcb_cd=request.getParameter("jxc_kcb_cd");
	if (jxc_kcb_cd!=null)
	{
		jxc_kcb_cd=cf.GB2Uni(jxc_kcb_cd);
		if (!(jxc_kcb_cd.equals("")))	wheresql+=" and  (jxc_kcb.cd='"+jxc_kcb_cd+"')";
	}
	jxc_kcb_zp=request.getParameter("jxc_kcb_zp");
	if (jxc_kcb_zp!=null)
	{
		jxc_kcb_zp=cf.GB2Uni(jxc_kcb_zp);
		if (!(jxc_kcb_zp.equals("")))	wheresql+=" and  (jxc_kcb.zp='"+jxc_kcb_zp+"')";
	}
	jxc_kcb_cgzq=request.getParameter("jxc_kcb_cgzq");
	if (jxc_kcb_cgzq!=null)
	{
		jxc_kcb_cgzq=jxc_kcb_cgzq.trim();
		if (!(jxc_kcb_cgzq.equals("")))	wheresql+=" and (jxc_kcb.cgzq="+jxc_kcb_cgzq+") ";
	}
	jxc_kcb_bz=request.getParameter("jxc_kcb_bz");
	if (jxc_kcb_bz!=null)
	{
		jxc_kcb_bz=cf.GB2Uni(jxc_kcb_bz);
		if (!(jxc_kcb_bz.equals("")))	wheresql+=" and  (jxc_kcb.bz='"+jxc_kcb_bz+"')";
	}
	jxc_kcb_clbm=request.getParameter("jxc_kcb_clbm");
	if (jxc_kcb_clbm!=null)
	{
		jxc_kcb_clbm=cf.GB2Uni(jxc_kcb_clbm);
		if (!(jxc_kcb_clbm.equals("")))	wheresql+=" and  (jxc_kcb.clbm='"+jxc_kcb_clbm+"')";
	}
	jxc_kcb_hjbh=request.getParameter("jxc_kcb_hjbh");
	if (jxc_kcb_hjbh!=null)
	{
		jxc_kcb_hjbh=cf.GB2Uni(jxc_kcb_hjbh);
		if (!(jxc_kcb_hjbh.equals("")))	wheresql+=" and  (jxc_kcb.hjbh='"+jxc_kcb_hjbh+"')";
	}
	jxc_kcb_ckbh=request.getParameter("jxc_kcb_ckbh");
	if (jxc_kcb_ckbh!=null)
	{
		jxc_kcb_ckbh=cf.GB2Uni(jxc_kcb_ckbh);
		if (!(jxc_kcb_ckbh.equals("")))	wheresql+=" and  (jxc_kcb.ckbh='"+jxc_kcb_ckbh+"')";
	}
	jxc_kcb_dqbm=request.getParameter("jxc_kcb_dqbm");
	if (jxc_kcb_dqbm!=null)
	{
		jxc_kcb_dqbm=cf.GB2Uni(jxc_kcb_dqbm);
		if (!(jxc_kcb_dqbm.equals("")))	wheresql+=" and  (jxc_kcb.dqbm='"+jxc_kcb_dqbm+"')";
	}
	jxc_kcb_cbj=request.getParameter("jxc_kcb_cbj");
	if (jxc_kcb_cbj!=null)
	{
		jxc_kcb_cbj=jxc_kcb_cbj.trim();
		if (!(jxc_kcb_cbj.equals("")))	wheresql+=" and  (jxc_kcb.rkj="+jxc_kcb_cbj+") ";
	}
	jxc_kcb_kcsl=request.getParameter("jxc_kcb_kcsl");
	if (jxc_kcb_kcsl!=null)
	{
		jxc_kcb_kcsl=jxc_kcb_kcsl.trim();
		if (!(jxc_kcb_kcsl.equals("")))	wheresql+=" and (jxc_cljgb.zcpzsl="+jxc_kcb_kcsl+") ";
	}
	jxc_kcb_kcje=request.getParameter("jxc_kcb_kcje");
	if (jxc_kcb_kcje!=null)
	{
		jxc_kcb_kcje=jxc_kcb_kcje.trim();
		if (!(jxc_kcb_kcje.equals("")))	wheresql+=" and  (jxc_kcb.kcje="+jxc_kcb_kcje+") ";
	}

	if (sfxstp!=null && sfxstp!="")
	{
		ls_sql="SELECT jxc_kcb.lsh,DECODE(jxc_kcb.ztbz,'Y','��;','N','��'),jxc_kcb.clbm,jxc_kcb.nbbm,jxc_kcb.clmc,jxc_kcb.xh,jxc_kcb.kcsl,TO_CHAR(jxc_cljgb.xsj),jxc_kcb.kcsl*jxc_cljgb.xsj,TO_CHAR(jxc_cljgb.lsj),dqmc,ckmc,hjmc,hwmc,DECODE(jxc_kcb.cllb,'0','����','1','����'),jxc_kcb.cldlbm,jxc_kcb.clxlbm,jxc_kcb.scsmc,jxc_kcb.ppmc,jxc_kcb.gysmc,jxc_kcb.cllbbm,jxc_kcb.gg,jxc_kcb.clysbm,jxc_kcb.jldwbm,jxc_kcb.pjts,jxc_kcb.cpjb,jxc_kcb.fgsx,jxc_kcb.cpsm,jxc_kcb.cd,jxc_kcb.cgzq,jxc_kcb.bz,'<img src=\"/jxc/jxc_clbm/clzp/'||jxc_kcb.zp||'\" width=\"100px\" height=\"100px\">' zp  ";
	}
	else
	{
		ls_sql="SELECT jxc_kcb.lsh,DECODE(jxc_kcb.ztbz,'Y','��;','N','��'),jxc_kcb.clbm,jxc_kcb.nbbm,jxc_kcb.clmc,jxc_kcb.xh,jxc_kcb.kcsl,TO_CHAR(jxc_cljgb.xsj),jxc_kcb.kcsl*jxc_cljgb.xsj,TO_CHAR(jxc_cljgb.lsj),dqmc,ckmc,hjmc,hwmc,DECODE(jxc_kcb.cllb,'0','����','1','����'),jxc_kcb.cldlbm,jxc_kcb.clxlbm,jxc_kcb.scsmc,jxc_kcb.ppmc,jxc_kcb.gysmc,jxc_kcb.cllbbm,jxc_kcb.gg,jxc_kcb.clysbm,jxc_kcb.jldwbm,jxc_kcb.pjts,jxc_kcb.cpjb,jxc_kcb.fgsx,jxc_kcb.cpsm,jxc_kcb.cd,jxc_kcb.cgzq,jxc_kcb.bz,'' zp  ";
	}
	ls_sql+=" FROM jxc_kcb,dm_dqbm,jxc_ckmc,jxc_hjmc,jxc_hwmc,jxc_cljgb  ";
    ls_sql+=" where jxc_kcb.dqbm=dm_dqbm.dqbm and jxc_kcb.ckbh=jxc_ckmc.ckbh(+) and jxc_kcb.hjbh=jxc_hjmc.hjbh(+) and jxc_kcb.hwbh=jxc_hwmc.hwbh(+) ";
    ls_sql+=" and jxc_kcb.clbm=jxc_cljgb.clbm(+) and jxc_kcb.dqbm=jxc_cljgb.dqbm(+)";
    ls_sql+=wheresql;
	ls_sql+=ordersql;
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_kcbCxList.jsp","SelectCxJxc_kcb.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"lsh","jxc_kcb_clmc","jxc_kcb_cllb","jxc_kcb_cldlbm","jxc_kcb_clxlbm","jxc_kcb_scsmc","jxc_kcb_ppmc","jxc_kcb_cllbbm","jxc_kcb_xh","jxc_kcb_gg","jxc_kcb_clysbm","jxc_kcb_jldwbm","jxc_kcb_hwbh","jxc_kcb_pjts","jxc_kcb_sfyh","jxc_kcb_cpjb","jxc_kcb_fgsx","jxc_kcb_cpsm","jxc_kcb_cd","jxc_kcb_zp","jxc_kcb_cgzq","jxc_kcb_bz","jxc_kcb_clbm","jxc_kcb_hjbh","jxc_kcb_ckbh","jxc_kcb_dqbm","jxc_kcb_rkj","jxc_kcb_kcsl","jxc_kcb_kcje"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"lsh"};
	pageObj.setKey(keyName);
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
	pageObj.printPageLink(450);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">��ˮ��</td>
	<td  width="1%">��;��־</td>
	<td  width="3%">���ϱ���</td>
	<td  width="3%">�ڲ�����</td>
	<td  width="5%">��������</td>
	<td  width="4%">�ͺ�</td>
	<td  width="2%">�������</td>
	<td  width="2%">���ۼ�</td>
	<td  width="3%">���ۼ۽��</td>
	<td  width="2%">�г����</td>
	<td  width="2%">���ڵ���</td>
	<td  width="3%">���ڲֿ�</td>
	<td  width="3%">���ڻ���</td>
	<td  width="3%">���ڻ�λ</td>
	<td  width="2%">�������</td>
	<td  width="5%">���ϴ���</td>
	<td  width="5%">����С��</td>
	<td  width="3%">Ʒ��</td>
	<td  width="5%">��Ʒ��</td>
	<td  width="6%">������λ</td>
	<td  width="4%">���ϵ��</td>
	<td  width="4%">���</td>
	<td  width="3%">��ɫ</td>
	<td  width="2%">������λ</td>
	<td  width="1%">�������</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="3%">�������</td>
	<td  width="3%">��Ʒ˵��</td>
	<td  width="3%">����</td>
	<td  width="2%">�ɹ�����</td>
	<td  width="5%">��ע</td>
	<td  width="3%">��Ƭ</td>
	
	
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