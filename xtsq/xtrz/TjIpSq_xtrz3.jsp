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

	ls_sql="SELECT a.dwmc,b.dwmc bm,zwmc,sq_xtrz.yhdlm,sq_yhxx.yhmc,sq_xtrz.ip1||'.'||sq_xtrz.ip2||'.'||sq_xtrz.ip3 ,count(*) cc ";
	ls_sql+=" FROM sq_yhxx,sq_xtrz,sq_dwxx b,sq_dwxx a ,dm_zwbm ";
    ls_sql+=" where sq_xtrz.yhdlm=sq_yhxx.yhdlm(+) and sq_yhxx.dwbh=b.dwbh(+) and b.ssfgs=a.dwbh and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
    ls_sql+=" and  sq_xtrz.yhdlm='"+yhdlm+"'";
	ls_sql+=" group by sq_xtrz.yhdlm,sq_yhxx.yhmc,a.dwmc,b.dwmc,zwmc,sq_xtrz.ip1,sq_xtrz.ip2,sq_xtrz.ip3";
	ls_sql+=" order by cc";
    
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("yhtj.jsp","","","");
	pageObj.setPageRow(300);//设置每页显示记录数
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
  <B><font size="3">IP地址统计</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">所属分公司</td>
	<td  width="15%">部门</td>
	<td  width="14%">职务</td>
	<td  width="14%">用户登陆名</td>
	<td  width="10%">用户名称</td>
	<td  width="14%">IP地址</td>
	<td  width="10%">登陆次数</td>
	
	
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