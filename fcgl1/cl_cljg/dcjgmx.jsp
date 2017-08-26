<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";

	String ssfgs=null;
	String clbm=null;
	String clmc=null;
	String clgg=null;
	String lrjsfs=null;
	String lrbfb=null;
	String cldj=null;
	String jldwmc=null;
	String jgtzzt=null;
	String cldlmc=null;

		
	ssfgs=request.getParameter("fgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (cl_jgmx.dwbh='"+ssfgs+"')";
	}



	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (cl_clbm.cldlmc='"+cldlmc+"')";
	}
	jgtzzt=request.getParameter("jgtzzt");
	if (jgtzzt!=null)
	{
		jgtzzt=jgtzzt.trim();
		if (jgtzzt.equals("1"))	wheresql+=" and  (fgsdj=0) ";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=clbm.trim();
		if (!(clbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+clbm+"') ";
	}
	cldj=request.getParameter("cldj");
	if (cldj!=null)
	{
		cldj=cldj.trim();
		if (!(cldj.equals("")))	wheresql+=" and  (cl_clbm.cldj>="+cldj+") ";
	}
	cldj=request.getParameter("cldj2");
	if (cldj!=null)
	{
		cldj=cldj.trim();
		if (!(cldj.equals("")))	wheresql+=" and  (cl_clbm.cldj<="+cldj+") ";
	}
	jldwmc=request.getParameter("jldwmc");
	if (jldwmc!=null)
	{
		jldwmc=cf.GB2Uni(jldwmc);
		if (!(jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+jldwmc+"')";
	}
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc='"+clmc+"')";
	}
	clgg=request.getParameter("clgg");
	if (clgg!=null)
	{
		clgg=cf.GB2Uni(clgg);
		if (!(clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg='"+clgg+"')";
	}
	lrjsfs=request.getParameter("lrjsfs");
	if (lrjsfs!=null)
	{
		lrjsfs=cf.GB2Uni(lrjsfs);
		if (!(lrjsfs.equals("")))	wheresql+=" and  (cl_clbm.lrjsfs='"+lrjsfs+"')";
	}
	lrbfb=request.getParameter("lrbfb");
	if (lrbfb!=null)
	{
		lrbfb=lrbfb.trim();
		if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb>="+lrbfb+") ";
	}
	lrbfb=request.getParameter("lrbfb2");
	if (lrbfb!=null)
	{
		lrbfb=lrbfb.trim();
		if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb<="+lrbfb+") ";
	}

	ls_sql="SELECT cl_jgmx.dwbh as dwbh,sq_dwxx.dwmc as sq_dwxx_dwmc,cl_jgmx.clbm as clbm,cl_jgmx.cj,cl_jgmx.cjjsj,cl_jgmx.fgsdj,cl_jgmx.gdj,cl_jgmx.ckmc as cl_jgmx_ckmc, DECODE(cl_jgmx.sfrk,'Y','��','N','��') as cl_jgmx_sfrk,cl_clbm.clmc as cl_clbm_clmc,cl_clbm.clgg as cl_clbm_clgg,cl_clbm.cldj as cl_clbm_cldj,cl_clbm.jldwmc as cl_clbm_jldwmc, DECODE(cl_clbm.lrjsfs,'1','��۷�ʽ','2','�ٷֱȷ�ʽ') as cl_clbm_lrjsfs,cl_clbm.lrbfb as cl_clbm_lrbfb,cl_clbm.cldlmc as cl_clbm_cldlmc  ";
	
	ls_sql+=" FROM sq_dwxx,cl_clbm,cl_jgmx  ";
    ls_sql+=" where cl_jgmx.dwbh=sq_dwxx.dwbh and cl_jgmx.clbm=cl_clbm.clbm";
    ls_sql+=wheresql;
    ls_sql+=" order by cl_jgmx.dwbh,cl_clbm.cldlmc,cl_jgmx.clbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"sq_dwxx_dwmc","cl_clbm_cldlmc","clbm","cl_clbm_clmc","cl_clbm_clgg","cl_clbm_jldwmc","cl_clbm_lrjsfs","cl_clbm_lrbfb","cjjsj","fgsdj","gdj","cl_jgmx_ckmc","cl_jgmx_sfrk"};
	pageObj.setDisColName(disColName);
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����۸�</font></B>
</CENTER>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">�ֹ�˾</td>
	<td  width="9%">���ϴ���</td>
	<td  width="11%">���ϱ���</td>
	<td  width="12%">��������</td>
	<td  width="11%">���Ϲ��</td>
	<td  width="5%">������λ</td>
	<td  width="6%">������㷽ʽ</td>
	<td  width="5%">����ٷֱ�</td>
	<td width="6%"><b>�볧�ҽ����</b></td>
	<td width="6%"><b>�ֹ�˾���ϵ���</b></td>
	<td  width="6%"><b>���Ӽ�</b></td>
	<td  width="10%">�ֿ�����</td>
	<td  width="4%">�Ƿ����</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>