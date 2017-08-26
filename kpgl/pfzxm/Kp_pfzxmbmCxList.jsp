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
	String kp_pfzxmbm_pfxmbm=null;
	String kp_pfzxmbm_xjlxbm=null;
	String kp_pfzxmbm_fz=null;
	kp_pfzxmbm_pfxmbm=request.getParameter("kp_pfzxmbm_pfxmbm");
	if (kp_pfzxmbm_pfxmbm!=null)
	{
		kp_pfzxmbm_pfxmbm=cf.GB2Uni(kp_pfzxmbm_pfxmbm);
		if (!(kp_pfzxmbm_pfxmbm.equals("")))	wheresql+=" and  (kp_pfzxmbm.pfxmbm='"+kp_pfzxmbm_pfxmbm+"')";
	}
	kp_pfzxmbm_xjlxbm=request.getParameter("kp_pfzxmbm_xjlxbm");
	if (kp_pfzxmbm_xjlxbm!=null)
	{
		kp_pfzxmbm_xjlxbm=cf.GB2Uni(kp_pfzxmbm_xjlxbm);
		if (!(kp_pfzxmbm_xjlxbm.equals("")))	wheresql+=" and  (kp_pfzxmbm.xjlxbm='"+kp_pfzxmbm_xjlxbm+"')";
	}
	kp_pfzxmbm_fz=request.getParameter("kp_pfzxmbm_fz");
	if (kp_pfzxmbm_fz!=null)
	{
		kp_pfzxmbm_fz=kp_pfzxmbm_fz.trim();
		if (!(kp_pfzxmbm_fz.equals("")))	wheresql+=" and (kp_pfzxmbm.fz="+kp_pfzxmbm_fz+") ";
	}
	ls_sql="SELECT kp_pfzxmbm.pfxmbm,kp_pfxmbm.pfxmmc,kp_pfzxmbm.xjlxbm,kp_xjlxbm.xjlxmc,kp_pfzxmbm.fz  ";
	ls_sql+=" FROM kp_xjlxbm,kp_pfxmbm,kp_pfzxmbm  ";
    ls_sql+=" where kp_pfzxmbm.xjlxbm=kp_xjlxbm.xjlxbm(+) and kp_pfzxmbm.pfxmbm=kp_pfxmbm.pfxmbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_pfzxmbm.pfxmbm,kp_pfzxmbm.xjlxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_pfzxmbmCxList.jsp","SelectCxKp_pfzxmbm.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pfxmbm","kp_pfxmbm_pfxmmc","xjlxbm","kp_xjlxbm_xjlxmc","kp_pfzxmbm_fz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pfxmbm","xjlxbm"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("pfxmbm","1");//列参数对象加入Hash表
	spanColHash.put("pfxmmc","1");//列参数对象加入Hash表
	spanColHash.put("xjlxbm","1");//列参数对象加入Hash表
	spanColHash.put("xjlxmc","1");//列参数对象加入Hash表
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
	<td  width="10%">评分项目编码</td>
	<td  width="30%">评分项目名称</td>
	<td  width="10%">巡检类型编码</td>
	<td  width="30%">巡检类型名称</td>
	<td  width="10%">分值</td>
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