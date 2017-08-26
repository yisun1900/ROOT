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
	String rs_shztlc_ztbm=null;
	String rs_shztlc_shjl=null;
	String rs_shztlc_xyztbm=null;

	String ztlx=null;
	ztlx=request.getParameter("ztlx");
	if (ztlx!=null)
	{
		ztlx=cf.GB2Uni(ztlx);
		if (!(ztlx.equals("")))	wheresql+=" and  (a.ztlx='"+ztlx+"')";
	}
	
	rs_shztlc_ztbm=request.getParameter("rs_shztlc_ztbm");
	if (rs_shztlc_ztbm!=null)
	{
		rs_shztlc_ztbm=cf.GB2Uni(rs_shztlc_ztbm);
		if (!(rs_shztlc_ztbm.equals("")))	wheresql+=" and  (rs_shztlc.ztbm='"+rs_shztlc_ztbm+"')";
	}
	rs_shztlc_shjl=request.getParameter("rs_shztlc_shjl");
	if (rs_shztlc_shjl!=null)
	{
		rs_shztlc_shjl=cf.GB2Uni(rs_shztlc_shjl);
		if (!(rs_shztlc_shjl.equals("")))	wheresql+=" and  (rs_shztlc.shjl='"+rs_shztlc_shjl+"')";
	}
	rs_shztlc_xyztbm=request.getParameter("rs_shztlc_xyztbm");
	if (rs_shztlc_xyztbm!=null)
	{
		rs_shztlc_xyztbm=cf.GB2Uni(rs_shztlc_xyztbm);
		if (!(rs_shztlc_xyztbm.equals("")))	wheresql+=" and  (rs_shztlc.xyztbm='"+rs_shztlc_xyztbm+"')";
	}
	ls_sql="SELECT rs_shztlc.ztbm,a.ztmc ztbmmc, DECODE(a.ztlx,'01','招聘','02','培训','03','变动','04','费用审批','06','二次入职','07','调休申请','08','加班申请','09','考勤卡修正单','10','请假单','11','出差申请','12','增设岗位申请','13','辞职申请','14','退回人员申请') ztlxmc, DECODE(a.sqzt,'02','正在审批','03','审批通过','04','审批取消') sqztmc,rs_shztlc.shjl,rs_shjlbm.shjlmc,b.ztmc xyztbm  ";
	ls_sql+=" FROM rs_shjlbm,rs_shztlc,rs_ztbm a,rs_ztbm b ";
    ls_sql+=" where rs_shztlc.ztbm=a.ztbm(+) and rs_shztlc.xyztbm=b.ztbm(+) and rs_shztlc.shjl=rs_shjlbm.shjl(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by a.ztlx,rs_shztlc.ztbm,rs_shztlc.shjl";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Rs_shztlcList.jsp","SelectRs_shztlc.jsp","","EditRs_shztlc.jsp");
	pageObj.setPageRow(200);//设置每页显示记录数

//设置显示列
	String[] disColName={"ztbmmc","shjlmc","xyztbm","sqztmc","ztlxmc"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"ztbm","shjl"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Rs_shztlcList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ztbmmc","1");//列参数对象加入Hash表
	spanColHash.put("ztlxmc","2");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from rs_shztlc where "+chooseitem;
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
	<td  width="24%">审核状态</td>
	<td  width="12%">审核结论</td>
	<td  width="24%">下一状态</td>
	<td  width="14%">需修改申请状态</td>
	<td  width="18%">状态类型</td>
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