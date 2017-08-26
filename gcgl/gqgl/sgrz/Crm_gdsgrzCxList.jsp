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
	String djbh=null;
	String khbh=null;
	String lrr=null;
	String lrsj=null;
	String sybz=null;
	String syr=null;
	String sysj=null;
	djbh=request.getParameter("djbh");
	if (djbh!=null)
	{
		djbh=cf.GB2Uni(djbh);
		if (!(djbh.equals("")))	wheresql+=" and  (djbh='"+djbh+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	sybz=request.getParameter("sybz");
	if (sybz!=null)
	{
		sybz=cf.GB2Uni(sybz);
		if (!(sybz.equals("")))	wheresql+=" and  (sybz='"+sybz+"')";
	}
	syr=request.getParameter("syr");
	if (syr!=null)
	{
		syr=cf.GB2Uni(syr);
		if (!(syr.equals("")))	wheresql+=" and  (syr='"+syr+"')";
	}
	sysj=request.getParameter("sysj");
	if (sysj!=null)
	{
		sysj=sysj.trim();
		if (!(sysj.equals("")))	wheresql+="  and (sysj>=TO_DATE('"+sysj+"','YYYY/MM/DD'))";
	}
	sysj=request.getParameter("sysj2");
	if (sysj!=null)
	{
		sysj=sysj.trim();
		if (!(sysj.equals("")))	wheresql+="  and (sysj<=TO_DATE('"+sysj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT djbh,khbh,qksm,lrr,lrsj, DECODE(sybz,'N','未阅','Y','已审阅'),syr,sysj  ";
	ls_sql+=" FROM crm_gdsgrz  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_gdsgrzCxList.jsp","SelectCxCrm_gdsgrz.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"djbh","khbh","qksm","lrr","lrsj","sybz","syr","sysj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"djbh"};
	pageObj.setKey(keyName);
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
	<td  width="12%">登记编号</td>
	<td  width="12%">客户编号</td>
	<td  width="12%">情况说明</td>
	<td  width="12%">录入人</td>
	<td  width="12%">录入时间</td>
	<td  width="12%">审阅标志</td>
	<td  width="12%">审阅人</td>
	<td  width="12%">审阅时间</td>
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