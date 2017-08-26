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
	String gtxh=request.getParameter("gtxh");

	ls_sql="SELECT TO_CHAR(jc_ddpjmx.pjxh) pjxh,TO_CHAR(jc_ddpjmx.gtxh),jc_ddpjmx.ddbh,jdm_jjpjmcbm.jjpjmc,jc_ddpjmx.xinghao,TO_CHAR(jc_ddpjmx.pjcd),TO_CHAR(jc_ddpjmx.pjkd),TO_CHAR(jc_ddpjmx.pjgd),jc_ddpjmx.sl,TO_CHAR(jc_ddpjmx.dj),jc_ddpjmx.je,jc_ddpjmx.bz";
	ls_sql+=" FROM jc_ddpjmx,jdm_jjpjmcbm  ";
    ls_sql+=" where jc_ddpjmx.jjpjmcbm=jdm_jjpjmcbm.jjpjmcbm";
    ls_sql+=" and jc_ddpjmx.gtxh="+gtxh+"";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_ddpjmxList.jsp","","","EditJc_ddpjmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jc_ddpjmx_gtxh","jc_ddpjmx_ddbh","jdm_jjpjmcbm_jjpjmc","pjxh","jc_ddpjmx_pjcd","jc_ddpjmx_pjkd","jc_ddpjmx_pjgd","jc_ddpjmx_sl","jc_ddpjmx_dj","jc_ddpjmx_je","jc_ddpjmx_bz","jc_ddpjmx_xinghao"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pjxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_ddpjmxList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] pjxh = request.getParameterValues("pjxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pjxh,"pjxh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_ddpjmx where "+chooseitem;
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
  <B><font size="3">柜体配件明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="5%">配件序号</td>
	<td  width="5%">柜体序号</td>
	<td  width="7%">订单编号</td>
	<td  width="11%">配件名称</td>
	<td  width="9%">配件型号</td>
	<td  width="8%">配件长度（mm）</td>
	<td  width="8%">配件宽度（mm）</td>
	<td  width="8%">配件高度（mm）</td>
	<td  width="6%">数量</td>
	<td  width="7%">单价</td>
	<td  width="8%">金额</td>
	<td  width="11%">备注</td>
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