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
	String xz_qcdm_qcph=null;
	String xz_qcdm_qcxh=null;
	String xz_qcdm_sjxm=null;
	String xz_qcdm_gcsj=null;
	String xz_qcdm_njrq=null;
	String xz_qcdm_yxsgls=null;
	String xz_qcdm_ssfgs=null;
	String xz_qcdm_lrr=null;
	String xz_qcdm_lrsj=null;
	xz_qcdm_qcph=request.getParameter("xz_qcdm_qcph");
	if (xz_qcdm_qcph!=null)
	{
		xz_qcdm_qcph=cf.GB2Uni(xz_qcdm_qcph);
		if (!(xz_qcdm_qcph.equals("")))	wheresql+=" and  (xz_qcdm.qcph like '%"+xz_qcdm_qcph+"%')";
	}
	xz_qcdm_qcxh=request.getParameter("xz_qcdm_qcxh");
	if (xz_qcdm_qcxh!=null)
	{
		xz_qcdm_qcxh=cf.GB2Uni(xz_qcdm_qcxh);
		if (!(xz_qcdm_qcxh.equals("")))	wheresql+=" and  (xz_qcdm.qcxh like '%"+xz_qcdm_qcxh+"%')";
	}
	xz_qcdm_sjxm=request.getParameter("xz_qcdm_sjxm");
	if (xz_qcdm_sjxm!=null)
	{
		xz_qcdm_sjxm=cf.GB2Uni(xz_qcdm_sjxm);
		if (!(xz_qcdm_sjxm.equals("")))	wheresql+=" and  (xz_qcdm.sjxm like '%"+xz_qcdm_sjxm+"%')";
	}
	xz_qcdm_gcsj=request.getParameter("xz_qcdm_gcsj");
	if (xz_qcdm_gcsj!=null)
	{
		xz_qcdm_gcsj=xz_qcdm_gcsj.trim();
		if (!(xz_qcdm_gcsj.equals("")))	wheresql+="  and (xz_qcdm.gcsj>=TO_DATE('"+xz_qcdm_gcsj+"','YYYY/MM/DD'))";
	}
	xz_qcdm_gcsj=request.getParameter("xz_qcdm_gcsj2");
	if (xz_qcdm_gcsj!=null)
	{
		xz_qcdm_gcsj=xz_qcdm_gcsj.trim();
		if (!(xz_qcdm_gcsj.equals("")))	wheresql+="  and (xz_qcdm.gcsj<=TO_DATE('"+xz_qcdm_gcsj+"','YYYY/MM/DD'))";
	}
	xz_qcdm_njrq=request.getParameter("xz_qcdm_njrq");
	if (xz_qcdm_njrq!=null)
	{
		xz_qcdm_njrq=xz_qcdm_njrq.trim();
		if (!(xz_qcdm_njrq.equals("")))	wheresql+="  and (xz_qcdm.njrq>=TO_DATE('"+xz_qcdm_njrq+"','YYYY/MM/DD'))";
	}
	xz_qcdm_njrq=request.getParameter("xz_qcdm_njrq2");
	if (xz_qcdm_njrq!=null)
	{
		xz_qcdm_njrq=xz_qcdm_njrq.trim();
		if (!(xz_qcdm_njrq.equals("")))	wheresql+="  and (xz_qcdm.njrq<=TO_DATE('"+xz_qcdm_njrq+"','YYYY/MM/DD'))";
	}
	xz_qcdm_yxsgls=request.getParameter("xz_qcdm_yxsgls");
	if (xz_qcdm_yxsgls!=null)
	{
		xz_qcdm_yxsgls=xz_qcdm_yxsgls.trim();
		if (!(xz_qcdm_yxsgls.equals("")))	wheresql+=" and  (xz_qcdm.yxsgls>="+xz_qcdm_yxsgls+") ";
	}
	xz_qcdm_yxsgls=request.getParameter("xz_qcdm_yxsgls2");
	if (xz_qcdm_yxsgls!=null)
	{
		xz_qcdm_yxsgls=xz_qcdm_yxsgls.trim();
		if (!(xz_qcdm_yxsgls.equals("")))	wheresql+=" and  (xz_qcdm.yxsgls<="+xz_qcdm_yxsgls+") ";
	}
	xz_qcdm_ssfgs=request.getParameter("xz_qcdm_ssfgs");
	if (xz_qcdm_ssfgs!=null)
	{
		xz_qcdm_ssfgs=cf.GB2Uni(xz_qcdm_ssfgs);
		if (!(xz_qcdm_ssfgs.equals("")))	wheresql+=" and  (xz_qcdm.ssfgs='"+xz_qcdm_ssfgs+"')";
	}
	xz_qcdm_lrr=request.getParameter("xz_qcdm_lrr");
	if (xz_qcdm_lrr!=null)
	{
		xz_qcdm_lrr=cf.GB2Uni(xz_qcdm_lrr);
		if (!(xz_qcdm_lrr.equals("")))	wheresql+=" and  (xz_qcdm.lrr='"+xz_qcdm_lrr+"')";
	}
	xz_qcdm_lrsj=request.getParameter("xz_qcdm_lrsj");
	if (xz_qcdm_lrsj!=null)
	{
		xz_qcdm_lrsj=xz_qcdm_lrsj.trim();
		if (!(xz_qcdm_lrsj.equals("")))	wheresql+="  and (xz_qcdm.lrsj>=TO_DATE('"+xz_qcdm_lrsj+"','YYYY/MM/DD'))";
	}
	xz_qcdm_lrsj=request.getParameter("xz_qcdm_lrsj2");
	if (xz_qcdm_lrsj!=null)
	{
		xz_qcdm_lrsj=xz_qcdm_lrsj.trim();
		if (!(xz_qcdm_lrsj.equals("")))	wheresql+="  and (xz_qcdm.lrsj<=TO_DATE('"+xz_qcdm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT xz_qcdm.qcph,xz_qcdm.qcxh,xz_qcdm.sjxm,xz_qcdm.gcsj,xz_qcdm.njrq,xz_qcdm.yxsgls,sq_dwxx.dwmc,xz_qcdm.lrr,xz_qcdm.lrsj,xz_qcdm.bz  ";
	ls_sql+=" FROM sq_dwxx,xz_qcdm  ";
    ls_sql+=" where sq_dwxx.dwbh=xz_qcdm.ssfgs";
    ls_sql+=wheresql;
    ls_sql+=" order by xz_qcdm.ssfgs,xz_qcdm.qcph";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_qcdmList.jsp","SelectXz_qcdm.jsp","","EditXz_qcdm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"qcph","xz_qcdm_qcxh","xz_qcdm_sjxm","xz_qcdm_gcsj","xz_qcdm_njrq","xz_qcdm_yxsgls","sq_dwxx_dwmc","xz_qcdm_lrr","xz_qcdm_lrsj","xz_qcdm_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"qcph"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Xz_qcdmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"qcph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewXz_qcdm.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("qcph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] qcph = request.getParameterValues("qcph");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(qcph,"qcph"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from xz_qcdm where "+chooseitem;
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
  <B><font size="3">汽车档案维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="10%">汽车牌号</td>
	<td  width="15%">汽车型号</td>
	<td  width="6%">司机姓名</td>
	<td  width="8%">购车时间</td>
	<td  width="8%">年检日期</td>
	<td  width="8%">已行使公里数</td>
	<td  width="11%">所属分公司</td>
	<td  width="6%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="13%">备注</td>
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