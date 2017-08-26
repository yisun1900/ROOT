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
	String ppbm=null;
	String ppmc=null;
	String clxl=null;
	String scsmc=null;

	String cldl=null;
	cldl=request.getParameter("cldl");
	if (cldl!=null)
	{
		cldl=cf.GB2Uni(cldl);
		if (!(cldl.equals("")))	wheresql+=" and  (jxc_ppxx.cldl='"+cldl+"')";
	}
	String pplb=null;
	pplb=request.getParameter("pplb");
	if (pplb!=null)
	{
		pplb=pplb.trim();
		if (!(pplb.equals("")))	wheresql+=" and (jxc_ppxx.pplb="+pplb+") ";
	}
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=ppbm.trim();
		if (!(ppbm.equals("")))	wheresql+=" and (ppbm="+ppbm+") ";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (ppmc like '%"+ppmc+"%')";
	}
	clxl=request.getParameter("clxl");
	if (clxl!=null)
	{
		clxl=cf.GB2Uni(clxl);
		if (!(clxl.equals("")))	wheresql+=" and  (clxl='"+clxl+"')";
	}
	scsmc=request.getParameter("scsmc");
	if (scsmc!=null)
	{
		scsmc=cf.GB2Uni(scsmc);
		if (!(scsmc.equals("")))	wheresql+=" and  (scsmc='"+scsmc+"')";
	}

	ls_sql="SELECT ppbm,ppmc,scsmc,cldl,clxl,tcycf,DECODE(sfxcl,'Y','需要','N','否'),DECODE(sfkgtcsl,'Y','可以','N','否'),DECODE(pplb,'1','主材','2','辅材'),bz  ";
	ls_sql+=" FROM jxc_ppxx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
	ls_sql+=" order by pplb,cldl,clxl,scsmc,ppmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_ppxxList.jsp","","","EditJxc_ppxx.jsp");
	pageObj.setPageRow(200);//设置每页显示记录数

//设置主键
	String[] keyName={"ppbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jxc_ppxxList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String[] ppbm = request.getParameterValues("ppbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ppbm,"ppbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from jxc_ppxx where "+chooseitem;
		sql[1]="delete from jxc_ppgysdzb where "+chooseitem;
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
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">子品牌编码</td>
	<td  width="14%">子品牌名称</td>
	<td  width="11%">品牌名称</td>
	<td  width="13%">材料大类</td>
	<td  width="11%">材料小类</td>
	<td  width="6%">套餐远程费</td>
	<td  width="6%">是否需测量</td>
	<td  width="6%">是否可改套餐数量</td>
	<td  width="6%">子品牌类别</td>
	<td  width="20%">备注</td>
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