<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String rs_yggzbg_ygbh=null;
	String rs_yggzbg_sjqd=null;
	String rs_yggzbg_sjzd=null;
	String rs_yggzbg_xm=null;
	String rs_yggzbg_xzzwbm=null;
	String rs_yggzbg_ssfgs=null;
	String rs_yggzbg_dwbh=null;
	String rs_yggzbg_lrr=null;
	String rs_yggzbg_lrsj=null;
	rs_yggzbg_ygbh=request.getParameter("rs_yggzbg_ygbh");
	if (rs_yggzbg_ygbh!=null)
	{
		rs_yggzbg_ygbh=rs_yggzbg_ygbh.trim();
		if (!(rs_yggzbg_ygbh.equals("")))	wheresql+=" and (rs_yggzbg.ygbh="+rs_yggzbg_ygbh+") ";
	}
	rs_yggzbg_sjqd=request.getParameter("rs_yggzbg_sjqd");
	if (rs_yggzbg_sjqd!=null)
	{
		rs_yggzbg_sjqd=rs_yggzbg_sjqd.trim();
		if (!(rs_yggzbg_sjqd.equals("")))	wheresql+="  and (rs_yggzbg.sjqd>=TO_DATE('"+rs_yggzbg_sjqd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjqd=request.getParameter("rs_yggzbg_sjqd2");
	if (rs_yggzbg_sjqd!=null)
	{
		rs_yggzbg_sjqd=rs_yggzbg_sjqd.trim();
		if (!(rs_yggzbg_sjqd.equals("")))	wheresql+="  and (rs_yggzbg.sjqd<=TO_DATE('"+rs_yggzbg_sjqd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjzd=request.getParameter("rs_yggzbg_sjzd");
	if (rs_yggzbg_sjzd!=null)
	{
		rs_yggzbg_sjzd=rs_yggzbg_sjzd.trim();
		if (!(rs_yggzbg_sjzd.equals("")))	wheresql+="  and (rs_yggzbg.sjzd>=TO_DATE('"+rs_yggzbg_sjzd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjzd=request.getParameter("rs_yggzbg_sjzd2");
	if (rs_yggzbg_sjzd!=null)
	{
		rs_yggzbg_sjzd=rs_yggzbg_sjzd.trim();
		if (!(rs_yggzbg_sjzd.equals("")))	wheresql+="  and (rs_yggzbg.sjzd<=TO_DATE('"+rs_yggzbg_sjzd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_xm=request.getParameter("rs_yggzbg_xm");
	if (rs_yggzbg_xm!=null)
	{
		rs_yggzbg_xm=cf.GB2Uni(rs_yggzbg_xm);
		if (!(rs_yggzbg_xm.equals("")))	wheresql+=" and  (rs_yggzbg.xm='"+rs_yggzbg_xm+"')";
	}
	rs_yggzbg_xzzwbm=request.getParameter("rs_yggzbg_xzzwbm");
	if (rs_yggzbg_xzzwbm!=null)
	{
		rs_yggzbg_xzzwbm=cf.GB2Uni(rs_yggzbg_xzzwbm);
		if (!(rs_yggzbg_xzzwbm.equals("")))	wheresql+=" and  (rs_yggzbg.xzzwbm='"+rs_yggzbg_xzzwbm+"')";
	}
	rs_yggzbg_ssfgs=request.getParameter("rs_yggzbg_ssfgs");
	if (rs_yggzbg_ssfgs!=null)
	{
		rs_yggzbg_ssfgs=cf.GB2Uni(rs_yggzbg_ssfgs);
		if (!(rs_yggzbg_ssfgs.equals("")))	wheresql+=" and  (rs_yggzbg.ssfgs='"+rs_yggzbg_ssfgs+"')";
	}
	rs_yggzbg_dwbh=request.getParameter("rs_yggzbg_dwbh");
	if (rs_yggzbg_dwbh!=null)
	{
		rs_yggzbg_dwbh=cf.GB2Uni(rs_yggzbg_dwbh);
		if (!(rs_yggzbg_dwbh.equals("")))	wheresql+=" and  (rs_yggzbg.dwbh='"+rs_yggzbg_dwbh+"')";
	}
	rs_yggzbg_lrr=request.getParameter("rs_yggzbg_lrr");
	if (rs_yggzbg_lrr!=null)
	{
		rs_yggzbg_lrr=cf.GB2Uni(rs_yggzbg_lrr);
		if (!(rs_yggzbg_lrr.equals("")))	wheresql+=" and  (rs_yggzbg.lrr='"+rs_yggzbg_lrr+"')";
	}
	rs_yggzbg_lrsj=request.getParameter("rs_yggzbg_lrsj");
	if (rs_yggzbg_lrsj!=null)
	{
		rs_yggzbg_lrsj=rs_yggzbg_lrsj.trim();
		if (!(rs_yggzbg_lrsj.equals("")))	wheresql+="  and (rs_yggzbg.lrsj>=TO_DATE('"+rs_yggzbg_lrsj+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_lrsj=request.getParameter("rs_yggzbg_lrsj2");
	if (rs_yggzbg_lrsj!=null)
	{
		rs_yggzbg_lrsj=rs_yggzbg_lrsj.trim();
		if (!(rs_yggzbg_lrsj.equals("")))	wheresql+="  and (rs_yggzbg.lrsj<=TO_DATE('"+rs_yggzbg_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT rs_yggzbg.sjqd,rs_yggzbg.sjzd,a.dwmc ssbm,rs_yggzbg.xm,rs_yggzbg.xzzwbm,rs_yggzbg.gzsm,gzsj,rs_yggzbg.lrr,rs_yggzbg.lrsj,b.dwmc ssfgs,rs_yggzbg.ygbh  ";
	ls_sql+=" FROM rs_yggzbg,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where rs_yggzbg.dwbh=a.dwbh and rs_yggzbg.ssfgs=b.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and rs_yggzbg.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and rs_yggzbg.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
    ls_sql+=" order by rs_yggzbg.sjqd,rs_yggzbg.dwbh,rs_yggzbg.xm desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_yggzbgCxList.jsp","","","");
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
  <B><font size="3">Ա����������-��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����ʱ�����</td>
	<td  width="5%">����ʱ���յ�</td>
	<td  width="7%">��������</td>
	<td  width="5%">����</td>
	<td  width="5%">ְ��</td>
	<td  width="50%">����˵��</td>
	<td  width="4%">����ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="6%">�����ֹ�˾</td>
	<td  width="4%">Ա�����</td>
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