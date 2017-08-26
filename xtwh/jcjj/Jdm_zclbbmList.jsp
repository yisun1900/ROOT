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
	String jdm_zclbbm_zclbbm=null;
	String jdm_zclbbm_zclbmc=null;
	String jdm_zclbbm_ppbm=null;
	jdm_zclbbm_zclbbm=request.getParameter("jdm_zclbbm_zclbbm");
	if (jdm_zclbbm_zclbbm!=null)
	{
		jdm_zclbbm_zclbbm=cf.GB2Uni(jdm_zclbbm_zclbbm);
		if (!(jdm_zclbbm_zclbbm.equals("")))	wheresql+=" and  (jdm_zclbbm.zclbbm='"+jdm_zclbbm_zclbbm+"')";
	}
	jdm_zclbbm_zclbmc=request.getParameter("jdm_zclbbm_zclbmc");
	if (jdm_zclbbm_zclbmc!=null)
	{
		jdm_zclbbm_zclbmc=cf.GB2Uni(jdm_zclbbm_zclbmc);
		if (!(jdm_zclbbm_zclbmc.equals("")))	wheresql+=" and  (jdm_zclbbm.zclbmc='"+jdm_zclbbm_zclbmc+"')";
	}
	jdm_zclbbm_ppbm=request.getParameter("jdm_zclbbm_ppbm");
	if (jdm_zclbbm_ppbm!=null)
	{
		jdm_zclbbm_ppbm=cf.GB2Uni(jdm_zclbbm_ppbm);
		if (!(jdm_zclbbm_ppbm.equals("")))	wheresql+=" and  (jdm_zclbbm.ppbm='"+jdm_zclbbm_ppbm+"')";
	}
	ls_sql="SELECT jdm_ppbm.ppmc,jdm_zclbbm.zclbbm,jdm_zclbbm.zclbmc ";
	ls_sql+=" FROM jdm_zclbbm,jdm_ppbm  ";
    ls_sql+=" where jdm_zclbbm.ppbm=jdm_ppbm.ppbm";
    ls_sql+=wheresql;
	ls_sql+=" order by jdm_zclbbm.ppbm,jdm_zclbbm.zclbbm ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jdm_zclbbmList.jsp","SelectJdm_zclbbm.jsp","","EditJdm_zclbbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zclbbm","jdm_zclbbm_zclbmc","jdm_ppbm_ppmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zclbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jdm_zclbbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ppmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] zclbbm = request.getParameterValues("zclbbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(zclbbm,"zclbbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jdm_zclbbm where "+chooseitem;
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
	<td  width="10%">&nbsp;</td>
	<td  width="15%">品牌名称</td>
	<td  width="19%">类别系列编码</td>
	<td  width="49%">类别系列名称</td>
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