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
	String zqs=null;
	String yy_rqsd_szs=null;
	String yy_rqsd_sze=null;
	String yy_rqsd_bzs=null;
	String yy_rqsd_bze=null;
	String lrr=null;
	String lrsj=null;
	zqs=request.getParameter("zqs");
	if (zqs!=null)
	{
		zqs=zqs.trim();
		if (!(zqs.equals("")))	wheresql+=" and (zqs="+zqs+") ";
	}
	yy_rqsd_szs=request.getParameter("yy_rqsd_szs");
	if (yy_rqsd_szs!=null)
	{
		yy_rqsd_szs=yy_rqsd_szs.trim();
		if (!(yy_rqsd_szs.equals("")))	wheresql+="  and (yy_rqsd_szs=TO_DATE('"+yy_rqsd_szs+"','YYYY/MM/DD'))";
	}
	yy_rqsd_sze=request.getParameter("yy_rqsd_sze");
	if (yy_rqsd_sze!=null)
	{
		yy_rqsd_sze=yy_rqsd_sze.trim();
		if (!(yy_rqsd_sze.equals("")))	wheresql+="  and (yy_rqsd_sze=TO_DATE('"+yy_rqsd_sze+"','YYYY/MM/DD'))";
	}
	yy_rqsd_bzs=request.getParameter("yy_rqsd_bzs");
	if (yy_rqsd_bzs!=null)
	{
		yy_rqsd_bzs=yy_rqsd_bzs.trim();
		if (!(yy_rqsd_bzs.equals("")))	wheresql+="  and (yy_rqsd_bzs=TO_DATE('"+yy_rqsd_bzs+"','YYYY/MM/DD'))";
	}
	yy_rqsd_bze=request.getParameter("yy_rqsd_bze");
	if (yy_rqsd_bze!=null)
	{
		yy_rqsd_bze=yy_rqsd_bze.trim();
		if (!(yy_rqsd_bze.equals("")))	wheresql+="  and (yy_rqsd_bze=TO_DATE('"+yy_rqsd_bze+"','YYYY/MM/DD'))";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT zqs,yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze,lrr,lrsj  ";
	ls_sql+=" FROM yy_rqsd  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_rqsd_szs";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yy_rqsdList.jsp","","","EditYy_rqsd.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zqs","yy_rqsd_szs","yy_rqsd_sze","yy_rqsd_bzs","yy_rqsd_bze","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zqs"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Yy_rqsdList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] zqs = request.getParameterValues("zqs");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zqs,"zqs"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from yy_rqsd where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="12%">周期数</td>
	<td  width="14%">上周日期开始</td>
	<td  width="14%">上周日期结束</td>
	<td  width="14%">本周日期开始</td>
	<td  width="14%">本周日期结束</td>
	<td  width="12%">录入人</td>
	<td  width="12%">录入时间</td>
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