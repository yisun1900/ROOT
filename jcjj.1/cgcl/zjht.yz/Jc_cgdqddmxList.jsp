<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT jc_cgdqddmx.ddbh,jc_cgdqddmx.dqbm,jc_cgdqbj.dqmc as jc_cgdqbj_dqmc,xh,cptz,TO_CHAR(jc_cgdqddmx.dj) as jc_cgdqddmx_dj,jc_cgdqddmx.sl as jc_cgdqddmx_sl,jc_cgdqddmx.je as jc_cgdqddmx_je,jc_cgdqddmx.bz as jc_cgdqddmx_bz ";
	ls_sql+=" FROM jc_cgdqbj,jc_cgdqddmx  ";
    ls_sql+=" where jc_cgdqddmx.dqbm=jc_cgdqbj.dqbm";
    ls_sql+=" and jc_cgdqddmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_cgdqddmxList.jsp?ddbh="+ddbh,"","","EditJc_cgdqddmx.jsp");
	pageObj.setPageRow(100);//设置每页显示记录数
//设置显示列
	String[] disColName={"jc_cgdqbj_dqmc","xh","cptz","jc_cgdqddmx_dj","jc_cgdqddmx_sl","jc_cgdqddmx_je","jc_cgdqddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"ddbh","dqbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_cgdqddmxList.jsp?ddbh="+ddbh};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_cgdqddmx where "+chooseitem;

/*
		sql[1]="update jc_cgdd set dqhtze=NVL((select sum(je) from  jc_cgdqddmx where ddbh='"+ddbh+"'),0)";
		sql[1]+=" where ddbh='"+ddbh+"'";

		sql[2]="update jc_cgdd set htze=cghtze+wjhtze+dqhtze,ssje=cghtze+wjhtze+dqhtze-zsje";
		sql[2]+=" where ddbh='"+ddbh+"'";
*/
		
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
  <B><font size="3">电器订单明细 </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="10%">电器名称</td>
	<td  width="10%">型号</td>
	<td  width="32%">产品特征</td>
	<td  width="6%">单价</td>
	<td  width="6%">数量</td>
	<td  width="10%">金额</td>
	<td  width="16%">备注</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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