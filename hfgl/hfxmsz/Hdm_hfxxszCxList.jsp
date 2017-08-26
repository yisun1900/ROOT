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
	String hdm_hfxxsz_hflxbm=null;
	String hdm_hfxxsz_dxpjzbbm=null;
	String hdm_hfxxsz_hfdxbm=null;
	hdm_hfxxsz_hflxbm=request.getParameter("hdm_hfxxsz_hflxbm");
	if (hdm_hfxxsz_hflxbm!=null)
	{
		hdm_hfxxsz_hflxbm=cf.GB2Uni(hdm_hfxxsz_hflxbm);
		if (!(hdm_hfxxsz_hflxbm.equals("")))	wheresql+=" and  (hdm_hfxxsz.hflxbm='"+hdm_hfxxsz_hflxbm+"')";
	}
	hdm_hfxxsz_dxpjzbbm=request.getParameter("hdm_hfxxsz_dxpjzbbm");
	if (hdm_hfxxsz_dxpjzbbm!=null)
	{
		hdm_hfxxsz_dxpjzbbm=cf.GB2Uni(hdm_hfxxsz_dxpjzbbm);
		if (!(hdm_hfxxsz_dxpjzbbm.equals("")))	wheresql+=" and  (hdm_hfxxsz.dxpjzbbm='"+hdm_hfxxsz_dxpjzbbm+"')";
	}
	hdm_hfxxsz_hfdxbm=request.getParameter("hdm_hfxxsz_hfdxbm");
	if (hdm_hfxxsz_hfdxbm!=null)
	{
		hdm_hfxxsz_hfdxbm=cf.GB2Uni(hdm_hfxxsz_hfdxbm);
		if (!(hdm_hfxxsz_hfdxbm.equals("")))	wheresql+=" and  (hdm_dxpjzb.hfdxbm='"+hdm_hfxxsz_hfdxbm+"')";
	}
	ls_sql="SELECT dm_hflxbm.hflxmc,hfdxmc,dxpjzb";
	ls_sql+=" FROM dm_hflxbm,hdm_hfxxsz,hdm_dxpjzb,hdm_hfdxbm  ";
    ls_sql+=" where hdm_hfxxsz.hflxbm=dm_hflxbm.hflxbm(+)";
    ls_sql+=" and hdm_hfxxsz.dxpjzbbm=hdm_dxpjzb.dxpjzbbm(+)";
    ls_sql+=" and hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hdm_hfxxsz.hflxbm,hdm_dxpjzb.hfdxbm,hdm_hfxxsz.dxpjzbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hdm_hfxxszCxList.jsp","","","");
	pageObj.setPageRow(300);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hflxmc","1");//列参数对象加入Hash表
	spanColHash.put("hfdxmc","1");//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">回访类型</td>
	<td  width="40%">回访对象</td>
	<td  width="40%">回访对象评价指标</td>
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