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
	String mdjgqjbm=null;
	String mdjgqj=null;
	String qskd=null;
	String zzkd=null;
	String qsgd=null;
	String zzgd=null;
	String mlx=null;
	mdjgqjbm=request.getParameter("mdjgqjbm");
	if (mdjgqjbm!=null)
	{
		mdjgqjbm=cf.GB2Uni(mdjgqjbm);
		if (!(mdjgqjbm.equals("")))	wheresql+=" and  (mdjgqjbm='"+mdjgqjbm+"')";
	}
	mdjgqj=request.getParameter("mdjgqj");
	if (mdjgqj!=null)
	{
		mdjgqj=cf.GB2Uni(mdjgqj);
		if (!(mdjgqj.equals("")))	wheresql+=" and  (mdjgqj='"+mdjgqj+"')";
	}
	qskd=request.getParameter("qskd");
	if (qskd!=null)
	{
		qskd=qskd.trim();
		if (!(qskd.equals("")))	wheresql+=" and (qskd="+qskd+") ";
	}
	zzkd=request.getParameter("zzkd");
	if (zzkd!=null)
	{
		zzkd=zzkd.trim();
		if (!(zzkd.equals("")))	wheresql+=" and (zzkd="+zzkd+") ";
	}
	qsgd=request.getParameter("qsgd");
	if (qsgd!=null)
	{
		qsgd=qsgd.trim();
		if (!(qsgd.equals("")))	wheresql+=" and (qsgd="+qsgd+") ";
	}
	zzgd=request.getParameter("zzgd");
	if (zzgd!=null)
	{
		zzgd=zzgd.trim();
		if (!(zzgd.equals("")))	wheresql+=" and (zzgd="+zzgd+") ";
	}
	mlx=request.getParameter("mlx");
	if (mlx!=null)
	{
		if (!(mlx.equals("")))	wheresql+=" and (jdm_mdjgqj.mlx="+mlx+") ";
	}

	ls_sql="SELECT mlxmc,mdjgqjbm,mdjgqj,qskd,zzkd,qsgd,zzgd  ";
	ls_sql+=" FROM jdm_mdjgqj,jdm_mlx  ";
    ls_sql+=" where (jdm_mdjgqj.mlx=jdm_mlx.mlx(+))";
    ls_sql+=wheresql;
     ls_sql+=" order by jdm_mdjgqj.mlx,mdjgqjbm";
   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jdm_mdjgqjList.jsp","SelectJdm_mdjgqj.jsp","","EditJdm_mdjgqj.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"mdjgqjbm","mdjgqj","qskd","zzkd","qsgd","zzgd"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"mdjgqjbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jdm_mdjgqjList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("mlxmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] mdjgqjbm = request.getParameterValues("mdjgqjbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(mdjgqjbm,"mdjgqjbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jdm_mdjgqj where "+chooseitem;
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
	<td  width="15%">门类型</td>
	<td  width="10%">门洞价格区间编码</td>
	<td  width="25%">门洞价格区间</td>
	<td  width="10%">起始宽度（>）mm</td>
	<td  width="10%">终止宽度（<=）mm</td>
	<td  width="10%">起始高度（>）mm</td>
	<td  width="10%">终止高度（<=）mm</td>
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