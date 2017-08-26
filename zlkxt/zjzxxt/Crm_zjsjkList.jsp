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
	String crm_zjsjk_jlh=null;
	String crm_zjsjk_zjlxbm=null;
	String crm_zjsjk_bt=null;
	String crm_zjsjk_nr=null;
	String crm_zjsjk_lrrq=null;
	String crm_zjsjk_yhdlm=null;
	crm_zjsjk_jlh=request.getParameter("crm_zjsjk_jlh");
	if (crm_zjsjk_jlh!=null)
	{
		crm_zjsjk_jlh=crm_zjsjk_jlh.trim();
		if (!(crm_zjsjk_jlh.equals("")))	wheresql+=" and (crm_zjsjk.jlh="+crm_zjsjk_jlh+") ";
	}
	crm_zjsjk_zjlxbm=request.getParameter("crm_zjsjk_zjlxbm");
	if (crm_zjsjk_zjlxbm!=null)
	{
		crm_zjsjk_zjlxbm=cf.GB2Uni(crm_zjsjk_zjlxbm);
		if (!(crm_zjsjk_zjlxbm.equals("")))	wheresql+=" and  (crm_zjsjk.zjlxbm='"+crm_zjsjk_zjlxbm+"')";
	}
	crm_zjsjk_bt=request.getParameter("crm_zjsjk_bt");
	if (crm_zjsjk_bt!=null)
	{
		crm_zjsjk_bt=cf.GB2Uni(crm_zjsjk_bt);
		if (!(crm_zjsjk_bt.equals("")))	wheresql+=" and  (crm_zjsjk.bt like '%"+crm_zjsjk_bt+"%')";
	}
	crm_zjsjk_nr=request.getParameter("crm_zjsjk_nr");
	if (crm_zjsjk_nr!=null)
	{
		crm_zjsjk_nr=cf.GB2Uni(crm_zjsjk_nr);
		if (!(crm_zjsjk_nr.equals("")))	wheresql+=" and  (crm_zjsjk.nr like '%"+crm_zjsjk_nr+"%')";
	}
	crm_zjsjk_lrrq=request.getParameter("crm_zjsjk_lrrq");
	if (crm_zjsjk_lrrq!=null)
	{
		crm_zjsjk_lrrq=crm_zjsjk_lrrq.trim();
		if (!(crm_zjsjk_lrrq.equals("")))	wheresql+="  and (crm_zjsjk.lrrq>=TO_DATE('"+crm_zjsjk_lrrq+"','YYYY/MM/DD'))";
	}
	crm_zjsjk_lrrq=request.getParameter("crm_zjsjk_lrrq2");
	if (crm_zjsjk_lrrq!=null)
	{
		crm_zjsjk_lrrq=crm_zjsjk_lrrq.trim();
		if (!(crm_zjsjk_lrrq.equals("")))	wheresql+="  and (crm_zjsjk.lrrq<=TO_DATE('"+crm_zjsjk_lrrq+"','YYYY/MM/DD'))";
	}
	crm_zjsjk_yhdlm=request.getParameter("crm_zjsjk_yhdlm");
	if (crm_zjsjk_yhdlm!=null)
	{
		crm_zjsjk_yhdlm=cf.GB2Uni(crm_zjsjk_yhdlm);
		if (!(crm_zjsjk_yhdlm.equals("")))	wheresql+=" and  (crm_zjsjk.yhdlm='"+crm_zjsjk_yhdlm+"')";
	}
	ls_sql="SELECT crm_zjsjk.jlh as jlh,dm_zjlxbm.zjlxmc as dm_zjlxbm_zjlxmc,crm_zjsjk.bt,nr";
	ls_sql+=" FROM dm_zjlxbm,crm_zjsjk  ";
    ls_sql+=" where crm_zjsjk.zjlxbm=dm_zjlxbm.zjlxbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zjsjkList.jsp","SelectCrm_zjsjk.jsp","","EditCrm_zjsjk.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jlh","dm_zjlxbm_zjlxmc","crm_zjsjk_bt","crm_zjsjk_lrrq","crm_zjsjk_yhdlm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Crm_zjsjkList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_zjsjk.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] jlh = request.getParameterValues("jlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jlh,"jlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from crm_zjsjk where "+chooseitem;
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
	<td  width="11%">&nbsp;</td>
	<td  width="8%">记录号</td>
	<td  width="13%">专家库类型</td>
	<td  width="20%">标题</td>
	<td  width="48%">内容</td>
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