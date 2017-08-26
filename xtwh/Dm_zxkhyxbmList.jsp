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
	String zxkhyxbm=null;
	String zxkhyxmc=null;
	zxkhyxbm=request.getParameter("zxkhyxbm");
	if (zxkhyxbm!=null)
	{
		zxkhyxbm=cf.GB2Uni(zxkhyxbm);
		if (!(zxkhyxbm.equals("")))	wheresql+=" and  (zxkhyxbm='"+zxkhyxbm+"')";
	}
	zxkhyxmc=request.getParameter("zxkhyxmc");
	if (zxkhyxmc!=null)
	{
		zxkhyxmc=cf.GB2Uni(zxkhyxmc);
		if (!(zxkhyxmc.equals("")))	wheresql+=" and  (zxkhyxmc='"+zxkhyxmc+"')";
	}
	ls_sql="SELECT zxkhyxbm,zxkhyxmc  ";
	ls_sql+=" FROM dm_zxkhyxbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by zxkhyxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_zxkhyxbmList.jsp","","","EditDm_zxkhyxbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zxkhyxbm","zxkhyxmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zxkhyxbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_zxkhyxbmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] zxkhyxbm = request.getParameterValues("zxkhyxbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zxkhyxbm,"zxkhyxbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_zxkhyxbm where "+chooseitem;
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
	<td  width="24%">客户意向编码</td>
	<td  width="64%">客户意向名称</td>
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