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
	String dm_cqbm_cqbm=null;
	String dm_cqbm_cqmc=null;
	String dm_cqbm_dqbm=null;
	dm_cqbm_cqbm=request.getParameter("dm_cqbm_cqbm");
	if (dm_cqbm_cqbm!=null)
	{
		dm_cqbm_cqbm=cf.GB2Uni(dm_cqbm_cqbm);
		if (!(dm_cqbm_cqbm.equals("")))	wheresql+=" and  (dm_cqbm.cqbm='"+dm_cqbm_cqbm+"')";
	}
	dm_cqbm_cqmc=request.getParameter("dm_cqbm_cqmc");
	if (dm_cqbm_cqmc!=null)
	{
		dm_cqbm_cqmc=cf.GB2Uni(dm_cqbm_cqmc);
		if (!(dm_cqbm_cqmc.equals("")))	wheresql+=" and  (dm_cqbm.cqmc='"+dm_cqbm_cqmc+"')";
	}
	dm_cqbm_dqbm=request.getParameter("dm_cqbm_dqbm");
	if (dm_cqbm_dqbm!=null)
	{
		dm_cqbm_dqbm=cf.GB2Uni(dm_cqbm_dqbm);
		if (!(dm_cqbm_dqbm.equals("")))	wheresql+=" and  (dm_cqbm.dqbm='"+dm_cqbm_dqbm+"')";
	}
	ls_sql="SELECT dm_cqbm.cqbm,dm_cqbm.cqmc,dm_cqbm.dqbm,dm_dqbm.dqmc  ";
	ls_sql+=" FROM dm_dqbm,dm_cqbm  ";
    ls_sql+=" where dm_cqbm.dqbm=dm_dqbm.dqbm";
    ls_sql+=wheresql;
    ls_sql+=" order by  dm_cqbm.dqbm,dm_cqbm.cqbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_cqbmList.jsp","SelectDm_cqbm.jsp","","EditDm_cqbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cqbm","dm_cqbm_cqmc","dm_cqbm_dqbm","dm_dqbm_dqmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cqbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_cqbmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] cqbm = request.getParameterValues("cqbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cqbm,"cqbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_cqbm where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="12%">城区编码</td>
	<td  width="22%">城区名称</td>
	<td  width="12%">地区编码</td>
	<td  width="22%">地区名称</td>
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