<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_lfbgfcsb_fgsbh=null;
	String cw_lfbgfcsb_bfcs=null;
	String cw_lfbgfcsb_bfjs=null;
	String cw_lfbgfcsb_bfbl=null;
	String cw_lfbgfcsb_dzld=null;
	cw_lfbgfcsb_fgsbh=request.getParameter("cw_lfbgfcsb_fgsbh");
	if (cw_lfbgfcsb_fgsbh!=null)
	{
		cw_lfbgfcsb_fgsbh=cf.GB2Uni(cw_lfbgfcsb_fgsbh);
		if (!(cw_lfbgfcsb_fgsbh.equals("")))	wheresql+=" and  (cw_lfbgfcsb.fgsbh='"+cw_lfbgfcsb_fgsbh+"')";
	}
	cw_lfbgfcsb_bfcs=request.getParameter("cw_lfbgfcsb_bfcs");
	if (cw_lfbgfcsb_bfcs!=null)
	{
		cw_lfbgfcsb_bfcs=cw_lfbgfcsb_bfcs.trim();
		if (!(cw_lfbgfcsb_bfcs.equals("")))	wheresql+=" and (cw_lfbgfcsb.bfcs="+cw_lfbgfcsb_bfcs+") ";
	}
	cw_lfbgfcsb_bfjs=request.getParameter("cw_lfbgfcsb_bfjs");
	if (cw_lfbgfcsb_bfjs!=null)
	{
		cw_lfbgfcsb_bfjs=cf.GB2Uni(cw_lfbgfcsb_bfjs);
		if (!(cw_lfbgfcsb_bfjs.equals("")))	wheresql+=" and  (cw_lfbgfcsb.bfjs='"+cw_lfbgfcsb_bfjs+"')";
	}
	cw_lfbgfcsb_bfbl=request.getParameter("cw_lfbgfcsb_bfbl");
	if (cw_lfbgfcsb_bfbl!=null)
	{
		cw_lfbgfcsb_bfbl=cw_lfbgfcsb_bfbl.trim();
		if (!(cw_lfbgfcsb_bfbl.equals("")))	wheresql+=" and  (cw_lfbgfcsb.bfbl="+cw_lfbgfcsb_bfbl+") ";
	}
	cw_lfbgfcsb_dzld=request.getParameter("cw_lfbgfcsb_dzld");
	if (cw_lfbgfcsb_dzld!=null)
	{
		cw_lfbgfcsb_dzld=cw_lfbgfcsb_dzld.trim();
		if (!(cw_lfbgfcsb_dzld.equals("")))	wheresql+=" and  (cw_lfbgfcsb.dzld="+cw_lfbgfcsb_dzld+") ";
	}
	ls_sql="SELECT sq_dwxx.dwmc,gdjsjdmc, DECODE(cw_lfbgfcsb.bfjs,'1','折前工程费','2','折后工程费','3','实收款','9','由打折力度决定折前折后'),cw_lfbgfcsb.bfbl||'%',cw_lfbgfcsb.dzld,DECODE(sfkclk,'Y','是','N','否') sfkclk,clkzdbl||'%' clkzdbl,DECODE(sfkybgf,'Y','是','N','否') sfkybgf  ";
	ls_sql+=" FROM sq_dwxx,cw_lfbgfcsb,dm_gdjsjd  ";
    ls_sql+=" where cw_lfbgfcsb.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_lfbgfcsb.bfcs=dm_gdjsjd.gdjsjd(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cw_lfbgfcsb.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_lfbgfcsb.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_lfbgfcsb.fgsbh,cw_lfbgfcsb.bfcs";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_lfbgfcsbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数


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
  <B><font size="3">拨工费参数表－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">分公司</td>
	<td  width="11%">拨付次数</td>
	<td  width="15%">拨付基数</td>
	<td  width="10%">拨付比例</td>
	<td  width="10%">打折力度</td>
	<td  width="10%">是否扣材料款</td>
	<td  width="10%">材料款最低比例</td>
	<td  width="10%">是否扣已拨工费</td>
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