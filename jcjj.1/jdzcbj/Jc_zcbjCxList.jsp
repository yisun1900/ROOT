<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.DBPageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String zcdlbm=null;
	String zcxlbm=null;
	String ppmc=null;
	String xh=null;
	String zcbm=null;
	String zcmc=null;

	String zcysbm=null;
	String gg=null;


	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcdlbm='"+zcdlbm+"')";
	}
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcxlbm='"+zcxlbm+"')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_zcjgb.ppmc='"+ppmc+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (jc_zcjgb.xh like '%"+xh+"%')";
	}
	zcbm=request.getParameter("zcbm");
	if (zcbm!=null)
	{
		zcbm=cf.GB2Uni(zcbm);
		if (!(zcbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcbm='"+zcbm+"')";
	}
	zcmc=request.getParameter("zcmc");
	if (zcmc!=null)
	{
		zcmc=cf.GB2Uni(zcmc);
		if (!(zcmc.equals("")))	wheresql+=" and  (jc_zcjgb.zcmc like '%"+zcmc+"%')";
	}
	zcysbm=request.getParameter("zcysbm");
	if (zcysbm!=null)
	{
		zcysbm=cf.GB2Uni(zcysbm);
		if (!(zcysbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcysbm like '%"+zcysbm+"%')";
	}
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (jc_zcjgb.gg like '%"+gg+"%')";
	}

	String jgpx=request.getParameter("jgpx");
	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT FItemID,FName,FModel,FOrderUnitID,FSalePrice";
	ls_sql+=" FROM t_ICItem";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
	if (jgpx==null || jgpx.equals(""))
	{
//		ls_sql+=" order by FModel";
	}
	else{
		ls_sql+=" order by "+jgpx;
	}

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_zcbjCxList.jsp","","","","sqlserver","sa","");
	pageObj.setPageRow(Integer.parseInt(myxssl));//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zcbm","zcmc","jdm_zcdlbm_zcdlmc","xh","gg","lsj","yhj","sq_dwxx_dwmc","zp","bz","ppbm","zclbbm","zcysbm","jldwbm","sfbhpj","pjts","pjjg"};
	pageObj.setDisColName(disColName);
*/


}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">


</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">产品报价查询</font></B>
</CENTER>


<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">主材编码</td>
	<td  width="4%">主材名称</td>
	<td  width="4%">型号</td>
	<td  width="2%">计量单位</td>
	<td  width="2%">销售限价</td>
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