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
	String dggdbm=null;
	String dggdmc=null;
	String dy=null;
	String xydy=null;
	dggdbm=request.getParameter("dggdbm");
	if (dggdbm!=null)
	{
		dggdbm=cf.GB2Uni(dggdbm);
		if (!(dggdbm.equals("")))	wheresql+=" and  (dggdbm='"+dggdbm+"')";
	}
	dggdmc=request.getParameter("dggdmc");
	if (dggdmc!=null)
	{
		dggdmc=cf.GB2Uni(dggdmc);
		if (!(dggdmc.equals("")))	wheresql+=" and  (dggdmc='"+dggdmc+"')";
	}
	dy=request.getParameter("dy");
	if (dy!=null)
	{
		dy=dy.trim();
		if (!(dy.equals("")))	wheresql+=" and (dy="+dy+") ";
	}
	xydy=request.getParameter("xydy");
	if (xydy!=null)
	{
		xydy=xydy.trim();
		if (!(xydy.equals("")))	wheresql+=" and (xydy="+xydy+") ";
	}
	ls_sql="SELECT dggdbm,dggdmc,dy,xydy  ";
	ls_sql+=" FROM jdm_dggdbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jdm_dggdbmList.jsp","SelectJdm_dggdbm.jsp","","EditJdm_dggdbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dggdbm","dggdmc","dy","xydy"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dggdbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jdm_dggdbmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] dggdbm = request.getParameterValues("dggdbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(dggdbm,"dggdbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jdm_dggdbm where "+chooseitem;
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
	<td  width="22%">吊柜高度区间编码</td>
	<td  width="22%">吊柜高度区间名称</td>
	<td  width="22%">大于（mm）</td>
	<td  width="22%">小于等于（mm）</td>
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