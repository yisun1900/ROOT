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
	String	dqbm=request.getParameter("dqbm");

	String myxssl=request.getParameter("myxssl");//每页显示数量

	ls_sql="SELECT clbm,clxlbm,nbbm,clmc,xh,gg,jldwbm,bzjldwbm,bzgg,djzl,cgzq,bzq,bztxq,cldlbm,scsmc,ppmc,DECODE(cglb,'J','集团采购','D','地方采购'),lrr,lrsj,dwmc,jxc_clbm.bz ";
	ls_sql+=" FROM jxc_clbm,sq_dwxx  ";
    ls_sql+=" where jxc_clbm.lrbm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and jxc_clbm.cllb='1'";//0：主材；1：辅材
    ls_sql+=" and jxc_clbm.clbm not in(select clbm from jxc_cljgb where dqbm='"+dqbm+"')";
    ls_sql+=" order by cldlbm,clxlbm,clmc,jxc_clbm.clbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_clbmCshList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));


//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"材料初始化"};//按钮的显示名称
	String[] buttonLink={"SaveChooseDqbm.jsp?dqbm="+dqbm};//按钮单击调用的网页，可以增加参数
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
  <B><font size="3">全部未初始化材料</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="5%">材料编码</td>
	<td  width="5%">材料小类</td>
	<td  width="5%">内部编码</td>
	<td  width="10%">材料名称</td>

	<td  width="5%">型号</td>
	<td  width="5%">规格</td>
	<td  width="3%">计量单位</td>
	<td  width="3%">包装计量单位</td>
	<td  width="3%">包装规格</td>
	<td  width="3%">单件重量</td>
	<td  width="3%">采购周期</td>
	<td  width="3%">保质期</td>
	<td  width="3%">保质提醒期</td>
	<td  width="5%">材料大类</td>
	<td  width="6%">品牌</td>
	<td  width="8%">子品牌</td>
	<td  width="3%">采购类别</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">录入部门</td>
	<td  width="8%">备注</td>
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