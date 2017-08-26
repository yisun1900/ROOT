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
	String jkbbh=null;
	String bjkgsmc=null;
	String xxlybm=null;
	String bcsj=null;
	String gggs=null;
	String dwbh=null;
	jkbbh=request.getParameter("jkbbh");
	if (jkbbh!=null)
	{
		jkbbh=cf.GB2Uni(jkbbh);
		if (!(jkbbh.equals("")))	wheresql+=" and  (jkbbh='"+jkbbh+"')";
	}
	bjkgsmc=request.getParameter("bjkgsbh");
	if (bjkgsmc!=null)
	{
		bjkgsmc=cf.GB2Uni(bjkgsmc);
		if (!(bjkgsmc.equals("")))	wheresql+=" and  (bjkgsbh='"+bjkgsmc+"')";
	}
	xxlybm=request.getParameter("xxlybm");
	if (xxlybm!=null)
	{
		xxlybm=cf.GB2Uni(xxlybm);
		if (!(xxlybm.equals("")))	wheresql+=" and  (xxlybm='"+xxlybm+"')";
	}
	bcsj=request.getParameter("bcsj");
	if (bcsj!=null)
	{
		bcsj=bcsj.trim();
		if (!(bcsj.equals("")))	wheresql+="  and (bcsj>=TO_DATE('"+bcsj+"','YYYY/MM/DD'))";
	}
	bcsj=request.getParameter("bcsj2");
	if (bcsj!=null)
	{
		bcsj=bcsj.trim();
		if (!(bcsj.equals("")))	wheresql+="  and (bcsj<=TO_DATE('"+bcsj+"','YYYY/MM/DD'))";
	}
	gggs=request.getParameter("gggs");
	if (gggs!=null)
	{
		gggs=cf.GB2Uni(gggs);
		if (!(gggs.equals("")))	wheresql+=" and  (gggs='"+gggs+"')";
	}
	dwbh=request.getParameter("dwbh");
	//out.println(dwbh);
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_dwxx.dwbh='"+dwbh+"')";
	}
	ls_sql="SELECT qh_mtjk.jkbbh,qh_bjkgsdm.bjkgsmc,dm_xxlybm.xxlymc,qh_mtjk.bcsj,qh_mtjk.gggs,qh_mtjk.yjjg,qh_mtjk.bz,sq_dwxx.dwmc  ";
	ls_sql+=" FROM qh_mtjk,sq_dwxx,dm_xxlybm,qh_bjkgsdm ";
    ls_sql+=" where (qh_bjkgsdm.bjkgsbh =qh_mtjk.bjkgsbh) and (qh_mtjk.dwbh=sq_dwxx.dwbh(+)) and (qh_mtjk.xxlybm=dm_xxlybm.xxlybm(+)) ";
    ls_sql+=wheresql;
	//out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Qh_mtjkList.jsp","SelectQh_mtjk.jsp","ViewQh_mtjk.jsp","EditQh_mtjk.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jkbbh","bjkgsmc","xxlymc","bcsj","gggs","yjjg","bz","dwbh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jkbbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Qh_mtjkList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] jkbbh = request.getParameterValues("jkbbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jkbbh,"jkbbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from qh_mtjk where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="11%">监控表编号</td>
	<td  width="11%">被监控公司名称</td>
	<td  width="11%">广告形式</td>
	<td  width="11%">播出时间</td>
	<td  width="11%">广告公司</td>
	<td  width="11%">预计价格</td>
	<td  width="11%">备注</td>
	<td  width="11%">填表单位名称</td>
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