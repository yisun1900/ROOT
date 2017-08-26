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
	String hjbh=null;
	String hjmc=null;
	String ckbh=null;
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_ckmc.dqbm='"+dqbm+"')";
	}
	hjbh=request.getParameter("hjbh");
	if (hjbh!=null)
	{
		hjbh=cf.GB2Uni(hjbh);
		if (!(hjbh.equals("")))	wheresql+=" and  (hjbh='"+hjbh+"')";
	}
	hjmc=request.getParameter("hjmc");
	if (hjmc!=null)
	{
		hjmc=cf.GB2Uni(hjmc);
		if (!(hjmc.equals("")))	wheresql+=" and  (hjmc='"+hjmc+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (jxc_hjmc.ckbh='"+ckbh+"')";
	}
	ls_sql="SELECT hjbh,hjmc,ckmc,dqmc  ";
	ls_sql+=" FROM jxc_hjmc,jxc_ckmc,dm_dqbm  ";
    ls_sql+=" where jxc_hjmc.ckbh=jxc_ckmc.ckbh and jxc_ckmc.dqbm=dm_dqbm.dqbm ";
    ls_sql+=wheresql;
	ls_sql+=" order by dqmc,ckmc,hjmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_hjmcList.jsp","SelectJxc_hjmc.jsp","ViewJxc_hjmc.jsp","EditJxc_hjmc.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hjbh","hjmc","ckbh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hjbh"};
	pageObj.setKey(keyName);
	//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("ckmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jxc_hjmcList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] hjbh = request.getParameterValues("hjbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hjbh,"hjbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jxc_hjmc where "+chooseitem;
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
  <br>&nbsp;<br>
  <font color="red">删除仓库提示：我们不建议您执行修改、删除操作，可能造成材料丢失、库存混乱！！！</font>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="20%">货架编号</td>
	<td  width="20%">货架名称</td>
	<td  width="20%">所属仓库</td>
	<td  width="20%">所属地区</td>
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