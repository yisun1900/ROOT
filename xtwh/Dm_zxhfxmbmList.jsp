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
	String hfxmbm=null;
	String hfxmmc=null;
	String lx=null;
	hfxmbm=request.getParameter("hfxmbm");
	if (hfxmbm!=null)
	{
		hfxmbm=cf.GB2Uni(hfxmbm);
		if (!(hfxmbm.equals("")))	wheresql+=" and  (hfxmbm='"+hfxmbm+"')";
	}
	hfxmmc=request.getParameter("hfxmmc");
	if (hfxmmc!=null)
	{
		hfxmmc=cf.GB2Uni(hfxmmc);
		if (!(hfxmmc.equals("")))	wheresql+=" and  (hfxmmc='"+hfxmmc+"')";
	}
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (lx='"+lx+"')";
	}
	ls_sql="SELECT hfxmbm,hfxmmc, DECODE(lx,'1','设计方案是否满意','2','设计师沟通能力','3','设计师服务','4','工程报价','5','其它人员服务','6','公司总体印象','7','希望改进方面')  lxmc";
	ls_sql+=" FROM dm_zxhfxmbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by lx,hfxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_zxhfxmbmList.jsp","","","EditDm_zxhfxmbm.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hfxmbm","hfxmmc","lx"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hfxmbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Dm_zxhfxmbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("lxmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] hfxmbm = request.getParameterValues("hfxmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hfxmbm,"hfxmbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from dm_zxhfxmbm where "+chooseitem;
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
	<td  width="20%">回访项目编码</td>
	<td  width="30%">回访项目名称</td>
	<td  width="30%">类型</td>
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