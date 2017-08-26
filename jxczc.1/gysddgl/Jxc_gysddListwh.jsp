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
	String gysddph=null;
	String ddzt=null;
	String dqbm=null;
	String gysbm=null;
	String gysmc=null;
	String cllb=null;
	String xdr=null;
	String xdrq=null;
	String ssfgs=null;
	String ssbm=null;
	String psfs=null;
	String yqdhsj=null;
	String gysjsr=null;
	String gysjsrq=null;
	String gysfhr=null;
	String gysfhrq=null;
	String jsr=null;
	String jsrq=null;
	String bz=null;
	String cglb=null;
	cglb=request.getParameter("cglb");
	if (cglb!=null)
	{
		cglb=cf.GB2Uni(cglb);
		if (!(cglb.equals("")))	wheresql+=" and  (jxc_gysdd.cglb='"+cglb+"')";
	}
	gysddph=request.getParameter("gysddph");
	if (gysddph!=null)
	{
		gysddph=cf.GB2Uni(gysddph);
		if (!(gysddph.equals("")))	wheresql+=" and  (jxc_gysdd.gysddph='"+gysddph+"')";
	}
	ddzt=request.getParameter("ddzt");
	if (ddzt!=null)
	{
		ddzt=cf.GB2Uni(ddzt);
		if (!(ddzt.equals("")))	wheresql+=" and  (jxc_gysdd.ddzt='"+ddzt+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_gysdd.dqbm='"+dqbm+"')";
	}
	gysbm=request.getParameter("gysbm");
	if (gysbm!=null)
	{
		gysbm=gysbm.trim();
		if (!(gysbm.equals("")))	wheresql+=" and (jxc_gysdd.gysbm="+gysbm+") ";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (jxc_gysdd.gysmc='"+gysmc+"')";
	}
	cllb=request.getParameter("cllb");
	if (cllb!=null)
	{
		cllb=cf.GB2Uni(cllb);
		if (!(cllb.equals("")))	wheresql+=" and  (jxc_gysdd.cllb='"+cllb+"')";
	}
	xdr=request.getParameter("xdr");
	if (xdr!=null)
	{
		xdr=cf.GB2Uni(xdr);
		if (!(xdr.equals("")))	wheresql+=" and  (jxc_gysdd.xdr='"+xdr+"')";
	}
	xdrq=request.getParameter("xdrq");
	if (xdrq!=null)
	{
		xdrq=xdrq.trim();
		if (!(xdrq.equals("")))	wheresql+="  and (jxc_gysdd.xdrq=TO_DATE('"+xdrq+"','YYYY/MM/DD'))";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (jxc_gysdd.ssfgs='"+ssfgs+"')";
	}
	ssbm=request.getParameter("ssbm");
	if (ssbm!=null)
	{
		ssbm=cf.GB2Uni(ssbm);
		if (!(ssbm.equals("")))	wheresql+=" and  (jxc_gysdd.ssbm='"+ssbm+"')";
	}
	psfs=request.getParameter("psfs");
	if (psfs!=null)
	{
		psfs=cf.GB2Uni(psfs);
		if (!(psfs.equals("")))	wheresql+=" and  (jxc_gysdd.psfs='"+psfs+"')";
	}
	yqdhsj=request.getParameter("yqdhsj");
	if (yqdhsj!=null)
	{
		yqdhsj=yqdhsj.trim();
		if (!(yqdhsj.equals("")))	wheresql+="  and (jxc_gysdd.yqdhsj=TO_DATE('"+yqdhsj+"','YYYY/MM/DD'))";
	}
	gysjsr=request.getParameter("gysjsr");
	if (gysjsr!=null)
	{
		gysjsr=cf.GB2Uni(gysjsr);
		if (!(gysjsr.equals("")))	wheresql+=" and  (jxc_gysdd.gysjsr='"+gysjsr+"')";
	}
	gysjsrq=request.getParameter("gysjsrq");
	if (gysjsrq!=null)
	{
		gysjsrq=gysjsrq.trim();
		if (!(gysjsrq.equals("")))	wheresql+="  and (jxc_gysdd.gysjsrq=TO_DATE('"+gysjsrq+"','YYYY/MM/DD'))";
	}
	gysfhr=request.getParameter("gysfhr");
	if (gysfhr!=null)
	{
		gysfhr=cf.GB2Uni(gysfhr);
		if (!(gysfhr.equals("")))	wheresql+=" and  (jxc_gysdd.gysfhr='"+gysfhr+"')";
	}
	gysfhrq=request.getParameter("gysfhrq");
	if (gysfhrq!=null)
	{
		gysfhrq=gysfhrq.trim();
		if (!(gysfhrq.equals("")))	wheresql+="  and (jxc_gysdd.gysfhrq=TO_DATE('"+gysfhrq+"','YYYY/MM/DD'))";
	}
	jsr=request.getParameter("jsr");
	if (jsr!=null)
	{
		jsr=cf.GB2Uni(jsr);
		if (!(jsr.equals("")))	wheresql+=" and  (jxc_gysdd.jsr='"+jsr+"')";
	}
	jsrq=request.getParameter("jsrq");
	if (jsrq!=null)
	{
		jsrq=jsrq.trim();
		if (!(jsrq.equals("")))	wheresql+="  and (jxc_gysdd.jsrq=TO_DATE('"+jsrq+"','YYYY/MM/DD'))";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (jxc_gysdd.bz='"+bz+"')";
	}
	ls_sql="SELECT gysddph,'<a href=\"scxd.jsp?gysddph='||gysddph||'\" onclick=\"return confirm(''确定要删除订单：['||gysddph||']下单标志么？'') \">删除下单标志</a>' scxd,DECODE(ddzt,'0','等待下单','1','已下单','2','已接收','3','已发货','4','已入库','5','已结算'),dqmc,gysmc,DECODE(cllb,'0','主材','1','辅材') ";
	ls_sql+=" FROM jxc_gysdd,dm_dqbm  ";
    ls_sql+=" where jxc_gysdd.dqbm=dm_dqbm.dqbm ";
    ls_sql+=" and jxc_gysdd.cllb='0'";//0：主材；1：辅材
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_gysddListwh.jsp","SelectJxc_gysddwh.jsp","ViewJxc_gysdd.jsp","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gysddph","ddzt","dqbm","gysbm","gysmc","cllb","xdr","xdrq","ssfgs","ssbm","psfs","yqdhsj","gysjsr","gysjsrq","gysfhr","gysfhrq","jsr","jsrq","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gysddph"};
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
	<td  width="5%">&nbsp;</td>
	<td  width="12%">供应商订单批号</td>
	<td  width="6%">删除下单标志</td>
	<td  width="6%">订单状态</td>
	<td  width="5%">地区</td>
	<td  width="15%">供应商名称</td>
	<td  width="6%">订单类别</td>
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