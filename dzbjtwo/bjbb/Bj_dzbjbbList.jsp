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
	String bj_dzbjbb_dqbm=null;
	String bj_dzbjbb_bjbbh=null;
	String bj_dzbjbb_qysj=null;
	String bj_dzbjbb_sfzybb=null;
	bj_dzbjbb_dqbm=request.getParameter("bj_dzbjbb_dqbm");
	if (bj_dzbjbb_dqbm!=null)
	{
		bj_dzbjbb_dqbm=cf.GB2Uni(bj_dzbjbb_dqbm);
		if (!(bj_dzbjbb_dqbm.equals("")))	wheresql+=" and  (bj_dzbjbb.dqbm='"+bj_dzbjbb_dqbm+"')";
	}
	bj_dzbjbb_bjbbh=request.getParameter("bj_dzbjbb_bjbbh");
	if (bj_dzbjbb_bjbbh!=null)
	{
		bj_dzbjbb_bjbbh=cf.GB2Uni(bj_dzbjbb_bjbbh);
		if (!(bj_dzbjbb_bjbbh.equals("")))	wheresql+=" and  (bj_dzbjbb.bjbbh='"+bj_dzbjbb_bjbbh+"')";
	}
	bj_dzbjbb_qysj=request.getParameter("bj_dzbjbb_qysj");
	if (bj_dzbjbb_qysj!=null)
	{
		bj_dzbjbb_qysj=bj_dzbjbb_qysj.trim();
		if (!(bj_dzbjbb_qysj.equals("")))	wheresql+="  and (bj_dzbjbb.qysj>=TO_DATE('"+bj_dzbjbb_qysj+"','YYYY/MM/DD'))";
	}
	bj_dzbjbb_qysj=request.getParameter("bj_dzbjbb_qysj2");
	if (bj_dzbjbb_qysj!=null)
	{
		bj_dzbjbb_qysj=bj_dzbjbb_qysj.trim();
		if (!(bj_dzbjbb_qysj.equals("")))	wheresql+="  and (bj_dzbjbb.qysj<=TO_DATE('"+bj_dzbjbb_qysj+"','YYYY/MM/DD'))";
	}
	bj_dzbjbb_sfzybb=request.getParameter("bj_dzbjbb_sfzybb");
	if (bj_dzbjbb_sfzybb!=null)
	{
		bj_dzbjbb_sfzybb=cf.GB2Uni(bj_dzbjbb_sfzybb);
		if (!(bj_dzbjbb_sfzybb.equals("")))	wheresql+=" and  (bj_dzbjbb.sfzybb='"+bj_dzbjbb_sfzybb+"')";
	}
	ls_sql="SELECT bj_dzbjbb.dqbm,dm_dqbm.dqmc,bj_dzbjbb.bjbbh,bj_dzbjbb.qysj,bj_dzbjbb.yxq,DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用'),bj_dzbjbb.bz  ";
	ls_sql+=" FROM dm_dqbm,bj_dzbjbb  ";
    ls_sql+=" where bj_dzbjbb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_dzbjbb.dqbm,bj_dzbjbb.qysj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_dzbjbbList.jsp","","","EditBj_dzbjbb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjbbh","bj_dzbjbb_qysj","bj_dzbjbb_sfyqy","bj_dzbjbb_sfzybb","bj_dzbjbb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dqbm","bjbbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Bj_dzbjbbList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[9];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from bj_dzbjbb where "+chooseitem;
		sql[1]="delete from bj_jzbjb where "+chooseitem;
		sql[2]="delete from bj_glxmb where "+chooseitem;
		sql[3]="delete from bj_jzglfxb where "+chooseitem;
		sql[4]="delete from bj_tcjgb where "+chooseitem;
		sql[5]="delete from bj_tcsjcjb where "+chooseitem;
		sql[6]="delete from bj_tcbzgcxm where "+chooseitem;
		sql[7]="delete from bj_tcbzzcxm where "+chooseitem;
		sql[8]="delete from bj_tczcbj where "+chooseitem;
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
  <B><font size="3">维护报价版本</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">地区编码</td>
	<td  width="10%">地区名称</td>
	<td  width="23%">报价版本号</td>
	<td  width="10%">启用时间</td>
	<td  width="10%">有效期</td>
	<td  width="7%">是否在用版本</td>
	<td  width="24%">备注</td>
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