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
	String ztmc=null;
	String ztlx=null;
	String sqzt=null;
	ztbm=request.getParameter("ztbm");
	if (ztbm!=null)
	{
		ztbm=cf.GB2Uni(ztbm);
		if (!(ztbm.equals("")))	wheresql+=" and  (ztbm='"+ztbm+"')";
	}
	ztmc=request.getParameter("ztmc");
	if (ztmc!=null)
	{
		ztmc=cf.GB2Uni(ztmc);
		if (!(ztmc.equals("")))	wheresql+=" and  (ztmc='"+ztmc+"')";
	}
	ztlx=request.getParameter("ztlx");
	if (ztlx!=null)
	{
		ztlx=cf.GB2Uni(ztlx);
		if (!(ztlx.equals("")))	wheresql+=" and  (ztlx='"+ztlx+"')";
	}
	sqzt=request.getParameter("sqzt");
	if (sqzt!=null)
	{
		sqzt=cf.GB2Uni(sqzt);
		if (!(sqzt.equals("")))	wheresql+=" and  (sqzt='"+sqzt+"')";
	}
	ls_sql="SELECT ztbm,ztmc,DECODE(sqzt,'02','正在审批','03','审批通过','04','审批取消') sqzt, DECODE(ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请','13','辞职申请','14','退回人员申请') ztlxmc  ";
	ls_sql+=" FROM rs_ztbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by ztlx,ztbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ztbmList.jsp","SelectRs_ztbm.jsp","","EditRs_ztbm.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ztbm","ztmc","ztlx","sqzt"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ztbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Rs_ztbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sqzt","1");//列参数对象加入Hash表
	spanColHash.put("ztlxmc","2");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] ztbm = request.getParameterValues("ztbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ztbm,"ztbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from rs_ztbm where "+chooseitem;
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
	<td  width="15%">状态编码</td>
	<td  width="30%">状态名称</td>
	<td  width="20%">需修改申请状态</td>
	<td  width="25%">状态类型</td>
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