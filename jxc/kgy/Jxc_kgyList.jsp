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
	String yhdlm=null;
	String ckbh=null;
	String dqbm=null;
	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (jxc_kgy.yhdlm='"+yhdlm+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (jxc_kgy.ckbh='"+ckbh+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(ckbh);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_ckmc.dqbm='"+dqbm+"')";
	}

	ls_sql="SELECT jxc_kgy.ckbh ckbh,ckmc,dqmc,jxc_kgy.yhdlm,sq_yhxx.yhmc,DECODE(sq_yhxx.sfzszg,'M','<font color=\"#009999\">实习生</font>','Y','转正','N','<font color=\"#0000CC\">试用期</font>','D','<font color=\"#CCCC00\">待岗</font>','S','<font color=\"#CC0000\">辞职</font>','T','<font color=\"#CC00CC\">辞退</font>','C','<font color=\"#CC00CC\">特权</font>'),dwmc  ";
	ls_sql+=" FROM jxc_kgy,jxc_ckmc,dm_dqbm,sq_yhxx,sq_dwxx  ";
    ls_sql+=" where jxc_kgy.ckbh=jxc_ckmc.ckbh and jxc_ckmc.dqbm=dm_dqbm.dqbm ";
    ls_sql+=" and jxc_kgy.yhdlm=sq_yhxx.yhdlm(+)";
    ls_sql+=" and sq_yhxx.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_ckmc.dqbm,jxc_kgy.ckbh,jxc_kgy.yhdlm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_kgyList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"yhdlm","ckbh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"yhdlm","ckbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jxc_kgyList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jxc_kgy where "+chooseitem;
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
	<td  width="4%">&nbsp;</td>
	<td  width="10%">仓库编号</td>
	<td  width="20%">仓库名称</td>
	<td  width="10%">地区</td>
	<td  width="15%">库管员登录名</td>
	<td  width="8%">名称</td>
	<td  width="8%">员工状态</td>
	<td  width="32%">部门</td>
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