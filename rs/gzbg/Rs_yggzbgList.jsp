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
	String rs_yggzbg_ygbh=null;
	String rs_yggzbg_sjqd=null;
	String rs_yggzbg_sjzd=null;
	String rs_yggzbg_xm=null;
	String rs_yggzbg_xzzwbm=null;
	String rs_yggzbg_ssfgs=null;
	String rs_yggzbg_dwbh=null;
	String rs_yggzbg_lrr=null;
	String rs_yggzbg_lrsj=null;
	rs_yggzbg_ygbh=request.getParameter("rs_yggzbg_ygbh");
	if (rs_yggzbg_ygbh!=null)
	{
		rs_yggzbg_ygbh=rs_yggzbg_ygbh.trim();
		if (!(rs_yggzbg_ygbh.equals("")))	wheresql+=" and (rs_yggzbg.ygbh="+rs_yggzbg_ygbh+") ";
	}
	rs_yggzbg_sjqd=request.getParameter("rs_yggzbg_sjqd");
	if (rs_yggzbg_sjqd!=null)
	{
		rs_yggzbg_sjqd=rs_yggzbg_sjqd.trim();
		if (!(rs_yggzbg_sjqd.equals("")))	wheresql+="  and (rs_yggzbg.sjqd>=TO_DATE('"+rs_yggzbg_sjqd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjqd=request.getParameter("rs_yggzbg_sjqd2");
	if (rs_yggzbg_sjqd!=null)
	{
		rs_yggzbg_sjqd=rs_yggzbg_sjqd.trim();
		if (!(rs_yggzbg_sjqd.equals("")))	wheresql+="  and (rs_yggzbg.sjqd<=TO_DATE('"+rs_yggzbg_sjqd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjzd=request.getParameter("rs_yggzbg_sjzd");
	if (rs_yggzbg_sjzd!=null)
	{
		rs_yggzbg_sjzd=rs_yggzbg_sjzd.trim();
		if (!(rs_yggzbg_sjzd.equals("")))	wheresql+="  and (rs_yggzbg.sjzd>=TO_DATE('"+rs_yggzbg_sjzd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjzd=request.getParameter("rs_yggzbg_sjzd2");
	if (rs_yggzbg_sjzd!=null)
	{
		rs_yggzbg_sjzd=rs_yggzbg_sjzd.trim();
		if (!(rs_yggzbg_sjzd.equals("")))	wheresql+="  and (rs_yggzbg.sjzd<=TO_DATE('"+rs_yggzbg_sjzd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_xm=request.getParameter("rs_yggzbg_xm");
	if (rs_yggzbg_xm!=null)
	{
		rs_yggzbg_xm=cf.GB2Uni(rs_yggzbg_xm);
		if (!(rs_yggzbg_xm.equals("")))	wheresql+=" and  (rs_yggzbg.xm='"+rs_yggzbg_xm+"')";
	}
	rs_yggzbg_xzzwbm=request.getParameter("rs_yggzbg_xzzwbm");
	if (rs_yggzbg_xzzwbm!=null)
	{
		rs_yggzbg_xzzwbm=cf.GB2Uni(rs_yggzbg_xzzwbm);
		if (!(rs_yggzbg_xzzwbm.equals("")))	wheresql+=" and  (rs_yggzbg.xzzwbm='"+rs_yggzbg_xzzwbm+"')";
	}
	rs_yggzbg_ssfgs=request.getParameter("rs_yggzbg_ssfgs");
	if (rs_yggzbg_ssfgs!=null)
	{
		rs_yggzbg_ssfgs=cf.GB2Uni(rs_yggzbg_ssfgs);
		if (!(rs_yggzbg_ssfgs.equals("")))	wheresql+=" and  (rs_yggzbg.ssfgs='"+rs_yggzbg_ssfgs+"')";
	}
	rs_yggzbg_dwbh=request.getParameter("rs_yggzbg_dwbh");
	if (rs_yggzbg_dwbh!=null)
	{
		rs_yggzbg_dwbh=cf.GB2Uni(rs_yggzbg_dwbh);
		if (!(rs_yggzbg_dwbh.equals("")))	wheresql+=" and  (rs_yggzbg.dwbh='"+rs_yggzbg_dwbh+"')";
	}
	rs_yggzbg_lrr=request.getParameter("rs_yggzbg_lrr");
	if (rs_yggzbg_lrr!=null)
	{
		rs_yggzbg_lrr=cf.GB2Uni(rs_yggzbg_lrr);
		if (!(rs_yggzbg_lrr.equals("")))	wheresql+=" and  (rs_yggzbg.lrr='"+rs_yggzbg_lrr+"')";
	}
	rs_yggzbg_lrsj=request.getParameter("rs_yggzbg_lrsj");
	if (rs_yggzbg_lrsj!=null)
	{
		rs_yggzbg_lrsj=rs_yggzbg_lrsj.trim();
		if (!(rs_yggzbg_lrsj.equals("")))	wheresql+="  and (rs_yggzbg.lrsj>=TO_DATE('"+rs_yggzbg_lrsj+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_lrsj=request.getParameter("rs_yggzbg_lrsj2");
	if (rs_yggzbg_lrsj!=null)
	{
		rs_yggzbg_lrsj=rs_yggzbg_lrsj.trim();
		if (!(rs_yggzbg_lrsj.equals("")))	wheresql+="  and (rs_yggzbg.lrsj<=TO_DATE('"+rs_yggzbg_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT rs_yggzbg.sjqd,rs_yggzbg.sjzd,a.dwmc ssbm,rs_yggzbg.xm,rs_yggzbg.xzzwbm,rs_yggzbg.gzsm,rs_yggzbg.gzsj,rs_yggzbg.lrr,rs_yggzbg.lrsj,b.dwmc ssfgs,rs_yggzbg.ygbh  ";
	ls_sql+=" FROM rs_yggzbg,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where rs_yggzbg.dwbh=a.dwbh and rs_yggzbg.ssfgs=b.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_yggzbg.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_yggzbgList.jsp","","","EditRs_yggzbg.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ygbh","sjqd","rs_yggzbg_sjzd","rs_yggzbg_xm","rs_yggzbg_xzzwbm","rs_yggzbg_ssfgs","rs_yggzbg_dwbh","rs_yggzbg_gzsm","rs_yggzbg_gzsj","rs_yggzbg_lrr","rs_yggzbg_lrsj","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ygbh","sjqd"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Rs_yggzbgList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from rs_yggzbg where "+chooseitem;
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
  <B><font size="3">员工工作报告-维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">报告时间起点</td>
	<td  width="5%">报告时间终点</td>
	<td  width="7%">所属部门</td>
	<td  width="5%">姓名</td>
	<td  width="5%">职务</td>
	<td  width="46%">工作说明</td>
	<td  width="4%">工作时间</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="6%">所属分公司</td>
	<td  width="4%">员工序号</td>
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