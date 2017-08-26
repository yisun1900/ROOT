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
	String cpztbm=null;
	String cpztmc=null;
	String cplx=null;
	String ghf=null;
	cpztbm=request.getParameter("cpztbm");
	if (cpztbm!=null)
	{
		cpztbm=cf.GB2Uni(cpztbm);
		if (!(cpztbm.equals("")))	wheresql+=" and  (cpztbm='"+cpztbm+"')";
	}
	cpztmc=request.getParameter("cpztmc");
	if (cpztmc!=null)
	{
		cpztmc=cf.GB2Uni(cpztmc);
		if (!(cpztmc.equals("")))	wheresql+=" and  (cpztmc='"+cpztmc+"')";
	}
	cplx=request.getParameter("cplx");
	if (cplx!=null)
	{
		cplx=cf.GB2Uni(cplx);
		if (!(cplx.equals("")))	wheresql+=" and  (cplx='"+cplx+"')";
	}
	ghf=request.getParameter("ghf");
	if (ghf!=null)
	{
		ghf=cf.GB2Uni(ghf);
		if (!(ghf.equals("")))	wheresql+=" and  (ghf='"+ghf+"')";
	}
	ls_sql="SELECT ztxh,cpztbm,cpztmc, DECODE(cplx,'0','全部','1','定制品','2','成品') cplx,ghf  ";
	ls_sql+=" FROM dm_cpztbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by ghf,cplx,cpztbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_cpztbmList.jsp","","","EditDm_cpztbm.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cpztbm","cpztmc","cplx"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cpztbm"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cplx","1");//列参数对象加入Hash表
	spanColHash.put("ghf","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_cpztbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String[] cpztbm = request.getParameterValues("cpztbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpztbm,"cpztbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_cpztbm where "+chooseitem;
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
	<td  width="9%">状态序号</td>
	<td  width="12%">产品状态编码</td>
	<td  width="47%">产品状态名称</td>
	<td  width="12%">产品类型</td>
	<td  width="12%">供货方</td>
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