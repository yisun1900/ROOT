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
	String rs_yhrzjl_xh=null;
	String rs_yhrzjl_ygbh=null;
	String rs_yhrzjl_yhmc=null;
	String rs_yhrzjl_bianhao=null;
	String rs_yhrzjl_sfzh=null;
	String rs_yhrzjl_xzzwbm=null;
	String rs_yhrzjl_rzsj=null;
	String rs_yhrzjl_rzcs=null;
	String dwbh=null;
	String ssfgs=null;
	String rs_yhrzjl_lrr=null;
	String rs_yhrzjl_lrsj=null;

	
	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (rs_yhrzjl.lx='"+lx+"')";
	}
	String sqxh=null;
	sqxh=request.getParameter("sqxh");
	if (sqxh!=null)
	{
		sqxh=cf.GB2Uni(sqxh);
		if (!(sqxh.equals("")))	wheresql+=" and  (rs_yhrzjl.sqxh='"+sqxh+"')";
	}
	
	rs_yhrzjl_xh=request.getParameter("rs_yhrzjl_xh");
	if (rs_yhrzjl_xh!=null)
	{
		rs_yhrzjl_xh=rs_yhrzjl_xh.trim();
		if (!(rs_yhrzjl_xh.equals("")))	wheresql+=" and (rs_yhrzjl.xh="+rs_yhrzjl_xh+") ";
	}
	rs_yhrzjl_ygbh=request.getParameter("rs_yhrzjl_ygbh");
	if (rs_yhrzjl_ygbh!=null)
	{
		rs_yhrzjl_ygbh=rs_yhrzjl_ygbh.trim();
		if (!(rs_yhrzjl_ygbh.equals("")))	wheresql+=" and (rs_yhrzjl.ygbh="+rs_yhrzjl_ygbh+") ";
	}
	rs_yhrzjl_yhmc=request.getParameter("rs_yhrzjl_yhmc");
	if (rs_yhrzjl_yhmc!=null)
	{
		rs_yhrzjl_yhmc=cf.GB2Uni(rs_yhrzjl_yhmc);
		if (!(rs_yhrzjl_yhmc.equals("")))	wheresql+=" and  (rs_yhrzjl.yhmc='"+rs_yhrzjl_yhmc+"')";
	}
	rs_yhrzjl_bianhao=request.getParameter("rs_yhrzjl_bianhao");
	if (rs_yhrzjl_bianhao!=null)
	{
		rs_yhrzjl_bianhao=cf.GB2Uni(rs_yhrzjl_bianhao);
		if (!(rs_yhrzjl_bianhao.equals("")))	wheresql+=" and  (rs_yhrzjl.bianhao='"+rs_yhrzjl_bianhao+"')";
	}
	rs_yhrzjl_sfzh=request.getParameter("rs_yhrzjl_sfzh");
	if (rs_yhrzjl_sfzh!=null)
	{
		rs_yhrzjl_sfzh=cf.GB2Uni(rs_yhrzjl_sfzh);
		if (!(rs_yhrzjl_sfzh.equals("")))	wheresql+=" and  (rs_yhrzjl.sfzh='"+rs_yhrzjl_sfzh+"')";
	}
	rs_yhrzjl_xzzwbm=request.getParameter("rs_yhrzjl_xzzwbm");
	if (rs_yhrzjl_xzzwbm!=null)
	{
		rs_yhrzjl_xzzwbm=cf.GB2Uni(rs_yhrzjl_xzzwbm);
		if (!(rs_yhrzjl_xzzwbm.equals("")))	wheresql+=" and  (rs_yhrzjl.xzzwbm='"+rs_yhrzjl_xzzwbm+"')";
	}
	rs_yhrzjl_rzsj=request.getParameter("rs_yhrzjl_rzsj");
	if (rs_yhrzjl_rzsj!=null)
	{
		rs_yhrzjl_rzsj=rs_yhrzjl_rzsj.trim();
		if (!(rs_yhrzjl_rzsj.equals("")))	wheresql+="  and (rs_yhrzjl.rzsj>=TO_DATE('"+rs_yhrzjl_rzsj+"','YYYY/MM/DD'))";
	}
	rs_yhrzjl_rzsj=request.getParameter("rs_yhrzjl_rzsj2");
	if (rs_yhrzjl_rzsj!=null)
	{
		rs_yhrzjl_rzsj=rs_yhrzjl_rzsj.trim();
		if (!(rs_yhrzjl_rzsj.equals("")))	wheresql+="  and (rs_yhrzjl.rzsj<=TO_DATE('"+rs_yhrzjl_rzsj+"','YYYY/MM/DD'))";
	}
	rs_yhrzjl_rzcs=request.getParameter("rs_yhrzjl_rzcs");
	if (rs_yhrzjl_rzcs!=null)
	{
		rs_yhrzjl_rzcs=rs_yhrzjl_rzcs.trim();
		if (!(rs_yhrzjl_rzcs.equals("")))	wheresql+=" and (rs_yhrzjl.rzcs="+rs_yhrzjl_rzcs+") ";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (rs_yhrzjl.dwbh='"+dwbh+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_yhrzjl.ssfgs='"+ssfgs+"')";
	}
	rs_yhrzjl_lrr=request.getParameter("rs_yhrzjl_lrr");
	if (rs_yhrzjl_lrr!=null)
	{
		rs_yhrzjl_lrr=cf.GB2Uni(rs_yhrzjl_lrr);
		if (!(rs_yhrzjl_lrr.equals("")))	wheresql+=" and  (rs_yhrzjl.lrr='"+rs_yhrzjl_lrr+"')";
	}
	rs_yhrzjl_lrsj=request.getParameter("rs_yhrzjl_lrsj");
	if (rs_yhrzjl_lrsj!=null)
	{
		rs_yhrzjl_lrsj=rs_yhrzjl_lrsj.trim();
		if (!(rs_yhrzjl_lrsj.equals("")))	wheresql+="  and (rs_yhrzjl.lrsj>=TO_DATE('"+rs_yhrzjl_lrsj+"','YYYY/MM/DD'))";
	}
	rs_yhrzjl_lrsj=request.getParameter("rs_yhrzjl_lrsj2");
	if (rs_yhrzjl_lrsj!=null)
	{
		rs_yhrzjl_lrsj=rs_yhrzjl_lrsj.trim();
		if (!(rs_yhrzjl_lrsj.equals("")))	wheresql+="  and (rs_yhrzjl.lrsj<=TO_DATE('"+rs_yhrzjl_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT rs_yhrzjl.xh,DECODE(lx,'1','����ְ','2','������ְ'),sqxh,rs_yhrzjl.ygbh,rs_yhrzjl.yhmc,rs_yhrzjl.bianhao,rs_yhrzjl.sfzh,dm_xzzwbm.xzzwmc,sq_yhxx.rzsj,rs_yhrzjl.rzcs,a.dwmc ssdw,b.dwmc ssfgs,rs_yhrzjl.lrr,rs_yhrzjl.lrsj  ";
	ls_sql+=" FROM dm_xzzwbm,rs_yhrzjl,sq_dwxx a,sq_dwxx b,sq_yhxx  ";
    ls_sql+=" where rs_yhrzjl.ygbh=sq_yhxx.ygbh and rs_yhrzjl.xzzwbm=dm_xzzwbm.xzzwbm(+) and rs_yhrzjl.dwbh=a.dwbh(+)  and rs_yhrzjl.ssfgs=b.dwbh(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_yhrzjl.xh desc";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_yhrzjlCxList.jsp","SelectCxRs_yhrzjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","rs_yhrzjl_ygbh","rs_yhrzjl_yhmc","rs_yhrzjl_bianhao","rs_yhrzjl_sfzh","dm_xzzwbm_xzzwmc","rs_yhrzjl_rzsj","rs_yhrzjl_rzcs","dwbh","ssfgs","rs_yhrzjl_lrr","rs_yhrzjl_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ygbh",coluParm);//�в����������Hash��
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
  <B><font size="3">��ѯ��ְ��Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="6%">��ְ����</td>
	<td  width="6%">������ְ�������</td>
	<td  width="5%">Ա�����</td>
	<td  width="7%">Ա������</td>
	<td  width="7%">����</td>
	<td  width="12%">���֤��</td>
	<td  width="9%">����ְ��</td>
	<td  width="7%">��ְ����</td>
	<td  width="5%">��ְ����</td>
	<td  width="11%">������λ</td>
	<td  width="9%">�����ֹ�˾</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
</tr>
<%
	pageObj.displayDate();
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
