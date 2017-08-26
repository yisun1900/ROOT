<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ybj_ybjqx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String fgs=null;
	String ybj_ybjqx_qxr=null;
	String ybj_ybjqx_qxsj=null;
	String ybj_ybjqx_lrr=null;
	String ybj_ybjqx_lrsj=null;
	String ybj_ybjqx_lrbm=null;

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	
	
	ybj_ybjqx_khbh=request.getParameter("ybj_ybjqx_khbh");
	if (ybj_ybjqx_khbh!=null)
	{
		ybj_ybjqx_khbh=cf.GB2Uni(ybj_ybjqx_khbh);
		if (!(ybj_ybjqx_khbh.equals("")))	wheresql+=" and  (ybj_ybjqx.khbh='"+ybj_ybjqx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (ybj_ybjqx.ssfgs='"+fgs+"')";
	}
	ybj_ybjqx_qxr=request.getParameter("ybj_ybjqx_qxr");
	if (ybj_ybjqx_qxr!=null)
	{
		ybj_ybjqx_qxr=cf.GB2Uni(ybj_ybjqx_qxr);
		if (!(ybj_ybjqx_qxr.equals("")))	wheresql+=" and  (ybj_ybjqx.qxr='"+ybj_ybjqx_qxr+"')";
	}
	ybj_ybjqx_qxsj=request.getParameter("ybj_ybjqx_qxsj");
	if (ybj_ybjqx_qxsj!=null)
	{
		ybj_ybjqx_qxsj=ybj_ybjqx_qxsj.trim();
		if (!(ybj_ybjqx_qxsj.equals("")))	wheresql+="  and (ybj_ybjqx.qxsj>=TO_DATE('"+ybj_ybjqx_qxsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjqx_qxsj=request.getParameter("ybj_ybjqx_qxsj2");
	if (ybj_ybjqx_qxsj!=null)
	{
		ybj_ybjqx_qxsj=ybj_ybjqx_qxsj.trim();
		if (!(ybj_ybjqx_qxsj.equals("")))	wheresql+="  and (ybj_ybjqx.qxsj<=TO_DATE('"+ybj_ybjqx_qxsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjqx_lrr=request.getParameter("ybj_ybjqx_lrr");
	if (ybj_ybjqx_lrr!=null)
	{
		ybj_ybjqx_lrr=cf.GB2Uni(ybj_ybjqx_lrr);
		if (!(ybj_ybjqx_lrr.equals("")))	wheresql+=" and  (ybj_ybjqx.lrr='"+ybj_ybjqx_lrr+"')";
	}
	ybj_ybjqx_lrsj=request.getParameter("ybj_ybjqx_lrsj");
	if (ybj_ybjqx_lrsj!=null)
	{
		ybj_ybjqx_lrsj=ybj_ybjqx_lrsj.trim();
		if (!(ybj_ybjqx_lrsj.equals("")))	wheresql+="  and (ybj_ybjqx.lrsj>=TO_DATE('"+ybj_ybjqx_lrsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjqx_lrsj=request.getParameter("ybj_ybjqx_lrsj2");
	if (ybj_ybjqx_lrsj!=null)
	{
		ybj_ybjqx_lrsj=ybj_ybjqx_lrsj.trim();
		if (!(ybj_ybjqx_lrsj.equals("")))	wheresql+="  and (ybj_ybjqx.lrsj<=TO_DATE('"+ybj_ybjqx_lrsj+"','YYYY/MM/DD'))";
	}
	ybj_ybjqx_lrbm=request.getParameter("ybj_ybjqx_lrbm");
	if (ybj_ybjqx_lrbm!=null)
	{
		ybj_ybjqx_lrbm=cf.GB2Uni(ybj_ybjqx_lrbm);
		if (!(ybj_ybjqx_lrbm.equals("")))	wheresql+=" and  (ybj_ybjqx.lrbm='"+ybj_ybjqx_lrbm+"')";
	}
	ls_sql="SELECT ybj_ybjqx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.qyrq,sgdmc,crm_khxx.zjxm,ybj_ybjqx.qxr,ybj_ybjqx.qxsj,ybj_ybjqx.lrr,ybj_ybjqx.lrsj,b.dwmc lrbm,a.dwmc ssfgs,ybj_ybjqx.bz  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,ybj_ybjqx,sq_sgd  ";
    ls_sql+=" where ybj_ybjqx.khbh=crm_khxx.khbh and ybj_ybjqx.ssfgs=a.dwbh and ybj_ybjqx.lrbm=b.dwbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Ybj_ybjqxCxList.jsp","SelectCxYbj_ybjqx.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","sq_dwxx_dwmc","ybj_ybjqx_qxr","ybj_ybjqx_qxsj","ybj_ybjqx_lrr","ybj_ybjqx_lrsj","ybj_ybjqx_lrbm","ybj_ybjqx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="15%">房屋地址</td>
	<td  width="5%">合同号</td>
	<td  width="4%">设计师</td>
	<td  width="6%">签约日期</td>
	<td  width="4%">施工队</td>
	<td  width="4%">质检</td>
	<td  width="4%">取消人</td>
	<td  width="6%">取消时间</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="8%">录入部门</td>
	<td  width="7%">所属分公司</td>
	<td  width="17%">备注</td>
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