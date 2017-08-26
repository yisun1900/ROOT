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
	String cw_jrtcbl_fgsbh=null;
	cw_jrtcbl_fgsbh=request.getParameter("cw_jrtcbl_fgsbh");
	if (cw_jrtcbl_fgsbh!=null)
	{
		cw_jrtcbl_fgsbh=cf.GB2Uni(cw_jrtcbl_fgsbh);
		if (!(cw_jrtcbl_fgsbh.equals("")))	wheresql+=" and  (cw_jrtcbl.fgsbh='"+cw_jrtcbl_fgsbh+"')";
	}
	ls_sql="SELECT cw_jrtcbl.fgsbh,sq_dwxx.dwmc,cw_jrtcbl.dzsjftcbl,cw_jrtcbl.dzzxftcbl,cw_jrtcbl.wyzxftcbl,cw_jrtcbl.khjlsjftcbl,cw_jrtcbl.khjlzxftcbl,cw_jrtcbl.sjssjftcbl,cw_jrtcbl.sjszxftcbl,cw_jrtcbl.sjsycftcbl,cw_jrtcbl.zjzxftcbl,cw_jrtcbl.zjycftcbl,cw_jrtcbl.xqzgzxftcbl,cw_jrtcbl.xqzzzxftcbl,cw_jrtcbl.xqzyzxftcbl,cw_jrtcbl.wlyxzgzxftcbl,cw_jrtcbl.yxzyzxftcbl,cw_jrtcbl.wzchzxftcbl,cw_jrtcbl.wysjzxftcbl,cw_jrtcbl.wzcxyzxftcbl,cw_jrtcbl.dhzyzxftcbl,cw_jrtcbl.wztgyzxftcbl,cw_jrtcbl.sjzxftcbl,cw_jrtcbl.clyzxftcbl,cw_jrtcbl.lrr,cw_jrtcbl.lrsj  ";
	ls_sql+=" FROM cw_jrtcbl,sq_dwxx  ";
    ls_sql+=" where cw_jrtcbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrtcbl.fgsbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jrtcblList.jsp","","","EditCw_jrtcbl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"fgsbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_jrtcblList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String[] fgsbh = request.getParameterValues("fgsbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(fgsbh,"fgsbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_jrtcbl where "+chooseitem;
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
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="3%">分公司</td>
	<td  width="6%">分公司</td>
	<td  width="3%">店长设计费提成比例</td>
	<td  width="3%">店长装修费提成比例</td>
	<td  width="3%">文员装修费提成比例</td>
	<td  width="3%">业务员设计费提成比例</td>
	<td  width="3%">业务员装修费提成比例</td>
	<td  width="3%">设计师设计费提成比例</td>
	<td  width="3%">设计师装修费提成比例</td>
	<td  width="3%">设计师远程费提成比例</td>
	<td  width="3%">客户经理装修费提成比例</td>
	<td  width="3%">客户经理远程费提成比例</td>
	<td  width="3%">小区主管装修费提成比例</td>
	<td  width="3%">小区组长装修费提成比例</td>
	<td  width="3%">小区专员装修费提成比例</td>
	<td  width="3%">网络营销主管装修费提成比例</td>
	<td  width="3%">营销专员装修费提成比例</td>
	<td  width="3%">网站策划装修费提成比例</td>
	<td  width="3%">网页设计装修费提成比例</td>
	<td  width="3%">网站程序员装修费提成比例</td>
	<td  width="3%">电话专员装修费提成比例</td>
	<td  width="3%">网站推广员装修费提成比例</td>
	<td  width="3%">司机装修费提成比例</td>
	<td  width="3%">材料员装修费提成比例</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
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