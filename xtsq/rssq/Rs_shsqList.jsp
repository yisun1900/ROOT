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
	String ztbm=null;
	String yhzbh=null;
	String ztlx=null;
	ztbm=request.getParameter("ztbm");
	if (ztbm!=null)
	{
		ztbm=cf.GB2Uni(ztbm);
		if (!(ztbm.equals("")))	wheresql+=" and  (rs_shsq.ztbm='"+ztbm+"')";
	}
	yhzbh=request.getParameter("yhzbh");
	if (yhzbh!=null)
	{
		yhzbh=cf.GB2Uni(yhzbh);
		if (!(yhzbh.equals("")))	wheresql+=" and  (rs_shsq.yhzbh='"+yhzbh+"')";
	}
	ztlx=request.getParameter("ztlx");
	if (ztlx!=null)
	{
		ztlx=cf.GB2Uni(ztlx);
		if (!(ztlx.equals("")))	wheresql+=" and  (rs_ztbm.ztlx='"+ztlx+"')";
	}

	ls_sql="SELECT DECODE(rs_ztbm.ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请') ztlxmc,rs_ztbm.ztmc,sq_yhz.yhzmc,rs_shsq.ztbm ztbm,rs_shsq.yhzbh yhzbh";
	ls_sql+=" FROM rs_shsq,rs_ztbm,sq_yhz  ";
    ls_sql+=" where rs_shsq.ztbm=rs_ztbm.ztbm and rs_shsq.yhzbh=sq_yhz.yhzbh";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_shsq.yhzbh,rs_ztbm.ztlx,rs_ztbm.ztbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_shsqList.jsp","SelectRs_shsq.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"yhzmc","ztlxmc","ztmc"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"ztbm","yhzbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Rs_shsqList.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("yhzmc","1");//列参数对象加入Hash表
	spanColHash.put("ztlxmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from rs_shsq where "+chooseitem;
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
	<td  width="24%">用户组名称</td>
	<td  width="24%">审核类型</td>
	<td  width="44%">审核状态</td>
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