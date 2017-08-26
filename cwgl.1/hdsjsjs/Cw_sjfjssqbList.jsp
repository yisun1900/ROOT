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
	String khbh=null;
	String sqr=null;
	String sqsj=null;
	String spr=null;
	String spsj=null;
	String clzt=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	sqr=request.getParameter("sqr");
	if (sqr!=null)
	{
		sqr=cf.GB2Uni(sqr);
		if (!(sqr.equals("")))	wheresql+=" and  (sqr='"+sqr+"')";
	}
	sqsj=request.getParameter("sqsj");
	if (sqsj!=null)
	{
		sqsj=sqsj.trim();
		if (!(sqsj.equals("")))	wheresql+="  and (sqsj>=TO_DATE('"+sqsj+"','YYYY/MM/DD'))";
	}
	sqsj=request.getParameter("sqsj2");
	if (sqsj!=null)
	{
		sqsj=sqsj.trim();
		if (!(sqsj.equals("")))	wheresql+="  and (sqsj<=TO_DATE('"+sqsj+"','YYYY/MM/DD'))";
	}
	spr=request.getParameter("spr");
	if (spr!=null)
	{
		spr=cf.GB2Uni(spr);
		if (!(spr.equals("")))	wheresql+=" and  (spr='"+spr+"')";
	}
	spsj=request.getParameter("spsj");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (spsj>=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	spsj=request.getParameter("spsj2");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (spsj<=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (clzt='"+clzt+"')";
	}
	ls_sql="SELECT khbh,sqr,sqsj,spr,spsj, DECODE(clzt,'1','申请','2','审批同意','3','审批不同意','4','结算'),bz  ";
	ls_sql+=" FROM cw_sjfjssqb  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sjfjssqbList.jsp","SelectCw_sjfjssqb.jsp","ViewCw_sjfjssqb.jsp","EditCw_sjfjssqb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","sqr","sqsj","spr","spsj","clzt","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_sjfjssqbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_sjfjssqb where "+chooseitem;
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
	<td  width="12%">客户编号</td>
	<td  width="12%">申请人</td>
	<td  width="12%">申请时间</td>
	<td  width="12%">审批人</td>
	<td  width="12%">审批时间</td>
	<td  width="12%">处理状态</td>
	<td  width="12%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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