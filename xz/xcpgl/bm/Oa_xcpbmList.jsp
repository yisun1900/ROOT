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
	String oa_xcpbm_xcpbm=null;
	String oa_xcpbm_xcpmc=null;
	String[] oa_xcpbm_xcpflbm=null;
	String oa_xcpbm_jldw=null;
	String oa_xcpbm_dj=null;
	String oa_xcpbm_sfxsp=null;
	String oa_xcpbm_xh=null;

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (oa_xcpbm.dwbh='"+dwbh+"')";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (oa_xcpbm.lrr='"+lrr+"')";
	}
	
	String oa_xcpbm_fgsbh=null;
	oa_xcpbm_xcpbm=request.getParameter("oa_xcpbm_xcpbm");
	if (oa_xcpbm_xcpbm!=null)
	{
		oa_xcpbm_xcpbm=cf.GB2Uni(oa_xcpbm_xcpbm);
		if (!(oa_xcpbm_xcpbm.equals("")))	wheresql+=" and  (oa_xcpbm.xcpbm='"+oa_xcpbm_xcpbm+"')";
	}
	oa_xcpbm_xcpmc=request.getParameter("oa_xcpbm_xcpmc");
	if (oa_xcpbm_xcpmc!=null)
	{
		oa_xcpbm_xcpmc=cf.GB2Uni(oa_xcpbm_xcpmc);
		if (!(oa_xcpbm_xcpmc.equals("")))	wheresql+=" and  (oa_xcpbm.xcpmc like '%"+oa_xcpbm_xcpmc+"%')";
	}
	oa_xcpbm_xcpflbm=request.getParameterValues("oa_xcpbm_xcpflbm");
	if (oa_xcpbm_xcpflbm!=null)
	{
		wheresql+=cf.arrayToSQL(oa_xcpbm_xcpflbm,"oa_xcpbm.xcpflbm");
	}
	oa_xcpbm_jldw=request.getParameter("oa_xcpbm_jldw");
	if (oa_xcpbm_jldw!=null)
	{
		oa_xcpbm_jldw=cf.GB2Uni(oa_xcpbm_jldw);
		if (!(oa_xcpbm_jldw.equals("")))	wheresql+=" and  (oa_xcpbm.jldw='"+oa_xcpbm_jldw+"')";
	}
	oa_xcpbm_dj=request.getParameter("oa_xcpbm_dj");
	if (oa_xcpbm_dj!=null)
	{
		oa_xcpbm_dj=oa_xcpbm_dj.trim();
		if (!(oa_xcpbm_dj.equals("")))	wheresql+=" and  (oa_xcpbm.dj="+oa_xcpbm_dj+") ";
	}
	oa_xcpbm_sfxsp=request.getParameter("oa_xcpbm_sfxsp");
	if (oa_xcpbm_sfxsp!=null)
	{
		oa_xcpbm_sfxsp=cf.GB2Uni(oa_xcpbm_sfxsp);
		if (!(oa_xcpbm_sfxsp.equals("")))	wheresql+=" and  (oa_xcpbm.sfxsp='"+oa_xcpbm_sfxsp+"')";
	}
	oa_xcpbm_xh=request.getParameter("oa_xcpbm_xh");
	if (oa_xcpbm_xh!=null)
	{
		oa_xcpbm_xh=oa_xcpbm_xh.trim();
		if (!(oa_xcpbm_xh.equals("")))	wheresql+=" and (oa_xcpbm.xh="+oa_xcpbm_xh+") ";
	}
	oa_xcpbm_fgsbh=request.getParameter("oa_xcpbm_fgsbh");
	if (oa_xcpbm_fgsbh!=null)
	{
		oa_xcpbm_fgsbh=cf.GB2Uni(oa_xcpbm_fgsbh);
		if (!(oa_xcpbm_fgsbh.equals("")))	wheresql+=" and  (oa_xcplqfw.fgsbh='"+oa_xcpbm_fgsbh+"')";
	}
	ls_sql="SELECT oa_xcpbm.xcpbm,oa_xcpbm.xcpmc,xcpflmc,oa_xcpbm.jldw,oa_xcpbm.dj, DECODE(oa_xcpbm.sfxsp,'N','不需要','Y','需要') sfxsp,oa_xcpbm.xh,sq_dwxx.dwmc,oa_xcpbm.bz  ";
	ls_sql+=" FROM oa_xcpbm,sq_dwxx,oa_xcpflbm,oa_xcplqfw  ";
    ls_sql+=" where oa_xcpbm.xcpflbm=oa_xcpflbm.xcpflbm(+)";
    ls_sql+=" and oa_xcpbm.xcpbm=oa_xcplqfw.xcpbm and  oa_xcplqfw.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by oa_xcpbm.xcpbm,oa_xcplqfw.fgsbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Oa_xcpbmList.jsp","SelectOa_xcpbm.jsp","","EditOa_xcpbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xcpbm","oa_xcpbm_xcpmc","oa_xcpbm_xcpflbm","oa_xcpbm_jldw","oa_xcpbm_dj","oa_xcpbm_sfxsp","oa_xcpbm_xh","sq_dwxx_dwmc","oa_xcpbm_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xcpbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Oa_xcpbmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("xcpbm","1");//列参数对象加入Hash表
	spanColHash.put("xcpmc","1");//列参数对象加入Hash表
	spanColHash.put("xcpflmc","1");//列参数对象加入Hash表
	spanColHash.put("jldw","1");//列参数对象加入Hash表
	spanColHash.put("dj","1");//列参数对象加入Hash表
	spanColHash.put("sfxsp","1");//列参数对象加入Hash表
	spanColHash.put("xh","1");//列参数对象加入Hash表
	spanColHash.put("bz","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] xcpbm = request.getParameterValues("xcpbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xcpbm,"xcpbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from oa_xcplqfw where "+chooseitem;
		sql[1]="delete from oa_xcpbm where "+chooseitem;
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="7%">印刷品编码</td>
	<td  width="16%">印刷品名称</td>
	<td  width="15%">印刷品分类</td>
	<td  width="8%">计量单位</td>
	<td  width="7%">单价</td>
	<td  width="7%">是否需审批</td>
	<td  width="6%">序号</td>
	<td  width="13%">可领取分公司</td>
	<td  width="14%">备注</td>
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