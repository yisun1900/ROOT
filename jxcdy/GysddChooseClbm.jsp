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

	String gysddph=request.getParameter("gysddph");

	ls_sql="SELECT jxc_gysddmx.clbm,nbbm,clmc,clxlbm,xh,gg,dhsl,ppmc ";
	ls_sql+=" FROM jxc_gysddmx";
	ls_sql+=" where jxc_gysddmx.gysddph='"+gysddph+"'";
	ls_sql+=" order by dhxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//设置每页显示记录数


//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"打印选中材料"};//按钮的显示名称
	String[] buttonLink={"PrintGysddClbm.jsp?gysddph="+gysddph};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
  <B><font size="3">供应商订单选择打印－－请勾选需打印的产品</font></B><br>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="10%">材料编码</td>
	<td  width="10%">内部编码</td>
	<td  width="16%">材料名称</td>
	<td  width="12%">材料小类</td>
	<td  width="14%">型号</td>
	<td  width="14%">规格</td>
	<td  width="8%">订货数量</td>
	<td  width="13%">品牌</td>
	
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