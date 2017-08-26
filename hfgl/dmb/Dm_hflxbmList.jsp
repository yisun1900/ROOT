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
	String hflxbm=null;
	String hflxmc=null;
	String hfdl=null;
	String sjjg=null;
	String sfzdsz=null;
	hflxbm=request.getParameter("hflxbm");
	if (hflxbm!=null)
	{
		hflxbm=cf.GB2Uni(hflxbm);
		if (!(hflxbm.equals("")))	wheresql+=" and  (hflxbm='"+hflxbm+"')";
	}
	hflxmc=request.getParameter("hflxmc");
	if (hflxmc!=null)
	{
		hflxmc=cf.GB2Uni(hflxmc);
		if (!(hflxmc.equals("")))	wheresql+=" and  (hflxmc='"+hflxmc+"')";
	}
	hfdl=request.getParameter("hfdl");
	if (hfdl!=null)
	{
		hfdl=cf.GB2Uni(hfdl);
		if (!(hfdl.equals("")))	wheresql+=" and  (hfdl='"+hfdl+"')";
	}
	sjjg=request.getParameter("sjjg");
	if (sjjg!=null)
	{
		sjjg=sjjg.trim();
		if (!(sjjg.equals("")))	wheresql+=" and (sjjg="+sjjg+") ";
	}
	sfzdsz=request.getParameter("sfzdsz");
	if (sfzdsz!=null)
	{
		sfzdsz=sfzdsz.trim();
		if (!(sfzdsz.equals("")))	wheresql+=" and (sfzdsz="+sfzdsz+") ";
	}
	ls_sql="SELECT hflxbm,hflxmc, DECODE(hfdl,'1','咨询客户回访','2','在施工程回访','3','保修客户回访','4','投诉报修回访'),DECODE(sfzdsz,'1','自动','2','手动设置'),sjjg  ";
	ls_sql+=" FROM dm_hflxbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by hfdl,hflxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_hflxbmList.jsp","SelectDm_hflxbm.jsp","","EditDm_hflxbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hflxbm","hflxmc","hfdl","sjjg"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hflxbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_hflxbmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] hflxbm = request.getParameterValues("hflxbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hflxbm,"hflxbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_hflxbm where "+chooseitem;
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
	<td  width="12%">回访类型编码</td>
	<td  width="30%">回访类型名称</td>
	<td  width="22%">回访大类</td>
	<td  width="12%">是否自动设置</td>
	<td  width="18%">回访时间间隔(天数)</td>
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