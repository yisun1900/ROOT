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
	String dqbm=null;
	String bjjbbm=null;
	String bj_jzbjcfb_fxmbh=null;
	String bj_jzbjcfb_xmbh=null;
	String bj_jzbjcfb_xmmc=null;
	String bj_jzbjcfb_xmdlbm=null;
	String bj_jzbjcfb_xmxlbm=null;
	String bj_jzbjcfb_smbm=null;
	String bj_jzbjcfb_lrsj=null;

	
	String fxmmc=null;
	fxmmc=request.getParameter("fxmmc");
	if (fxmmc!=null)
	{
		fxmmc=cf.GB2Uni(fxmmc);
		if (!(fxmmc.equals("")))	wheresql+=" and  (bj_jzbjb.fxmmc like '%"+bj_jzbjcfb_xmmc+"%')";
	}
	
	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (dqbm!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (bj_jzbjcfb.bjbbh='"+bjbbh+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.dqbm='"+dqbm+"')";
	}
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.bjjbbm='"+bjjbbm+"')";
	}
	bj_jzbjcfb_fxmbh=request.getParameter("bj_jzbjcfb_fxmbh");
	if (bj_jzbjcfb_fxmbh!=null)
	{
		bj_jzbjcfb_fxmbh=cf.GB2Uni(bj_jzbjcfb_fxmbh);
		if (!(bj_jzbjcfb_fxmbh.equals("")))	wheresql+=" and  (bj_jzbjcfb.fxmbh='"+bj_jzbjcfb_fxmbh+"')";
	}
	bj_jzbjcfb_xmbh=request.getParameter("bj_jzbjcfb_xmbh");
	if (bj_jzbjcfb_xmbh!=null)
	{
		bj_jzbjcfb_xmbh=cf.GB2Uni(bj_jzbjcfb_xmbh);
		if (!(bj_jzbjcfb_xmbh.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmbh='"+bj_jzbjcfb_xmbh+"')";
	}
	bj_jzbjcfb_xmmc=request.getParameter("bj_jzbjcfb_xmmc");
	if (bj_jzbjcfb_xmmc!=null)
	{
		bj_jzbjcfb_xmmc=cf.GB2Uni(bj_jzbjcfb_xmmc);
		if (!(bj_jzbjcfb_xmmc.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmmc like '%"+bj_jzbjcfb_xmmc+"%')";
	}
	bj_jzbjcfb_xmdlbm=request.getParameter("bj_jzbjcfb_xmdlbm");
	if (bj_jzbjcfb_xmdlbm!=null)
	{
		bj_jzbjcfb_xmdlbm=cf.GB2Uni(bj_jzbjcfb_xmdlbm);
		if (!(bj_jzbjcfb_xmdlbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmdlbm='"+bj_jzbjcfb_xmdlbm+"')";
	}
	bj_jzbjcfb_xmxlbm=request.getParameter("bj_jzbjcfb_xmxlbm");
	if (bj_jzbjcfb_xmxlbm!=null)
	{
		bj_jzbjcfb_xmxlbm=cf.GB2Uni(bj_jzbjcfb_xmxlbm);
		if (!(bj_jzbjcfb_xmxlbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.xmxlbm='"+bj_jzbjcfb_xmxlbm+"')";
	}
	bj_jzbjcfb_smbm=request.getParameter("bj_jzbjcfb_smbm");
	if (bj_jzbjcfb_smbm!=null)
	{
		bj_jzbjcfb_smbm=cf.GB2Uni(bj_jzbjcfb_smbm);
		if (!(bj_jzbjcfb_smbm.equals("")))	wheresql+=" and  (bj_jzbjcfb.smbm='"+bj_jzbjcfb_smbm+"')";
	}
	bj_jzbjcfb_lrsj=request.getParameter("bj_jzbjcfb_lrsj");
	if (bj_jzbjcfb_lrsj!=null)
	{
		bj_jzbjcfb_lrsj=bj_jzbjcfb_lrsj.trim();
		if (!(bj_jzbjcfb_lrsj.equals("")))	wheresql+="  and (bj_jzbjcfb.lrsj>=TO_DATE('"+bj_jzbjcfb_lrsj+"','YYYY/MM/DD'))";
	}
	bj_jzbjcfb_lrsj=request.getParameter("bj_jzbjcfb_lrsj2");
	if (bj_jzbjcfb_lrsj!=null)
	{
		bj_jzbjcfb_lrsj=bj_jzbjcfb_lrsj.trim();
		if (!(bj_jzbjcfb_lrsj.equals("")))	wheresql+="  and (bj_jzbjcfb.lrsj<=TO_DATE('"+bj_jzbjcfb_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT bj_jzbjcfb.bjbbh,dqmc,bjjbmc,bj_jzbjcfb.fxmbh,bj_jzbjb.xmmc fxmmc,bj_jzbjcfb.xmbh,bj_jzbjcfb.xmmc,xmdlmc,xmxlmc,smmc,jldwmc,bj_jzbjcfb.clbj,bj_jzbjcfb.zcf,bj_jzbjcfb.rgbj,bj_jzbjcfb.ysf,bj_jzbjcfb.jxbj,bj_jzbjcfb.shf,bj_jzbjcfb.qtf,bj_jzbjcfb.bj,bj_jzbjcfb.gycl,bj_jzbjcfb.flmcgg,bj_jzbjcfb.lrr,bj_jzbjcfb.lrsj,bj_jzbjcfb.bz  ";
	ls_sql+=" FROM bdm_bjjbbm,bj_jzbjcfb,bj_jzbjb,dm_dqbm,jdm_jldwbm,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm  ";
    ls_sql+=" where bj_jzbjcfb.bjjbbm=bdm_bjjbbm.bjjbbm(+) ";
    ls_sql+=" and bj_jzbjcfb.bjbbh=bj_jzbjb.bjbbh and bj_jzbjcfb.dqbm=bj_jzbjb.dqbm and bj_jzbjcfb.bjjbbm=bj_jzbjb.bjjbbm and bj_jzbjcfb.fxmbh=bj_jzbjb.xmbh";
    ls_sql+=" and bj_jzbjcfb.dqbm=dm_dqbm.dqbm(+) ";
    ls_sql+=" and bj_jzbjcfb.jldwbm=jdm_jldwbm.jldwbm(+) ";
    ls_sql+=" and bj_jzbjcfb.xmdlbm=bdm_xmdlbm.xmdlbm(+) ";
    ls_sql+=" and bj_jzbjcfb.xmxlbm=bdm_xmxlbm.xmxlbm(+) ";
    ls_sql+=" and bj_jzbjcfb.smbm=bdm_smbm.smbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jzbjcfb.bjbbh,bj_jzbjcfb.dqbm,bj_jzbjcfb.bjjbbm,bj_jzbjcfb.fxmbh,bj_jzbjcfb.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_jzbjcfbCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

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
  <B><font size="3">��ֱ��۲�ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���۰汾��</td>
	<td  width="3%">����</td>
	<td  width="3%">���ۼ���</td>
	<td  width="4%">����Ŀ���</td>
	<td  width="7%">����Ŀ����</td>
	<td  width="4%">��Ŀ���</td>
	<td  width="7%">��Ŀ����</td>
	<td  width="4%">��Ŀ����</td>
	<td  width="4%">��ĿС��</td>
	<td  width="3%">����</td>
	<td  width="2%">������λ</td>
	<td  width="2%">���ķ�</td>
	<td  width="2%">���ķ�</td>
	<td  width="2%">�˹���</td>
	<td  width="2%">�����</td>
	<td  width="2%">��е��</td>
	<td  width="2%">��ķ�</td>
	<td  width="2%">������</td>
	<td  width="3%">����Ԥ���</td>
	<td  width="12%">��������������</td>
	<td  width="12%">�������ƹ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="18%">��ע</td>
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