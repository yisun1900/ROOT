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
	String glmc=null;
	String cldlbm=null;
	String dqbm=null;

	String wlllbz=null;
	wlllbz=request.getParameter("wlllbz");
	if (wlllbz!=null)
	{
		wlllbz=cf.GB2Uni(wlllbz);
		if (!(wlllbz.equals("")))	wheresql+=" and  (bj_jscljgb.wlllbz='"+wlllbz+"')";
	}
	
	wlbm=request.getParameter("wlbm");
	if (wlbm!=null)
	{
		wlbm=cf.GB2Uni(wlbm);
		if (!(wlbm.equals("")))	wheresql+=" and  (bj_jscljgb.wlbm='"+wlbm+"')";
	}
	glmc=request.getParameter("glmc");
	if (glmc!=null)
	{
		glmc=cf.GB2Uni(glmc);
		if (!(glmc.equals("")))	wheresql+=" and  (bj_jscljgb.glmc like '%"+glmc+"%')";
	}
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (bj_jscljgb.cldlbm='"+cldlbm+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_jscljgb.dqbm='"+dqbm+"')";
	}
	ls_sql="SELECT dqmc,DECODE(wlllbz,'Y','需要','N','否'),cldlmc,wlbm,glmc,xhgg,pp,cljldwmc,dj,lrr,lrsj ";
	ls_sql+=" FROM bj_jscljgb,dm_dqbm,bdm_cldlbm,bdm_cljldwbm ";
	ls_sql+=" where ( bj_jscljgb.dqbm=dm_dqbm.dqbm and  bj_jscljgb.cldlbm=bdm_cldlbm.cldlbm(+) and bj_jscljgb.jldwbm=bdm_cljldwbm.cljldwbm(+))";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jscljgb.dqbm,wlbm";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_bjmbList.jsp","SelectBj_gzcljgb.jsp","","EditBj_gzclb.jsp?dqbm="+dqbm);
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqmc","cldlbm","wlbm","glmc","pp","xhgg","cljldwmc","dj","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"wlbm"};
	pageObj.setKey(keyName);
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">所属地区</td>
	<td  width="4%">需到物流领料</td>
	<td  width="15%">材料类别</td>
	<td  width="7%">结算材料编码</td>
    <td  width="16%">材料名称</td>
	<td  width="12%">型号规格</td>
	<td  width="15%">品牌</td>
	<td  width="6%">计量单位</td>
	<td  width="6%">单价</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
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