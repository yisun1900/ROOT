<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String xsph=cf.GB2Uni(request.getParameter("xsph"));

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String clbm=null;
	String clmc=null;
	String cllb=null;
	String cldlbm=null;
	String clxlbm=null;
	String scsmc=null;
	String ppmc=null;
	String cllbbm=null;
	String xh=null;
	String gg=null;
	String cd=null;
	String cgzq=null;
	String bzq=null;
	String nbbm=null;

	
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_cljgb.dqbm='"+dqbm+"')";
	}
	String sfcy=null;
	sfcy=request.getParameter("sfcy");
	if (sfcy!=null)
	{
		sfcy=cf.GB2Uni(sfcy);
		if (!(sfcy.equals("")))	wheresql+=" and  (jxc_cljgb.sfcy='"+sfcy+"')";
	}
	String xsfs=null;
	xsfs=request.getParameter("xsfs");
	if (xsfs!=null)
	{
		xsfs=cf.GB2Uni(xsfs);
		if (!(xsfs.equals("")))	wheresql+=" and  (jxc_cljgb.xsfs='"+xsfs+"')";
	}
	
	nbbm=request.getParameter("nbbm");
	if (nbbm!=null)
	{
		nbbm=cf.GB2Uni(nbbm);
		if (!(nbbm.equals("")))	wheresql+=" and  (jxc_clbm.nbbm='"+nbbm+"')";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (jxc_clbm.clbm='"+clbm+"')";
	}
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (jxc_clbm.clmc like '%"+clmc+"%')";
	}
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (jxc_clbm.cldlbm='"+cldlbm+"')";
	}
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_clbm.clxlbm='"+clxlbm+"')";
	}
	scsmc=request.getParameter("scsmc");
	if (scsmc!=null)
	{
		scsmc=cf.GB2Uni(scsmc);
		if (!(scsmc.equals("")))	wheresql+=" and  (jxc_clbm.scsmc='"+scsmc+"')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jxc_clbm.ppmc='"+ppmc+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (jxc_clbm.xh like '%"+xh+"%')";
	}
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (jxc_clbm.gg like '%"+gg+"%')";
	}

	String myxssl=request.getParameter("myxssl");//每页显示数量

	ls_sql="SELECT clxlbm,jxc_cljgb.clbm,nbbm,clmc,xh,gg,jldwbm,jxc_cljgb.dgzjg,DECODE(jxc_cljgb.xsfs,'1','代销品','2','现货',3,'期货销售',4,'可负库存') xsfs,DECODE(jxc_cljgb.sfcy,'Y','常用','N','否') sfcy,bzgg,djzl,bzq,ppmc,DECODE(cglb,'J','集采','D','地方采'),jxc_clbm.bz ";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb  ";
    ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm(+)";
    ls_sql+=" and jxc_clbm.cllb='1'";//0：主材；1：辅材
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.clmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_cljgbCxList.jsp?xsph="+xsph,"","","InsertJxc_clbm.jsp?xsph="+xsph+"&dqbm="+dqbm);
	pageObj.setPageRow(Integer.parseInt(myxssl));
	pageObj.setEditStr("录入");

//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
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
  <B><font size="3">辅材销售单－选择材料（销售单号：<%=xsph%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">材料小类</td>
	<td  width="6%">材料编码</td>
	<td  width="6%">内部编码</td>
	<td  width="11%">材料名称</td>

	<td  width="7%">型号</td>
	<td  width="7%">规格</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">对工长价格</td>
	<td  width="5%">销售方式</td>
	<td  width="3%">是否常用</td>
	<td  width="4%">包装规格</td>
	<td  width="4%">单件重量</td>
	<td  width="4%">保质期</td>
	<td  width="10%">子品牌</td>
	<td  width="4%">采购类别</td>
	<td  width="8%">备注</td>
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