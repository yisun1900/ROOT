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
	String cw_dejsglfl_xh=null;
	String cw_dejsglfl_qsz=null;
	String cw_dejsglfl_jzz=null;
	String cw_dejsglfl_jsbl=null;
	String cw_dejsglfl_dqbm=null;
	cw_dejsglfl_xh=request.getParameter("cw_dejsglfl_xh");
	if (cw_dejsglfl_xh!=null)
	{
		cw_dejsglfl_xh=cw_dejsglfl_xh.trim();
		if (!(cw_dejsglfl_xh.equals("")))	wheresql+=" and (cw_dejsglfl.xh="+cw_dejsglfl_xh+") ";
	}
	cw_dejsglfl_qsz=request.getParameter("cw_dejsglfl_qsz");
	if (cw_dejsglfl_qsz!=null)
	{
		cw_dejsglfl_qsz=cw_dejsglfl_qsz.trim();
		if (!(cw_dejsglfl_qsz.equals("")))	wheresql+=" and  (cw_dejsglfl.qsz="+cw_dejsglfl_qsz+") ";
	}
	cw_dejsglfl_jzz=request.getParameter("cw_dejsglfl_jzz");
	if (cw_dejsglfl_jzz!=null)
	{
		cw_dejsglfl_jzz=cw_dejsglfl_jzz.trim();
		if (!(cw_dejsglfl_jzz.equals("")))	wheresql+=" and  (cw_dejsglfl.jzz="+cw_dejsglfl_jzz+") ";
	}
	cw_dejsglfl_jsbl=request.getParameter("cw_dejsglfl_jsbl");
	if (cw_dejsglfl_jsbl!=null)
	{
		cw_dejsglfl_jsbl=cw_dejsglfl_jsbl.trim();
		if (!(cw_dejsglfl_jsbl.equals("")))	wheresql+=" and  (cw_dejsglfl.jsbl="+cw_dejsglfl_jsbl+") ";
	}
	cw_dejsglfl_dqbm=request.getParameter("cw_dejsglfl_dqbm");
	if (cw_dejsglfl_dqbm!=null)
	{
		cw_dejsglfl_dqbm=cf.GB2Uni(cw_dejsglfl_dqbm);
		if (!(cw_dejsglfl_dqbm.equals("")))	wheresql+=" and  (cw_dejsglfl.dqbm='"+cw_dejsglfl_dqbm+"')";
	}
	ls_sql="SELECT cw_dejsglfl.xh,cw_dejsglfl.qsz,cw_dejsglfl.jzz,cw_dejsglfl.jsbl,cw_dejsglfl.dqbm,dm_dqbm.dqmc  ";
	ls_sql+=" FROM cw_dejsglfl,dm_dqbm  ";
    ls_sql+=" where cw_dejsglfl.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by cw_dejsglfl.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_dejsglflList.jsp","SelectCw_dejsglfl.jsp","","EditCw_dejsglfl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","cw_dejsglfl_qsz","cw_dejsglfl_jzz","cw_dejsglfl_jsbl","cw_dejsglfl_dqbm","dm_dqbm_dqmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_dejsglflList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_dejsglfl where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="10%">序号</td>
	<td  width="20%">成本金额起始值（>=）</td>
	<td  width="20%">成本金额截止值（<）</td>
	<td  width="15%">结算比例(0-100)</td>
	<td  width="10%">地区</td>
	<td  width="15%">地区</td>
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