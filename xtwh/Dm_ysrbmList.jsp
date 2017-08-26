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
	String ysrbm=null;
	String ysrmc=null;
	String ysrxx=null;
	String ysrsx=null;
	ysrbm=request.getParameter("ysrbm");
	if (ysrbm!=null)
	{
		ysrbm=cf.GB2Uni(ysrbm);
		if (!(ysrbm.equals("")))	wheresql+=" and  (ysrbm='"+ysrbm+"')";
	}
	ysrmc=request.getParameter("ysrmc");
	if (ysrmc!=null)
	{
		ysrmc=cf.GB2Uni(ysrmc);
		if (!(ysrmc.equals("")))	wheresql+=" and  (ysrmc='"+ysrmc+"')";
	}
	ysrxx=request.getParameter("ysrxx");
	if (ysrxx!=null)
	{
		ysrxx=ysrxx.trim();
		if (!(ysrxx.equals("")))	wheresql+=" and  (ysrxx="+ysrxx+") ";
	}
	ysrsx=request.getParameter("ysrsx");
	if (ysrsx!=null)
	{
		ysrsx=ysrsx.trim();
		if (!(ysrsx.equals("")))	wheresql+=" and  (ysrsx="+ysrsx+") ";
	}
	ls_sql="SELECT ysrbm,ysrmc,ysrxx,ysrsx  ";
	ls_sql+=" FROM dm_ysrbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by ysrbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_ysrbmList.jsp","SelectDm_ysrbm.jsp","","EditDm_ysrbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ysrbm","ysrmc","ysrxx","ysrsx"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ysrbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_ysrbmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] ysrbm = request.getParameterValues("ysrbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ysrbm,"ysrbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_ysrbm where "+chooseitem;
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
	<td  width="12%">月收入编码</td>
	<td  width="22%">月收入名称</td>
	<td  width="22%">月收入下限</td>
	<td  width="22%">月收入上限</td>
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