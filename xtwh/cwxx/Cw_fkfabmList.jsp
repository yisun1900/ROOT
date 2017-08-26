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
	String fkfabm=null;
	String fkfamc=null;
	fkfabm=request.getParameter("fkfabm");
	if (fkfabm!=null)
	{
		fkfabm=cf.GB2Uni(fkfabm);
		if (!(fkfabm.equals("")))	wheresql+=" and  (fkfabm='"+fkfabm+"')";
	}
	fkfamc=request.getParameter("fkfamc");
	if (fkfamc!=null)
	{
		fkfamc=cf.GB2Uni(fkfamc);
		if (!(fkfamc.equals("")))	wheresql+=" and  (fkfamc='"+fkfamc+"')";
	}
	ls_sql="SELECT fkfabm,fkfamc  ";
	ls_sql+=" FROM cw_fkfabm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_fkfabm.fkfabm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_fkfabmList.jsp","","","EditCw_fkfabm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"fkfabm","fkfamc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fkfabm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_fkfabmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"fkfabm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_fkfamx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("fkfabm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String[] fkfabm = request.getParameterValues("fkfabm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(fkfabm,"fkfabm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[3];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from cw_fkfamx where "+chooseitem;
		sql[1]="delete from cw_fgsfkfa where "+chooseitem;
		sql[2]="delete from cw_fkfabm where "+chooseitem;
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
	<td  width="24%">付款方案编码</td>
	<td  width="64%">付款方案名称</td>
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