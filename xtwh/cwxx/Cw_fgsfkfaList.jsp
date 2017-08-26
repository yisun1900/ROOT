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
	String cw_fgsfkfa_fgsbh=null;
	String cw_fgsfkfa_fkfabm=null;
	cw_fgsfkfa_fgsbh=request.getParameter("cw_fgsfkfa_fgsbh");
	if (cw_fgsfkfa_fgsbh!=null)
	{
		cw_fgsfkfa_fgsbh=cf.GB2Uni(cw_fgsfkfa_fgsbh);
		if (!(cw_fgsfkfa_fgsbh.equals("")))	wheresql+=" and  (cw_fgsfkfa.fgsbh='"+cw_fgsfkfa_fgsbh+"')";
	}
	cw_fgsfkfa_fkfabm=request.getParameter("cw_fgsfkfa_fkfabm");
	if (cw_fgsfkfa_fkfabm!=null)
	{
		cw_fgsfkfa_fkfabm=cf.GB2Uni(cw_fgsfkfa_fkfabm);
		if (!(cw_fgsfkfa_fkfabm.equals("")))	wheresql+=" and  (cw_fgsfkfa.fkfabm='"+cw_fgsfkfa_fkfabm+"')";
	}
	ls_sql="SELECT cw_fgsfkfa.fgsbh,dwmc,cw_fgsfkfa.fkfabm,fkfamc  ";
	ls_sql+=" FROM cw_fgsfkfa,cw_fkfabm,sq_dwxx  ";
    ls_sql+=" where cw_fgsfkfa.fgsbh=sq_dwxx.dwbh(+) and cw_fgsfkfa.fkfabm=cw_fkfabm.fkfabm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_fgsfkfa.fgsbh,cw_fgsfkfa.fkfabm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_fgsfkfaList.jsp","","","EditCw_fgsfkfa.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"fgsbh","fkfabm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fgsbh","fkfabm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_fgsfkfaList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_fgsfkfa where "+chooseitem;
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
	<td  width="12%">分公司编号</td>
	<td  width="30%">分公司</td>
	<td  width="12%">付款方案编码</td>
	<td  width="34%">付款方案</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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