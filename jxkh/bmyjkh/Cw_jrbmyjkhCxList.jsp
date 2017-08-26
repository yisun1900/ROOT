<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_jrbmyjkh_khzq=null;
	String cw_jrbmyjkh_khqssj=null;
	String cw_jrbmyjkh_khjzsj=null;
	String cw_jrbmyjkh_sfkh=null;
	String cw_jrbmyjkh_khr=null;
	String cw_jrbmyjkh_khsj=null;
	String cw_jrbmyjkh_lrr=null;
	String cw_jrbmyjkh_lrsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (cw_jrbmyjkh.fgsbh='"+fgs+"')";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_jrbmyjkh.dwbh='"+dwbh+"')";
	}

	cw_jrbmyjkh_khzq=request.getParameter("cw_jrbmyjkh_khzq");
	if (cw_jrbmyjkh_khzq!=null)
	{
		cw_jrbmyjkh_khzq=cf.GB2Uni(cw_jrbmyjkh_khzq);
		if (!(cw_jrbmyjkh_khzq.equals("")))	wheresql+=" and  (cw_jrbmyjkh.khzq='"+cw_jrbmyjkh_khzq+"')";
	}
	cw_jrbmyjkh_khqssj=request.getParameter("cw_jrbmyjkh_khqssj");
	if (cw_jrbmyjkh_khqssj!=null)
	{
		cw_jrbmyjkh_khqssj=cw_jrbmyjkh_khqssj.trim();
		if (!(cw_jrbmyjkh_khqssj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khqssj>=TO_DATE('"+cw_jrbmyjkh_khqssj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_khqssj=request.getParameter("cw_jrbmyjkh_khqssj2");
	if (cw_jrbmyjkh_khqssj!=null)
	{
		cw_jrbmyjkh_khqssj=cw_jrbmyjkh_khqssj.trim();
		if (!(cw_jrbmyjkh_khqssj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khqssj<=TO_DATE('"+cw_jrbmyjkh_khqssj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_khjzsj=request.getParameter("cw_jrbmyjkh_khjzsj");
	if (cw_jrbmyjkh_khjzsj!=null)
	{
		cw_jrbmyjkh_khjzsj=cw_jrbmyjkh_khjzsj.trim();
		if (!(cw_jrbmyjkh_khjzsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khjzsj>=TO_DATE('"+cw_jrbmyjkh_khjzsj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_khjzsj=request.getParameter("cw_jrbmyjkh_khjzsj2");
	if (cw_jrbmyjkh_khjzsj!=null)
	{
		cw_jrbmyjkh_khjzsj=cw_jrbmyjkh_khjzsj.trim();
		if (!(cw_jrbmyjkh_khjzsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khjzsj<=TO_DATE('"+cw_jrbmyjkh_khjzsj+"','YYYY/MM/DD'))";
	}

	cw_jrbmyjkh_sfkh=request.getParameter("cw_jrbmyjkh_sfkh");
	if (cw_jrbmyjkh_sfkh!=null)
	{
		cw_jrbmyjkh_sfkh=cf.GB2Uni(cw_jrbmyjkh_sfkh);
		if (!(cw_jrbmyjkh_sfkh.equals("")))	wheresql+=" and  (cw_jrbmyjkh.sfkh='"+cw_jrbmyjkh_sfkh+"')";
	}
	cw_jrbmyjkh_khr=request.getParameter("cw_jrbmyjkh_khr");
	if (cw_jrbmyjkh_khr!=null)
	{
		cw_jrbmyjkh_khr=cf.GB2Uni(cw_jrbmyjkh_khr);
		if (!(cw_jrbmyjkh_khr.equals("")))	wheresql+=" and  (cw_jrbmyjkh.khr='"+cw_jrbmyjkh_khr+"')";
	}
	cw_jrbmyjkh_khsj=request.getParameter("cw_jrbmyjkh_khsj");
	if (cw_jrbmyjkh_khsj!=null)
	{
		cw_jrbmyjkh_khsj=cw_jrbmyjkh_khsj.trim();
		if (!(cw_jrbmyjkh_khsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khsj>=TO_DATE('"+cw_jrbmyjkh_khsj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_khsj=request.getParameter("cw_jrbmyjkh_khsj2");
	if (cw_jrbmyjkh_khsj!=null)
	{
		cw_jrbmyjkh_khsj=cw_jrbmyjkh_khsj.trim();
		if (!(cw_jrbmyjkh_khsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khsj<=TO_DATE('"+cw_jrbmyjkh_khsj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_lrr=request.getParameter("cw_jrbmyjkh_lrr");
	if (cw_jrbmyjkh_lrr!=null)
	{
		cw_jrbmyjkh_lrr=cf.GB2Uni(cw_jrbmyjkh_lrr);
		if (!(cw_jrbmyjkh_lrr.equals("")))	wheresql+=" and  (cw_jrbmyjkh.lrr='"+cw_jrbmyjkh_lrr+"')";
	}
	cw_jrbmyjkh_lrsj=request.getParameter("cw_jrbmyjkh_lrsj");
	if (cw_jrbmyjkh_lrsj!=null)
	{
		cw_jrbmyjkh_lrsj=cw_jrbmyjkh_lrsj.trim();
		if (!(cw_jrbmyjkh_lrsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.lrsj>=TO_DATE('"+cw_jrbmyjkh_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_lrsj=request.getParameter("cw_jrbmyjkh_lrsj2");
	if (cw_jrbmyjkh_lrsj!=null)
	{
		cw_jrbmyjkh_lrsj=cw_jrbmyjkh_lrsj.trim();
		if (!(cw_jrbmyjkh_lrsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.lrsj<=TO_DATE('"+cw_jrbmyjkh_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_jrbmyjkh.khzq,cw_jrbmyjkh.khqssj,cw_jrbmyjkh.khjzsj,b.dwmc fgsbh,a.dwmc,cw_jrbmyjkh.djsjh,cw_jrbmyjkh.sjfjh,cw_jrbmyjkh.gxhjh,cw_jrbmyjkh.tcjh,cw_jrbmyjkh.zcjh,cw_jrbmyjkh.zjh   ,cw_jrbmyjkh.jtdjsjh,cw_jrbmyjkh.jtsjfjh,cw_jrbmyjkh.jtgxhjh,cw_jrbmyjkh.jttcjh,cw_jrbmyjkh.jtzcjh,cw_jrbmyjkh.jtzjh   ,cw_jrbmyjkh.djswc,cw_jrbmyjkh.sjfwc,cw_jrbmyjkh.gxhwc,cw_jrbmyjkh.tcwc,cw_jrbmyjkh.zcwc,cw_jrbmyjkh.zwc, DECODE(cw_jrbmyjkh.sfkh,'N','未考核','Y','考核'),cw_jrbmyjkh.khdf,cw_jrbmyjkh.khr,cw_jrbmyjkh.khsj,cw_jrbmyjkh.lrr,cw_jrbmyjkh.lrsj,cw_jrbmyjkh.bz  ";
	ls_sql+=" FROM cw_jrbmyjkh,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where cw_jrbmyjkh.dwbh=a.dwbh(+)";
    ls_sql+=" and cw_jrbmyjkh.fgsbh=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cw_jrbmyjkh.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_jrbmyjkh.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrbmyjkh.khzq,cw_jrbmyjkh.fgsbh,cw_jrbmyjkh.dwbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jrbmyjkhCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khzq","cw_jrbmyjkh_khqssj","cw_jrbmyjkh_khjzsj","cw_jrbmyjkh_fgsbh","dwbh","sq_dwxx_dwmc","cw_jrbmyjkh_djsjh","cw_jrbmyjkh_djswc","cw_jrbmyjkh_sjfjh","cw_jrbmyjkh_sjfwc","cw_jrbmyjkh_gxhjh","cw_jrbmyjkh_gxhwc","cw_jrbmyjkh_tcjh","cw_jrbmyjkh_tcwc","cw_jrbmyjkh_zcjh","cw_jrbmyjkh_zcwc","cw_jrbmyjkh_zjh","cw_jrbmyjkh_zwc","cw_jrbmyjkh_sfkh","cw_jrbmyjkh_khdf","cw_jrbmyjkh_khr","cw_jrbmyjkh_khsj","cw_jrbmyjkh_lrr","cw_jrbmyjkh_lrsj","cw_jrbmyjkh_bz"};
	pageObj.setDisColName(disColName);
*/

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
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">考核周期</td>
	<td  width="3%">考核起始时间</td>
	<td  width="3%">考核截至时间</td>
	<td  width="4%">分公司</td>
	<td  width="4%">所属部门</td>

	<td  width="2%">公司订金数计划</td>
	<td  width="4%">公司设计费计划</td>
	<td  width="4%">公司个性化计划</td>
	<td  width="4%">公司套餐计划</td>
	<td  width="4%">公司主材计划</td>
	<td  width="4%">公司总计划</td>

	<td  width="2%">集团订金数计划</td>
	<td  width="3%">集团设计费计划</td>
	<td  width="4%">集团个性化计划</td>
	<td  width="4%">集团套餐计划</td>
	<td  width="4%">集团主材计划</td>
	<td  width="4%">集团总计划</td>

	<td  width="2%">订金数完成</td>
	<td  width="3%">设计费完成</td>
	<td  width="4%">个性化完成</td>
	<td  width="4%">套餐完成</td>
	<td  width="4%">主材完成</td>
	<td  width="4%">总完成</td>

	<td  width="2%">是否考核</td>
	<td  width="2%">考核得分</td>
	<td  width="2%">考核人</td>
	<td  width="3%">考核时间</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="11%">备注</td>
</tr>
<%
	pageObj.printDateSum();
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