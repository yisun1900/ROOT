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
	String dm_shxmbm_shxmbm=null;
	String dm_shxmbm_shxmmc=null;
	String dm_shxmbm_shxmdlbm=null;
	String dm_shxmbm_shxmxlbm=null;
	String dm_shxmbm_kf=null;
	dm_shxmbm_shxmbm=request.getParameter("dm_shxmbm_shxmbm");
	if (dm_shxmbm_shxmbm!=null)
	{
		dm_shxmbm_shxmbm=cf.GB2Uni(dm_shxmbm_shxmbm);
		if (!(dm_shxmbm_shxmbm.equals("")))	wheresql+=" and  (dm_shxmbm.shxmbm='"+dm_shxmbm_shxmbm+"')";
	}
	dm_shxmbm_shxmmc=request.getParameter("dm_shxmbm_shxmmc");
	if (dm_shxmbm_shxmmc!=null)
	{
		dm_shxmbm_shxmmc=cf.GB2Uni(dm_shxmbm_shxmmc);
		if (!(dm_shxmbm_shxmmc.equals("")))	wheresql+=" and  (dm_shxmbm.shxmmc like '%"+dm_shxmbm_shxmmc+"%')";
	}
	dm_shxmbm_shxmdlbm=request.getParameter("dm_shxmbm_shxmdlbm");
	if (dm_shxmbm_shxmdlbm!=null)
	{
		dm_shxmbm_shxmdlbm=cf.GB2Uni(dm_shxmbm_shxmdlbm);
		if (!(dm_shxmbm_shxmdlbm.equals("")))	wheresql+=" and  (dm_shxmbm.shxmdlbm='"+dm_shxmbm_shxmdlbm+"')";
	}
	dm_shxmbm_shxmxlbm=request.getParameter("dm_shxmbm_shxmxlbm");
	if (dm_shxmbm_shxmxlbm!=null)
	{
		dm_shxmbm_shxmxlbm=cf.GB2Uni(dm_shxmbm_shxmxlbm);
		if (!(dm_shxmbm_shxmxlbm.equals("")))	wheresql+=" and  (dm_shxmbm.shxmxlbm='"+dm_shxmbm_shxmxlbm+"')";
	}
	dm_shxmbm_kf=request.getParameter("dm_shxmbm_kf");
	if (dm_shxmbm_kf!=null)
	{
		dm_shxmbm_kf=dm_shxmbm_kf.trim();
		if (!(dm_shxmbm_kf.equals("")))	wheresql+=" and (dm_shxmbm.kf="+dm_shxmbm_kf+") ";
	}
	ls_sql="SELECT shxmdlmc,shxmxlmc,dm_shxmbm.shxmbm,dm_shxmbm.shxmmc,dm_shxmbm.kf  ";
	ls_sql+=" FROM dm_shxmbm,dm_shxmdlbm,dm_shxmxlbm  ";
    ls_sql+=" where dm_shxmbm.shxmxlbm=dm_shxmxlbm.shxmxlbm and dm_shxmbm.shxmdlbm=dm_shxmdlbm.shxmdlbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_shxmbm.shxmdlbm,dm_shxmbm.shxmxlbm,shxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_shxmbmCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"shxmbm","dm_shxmbm_shxmmc","dm_shxmdlbm_shxmdlmc","dm_shxmxlbm_shxmxlmc","dm_shxmbm_kf"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"shxmbm"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("shxmdlmc","1");//列参数对象加入Hash表
	spanColHash.put("shxmxlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">查询合同审核项目</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="16%">项目大类</td>
	<td  width="20%">项目小类</td>
	<td  width="10%">项目编码</td>
	<td  width="48%">项目名称</td>
	<td  width="6%">扣分</td>
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