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
	String cw_jrzjyjkh_khzq=null;
	String cw_jrzjyjkh_fgsbh=null;
	String cw_jrzjyjkh_dwbh=null;
	String cw_jrzjyjkh_yhmc=null;
	cw_jrzjyjkh_khzq=request.getParameter("cw_jrzjyjkh_khzq");
	if (cw_jrzjyjkh_khzq!=null)
	{
		cw_jrzjyjkh_khzq=cf.GB2Uni(cw_jrzjyjkh_khzq);
		if (!(cw_jrzjyjkh_khzq.equals("")))	wheresql+=" and  (cw_jrzjyjkh.khzq='"+cw_jrzjyjkh_khzq+"')";
	}
	cw_jrzjyjkh_fgsbh=request.getParameter("cw_jrzjyjkh_fgsbh");
	if (cw_jrzjyjkh_fgsbh!=null)
	{
		cw_jrzjyjkh_fgsbh=cf.GB2Uni(cw_jrzjyjkh_fgsbh);
		if (!(cw_jrzjyjkh_fgsbh.equals("")))	wheresql+=" and  (cw_jrzjyjkh.fgsbh='"+cw_jrzjyjkh_fgsbh+"')";
	}
	cw_jrzjyjkh_dwbh=request.getParameter("cw_jrzjyjkh_dwbh");
	if (cw_jrzjyjkh_dwbh!=null)
	{
		cw_jrzjyjkh_dwbh=cf.GB2Uni(cw_jrzjyjkh_dwbh);
		if (!(cw_jrzjyjkh_dwbh.equals("")))	wheresql+=" and  (cw_jrzjyjkh.dwbh='"+cw_jrzjyjkh_dwbh+"')";
	}
	cw_jrzjyjkh_yhmc=request.getParameter("cw_jrzjyjkh_yhmc");
	if (cw_jrzjyjkh_yhmc!=null)
	{
		cw_jrzjyjkh_yhmc=cf.GB2Uni(cw_jrzjyjkh_yhmc);
		if (!(cw_jrzjyjkh_yhmc.equals("")))	wheresql+=" and  (cw_jrzjyjkh.yhmc='"+cw_jrzjyjkh_yhmc+"')";
	}
	ls_sql="SELECT cw_jrzjyjkh.khzq,cw_jrzjyjkh.khqssj,cw_jrzjyjkh.khjzsj,a.dwmc fgsbh,b.dwmc,cw_jrzjyjkh.yhmc,cw_jrzjyjkh.khfs,cw_jrzjyjkh.lrr,cw_jrzjyjkh.lrsj,cw_jrzjyjkh.bz  ";
	ls_sql+=" FROM cw_jrzjyjkh,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where cw_jrzjyjkh.fgsbh=a.dwbh(+)";
    ls_sql+=" and cw_jrzjyjkh.dwbh=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrzjyjkh.khzq,cw_jrzjyjkh.fgsbh,cw_jrzjyjkh.dwbh,cw_jrzjyjkh.yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jrzjyjkhCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khzq","cw_jrzjyjkh_khqssj","cw_jrzjyjkh_khjzsj","cw_jrzjyjkh_fgsbh","dwbh","sq_dwxx_dwmc","yhmc","cw_jrzjyjkh_khfs","cw_jrzjyjkh_lrr","cw_jrzjyjkh_lrsj","cw_jrzjyjkh_bz"};
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
	<td  width="8%">考核周期</td>
	<td  width="8%">考核起始时间</td>
	<td  width="8%">考核截至时间</td>
	<td  width="10%">分公司</td>
	<td  width="9%">所属部门</td>
	<td  width="6%">姓名</td>
	<td  width="8%">考核分数</td>
	<td  width="6%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="58%">备注</td>
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