<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String flbm=null;
	String flmc=null;
	String dj=null;
	flbm=request.getParameter("flbm");
	if (flbm!=null)
	{
		flbm=cf.GB2Uni(flbm);
		if (!(flbm.equals("")))	wheresql+=" and  (flbm='"+flbm+"')";
	}
	flmc=request.getParameter("flmc");
	if (flmc!=null)
	{
		flmc=cf.GB2Uni(flmc);
		if (!(flmc.equals("")))	wheresql+=" and  (flmc like '%"+flmc+"%')";
	}
	dj=request.getParameter("dj");
	if (dj!=null)
	{
		dj=dj.trim();
		if (!(dj.equals("")))	wheresql+=" and  (dj="+dj+") ";
	}
	ls_sql="SELECT dwmc,flbm,flmc,jldw,dj,DECODE(lx,'1','公司辅料','2','配送辅料')  ";
	ls_sql+=" FROM cw_flbm,sq_dwxx  ";
    ls_sql+=" where cw_flbm.ssfgs=sq_dwxx.dwbh(+)";
 	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cw_flbm.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_flbm.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by flbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_flbmList.jsp","","","EditCw_flbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"flbm","flmc","dj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"flbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_flbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String[] flbm = request.getParameterValues("flbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(flbm,"flbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_flbm where "+chooseitem;
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
  <B><font size="3">辅料编码－修改</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="13%">分公司</td>
	<td  width="10%">辅料编码</td>
	<td  width="40%">辅料名称</td>
	<td  width="10%">计量单位</td>
	<td  width="10%">单价</td>
	<td  width="12%">类型</td>
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