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
	String khzq=null;
	String ssfgs=null;
	String dwbh=null;
	String cw_jryjkh_yhmc=null;
	khzq=request.getParameter("khzq");
	if (khzq!=null)
	{
		khzq=cf.GB2Uni(khzq);
		if (!(khzq.equals("")))	wheresql+=" and  (cw_jryjkh.khzq='"+khzq+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (cw_jryjkh.fgsbh='"+ssfgs+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_jryjkh.dwbh='"+dwbh+"')";
	}
	cw_jryjkh_yhmc=request.getParameter("cw_jryjkh_yhmc");
	if (cw_jryjkh_yhmc!=null)
	{
		cw_jryjkh_yhmc=cf.GB2Uni(cw_jryjkh_yhmc);
		if (!(cw_jryjkh_yhmc.equals("")))	wheresql+=" and  (cw_jryjkh.yhmc='"+cw_jryjkh_yhmc+"')";
	}

	String sfkh=null;
	sfkh=request.getParameter("sfkh");
	if (sfkh!=null)
	{
		sfkh=cf.GB2Uni(sfkh);
		if (!(sfkh.equals("")))	wheresql+=" and  (cw_jryjkh.sfkh='"+sfkh+"')";
	}
	

	ls_sql="SELECT cw_jryjkh.khzq,cw_jryjkh.khqssj,cw_jryjkh.khjzsj,a.dwmc fgs,b.dwmc,DECODE(cw_jryjkh.sfkh,'N','未考核','Y','考核'),cw_jryjkh.yhmc,zwmc,cw_jryjkh.byrw,cw_jryjkh.byqds,cw_jryjkh.byyj,cw_jryjkh.dzkhbl||'%',cw_jryjkh.khr,cw_jryjkh.khsj,cw_jryjkh.lrr,cw_jryjkh.lrsj,cw_jryjkh.bz  ";
	ls_sql+=" FROM cw_jryjkh,sq_dwxx a,sq_dwxx b,dm_zwbm  ";
    ls_sql+=" where cw_jryjkh.fgsbh=a.dwbh(+)";
    ls_sql+=" and cw_jryjkh.dwbh=b.dwbh(+)";
    ls_sql+=" and cw_jryjkh.zw=dm_zwbm.zwbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jryjkh.khzq,cw_jryjkh.fgsbh,cw_jryjkh.dwbh,cw_jryjkh.zw,cw_jryjkh.yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jryjkhCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khzq","cw_jryjkh_khqssj","cw_jryjkh_khjzsj","cw_jryjkh_fgsbh","dwbh","sq_dwxx_dwmc","yhmc","cw_jryjkh_zw","cw_jryjkh_byrw","cw_jryjkh_byqds","cw_jryjkh_byyj","cw_jryjkh_dzkhbl","cw_jryjkh_lrr","cw_jryjkh_lrsj","cw_jryjkh_bz"};
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
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">考核周期</td>
	<td  width="6%">考核起始时间</td>
	<td  width="6%">考核截至时间</td>
	<td  width="8%">分公司</td>
	<td  width="8%">所属部门</td>
	<td  width="4%">是否考核</td>
	<td  width="4%">姓名</td>
	<td  width="6%">职务</td>
	<td  width="5%">本月任务</td>
	<td  width="5%">本月签单数</td>
	<td  width="5%">本月业绩</td>
	<td  width="4%">考核比例</td>
	<td  width="4%">考核人</td>
	<td  width="6%">考核时间</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="15%">备注</td>
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