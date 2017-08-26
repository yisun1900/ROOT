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
	String dm_tsyybm_tsyybm=null;
	String dm_tsyybm_tsyymc=null;
	String dm_tsyybm_tslxbm=null;
	String dm_tsyybm_tsxlbm=null;
	String dm_tsyybm_px=null;
	dm_tsyybm_tsyybm=request.getParameter("dm_tsyybm_tsyybm");
	if (dm_tsyybm_tsyybm!=null)
	{
		dm_tsyybm_tsyybm=cf.GB2Uni(dm_tsyybm_tsyybm);
		if (!(dm_tsyybm_tsyybm.equals("")))	wheresql+=" and  (dm_tsyybm.tsyybm='"+dm_tsyybm_tsyybm+"')";
	}
	dm_tsyybm_tsyymc=request.getParameter("dm_tsyybm_tsyymc");
	if (dm_tsyybm_tsyymc!=null)
	{
		dm_tsyybm_tsyymc=cf.GB2Uni(dm_tsyybm_tsyymc);
		if (!(dm_tsyybm_tsyymc.equals("")))	wheresql+=" and  (dm_tsyybm.tsyymc='"+dm_tsyybm_tsyymc+"')";
	}
	dm_tsyybm_tslxbm=request.getParameter("dm_tsyybm_tslxbm");
	if (dm_tsyybm_tslxbm!=null)
	{
		dm_tsyybm_tslxbm=cf.GB2Uni(dm_tsyybm_tslxbm);
		if (!(dm_tsyybm_tslxbm.equals("")))	wheresql+=" and  (dm_tsyybm.tslxbm='"+dm_tsyybm_tslxbm+"')";
	}
	dm_tsyybm_tsxlbm=request.getParameter("dm_tsyybm_tsxlbm");
	if (dm_tsyybm_tsxlbm!=null)
	{
		dm_tsyybm_tsxlbm=cf.GB2Uni(dm_tsyybm_tsxlbm);
		if (!(dm_tsyybm_tsxlbm.equals("")))	wheresql+=" and  (dm_tsyybm.tsxlbm='"+dm_tsyybm_tsxlbm+"')";
	}
	dm_tsyybm_px=request.getParameter("dm_tsyybm_px");
	if (dm_tsyybm_px!=null)
	{
		dm_tsyybm_px=dm_tsyybm_px.trim();
		if (!(dm_tsyybm_px.equals("")))	wheresql+=" and (dm_tsyybm.px="+dm_tsyybm_px+") ";
	}
	ls_sql="SELECT dm_tsyybm.tsyybm,dm_tsyybm.tsyymc,dm_tsyybm.zjkf,dm_tsyybm.px,dm_tsxlbm.tsxlmc,dm_tslxbm.tslxmc  ";
	ls_sql+=" FROM dm_tsxlbm,dm_tslxbm,dm_tsyybm  ";
    ls_sql+=" where dm_tsyybm.tsxlbm=dm_tsxlbm.tsxlbm(+) and dm_tsyybm.tslxbm=dm_tslxbm.tslxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by  dm_tsyybm.tslxbm,dm_tsyybm.tsxlbm,dm_tsyybm.tsyybm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_tsyybmList.jsp","SelectDm_tsyybm.jsp","","EditDm_tsyybm.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tsyybm","dm_tsyybm_tsyymc","dm_tslxbm_tslxmc","dm_tsxlbm_tsxlmc","dm_tsyybm_px"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tsyybm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_tsyybmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("tsxlmc","1");//列参数对象加入Hash表
	spanColHash.put("tslxmc","2");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] tsyybm = request.getParameterValues("tsyybm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(tsyybm,"tsyybm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_tsyybm where "+chooseitem;
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
	<td  width="0%">&nbsp;</td>
	<td  width="15%">投诉报修原因编码</td>
	<td  width="23%">投诉报修原因名称</td>
	<td  width="10%">质检扣分</td>
	<td  width="10%">显示顺序</td>
	<td  width="18%">投诉报修小类</td>
	<td  width="15%">投诉报修大类</td>
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