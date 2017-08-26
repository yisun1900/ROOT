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
	String jdm_ppbm_ppbm=null;
	String jdm_ppbm_ppmc=null;
	String jdm_ppbm_dwbh=null;
	String zclb=null;
	zclb=request.getParameter("zclb");
	if (zclb!=null)
	{
		zclb=cf.GB2Uni(zclb);
		if (!(zclb.equals("")))	wheresql+=" and  (jdm_ppbm.zclb='"+zclb+"')";
	}
	jdm_ppbm_ppbm=request.getParameter("jdm_ppbm_ppbm");
	if (jdm_ppbm_ppbm!=null)
	{
		jdm_ppbm_ppbm=cf.GB2Uni(jdm_ppbm_ppbm);
		if (!(jdm_ppbm_ppbm.equals("")))	wheresql+=" and  (jdm_ppbm.ppbm='"+jdm_ppbm_ppbm+"')";
	}
	jdm_ppbm_ppmc=request.getParameter("jdm_ppbm_ppmc");
	if (jdm_ppbm_ppmc!=null)
	{
		jdm_ppbm_ppmc=cf.GB2Uni(jdm_ppbm_ppmc);
		if (!(jdm_ppbm_ppmc.equals("")))	wheresql+=" and  (jdm_ppbm.ppmc='"+jdm_ppbm_ppmc+"')";
	}
	jdm_ppbm_dwbh=request.getParameter("jdm_ppbm_dwbh");
	if (jdm_ppbm_dwbh!=null)
	{
		jdm_ppbm_dwbh=cf.GB2Uni(jdm_ppbm_dwbh);
		if (!(jdm_ppbm_dwbh.equals("")))	wheresql+=" and  (jdm_ppbm.dwbh='"+jdm_ppbm_dwbh+"')";
	}
	ls_sql="SELECT jdm_ppbm.ppbm,jdm_ppbm.ppmc,sq_dwxx.dwmc,zcdlmc  ";
	ls_sql+=" FROM sq_dwxx,jdm_ppbm,jdm_zcdlbm  ";
    ls_sql+=" where jdm_ppbm.dwbh=sq_dwxx.dwbh and jdm_ppbm.zclb=jdm_zcdlbm.zcdlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_ppbm.zclb,jdm_ppbm.dwbh,jdm_ppbm.ppbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jdm_ppbmList.jsp","SelectJdm_ppbm.jsp","","EditJdm_ppbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ppbm","jdm_ppbm_ppmc","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ppbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jdm_ppbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zcdlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] ppbm = request.getParameterValues("ppbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ppbm,"ppbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jdm_ppbm where "+chooseitem;
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
	<td  width="10%">品牌编码</td>
	<td  width="30%">品牌名称</td>
	<td  width="20%">生产厂家</td>
	<td  width="15%">主材类别</td>
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