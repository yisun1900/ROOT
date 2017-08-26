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
	pageObj.initPage("Dm_shxmbmList.jsp","SelectDm_shxmbm.jsp","","EditDm_shxmbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"shxmbm","dm_shxmbm_shxmmc","dm_shxmdlbm_shxmdlmc","dm_shxmxlbm_shxmxlmc","dm_shxmbm_kf"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"shxmbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_shxmbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("shxmdlmc","1");//列参数对象加入Hash表
	spanColHash.put("shxmxlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] shxmbm = request.getParameterValues("shxmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(shxmbm,"shxmbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_shxmbm where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
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
	<td  width="10%">&nbsp;</td>
	<td  width="16%">审核项目大类</td>
	<td  width="20%">审核项目小类</td>
	<td  width="10%">审核项目编码</td>
	<td  width="38%">审核项目名称</td>
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