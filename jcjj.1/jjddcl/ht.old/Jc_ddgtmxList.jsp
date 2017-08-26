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
	String ddbh=request.getParameter("ddbh");

	ls_sql="SELECT TO_CHAR(jc_ddgtmx.gtxh) gtxh,jc_ddgtmx.ddbh,jdm_jjlbbm.jjlbmc,jdm_jjgtmcbm.jjgtmc,TO_CHAR(jc_ddgtmx.gtcd),TO_CHAR(jc_ddgtmx.gtkd),TO_CHAR(jc_ddgtmx.gtgd),jdm_gtbcysbm.gtbcysmc,jc_ddgtmx.zj,jc_ddgtmx.bz  ";
	ls_sql+=" FROM jc_ddgtmx,jdm_gtbcysbm,jdm_jjgtmcbm,jdm_jjlbbm  ";
    ls_sql+=" where jc_ddgtmx.jjgtmcbm=jdm_jjgtmcbm.jjgtmcbm and jc_ddgtmx.jjlbbm=jdm_jjlbbm.jjlbbm and jc_ddgtmx.gtbcysbm=jdm_gtbcysbm.gtbcysbm(+)";
    ls_sql+=" and jc_ddgtmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_ddgtmxList.jsp","","","EditJc_ddgtmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gtxh","ddbh","jdm_jjlbbm_jjlbmc","jdm_jjgtmcbm_jjgtmc","jc_ddgtmx_gtcd","jc_ddgtmx_gtkd","jc_ddgtmx_gtgd","jdm_gtbcysbm_gtbcysmc","jc_ddgtmx_zj","jc_ddgtmx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gtxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_ddgtmxList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] gtxh = request.getParameterValues("gtxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gtxh,"gtxh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_ddgtmx where "+chooseitem;
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
  <B><font size="3">柜体明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">柜体序号</td>
	<td  width="8%">订单编号</td>
	<td  width="12%">家具类别</td>
	<td  width="11%">家具柜体</td>
	<td  width="7%">柜体长度</td>
	<td  width="7%">柜体宽度</td>
	<td  width="7%">柜体高度</td>
	<td  width="10%">板材颜色</td>
	<td  width="8%">总价</td>
	<td  width="16%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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