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
	String fkfabm=null;
	String cw_fkfamx_fkcs=null;
	String cw_fkfamx_lx=null;
	String sfbhglf=null;
	String sfbhsj=null;
	fkfabm=request.getParameter("fkfabm");
	if (fkfabm!=null)
	{
		fkfabm=cf.GB2Uni(fkfabm);
		if (!(fkfabm.equals("")))	wheresql+=" and  (cw_fkfamx.fkfabm='"+fkfabm+"')";
	}
	cw_fkfamx_fkcs=request.getParameter("cw_fkfamx_fkcs");
	if (cw_fkfamx_fkcs!=null)
	{
		cw_fkfamx_fkcs=cw_fkfamx_fkcs.trim();
		if (!(cw_fkfamx_fkcs.equals("")))	wheresql+=" and (cw_fkfamx.fkcs="+cw_fkfamx_fkcs+") ";
	}
	cw_fkfamx_lx=request.getParameter("cw_fkfamx_lx");
	if (cw_fkfamx_lx!=null)
	{
		cw_fkfamx_lx=cf.GB2Uni(cw_fkfamx_lx);
		if (!(cw_fkfamx_lx.equals("")))	wheresql+=" and  (cw_fkfamx.lx='"+cw_fkfamx_lx+"')";
	}
	sfbhglf=request.getParameter("sfbhglf");
	if (sfbhglf!=null)
	{
		sfbhglf=cf.GB2Uni(sfbhglf);
		if (!(sfbhglf.equals("")))	wheresql+=" and  (cw_fkfamx.sfbhglf='"+sfbhglf+"')";
	}
	sfbhsj=request.getParameter("sfbhsj");
	if (sfbhsj!=null)
	{
		sfbhsj=cf.GB2Uni(sfbhsj);
		if (!(sfbhsj.equals("")))	wheresql+=" and  (cw_fkfamx.sfbhsj='"+sfbhsj+"')";
	}
	ls_sql="SELECT fkfamc,cw_fkfamx.fkfabm,cw_fkfamx.fkcs,cw_fkcs.fkcsmc, DECODE(cw_fkfamx.lx,'1','按折前收款(不含增减项)','2','按折前收款（含增减项一次收取）','3','按折前收款（含增减项分次收取）','6','按折后收款(不含增减项)','7','按折后收款（含增减项一次收取）','8','按折后收款（含增减项分次收取）','A','折前增减项','B','折后增减项') lx,DECODE(cw_fkfamx.sfsjfsesk,'N','否','Y','总额') sfsjfsesk,DECODE(cw_fkfamx.sfbhgcf,'N','不包含','Y','包含') sfbhgcf,DECODE(cw_fkfamx.sfbhjrqtf,'N','不包含','Y','包含') sfbhjrqtf,DECODE(cw_fkfamx.sfbhbjrqtf,'N','不包含','Y','包含') sfbhbjrqtf,DECODE(cw_fkfamx.sfbhsjf,'N','不包含','Y','包含') sfbhsjf,DECODE(cw_fkfamx.sfbhglf,'N','不包含','Y','包含') sfbhglf,DECODE(cw_fkfamx.sfbhsj,'N','不包含','Y','包含') sfbhsj,DECODE(cw_fkfamx.sfbhzcf,'N','不包含','Y','包含') sfbhzcf,cw_fkfamx.bqfkbl,cw_fkfamx.yfkbl  ";
	ls_sql+=" FROM cw_fkcs,cw_fkfamx,cw_fkfabm  ";
    ls_sql+=" where cw_fkfamx.fkcs=cw_fkcs.fkcs(+) and cw_fkfamx.fkfabm=cw_fkfabm.fkfabm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_fkfamx.fkfabm,cw_fkfamx.fkcs";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_fkfamxCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"fkfamc","fkcsmc","lx","sfsjfsesk","sfbhgcf","sfbhjrqtf","sfbhbjrqtf","sfbhsjf","sfbhglf","sfbhsj","sfbhzcf","bqfkbl","yfkbl"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"fkfabm","fkcs"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("fkfamc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	<td  width="12%">付款方案</td>
	<td  width="8%">收款期数</td>
	<td  width="18%">收款方式</td>
	<td  width="6%">是否按实际发生总额收款</td>
	<td  width="7%">是否含工程费</td>
	<td  width="7%">是否含记业绩其它费</td>
	<td  width="7%">是否含不记业绩其它费</td>
	<td  width="6%">是否含设计费</td>
	<td  width="7%">收款是否包含管理费</td>
	<td  width="6%">收款是否包含税金</td>
	<td  width="6%">是否含主材费</td>
	<td  width="6%">本期收款比率（%）</td>
	<td  width="6%">累计收款比率（%）</td>
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