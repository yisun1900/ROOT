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

	String yhdlm=request.getParameter("yhdlm");
	String ip=request.getParameter("ip");

	ls_sql="SELECT sq_xtrz.xh,sq_xtrz.ip,sq_xtrz.yhdlm,sq_yhxx.yhmc,sq_yhxx.xzzwbm,sq_xtrz.dlsj,sq_xtrz.tcsj,b.dwmc xxx,a.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,sq_xtrz,sq_dwxx b,sq_dwxx a  ";
    ls_sql+=" where sq_xtrz.yhdlm=sq_yhxx.yhdlm(+) and sq_yhxx.dwbh=b.dwbh(+) and sq_yhxx.ssfgs=a.dwbh(+)";
    ls_sql+=" and  sq_xtrz.yhdlm='"+yhdlm+"'";
    ls_sql+=" and  sq_xtrz.ip='"+ip+"'";
    ls_sql+=" order by sq_xtrz.ip,sq_xtrz.dlsj ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("ViewSq_xtrz.jsp","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">序号</td>
	<td  width="13%">IP地址</td>
	<td  width="12%">用户登陆名</td>
	<td  width="8%">用户名称</td>
	<td  width="9%">职务</td>
	<td  width="16%">登陆时间</td>
	<td  width="10%">退出时间</td>
	<td  width="14%">所属单位</td>
	<td  width="14%">所属分公司</td>
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