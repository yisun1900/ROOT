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
	String tckb_kjmxb_hxbm=null;
	String tckb_kjmxb_jgwzbm=null;
	String tckb_kjmxb_mj=null;
	tckb_kjmxb_hxbm=request.getParameter("tckb_kjmxb_hxbm");
	if (tckb_kjmxb_hxbm!=null)
	{
		tckb_kjmxb_hxbm=cf.GB2Uni(tckb_kjmxb_hxbm);
		if (!(tckb_kjmxb_hxbm.equals("")))	wheresql+=" and  (tckb_kjmxb.hxbm='"+tckb_kjmxb_hxbm+"')";
	}
	tckb_kjmxb_jgwzbm=request.getParameter("tckb_kjmxb_jgwzbm");
	if (tckb_kjmxb_jgwzbm!=null)
	{
		tckb_kjmxb_jgwzbm=cf.GB2Uni(tckb_kjmxb_jgwzbm);
		if (!(tckb_kjmxb_jgwzbm.equals("")))	wheresql+=" and  (tckb_kjmxb.jgwzbm='"+tckb_kjmxb_jgwzbm+"')";
	}
	tckb_kjmxb_mj=request.getParameter("tckb_kjmxb_mj");
	if (tckb_kjmxb_mj!=null)
	{
		tckb_kjmxb_mj=tckb_kjmxb_mj.trim();
		if (!(tckb_kjmxb_mj.equals("")))	wheresql+=" and (tckb_kjmxb.mj="+tckb_kjmxb_mj+") ";
	}
	ls_sql="SELECT tckb_kjmxb.hxbm,dm_hxbm.hxmc,tckb_kjmxb.jgwzbm,tckb_kjmxb.mj  ";
	ls_sql+=" FROM dm_hxbm,tckb_kjmxb  ";
    ls_sql+=" where tckb_kjmxb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckb_kjmxb.hxbm,tckb_kjmxb.jgwzbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tckb_kjmxbList.jsp","","","EditTckb_kjmxb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"hxmc","jgwzbm","mj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"hxbm","jgwzbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tckb_kjmxbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from tckb_kjmxb where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="30%">户型</td>
	<td  width="30%">功能空间</td>
	<td  width="22%">空间面积</td>
</tr>
<%
	pageObj.printDate();
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