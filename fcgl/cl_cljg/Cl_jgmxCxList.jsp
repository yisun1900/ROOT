<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
%>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cl_jgmx_dwbh=null;
	String cl_jgmx_clbm=null;
	String cl_jgmx_cj=null;
	String cl_jgmx_cjjsj=null;
	String cl_jgmx_fgsdj=null;
	String cl_jgmx_gdj=null;
	String cl_jgmx_ckmc=null;
	String cl_jgmx_sfrk=null;
	String cl_clbm_clmc=null;
	String cl_clbm_clgg=null;
	String cl_clbm_jldwmc=null;
	String cl_clbm_qybfb=null;
	String cl_clbm_lrjsfs=null;
	String cl_clbm_lrbfb=null;
	String cl_clbm_cldlmc=null;

	String xjgsfgx=null;
	xjgsfgx=request.getParameter("xjgsfgx");
	if (xjgsfgx!=null)
	{
		xjgsfgx=cf.GB2Uni(xjgsfgx);
		if (!(xjgsfgx.equals("")))	wheresql+=" and  (cl_jgmx.xjgsfgx='"+xjgsfgx+"')";
	}
	String sfycx=null;
	sfycx=request.getParameter("sfycx");
	if (sfycx!=null)
	{
		sfycx=cf.GB2Uni(sfycx);
		if (!(sfycx.equals("")))	wheresql+=" and  (cl_jgmx.sfycx='"+sfycx+"')";
	}

	String wxr=null;
	wxr=request.getParameter("wxr");
	if (wxr!=null)
	{
		wxr=cf.GB2Uni(wxr);
		if (!(wxr.equals("")))	wheresql+=" and  (cl_clbm.wxr='"+wxr+"')";
	}
	
	cl_jgmx_dwbh=request.getParameter("cl_jgmx_dwbh");
	if (cl_jgmx_dwbh!=null)
	{
		cl_jgmx_dwbh=cf.GB2Uni(cl_jgmx_dwbh);
		if (!(cl_jgmx_dwbh.equals("")))	wheresql+=" and  (cl_jgmx.dwbh='"+cl_jgmx_dwbh+"')";
	}
	cl_jgmx_clbm=request.getParameter("cl_jgmx_clbm");
	if (cl_jgmx_clbm!=null)
	{
		cl_jgmx_clbm=cf.GB2Uni(cl_jgmx_clbm);
		if (!(cl_jgmx_clbm.equals("")))	wheresql+=" and  (cl_jgmx.clbm='"+cl_jgmx_clbm+"')";
	}
	cl_jgmx_cj=request.getParameter("cl_jgmx_cj");
	if (cl_jgmx_cj!=null)
	{
		cl_jgmx_cj=cl_jgmx_cj.trim();
		if (!(cl_jgmx_cj.equals("")))	wheresql+=" and  (cl_jgmx.cj="+cl_jgmx_cj+") ";
	}
	cl_jgmx_cjjsj=request.getParameter("cl_jgmx_cjjsj");
	if (cl_jgmx_cjjsj!=null)
	{
		cl_jgmx_cjjsj=cl_jgmx_cjjsj.trim();
		if (!(cl_jgmx_cjjsj.equals("")))	wheresql+=" and  (cl_jgmx.cjjsj="+cl_jgmx_cjjsj+") ";
	}
	cl_jgmx_fgsdj=request.getParameter("cl_jgmx_fgsdj");
	if (cl_jgmx_fgsdj!=null)
	{
		cl_jgmx_fgsdj=cl_jgmx_fgsdj.trim();
		if (!(cl_jgmx_fgsdj.equals("")))	wheresql+=" and  (cl_jgmx.fgsdj="+cl_jgmx_fgsdj+") ";
	}
	cl_jgmx_gdj=request.getParameter("cl_jgmx_gdj");
	if (cl_jgmx_gdj!=null)
	{
		cl_jgmx_gdj=cl_jgmx_gdj.trim();
		if (!(cl_jgmx_gdj.equals("")))	wheresql+=" and  (cl_jgmx.gdj="+cl_jgmx_gdj+") ";
	}
	cl_jgmx_ckmc=request.getParameter("cl_jgmx_ckmc");
	if (cl_jgmx_ckmc!=null)
	{
		cl_jgmx_ckmc=cf.GB2Uni(cl_jgmx_ckmc);
		if (!(cl_jgmx_ckmc.equals("")))	wheresql+=" and  (cl_jgmx.ckmc='"+cl_jgmx_ckmc+"')";
	}
	cl_jgmx_sfrk=request.getParameter("cl_jgmx_sfrk");
	if (cl_jgmx_sfrk!=null)
	{
		cl_jgmx_sfrk=cf.GB2Uni(cl_jgmx_sfrk);
		if (!(cl_jgmx_sfrk.equals("")))	wheresql+=" and  (cl_jgmx.sfrk='"+cl_jgmx_sfrk+"')";
	}
	cl_clbm_clmc=request.getParameter("cl_clbm_clmc");
	if (cl_clbm_clmc!=null)
	{
		cl_clbm_clmc=cf.GB2Uni(cl_clbm_clmc);
		if (!(cl_clbm_clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc='"+cl_clbm_clmc+"')";
	}
	cl_clbm_clgg=request.getParameter("cl_clbm_clgg");
	if (cl_clbm_clgg!=null)
	{
		cl_clbm_clgg=cf.GB2Uni(cl_clbm_clgg);
		if (!(cl_clbm_clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg='"+cl_clbm_clgg+"')";
	}
	cl_clbm_jldwmc=request.getParameter("cl_clbm_jldwmc");
	if (cl_clbm_jldwmc!=null)
	{
		cl_clbm_jldwmc=cf.GB2Uni(cl_clbm_jldwmc);
		if (!(cl_clbm_jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+cl_clbm_jldwmc+"')";
	}
	cl_clbm_qybfb=request.getParameter("cl_clbm_qybfb");
	if (cl_clbm_qybfb!=null)
	{
		cl_clbm_qybfb=cl_clbm_qybfb.trim();
		if (!(cl_clbm_qybfb.equals("")))	wheresql+=" and  (cl_clbm.qybfb="+cl_clbm_qybfb+") ";
	}
	cl_clbm_lrjsfs=request.getParameter("cl_clbm_lrjsfs");
	if (cl_clbm_lrjsfs!=null)
	{
		cl_clbm_lrjsfs=cf.GB2Uni(cl_clbm_lrjsfs);
		if (!(cl_clbm_lrjsfs.equals("")))	wheresql+=" and  (cl_clbm.lrjsfs='"+cl_clbm_lrjsfs+"')";
	}
	cl_clbm_lrbfb=request.getParameter("cl_clbm_lrbfb");
	if (cl_clbm_lrbfb!=null)
	{
		cl_clbm_lrbfb=cl_clbm_lrbfb.trim();
		if (!(cl_clbm_lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb="+cl_clbm_lrbfb+") ";
	}
	cl_clbm_cldlmc=request.getParameter("cl_clbm_cldlmc");
	if (cl_clbm_cldlmc!=null)
	{
		cl_clbm_cldlmc=cf.GB2Uni(cl_clbm_cldlmc);
		if (!(cl_clbm_cldlmc.equals("")))	wheresql+=" and  (cl_clbm.cldlmc='"+cl_clbm_cldlmc+"')";
	}

	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		ls_sql="SELECT cl_jgmx.dwbh as dwbh,sq_dwxx.dwmc as sq_dwxx_dwmc,cl_jgmx.clbm as clbm,cl_jgmx.cj as cl_jgmx_cj,cl_jgmx.cjjsj as cl_jgmx_cjjsj,cl_jgmx.fgsdj as cl_jgmx_fgsdj,DECODE(cl_jgmx.fgsdj,0,0,round((cl_jgmx.fgsdj-cl_jgmx.cjjsj)*100/cl_jgmx.fgsdj,2))||'%' as cl_jgmx_mll,cl_jgmx.gdj as cl_jgmx_gdj,cl_jgmx.ckmc as cl_jgmx_ckmc, DECODE(cl_jgmx.sfrk,'Y','��','N','��') as cl_jgmx_sfrk,cl_clbm.clmc as cl_clbm_clmc,cl_clbm.clgg as cl_clbm_clgg,cl_clbm.jldwmc as cl_clbm_jldwmc, DECODE(cl_clbm.lrjsfs,'1','���','2','�ٷֱ�') as cl_clbm_lrjsfs,cl_clbm.lrbfb as cl_clbm_lrbfb,cl_clbm.cldlmc as cl_clbm_cldlmc,cl_jgmx.tzr,cl_jgmx.tzsj,DECODE(xjgsfgx,'1','δ����','2','����') xjgsfgx,xjgsxsj,xcj,xcjjsj,xfgsdj,xgdj,DECODE(sfycx,'N','��','Y','�д���') sfycx,cxkssj,cxjzsj,cxcj,cxcjjsj,cxfgsdj,cxgdj,DECODE(xsfycx,'N','��','Y','�д���') xsfycx,xcxkssj,xcxjzsj,xcxcj,xcxcjjsj,xcxfgsdj,xcxgdj  ";
	}
	else{
		ls_sql="SELECT cl_jgmx.dwbh as dwbh,sq_dwxx.dwmc as sq_dwxx_dwmc,cl_jgmx.clbm as clbm,cl_jgmx.cj as cl_jgmx_cj,0 as cl_jgmx_cjjsj,cl_jgmx.fgsdj as cl_jgmx_fgsdj,'' as cl_jgmx_mll,cl_jgmx.gdj as cl_jgmx_gdj,cl_jgmx.ckmc as cl_jgmx_ckmc, DECODE(cl_jgmx.sfrk,'Y','��','N','��') as cl_jgmx_sfrk,cl_clbm.clmc as cl_clbm_clmc,cl_clbm.clgg as cl_clbm_clgg,cl_clbm.jldwmc as cl_clbm_jldwmc, DECODE(cl_clbm.lrjsfs,'1','���','2','�ٷֱ�') as cl_clbm_lrjsfs,cl_clbm.lrbfb as cl_clbm_lrbfb,cl_clbm.cldlmc as cl_clbm_cldlmc,cl_jgmx.tzr,cl_jgmx.tzsj,DECODE(xjgsfgx,'1','δ����','2','����') xjgsfgx,xjgsxsj,xcj,0 xcjjsj,xfgsdj,xgdj,DECODE(sfycx,'N','��','Y','�д���') sfycx,cxkssj,cxjzsj,cxcj,0 cxcjjsj,cxfgsdj,cxgdj,DECODE(xsfycx,'N','��','Y','�д���') xsfycx,xcxkssj,xcxjzsj,xcxcj,0 xcxcjjsj,xcxfgsdj,xcxgdj    ";
	}
	
	ls_sql+=" FROM sq_dwxx,cl_clbm,cl_jgmx  ";
    ls_sql+=" where cl_jgmx.dwbh=sq_dwxx.dwbh and cl_jgmx.clbm=cl_clbm.clbm";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_jgmx.dwbh,cl_clbm.cldlmc,cl_jgmx.clbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cl_jgmxCxList.jsp","SelectCxCl_jgmx.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"sq_dwxx_dwmc","cl_clbm_cldlmc","clbm","cl_clbm_clmc","cl_clbm_clgg","cl_clbm_jldwmc","cl_clbm_lrjsfs","cl_clbm_lrbfb","cl_jgmx_cj","cl_jgmx_cjjsj","cl_jgmx_fgsdj","cl_jgmx_mll","cl_jgmx_gdj","sfycx","cxkssj","cxjzsj","cxcj","cxcjjsj","cxfgsdj","cxgdj","xjgsfgx","xjgsxsj","xcj","xcjjsj","xfgsdj","xgdj","xsfycx","xcxkssj","xcxjzsj","xcxcj","xcxcjjsj","xcxfgsdj","xcxgdj","cl_jgmx_sfrk","cl_jgmx_ckmc","tzr","tzsj"  };
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"dwbh","clbm"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sq_dwxx_dwmc","1");//�в����������Hash��
	spanColHash.put("cl_clbm_cldlmc","1");//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(370);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�ֹ�˾</td>
	<td  width="3%">���ϴ���</td>
	<td  width="3%">���ϱ���</td>
	<td  width="6%">��������</td>
	<td  width="5%">���Ϲ��</td>
	<td  width="2%">������λ</td>
	<td  width="2%">������㷽ʽ</td>
	<td  width="2%">����ٷֱ�</td>
	<td  width="2%">����</td>
	<td  width="2%">�볧�ҽ����</td>
	<td  width="2%">�ֹ�˾���ϵ���</td>
	<td  width="2%">ë����</td>
	<td  width="2%">���Ӽ�</td>
	<td  width="2%">�Ƿ��д���</td>
	<td  width="3%">������ʼʱ��</td>
	<td  width="3%">��������ʱ��</td>
	<td  width="2%">�����ڳ���</td>
	<td  width="2%">�������볧�ҽ����</td>
	<td  width="2%">�����ڷֹ�˾���ϵ���</td>
	<td  width="2%">�����ڹ��Ӽ�</td>

	<td  width="2%">�¼۸��Ƿ����</td>
	<td  width="3%">�¼۸���Чʱ��</td>
	<td  width="2%">�³���</td>
	<td  width="2%">���볧�ҽ����</td>
	<td  width="2%">�·ֹ�˾���ϵ���</td>
	<td  width="2%">�¹��Ӽ�</td>
	<td  width="2%">���Ƿ��д���</td>
	<td  width="3%">�´�����ʼʱ��</td>
	<td  width="3%">�´�������ʱ��</td>
	<td  width="2%">�´����ڳ���</td>
	<td  width="2%">�´������볧�ҽ����</td>
	<td  width="2%">�´����ڷֹ�˾���ϵ���</td>
	<td  width="2%">�´����ڹ��Ӽ�</td>

	<td  width="2%">�Ƿ����</td>
	<td  width="4%">�ֿ�����</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
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