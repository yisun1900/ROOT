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
	String jdm_cpjjhs_cpjjhsbm=null;
	String jdm_cpjjhs_cpjjhs=null;
	String jdm_cpjjhs_cpjjczbm=null;
	jdm_cpjjhs_cpjjhsbm=request.getParameter("jdm_cpjjhs_cpjjhsbm");
	if (jdm_cpjjhs_cpjjhsbm!=null)
	{
		jdm_cpjjhs_cpjjhsbm=cf.GB2Uni(jdm_cpjjhs_cpjjhsbm);
		if (!(jdm_cpjjhs_cpjjhsbm.equals("")))	wheresql+=" and  (jdm_cpjjhs.cpjjhsbm='"+jdm_cpjjhs_cpjjhsbm+"')";
	}
	jdm_cpjjhs_cpjjhs=request.getParameter("jdm_cpjjhs_cpjjhs");
	if (jdm_cpjjhs_cpjjhs!=null)
	{
		jdm_cpjjhs_cpjjhs=cf.GB2Uni(jdm_cpjjhs_cpjjhs);
		if (!(jdm_cpjjhs_cpjjhs.equals("")))	wheresql+=" and  (jdm_cpjjhs.cpjjhs='"+jdm_cpjjhs_cpjjhs+"')";
	}
	jdm_cpjjhs_cpjjczbm=request.getParameter("jdm_cpjjhs_cpjjczbm");
	if (jdm_cpjjhs_cpjjczbm!=null)
	{
		jdm_cpjjhs_cpjjczbm=cf.GB2Uni(jdm_cpjjhs_cpjjczbm);
		if (!(jdm_cpjjhs_cpjjczbm.equals("")))	wheresql+=" and  (jdm_cpjjhs.cpjjczbm='"+jdm_cpjjhs_cpjjczbm+"')";
	}
	ls_sql="SELECT jdm_cpjjhs.cpjjhsbm,jdm_cpjjhs.cpjjhs,jdm_cpjjhs.cpjjczbm,jdm_cpjjcz.cpjjcz  ";
	ls_sql+=" FROM jdm_cpjjcz,jdm_cpjjhs  ";
    ls_sql+=" where jdm_cpjjhs.cpjjczbm=jdm_cpjjcz.cpjjczbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_cpjjhs.cpjjczbm,jdm_cpjjhs.cpjjhsbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jdm_cpjjhsList.jsp","SelectJdm_cpjjhs.jsp","","EditJdm_cpjjhs.jsp");
	pageObj.setPageRow(200);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cpjjhsbm","jdm_cpjjhs_cpjjhs","jdm_cpjjhs_cpjjczbm","jdm_cpjjcz_cpjjcz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cpjjhsbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jdm_cpjjhsList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cpjjczbm","1");//列参数对象加入Hash表
	spanColHash.put("cpjjcz","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] cpjjhsbm = request.getParameterValues("cpjjhsbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpjjhsbm,"cpjjhsbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jdm_cpjjhs where "+chooseitem;
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
	<td  width="14%">成品家具花色编码</td>
	<td  width="30%">成品家具花色</td>
	<td  width="14%">成品家具材质编码</td>
	<td  width="30%">成品家具材质</td>
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