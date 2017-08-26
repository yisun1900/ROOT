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
	ls_sql="SELECT jdm_cpjjcz.cpjjcz,jdm_cpjjhs.cpjjhs  ";
	ls_sql+=" FROM jdm_cpjjcz,jdm_cpjjhs  ";
    ls_sql+=" where jdm_cpjjhs.cpjjczbm=jdm_cpjjcz.cpjjczbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_cpjjhs.cpjjczbm,jdm_cpjjhs.cpjjhsbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jdm_cpjjhsCxList.jsp","SelectCxJdm_cpjjhs.jsp","","");
	pageObj.setPageRow(200);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cpjjhsbm","jdm_cpjjhs_cpjjhs","jdm_cpjjhs_cpjjczbm","jdm_cpjjcz_cpjjcz"};
	pageObj.setDisColName(disColName);
*/


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cpjjcz","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">成品家具花色纹理查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(70);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="30%">成品家具材质</td>
	<td  width="40%">成品家具花色</td>
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