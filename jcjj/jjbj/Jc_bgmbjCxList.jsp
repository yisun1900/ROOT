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
	String xcmbm=null;
	String xcmlxbm=null;
	String bklxxh=null;
	String mbcl=null;
	String xbpz=null;
	String zsxt=null;
	String jjfs=null;
	String pmdj=null;
	String ymdj=null;
	String zpmc=null;
	String lrr=null;
	String lrsj=null;
	xcmbm=request.getParameter("xcmbm");
	if (xcmbm!=null)
	{
		xcmbm=cf.GB2Uni(xcmbm);
		if (!(xcmbm.equals("")))	wheresql+=" and  (jc_bgmbj.xcmbm='"+xcmbm+"')";
	}
	xcmlxbm=request.getParameter("xcmlxbm");
	if (xcmlxbm!=null)
	{
		xcmlxbm=cf.GB2Uni(xcmlxbm);
		if (!(xcmlxbm.equals("")))	wheresql+=" and  (jc_bgmbj.xcmlxbm='"+xcmlxbm+"')";
	}
	bklxxh=request.getParameter("bklxxh");
	if (bklxxh!=null)
	{
		bklxxh=cf.GB2Uni(bklxxh);
		if (!(bklxxh.equals("")))	wheresql+=" and  (jc_bgmbj.bklxxh='"+bklxxh+"')";
	}
	mbcl=request.getParameter("mbcl");
	if (mbcl!=null)
	{
		mbcl=cf.GB2Uni(mbcl);
		if (!(mbcl.equals("")))	wheresql+=" and  (jc_bgmbj.mbcl='"+mbcl+"')";
	}
	xbpz=request.getParameter("xbpz");
	if (xbpz!=null)
	{
		xbpz=cf.GB2Uni(xbpz);
		if (!(xbpz.equals("")))	wheresql+=" and  (jc_bgmbj.xbpz='"+xbpz+"')";
	}
	zsxt=request.getParameter("zsxt");
	if (zsxt!=null)
	{
		zsxt=cf.GB2Uni(zsxt);
		if (!(zsxt.equals("")))	wheresql+=" and  (jc_bgmbj.zsxt='"+zsxt+"')";
	}
	jjfs=request.getParameter("jjfs");
	if (jjfs!=null)
	{
		jjfs=cf.GB2Uni(jjfs);
		if (!(jjfs.equals("")))	wheresql+=" and  (jc_bgmbj.jjfs='"+jjfs+"')";
	}
	pmdj=request.getParameter("pmdj");
	if (pmdj!=null)
	{
		pmdj=pmdj.trim();
		if (!(pmdj.equals("")))	wheresql+=" and  (jc_bgmbj.pmdj="+pmdj+") ";
	}
	ymdj=request.getParameter("ymdj");
	if (ymdj!=null)
	{
		ymdj=ymdj.trim();
		if (!(ymdj.equals("")))	wheresql+=" and  (jc_bgmbj.ymdj="+ymdj+") ";
	}
	zpmc=request.getParameter("zpmc");
	if (zpmc!=null)
	{
		zpmc=cf.GB2Uni(zpmc);
		if (!(zpmc.equals("")))	wheresql+=" and  (jc_bgmbj.zpmc='"+zpmc+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (jc_bgmbj.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jc_bgmbj.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jc_bgmbj.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT xcmbm,xcmlxmc,bklxxh,mbcl,xbpz,DECODE(jjfs,'1','平米单价','2','平米单价+封边延米单价') jjfs,pmdj,ymdj,'<IMG SRC=\"images/'||UPPER(jc_bgmbj.zpmc)||'\" width=100>' zpmc,zsxt,bz,lrr,lrsj  ";
	ls_sql+=" FROM jc_bgmbj,jdm_xcmlxbm  ";
    ls_sql+=" where jc_bgmbj.xcmlxbm=jdm_xcmlxbm.xcmlxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by xcmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_bgmbjCxList.jsp","","","");
	pageObj.setPageRow(100);//设置每页显示记录数

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
  <B><font size="3">型材门报价－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">型材门编码</td>
	<td  width="4%">型材门类型</td>
	<td align="left" width="9%">&nbsp;&nbsp;<strong>推拉门</strong>：边框型号<BR>
	  &nbsp;&nbsp;<strong>吸塑</strong>：刀型<BR>
	  &nbsp;&nbsp;<strong>包覆</strong>：刀型<BR>
	  &nbsp;&nbsp;<strong>板材铝门</strong>：门型</td>
	<td align="left" width="11%">&nbsp;&nbsp;<strong>推拉门</strong>：材料<BR>
	  &nbsp;&nbsp;<strong>吸塑</strong>：花色<BR>
	  &nbsp;&nbsp;<strong>包覆</strong>：花色<BR>
	  &nbsp;&nbsp;<strong>板材铝门</strong>：材料</td>
	<td  width="9%">芯板配置</td>
	<td  width="5%">计价方式</td>
	<td  width="4%">平米单价</td>
	<td  width="4%">延米单价</td>
	<td  width="8%">照片名称</td>
	<td  width="11%">装饰线条</td>
	<td  width="23%">备注</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
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