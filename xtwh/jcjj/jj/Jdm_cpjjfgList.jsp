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
	String cpjjfgbm=null;
	String cpjjfg=null;
	cpjjfgbm=request.getParameter("cpjjfgbm");
	if (cpjjfgbm!=null)
	{
		cpjjfgbm=cf.GB2Uni(cpjjfgbm);
		if (!(cpjjfgbm.equals("")))	wheresql+=" and  (cpjjfgbm='"+cpjjfgbm+"')";
	}
	cpjjfg=request.getParameter("cpjjfg");
	if (cpjjfg!=null)
	{
		cpjjfg=cf.GB2Uni(cpjjfg);
		if (!(cpjjfg.equals("")))	wheresql+=" and  (cpjjfg='"+cpjjfg+"')";
	}
	ls_sql="SELECT cpjjfgbm,cpjjfg  ";
	ls_sql+=" FROM jdm_cpjjfg  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by cpjjfgbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jdm_cpjjfgList.jsp","SelectJdm_cpjjfg.jsp","","EditJdm_cpjjfg.jsp");
	pageObj.setPageRow(200);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cpjjfgbm","cpjjfg"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cpjjfgbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jdm_cpjjfgList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] cpjjfgbm = request.getParameterValues("cpjjfgbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpjjfgbm,"cpjjfgbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jdm_cpjjfg where "+chooseitem;
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
	<td  width="24%">成品家具风格编码</td>
	<td  width="64%">成品家具风格</td>
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