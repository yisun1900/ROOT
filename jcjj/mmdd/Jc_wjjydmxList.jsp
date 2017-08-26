<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT jc_wjjydmx.yddbh as yddbh,jc_wjjydmx.xh as xh,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_wjjbj.xinghao as jc_wjjbj_xinghao,TO_CHAR(jc_wjjydmx.dj) as jc_wjjydmx_dj,jc_wjjydmx.sl as jc_wjjydmx_sl,jc_wjjydmx.dj*jc_wjjydmx.sl je,jc_wjjydmx.bz as jc_wjjydmx_bz  ";
	ls_sql+=" FROM jc_wjjbj,jc_wjjydmx,jdm_wjjbm  ";
    ls_sql+=" where jc_wjjbj.wjjbm=jdm_wjjbm.wjjbm and jc_wjjbj.xh=jc_wjjydmx.xh";
    ls_sql+=" and jc_wjjydmx.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_wjjydmx.yddbh,jc_wjjydmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_wjjydmxList.jsp?yddbh="+yddbh,"","","EditJc_wjjydmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"jdm_wjjbm_wjjmc","jc_wjjbj_xinghao","jc_wjjydmx_dj","jc_wjjydmx_sl","je","jc_wjjydmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"yddbh","xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_wjjydmxList.jsp?yddbh="+yddbh};//按钮单击调用的网页，可以增加参数
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
		String[] sql=new String[3];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from jc_wjjydmx where "+chooseitem;

		sql[1]="update jc_mmydd set yddwjje=NVL((select sum(dj*sl) from  jc_wjjydmx where yddbh='"+yddbh+"'),0)";
		sql[1]+=" where yddbh='"+yddbh+"'";

		sql[2]="update jc_mmydd set yddbzje=yddmmje+yddwjje+yddblje,yddze=yddmmje*mmzkl/10+yddwjje*wjzkl/10+yddblje*blzkl/10";
		sql[2]+=" where yddbh='"+yddbh+"'";

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
  <B><font size="3">五金件预订明细（单号：<%=yddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="12%">五金件名称</td>
	<td  width="22%">型号</td>
	<td  width="8%">单价</td>
	<td  width="10%">订购数量</td>
	<td  width="12%">总金额</td>
	<td  width="30%">备注</td>
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