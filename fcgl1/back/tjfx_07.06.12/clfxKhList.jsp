<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=cf.GB2Uni(request.getParameter("fgs"));

	String sjwjrq=request.getParameter("sjwjrq");
	String sjwjrq2=request.getParameter("sjwjrq2");

	String myxssl=null;
	myxssl=request.getParameter("myxssl");

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	ls_sql="select '',crm_khxx.hth,crm_khxx.khxm,crm_khxx.khjsje,cl_djjflmx.cldlmc,cl_djjflmx.ylqje,cl_djjflmx.sjje,cl_djjflmx.jmyy,cl_djjflmx.ylqje-cl_djjflmx.sjje jmje";
	ls_sql+=" from cl_djjflmx,crm_khxx  ";
	ls_sql+=" where cl_djjflmx.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_khxx.fgsbh='"+fgs+"' and crm_khxx.gcjdbm='5' ";
	ls_sql+=" and crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
//		ls_sql+=" and cl_djjflmx.ylqje>cl_djjflmx.sjje ";
	ls_sql+=" and cl_djjflmx.ylqje*0.98>cl_djjflmx.sjje ";
	ls_sql+=" order by  crm_khxx.fgsbh,crm_khxx.khxm,cl_djjflmx.cldlmc";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("clfxKhList.jsp","","","");

	pageObj.setPageRow(Integer.parseInt(myxssl));
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<CENTER >
  <B><font size="3">材料统计</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>

<tr bgcolor="CCCCCC" align="center"> 
	<td width="5%"><B>序号</b></td>
	<td width="10%"><B>合同号</b></td>
	<td width="8%"><B>客户姓名</b></td>
	<td width="10%"><B>结算金额</b></td>
	<td width="18%"><B>材料大类</b></td>
	<td width="10%"><B>应领取金额</b></td>
	<td width="10%"><B>实际金额</b></td>
	<td width="20%"><B>减免原因</b></td>
	<td width="10%"><B>减免金额</b></td>
</tr>
<%
	pageObj.printDateSum(true);
	pageObj.displayFoot();
%> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 

//-->
</script>



