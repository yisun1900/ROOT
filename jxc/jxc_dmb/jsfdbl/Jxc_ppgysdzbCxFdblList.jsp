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
	String ppbm=null;
	String ppmc=null;
	String gysbm=null;
	String gysmc=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=ssfgs.trim();
		if (!(ssfgs.equals("")))	wheresql+=" and (jxc_ppgysdzb.ssfgs='"+ssfgs+"') ";
	}
	
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=ppbm.trim();
		if (!(ppbm.equals("")))	wheresql+=" and (jxc_ppgysdzb.ppbm="+ppbm+") ";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jxc_ppgysdzb.ppmc like '%"+ppmc+"%')";
	}
	gysbm=request.getParameter("gysbm");
	if (gysbm!=null)
	{
		gysbm=gysbm.trim();
		if (!(gysbm.equals("")))	wheresql+=" and (jxc_ppgysdzb.gysbm="+gysbm+") ";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (jxc_ppgysdzb.gysmc like '%"+gysmc+"%')";
	}


	ls_sql="SELECT  jxc_ppgysdzb.ppbm,jxc_ppgysdzb.ppmc,jxc_ppgysdzb.gysbm,jxc_ppgysdzb.gysmc,jxc_ppgysdzb.azfjsbl||'%' azfjsbl,jxc_ppgysdzb.ycfjsbl||'%' ycfjsbl,fdbl||'%' fdbl,cxfdbl||'%' cxfdbl,khfdbl||'%' khfdbl,khcxfdbl||'%' khcxfdbl,tcjrbl||'%' tcjrbl,tccxjrbl||'%' tccxjrbl,xpjsbl||'%' xpjsbl,xpcxjsbl||'%' xpcxjsbl,xpkhfdbl||'%' xpkhfdbl,xpkhcxfdbl||'%' xpkhcxfdbl,xptcjrbl||'%' xptcjrbl,xptccxjrbl||'%' xptccxjrbl,jxc_ppgysdzb.lrr,jxc_ppgysdzb.lrsj,jxc_ppgysdzb.ssfgs,dwmc ";
	ls_sql+=" FROM jxc_ppgysdzb,jxc_ppxx,jxc_gysxx,sq_dwxx  ";
    ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm(+) ";
    ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm(+) ";
    ls_sql+=" and jxc_ppgysdzb.ssfgs=sq_dwxx.dwbh(+) ";
    ls_sql+=" and jxc_ppxx.pplb='1' ";
    ls_sql+=" and jxc_gysxx.cllx='1' ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and jxc_ppgysdzb.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_ppgysdzb.ssfgs in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
	ls_sql+=" order by jxc_ppgysdzb.ssfgs,jxc_ppgysdzb.ppmc,jxc_ppgysdzb.gysmc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_ppgysdzbCxFdblList.jsp","","","");
	pageObj.setPageRow(26);//设置每页显示记录数
 
 //设置显示列
	String[] disColName={"ppbm","ppmc","gysbm","gysmc","azfjsbl","ycfjsbl","fdbl","cxfdbl","khfdbl","khcxfdbl","tcjrbl","tccxjrbl","xpjsbl","xpcxjsbl","xpkhfdbl","xpkhcxfdbl","xptcjrbl","xptccxjrbl","lrr","lrsj","dwmc"};
	pageObj.setDisColName(disColName);

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
  <B><font size="3">结算比例</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">子品牌编码</td>
	<td  width="6%">子品牌名称</td>
	<td  width="3%">供应商编码</td>
	<td  width="13%">供应商名称</td>
	<td  width="4%">安装费结算比例</td>
	<td  width="4%">远程费结算比例</td>
	<td  width="4%">代购厂商正常结算比例</td>
	<td  width="4%">代购厂商促销结算比例</td>
	<td  width="4%">代购客户正常结算比例</td>
	<td  width="4%">代购客户促销结算比例</td>
	<td  width="4%">代购提成正常记入比例</td>
	<td  width="4%">代购提成促销记入比例</td>
	<td  width="4%">选配厂商正常结算比例</td>
	<td  width="4%">选配厂商促销结算比例</td>
	<td  width="4%">选配客户正常结算比例</td>
	<td  width="4%">选配客户促销结算比例</td>
	<td  width="4%">选配提成正常记入比例</td>
	<td  width="4%">选配提成促销记入比例</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="12%">所属分公司</td>
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