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
	String wlbm=null;
	String jswlbm=null;
	String glmc=null;
	String cldlbm=null;
	String dqbm=null;

	String qrbz=null;
	qrbz=request.getParameter("qrbz");
	if (qrbz!=null)
	{
		qrbz=cf.GB2Uni(qrbz);
		if (!(qrbz.equals("")))	wheresql+=" and  (bj_jzcljgb.qrbz='"+qrbz+"')";
	}

	wlbm=request.getParameter("wlbm");
	if (wlbm!=null)
	{
		wlbm=cf.GB2Uni(wlbm);
		if (!(wlbm.equals("")))	wheresql+=" and  (bj_jzcljgb.wlbm='"+wlbm+"')";
	}
	jswlbm=request.getParameter("jswlbm");
	if (jswlbm!=null)
	{
		jswlbm=cf.GB2Uni(jswlbm);
		if (!(jswlbm.equals("")))	wheresql+=" and  (bj_jzcljgb.jswlbm='"+jswlbm+"')";
	}
	glmc=request.getParameter("glmc");
	if (glmc!=null)
	{
		glmc=cf.GB2Uni(glmc);
		if (!(glmc.equals("")))	wheresql+=" and  (bj_jzcljgb.glmc like '%"+glmc+"%')";
	}
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (bj_jzcljgb.cldlbm='"+cldlbm+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_jzcljgb.dqbm='"+dqbm+"')";
	}
	ls_sql="SELECT dqmc,DECODE(qrbz,'N','未确认','Y','确认'),cldlmc,bj_jzcljgb.wlbm,bj_jzcljgb.glmc,bj_jzcljgb.xhgg,bj_jzcljgb.pp,a.cljldwmc jldwbm,bj_jzcljgb.dj,bj_jzcljgb.jswlbm,bj_jscljgb.glmc||NVL2(bj_jscljgb.pp,'('||bj_jscljgb.pp||')',''),b.cljldwmc jsjldwbm,bj_jzcljgb.wljsbz,bj_jzcljgb.lrr,bj_jzcljgb.lrsj ";
	ls_sql+=" FROM bj_jzcljgb,dm_dqbm,bdm_cldlbm,bdm_cljldwbm a,bdm_cljldwbm b,bj_jscljgb ";
	ls_sql+=" where bj_jzcljgb.dqbm=dm_dqbm.dqbm and  bj_jzcljgb.cldlbm=bdm_cldlbm.cldlbm(+)";
	ls_sql+=" and bj_jzcljgb.jldwbm=a.cljldwbm(+) and bj_jzcljgb.jsjldwbm=b.cljldwbm(+) and bj_jzcljgb.jswlbm=bj_jscljgb.wlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jzcljgb.dqbm,bj_jzcljgb.wlbm";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_bjmbCxList.jsp","SelectCxBj_gzcljgb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqmc","cldlbm","wlbm","glmc","pp","xhgg","cljldwmc","dj","lrr","lrsj"};
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
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">所属地区</td>
	<td  width="3%">确认标志</td>
	<td  width="9%">材料类别</td>
	<td  width="6%">物流材料编码</td>
    <td  width="13%">物流材料名称</td>
	<td  width="10%">型号规格</td>
	<td  width="12%">品牌</td>
	<td  width="3%">物流计量单位</td>
	<td  width="4%">单价</td>
	<td  width="4%">结算材料编码</td>
	<td  width="17%">结算物料名称</td>
	<td  width="3%">结算计量单位</td>
	<td  width="4%">物流结算计量单位比</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
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