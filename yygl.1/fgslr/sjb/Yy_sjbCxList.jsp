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
	String yy_sjb_zqs=null;
	String yy_sjb_yy_sjb_ygmc=null;
	String yy_sjb_ssbm=null;
	String yy_sjb_ssfgs=null;
	String yy_sjb_yy_sjbdj_sydjcb=null;
	String yy_sjb_yy_sjbdj_byjh=null;
	String yy_sjb_yy_sjbdj_bylj=null;
	String yy_sjb_yy_sjbdj_szjh=null;
	String yy_sjb_yy_sjbdj_szwc=null;
	String yy_sjb_yy_sjbdj_bzyj=null;
	String yy_sjb_yy_sjbdj_bztdj=null;
	String yy_sjb_yy_sjbdj_byljtdj=null;
	String yy_sjb_yy_sjbsjf_byjh=null;
	String yy_sjb_yy_sjbsjf_bylj=null;
	String yy_sjb_yy_sjbsjf_szjh=null;
	String yy_sjb_yy_sjbsjf_szwc=null;
	String yy_sjb_yy_sjbsjf_bzyj=null;
	String yy_sjb_yy_sjbgccz_byjh=null;
	String yy_sjb_yy_sjbgccz_bylj=null;
	String yy_sjb_yy_sjbgccz_szjh=null;
	String yy_sjb_yy_sjbgccz_szwc=null;
	String yy_sjb_yy_sjbgccz_bzyj=null;
	String yy_sjb_yy_sjbzccz_byjh=null;
	String yy_sjb_yy_sjbzccz_bylj=null;
	String yy_sjb_yy_sjbzccz_szjh=null;
	String yy_sjb_yy_sjbzccz_szwc=null;
	String yy_sjb_yy_sjbzccz_bzyj=null;
	String yy_sjb_yy_sjb_lrr=null;
	String yy_sjb_yy_sjb_lrsj=null;
	yy_sjb_zqs=request.getParameter("yy_sjb_zqs");
	if (yy_sjb_zqs!=null)
	{
		yy_sjb_zqs=yy_sjb_zqs.trim();
		if (!(yy_sjb_zqs.equals("")))	wheresql+=" and (yy_sjb.zqs="+yy_sjb_zqs+") ";
	}
	yy_sjb_yy_sjb_ygmc=request.getParameter("yy_sjb_yy_sjb_ygmc");
	if (yy_sjb_yy_sjb_ygmc!=null)
	{
		yy_sjb_yy_sjb_ygmc=cf.GB2Uni(yy_sjb_yy_sjb_ygmc);
		if (!(yy_sjb_yy_sjb_ygmc.equals("")))	wheresql+=" and  (yy_sjb.yy_sjb_ygmc='"+yy_sjb_yy_sjb_ygmc+"')";
	}
	yy_sjb_ssbm=request.getParameter("yy_sjb_ssbm");
	if (yy_sjb_ssbm!=null)
	{
		yy_sjb_ssbm=cf.GB2Uni(yy_sjb_ssbm);
		if (!(yy_sjb_ssbm.equals("")))	wheresql+=" and  (yy_sjb.ssbm='"+yy_sjb_ssbm+"')";
	}
	yy_sjb_ssfgs=request.getParameter("yy_sjb_ssfgs");
	if (yy_sjb_ssfgs!=null)
	{
		yy_sjb_ssfgs=cf.GB2Uni(yy_sjb_ssfgs);
		if (!(yy_sjb_ssfgs.equals("")))	wheresql+=" and  (yy_sjb.ssfgs='"+yy_sjb_ssfgs+"')";
	}
	yy_sjb_yy_sjbdj_sydjcb=request.getParameter("yy_sjb_yy_sjbdj_sydjcb");
	if (yy_sjb_yy_sjbdj_sydjcb!=null)
	{
		yy_sjb_yy_sjbdj_sydjcb=yy_sjb_yy_sjbdj_sydjcb.trim();
		if (!(yy_sjb_yy_sjbdj_sydjcb.equals("")))	wheresql+=" and (yy_sjb.yy_sjbdj_sydjcb="+yy_sjb_yy_sjbdj_sydjcb+") ";
	}
	yy_sjb_yy_sjbdj_byjh=request.getParameter("yy_sjb_yy_sjbdj_byjh");
	if (yy_sjb_yy_sjbdj_byjh!=null)
	{
		yy_sjb_yy_sjbdj_byjh=yy_sjb_yy_sjbdj_byjh.trim();
		if (!(yy_sjb_yy_sjbdj_byjh.equals("")))	wheresql+=" and (yy_sjb.yy_sjbdj_byjh="+yy_sjb_yy_sjbdj_byjh+") ";
	}
	yy_sjb_yy_sjbdj_bylj=request.getParameter("yy_sjb_yy_sjbdj_bylj");
	if (yy_sjb_yy_sjbdj_bylj!=null)
	{
		yy_sjb_yy_sjbdj_bylj=yy_sjb_yy_sjbdj_bylj.trim();
		if (!(yy_sjb_yy_sjbdj_bylj.equals("")))	wheresql+=" and (yy_sjb.yy_sjbdj_bylj="+yy_sjb_yy_sjbdj_bylj+") ";
	}
	yy_sjb_yy_sjbdj_szjh=request.getParameter("yy_sjb_yy_sjbdj_szjh");
	if (yy_sjb_yy_sjbdj_szjh!=null)
	{
		yy_sjb_yy_sjbdj_szjh=yy_sjb_yy_sjbdj_szjh.trim();
		if (!(yy_sjb_yy_sjbdj_szjh.equals("")))	wheresql+=" and (yy_sjb.yy_sjbdj_szjh="+yy_sjb_yy_sjbdj_szjh+") ";
	}
	yy_sjb_yy_sjbdj_szwc=request.getParameter("yy_sjb_yy_sjbdj_szwc");
	if (yy_sjb_yy_sjbdj_szwc!=null)
	{
		yy_sjb_yy_sjbdj_szwc=yy_sjb_yy_sjbdj_szwc.trim();
		if (!(yy_sjb_yy_sjbdj_szwc.equals("")))	wheresql+=" and (yy_sjb.yy_sjbdj_szwc="+yy_sjb_yy_sjbdj_szwc+") ";
	}
	yy_sjb_yy_sjbdj_bzyj=request.getParameter("yy_sjb_yy_sjbdj_bzyj");
	if (yy_sjb_yy_sjbdj_bzyj!=null)
	{
		yy_sjb_yy_sjbdj_bzyj=yy_sjb_yy_sjbdj_bzyj.trim();
		if (!(yy_sjb_yy_sjbdj_bzyj.equals("")))	wheresql+=" and (yy_sjb.yy_sjbdj_bzyj="+yy_sjb_yy_sjbdj_bzyj+") ";
	}
	yy_sjb_yy_sjbdj_bztdj=request.getParameter("yy_sjb_yy_sjbdj_bztdj");
	if (yy_sjb_yy_sjbdj_bztdj!=null)
	{
		yy_sjb_yy_sjbdj_bztdj=yy_sjb_yy_sjbdj_bztdj.trim();
		if (!(yy_sjb_yy_sjbdj_bztdj.equals("")))	wheresql+=" and (yy_sjb.yy_sjbdj_bztdj="+yy_sjb_yy_sjbdj_bztdj+") ";
	}
	yy_sjb_yy_sjbdj_byljtdj=request.getParameter("yy_sjb_yy_sjbdj_byljtdj");
	if (yy_sjb_yy_sjbdj_byljtdj!=null)
	{
		yy_sjb_yy_sjbdj_byljtdj=yy_sjb_yy_sjbdj_byljtdj.trim();
		if (!(yy_sjb_yy_sjbdj_byljtdj.equals("")))	wheresql+=" and (yy_sjb.yy_sjbdj_byljtdj="+yy_sjb_yy_sjbdj_byljtdj+") ";
	}
	yy_sjb_yy_sjbsjf_byjh=request.getParameter("yy_sjb_yy_sjbsjf_byjh");
	if (yy_sjb_yy_sjbsjf_byjh!=null)
	{
		yy_sjb_yy_sjbsjf_byjh=yy_sjb_yy_sjbsjf_byjh.trim();
		if (!(yy_sjb_yy_sjbsjf_byjh.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbsjf_byjh="+yy_sjb_yy_sjbsjf_byjh+") ";
	}
	yy_sjb_yy_sjbsjf_bylj=request.getParameter("yy_sjb_yy_sjbsjf_bylj");
	if (yy_sjb_yy_sjbsjf_bylj!=null)
	{
		yy_sjb_yy_sjbsjf_bylj=yy_sjb_yy_sjbsjf_bylj.trim();
		if (!(yy_sjb_yy_sjbsjf_bylj.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbsjf_bylj="+yy_sjb_yy_sjbsjf_bylj+") ";
	}
	yy_sjb_yy_sjbsjf_szjh=request.getParameter("yy_sjb_yy_sjbsjf_szjh");
	if (yy_sjb_yy_sjbsjf_szjh!=null)
	{
		yy_sjb_yy_sjbsjf_szjh=yy_sjb_yy_sjbsjf_szjh.trim();
		if (!(yy_sjb_yy_sjbsjf_szjh.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbsjf_szjh="+yy_sjb_yy_sjbsjf_szjh+") ";
	}
	yy_sjb_yy_sjbsjf_szwc=request.getParameter("yy_sjb_yy_sjbsjf_szwc");
	if (yy_sjb_yy_sjbsjf_szwc!=null)
	{
		yy_sjb_yy_sjbsjf_szwc=yy_sjb_yy_sjbsjf_szwc.trim();
		if (!(yy_sjb_yy_sjbsjf_szwc.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbsjf_szwc="+yy_sjb_yy_sjbsjf_szwc+") ";
	}
	yy_sjb_yy_sjbsjf_bzyj=request.getParameter("yy_sjb_yy_sjbsjf_bzyj");
	if (yy_sjb_yy_sjbsjf_bzyj!=null)
	{
		yy_sjb_yy_sjbsjf_bzyj=yy_sjb_yy_sjbsjf_bzyj.trim();
		if (!(yy_sjb_yy_sjbsjf_bzyj.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbsjf_bzyj="+yy_sjb_yy_sjbsjf_bzyj+") ";
	}
	yy_sjb_yy_sjbgccz_byjh=request.getParameter("yy_sjb_yy_sjbgccz_byjh");
	if (yy_sjb_yy_sjbgccz_byjh!=null)
	{
		yy_sjb_yy_sjbgccz_byjh=yy_sjb_yy_sjbgccz_byjh.trim();
		if (!(yy_sjb_yy_sjbgccz_byjh.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbgccz_byjh="+yy_sjb_yy_sjbgccz_byjh+") ";
	}
	yy_sjb_yy_sjbgccz_bylj=request.getParameter("yy_sjb_yy_sjbgccz_bylj");
	if (yy_sjb_yy_sjbgccz_bylj!=null)
	{
		yy_sjb_yy_sjbgccz_bylj=yy_sjb_yy_sjbgccz_bylj.trim();
		if (!(yy_sjb_yy_sjbgccz_bylj.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbgccz_bylj="+yy_sjb_yy_sjbgccz_bylj+") ";
	}
	yy_sjb_yy_sjbgccz_szjh=request.getParameter("yy_sjb_yy_sjbgccz_szjh");
	if (yy_sjb_yy_sjbgccz_szjh!=null)
	{
		yy_sjb_yy_sjbgccz_szjh=yy_sjb_yy_sjbgccz_szjh.trim();
		if (!(yy_sjb_yy_sjbgccz_szjh.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbgccz_szjh="+yy_sjb_yy_sjbgccz_szjh+") ";
	}
	yy_sjb_yy_sjbgccz_szwc=request.getParameter("yy_sjb_yy_sjbgccz_szwc");
	if (yy_sjb_yy_sjbgccz_szwc!=null)
	{
		yy_sjb_yy_sjbgccz_szwc=yy_sjb_yy_sjbgccz_szwc.trim();
		if (!(yy_sjb_yy_sjbgccz_szwc.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbgccz_szwc="+yy_sjb_yy_sjbgccz_szwc+") ";
	}
	yy_sjb_yy_sjbgccz_bzyj=request.getParameter("yy_sjb_yy_sjbgccz_bzyj");
	if (yy_sjb_yy_sjbgccz_bzyj!=null)
	{
		yy_sjb_yy_sjbgccz_bzyj=yy_sjb_yy_sjbgccz_bzyj.trim();
		if (!(yy_sjb_yy_sjbgccz_bzyj.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbgccz_bzyj="+yy_sjb_yy_sjbgccz_bzyj+") ";
	}
	yy_sjb_yy_sjbzccz_byjh=request.getParameter("yy_sjb_yy_sjbzccz_byjh");
	if (yy_sjb_yy_sjbzccz_byjh!=null)
	{
		yy_sjb_yy_sjbzccz_byjh=yy_sjb_yy_sjbzccz_byjh.trim();
		if (!(yy_sjb_yy_sjbzccz_byjh.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbzccz_byjh="+yy_sjb_yy_sjbzccz_byjh+") ";
	}
	yy_sjb_yy_sjbzccz_bylj=request.getParameter("yy_sjb_yy_sjbzccz_bylj");
	if (yy_sjb_yy_sjbzccz_bylj!=null)
	{
		yy_sjb_yy_sjbzccz_bylj=yy_sjb_yy_sjbzccz_bylj.trim();
		if (!(yy_sjb_yy_sjbzccz_bylj.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbzccz_bylj="+yy_sjb_yy_sjbzccz_bylj+") ";
	}
	yy_sjb_yy_sjbzccz_szjh=request.getParameter("yy_sjb_yy_sjbzccz_szjh");
	if (yy_sjb_yy_sjbzccz_szjh!=null)
	{
		yy_sjb_yy_sjbzccz_szjh=yy_sjb_yy_sjbzccz_szjh.trim();
		if (!(yy_sjb_yy_sjbzccz_szjh.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbzccz_szjh="+yy_sjb_yy_sjbzccz_szjh+") ";
	}
	yy_sjb_yy_sjbzccz_szwc=request.getParameter("yy_sjb_yy_sjbzccz_szwc");
	if (yy_sjb_yy_sjbzccz_szwc!=null)
	{
		yy_sjb_yy_sjbzccz_szwc=yy_sjb_yy_sjbzccz_szwc.trim();
		if (!(yy_sjb_yy_sjbzccz_szwc.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbzccz_szwc="+yy_sjb_yy_sjbzccz_szwc+") ";
	}
	yy_sjb_yy_sjbzccz_bzyj=request.getParameter("yy_sjb_yy_sjbzccz_bzyj");
	if (yy_sjb_yy_sjbzccz_bzyj!=null)
	{
		yy_sjb_yy_sjbzccz_bzyj=yy_sjb_yy_sjbzccz_bzyj.trim();
		if (!(yy_sjb_yy_sjbzccz_bzyj.equals("")))	wheresql+=" and  (yy_sjb.yy_sjbzccz_bzyj="+yy_sjb_yy_sjbzccz_bzyj+") ";
	}
	yy_sjb_yy_sjb_lrr=request.getParameter("yy_sjb_yy_sjb_lrr");
	if (yy_sjb_yy_sjb_lrr!=null)
	{
		yy_sjb_yy_sjb_lrr=cf.GB2Uni(yy_sjb_yy_sjb_lrr);
		if (!(yy_sjb_yy_sjb_lrr.equals("")))	wheresql+=" and  (yy_sjb.yy_sjb_lrr='"+yy_sjb_yy_sjb_lrr+"')";
	}
	yy_sjb_yy_sjb_lrsj=request.getParameter("yy_sjb_yy_sjb_lrsj");
	if (yy_sjb_yy_sjb_lrsj!=null)
	{
		yy_sjb_yy_sjb_lrsj=yy_sjb_yy_sjb_lrsj.trim();
		if (!(yy_sjb_yy_sjb_lrsj.equals("")))	wheresql+="  and (yy_sjb.yy_sjb_lrsj>=TO_DATE('"+yy_sjb_yy_sjb_lrsj+"','YYYY/MM/DD'))";
	}
	yy_sjb_yy_sjb_lrsj=request.getParameter("yy_sjb_yy_sjb_lrsj2");
	if (yy_sjb_yy_sjb_lrsj!=null)
	{
		yy_sjb_yy_sjb_lrsj=yy_sjb_yy_sjb_lrsj.trim();
		if (!(yy_sjb_yy_sjb_lrsj.equals("")))	wheresql+="  and (yy_sjb.yy_sjb_lrsj<=TO_DATE('"+yy_sjb_yy_sjb_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=null;
	myxssl=request.getParameter("myxssl");
	
	ls_sql="SELECT yy_sjb.zqs,yy_sjb.yy_sjb_ygmc,a.dwmc ssbm,b.dwmc ssfgs,yy_sjb.yy_sjbdj_sydjcb,yy_sjb.yy_sjbdj_byjh,yy_sjb.yy_sjbdj_bylj,yy_sjb.yy_sjbdj_szjh,yy_sjb.yy_sjbdj_szwc,yy_sjb.yy_sjbdj_bzyj,yy_sjb.yy_sjbdj_bztdj,yy_sjb.yy_sjbdj_byljtdj,yy_sjb.yy_sjbsjf_byjh,yy_sjb.yy_sjbsjf_bylj,yy_sjb.yy_sjbsjf_szjh,yy_sjb.yy_sjbsjf_szwc,yy_sjb.yy_sjbsjf_bzyj,yy_sjb.yy_sjbgccz_byjh,yy_sjb.yy_sjbgccz_bylj,yy_sjb.yy_sjbgccz_szjh,yy_sjb.yy_sjbgccz_szwc,yy_sjb.yy_sjbgccz_bzyj,yy_sjb.yy_sjbzccz_byjh,yy_sjb.yy_sjbzccz_bylj,yy_sjb.yy_sjbzccz_szjh,yy_sjb.yy_sjbzccz_szwc,yy_sjb.yy_sjbzccz_bzyj,yy_sjb.yy_sjb_lrr,yy_sjb.yy_sjb_lrsj  ";
	ls_sql+=" FROM yy_sjb,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where yy_sjb.ssbm=a.dwbh(+)";
    ls_sql+=" and yy_sjb.ssfgs=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_sjb.zqs,yy_sjb.ssbm,yy_sjb.yy_sjb_ygmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yy_sjbCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"zqs","yy_sjb_ygmc","sq_dwxx_dwmc","yy_sjb_ssfgs","yy_sjb_yy_sjbdj_sydjcb","yy_sjb_yy_sjbdj_byjh","yy_sjb_yy_sjbdj_bylj","yy_sjb_yy_sjbdj_szjh","yy_sjb_yy_sjbdj_szwc","yy_sjb_yy_sjbdj_bzyj","yy_sjb_yy_sjbdj_bztdj","yy_sjb_yy_sjbdj_byljtdj","yy_sjb_yy_sjbsjf_byjh","yy_sjb_yy_sjbsjf_bylj","yy_sjb_yy_sjbsjf_szjh","yy_sjb_yy_sjbsjf_szwc","yy_sjb_yy_sjbsjf_bzyj","yy_sjb_yy_sjbgccz_byjh","yy_sjb_yy_sjbgccz_bylj","yy_sjb_yy_sjbgccz_szjh","yy_sjb_yy_sjbgccz_szwc","yy_sjb_yy_sjbgccz_bzyj","yy_sjb_yy_sjbzccz_byjh","yy_sjb_yy_sjbzccz_bylj","yy_sjb_yy_sjbzccz_szjh","yy_sjb_yy_sjbzccz_szwc","yy_sjb_yy_sjbzccz_bzyj","yy_sjb_yy_sjb_lrr","yy_sjb_yy_sjb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zqs","yy_sjb_ygmc"};
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
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">������</td>
	<td  width="3%">��Ʋ�Ա������</td>
	<td  width="5%">��������</td>
	<td  width="4%">�����ֹ�˾</td>
	<td  width="3%">����(�Ǳ���)����</td>
	<td  width="3%">���¼ƻ���ȡ����</td>
	<td  width="3%">�����ۼ���ȡ����</td>
	<td  width="3%">���ܼƻ���ȡ����</td>
	<td  width="3%">���������ȡ����</td>
	<td  width="3%">����Ԥ����ȡ����</td>
	<td  width="3%">�����˶���</td>
	<td  width="3%">�����ۼ��˶���</td>
	<td  width="3%">��Ʒѱ��¼ƻ�</td>
	<td  width="3%">��Ʒѱ����ۼ�</td>
	<td  width="3%">��Ʒ����ܼƻ�</td>
	<td  width="3%">��Ʒ��������</td>
	<td  width="3%">��Ʒѱ���Ԥ��</td>
	<td  width="4%">���̲�ֵ���¼ƻ�</td>
	<td  width="4%">���̲�ֵ�����ۼ�</td>
	<td  width="4%">���̲�ֵ���ܼƻ�</td>
	<td  width="4%">���̲�ֵ�������</td>
	<td  width="4%">���̲�ֵ����Ԥ��</td>
	<td  width="4%">���Ĳ�ֵ���¼ƻ�</td>
	<td  width="4%">���Ĳ�ֵ�����ۼ�</td>
	<td  width="4%">���Ĳ�ֵ���ܼƻ�</td>
	<td  width="4%">���Ĳ�ֵ�������</td>
	<td  width="4%">���Ĳ�ֵ����Ԥ��</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
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