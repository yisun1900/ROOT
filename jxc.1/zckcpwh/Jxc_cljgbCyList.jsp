<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");//地区编码

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (jxc_cljgb.gysmc='"+gysmc+"')";
	}
	String xsfs=null;
	xsfs=request.getParameter("xsfs");
	if (xsfs!=null)
	{
		xsfs=cf.GB2Uni(xsfs);
		if (!(xsfs.equals("")))	wheresql+=" and  (jxc_cljgb.xsfs='"+xsfs+"')";
	}
	String sfcy=null;
	sfcy=request.getParameter("sfcy");
	if (sfcy!=null)
	{
		sfcy=cf.GB2Uni(sfcy);
		if (!(sfcy.equals("")))	wheresql+=" and  (jxc_cljgb.sfcy='"+sfcy+"')";
	}
	String sfyh=null;
	sfyh=request.getParameter("sfyh");
	if (sfyh!=null)
	{
		sfyh=cf.GB2Uni(sfyh);
		if (!(sfyh.equals("")))	wheresql+=" and  (jxc_cljgb.sfyh='"+sfyh+"')";
	}

	String cldlbm=null;
	String clxlbm=null;
	String clbm=null;
	String nbbm=null;
	
	
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
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (jxc_clbm.clbm='"+clbm+"')";
	}
	nbbm=request.getParameter("nbbm");
	if (nbbm!=null)
	{
		nbbm=cf.GB2Uni(nbbm);
		if (!(nbbm.equals("")))	wheresql+=" and  (jxc_clbm.nbbm='"+nbbm+"')";
	}


	String clmc=null;
	String xh=null;
	String gg=null;
	String ppmc=null;
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (jxc_clbm.clmc like '%"+clmc+"%')";
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
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jxc_clbm.ppmc='"+ppmc+"')";
	}

	String jldwbm=null;
	String bzjldwbm=null;
	jldwbm=request.getParameter("jldwbm");
	if (jldwbm!=null)
	{
		jldwbm=cf.GB2Uni(jldwbm);
		if (!(jldwbm.equals("")))	wheresql+=" and  (jxc_clbm.jldwbm='"+jldwbm+"')";
	}
	bzjldwbm=request.getParameter("bzjldwbm");
	if (bzjldwbm!=null)
	{
		bzjldwbm=cf.GB2Uni(bzjldwbm);
		if (!(bzjldwbm.equals("")))	wheresql+=" and  (jxc_clbm.bzjldwbm='"+bzjldwbm+"')";
	}
	
	String djzl=null;
	String cgzq=null;
	String bzq=null;
	String bztxq=null;
	String lrsj=null;
	djzl=request.getParameter("djzl");
	if (djzl!=null)
	{
		djzl=djzl.trim();
		if (!(djzl.equals("")))	wheresql+=" and (jxc_clbm.djzl<="+djzl+") ";
	}
	djzl=request.getParameter("djzl2");
	if (djzl!=null)
	{
		djzl=djzl.trim();
		if (!(djzl.equals("")))	wheresql+=" and (jxc_clbm.djzl>="+djzl+") ";
	}
	cgzq=request.getParameter("cgzq");
	if (cgzq!=null)
	{
		cgzq=cgzq.trim();
		if (!(cgzq.equals("")))	wheresql+=" and (jxc_clbm.cgzq<="+cgzq+") ";
	}
	cgzq=request.getParameter("cgzq2");
	if (cgzq!=null)
	{
		cgzq=cgzq.trim();
		if (!(cgzq.equals("")))	wheresql+=" and (jxc_clbm.cgzq>="+cgzq+") ";
	}
	bzq=request.getParameter("bzq");
	if (bzq!=null)
	{
		bzq=bzq.trim();
		if (!(bzq.equals("")))	wheresql+=" and (jxc_clbm.bzq<="+bzq+") ";
	}
	bzq=request.getParameter("bzq2");
	if (bzq!=null)
	{
		bzq=bzq.trim();
		if (!(bzq.equals("")))	wheresql+=" and (jxc_clbm.bzq>="+bzq+") ";
	}
	bztxq=request.getParameter("bztxq");
	if (bztxq!=null)
	{
		bztxq=bztxq.trim();
		if (!(bztxq.equals("")))	wheresql+=" and (jxc_clbm.bztxq<="+bztxq+") ";
	}
	bztxq=request.getParameter("bztxq2");
	if (bztxq!=null)
	{
		bztxq=bztxq.trim();
		if (!(bztxq.equals("")))	wheresql+=" and (jxc_clbm.bztxq>="+bztxq+") ";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jxc_clbm.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jxc_clbm.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String myxssl=request.getParameter("myxssl");//每页显示数量

	ls_sql="SELECT dqmc,DECODE(jxc_cljgb.xsfs,'1','代销品','2','现货','3','期货销售','4','虚拟出入库') xsfs,DECODE(jxc_cljgb.sfyh,'Y','有货','N','无货') sfyh,DECODE(jxc_cljgb.sfcy,'Y','常用','N','否') sfcy,jxc_clbm.clbm,clxlbm,nbbm,clmc,xh,gg,jldwbm,TO_CHAR(jxc_cljgb.dgzjg),jxc_cljgb.zcpzsl,jxc_cljgb.dgzjg*jxc_cljgb.zcpzsl zcpje,jxc_cljgb.ccpzsl,jxc_cljgb.bfpzsl,jxc_cljgb.dhsl,jxc_cljgb.ycgsl,jxc_cljgb.gysmc,bzjldwbm,bzgg,djzl,cgzq,bzq,bztxq,cldlbm,ppmc,DECODE(cglb,'J','集团','D','地方'),jxc_clbm.bz ";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb,dm_dqbm  ";
    ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
    ls_sql+=" and jxc_cljgb.dqbm=dm_dqbm.dqbm";
    ls_sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
    ls_sql+=" and jxc_cljgb.xsfs!='1'";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
    ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"'";
    ls_sql+=wheresql;
    ls_sql+=" order by cldlbm,clxlbm,clmc,jxc_clbm.clbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_cljgbList.jsp?dqbm="+dqbm,"","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"调是否常用"};//按钮的显示名称
	String[] buttonLink={"pltzsfcy.jsp?dqbm="+dqbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

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
  <B><font size="3">维护常用材料</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">地区</td>
	<td  width="3%">销售方式</td>
	<td  width="2%">是否有货</td>
	<td  width="2%">是否常用</td>
	<td  width="4%">材料编码</td>
	<td  width="4%">材料小类</td>
	<td  width="3%">内部编码</td>
	<td  width="6%">材料名称</td>

	<td  width="5%">型号</td>
	<td  width="5%">规格</td>
	<td  width="2%">计量单位</td>
	<td  width="3%">工队价</td>
	<td  width="3%">正常品总数量</td>
	<td  width="4%">正常品对工金额</td>
	<td  width="3%">残次品总数量</td>
	<td  width="3%">报废品总数量</td>
	<td  width="3%">客户订货数量</td>
	<td  width="3%">已采购数量</td>
	<td  width="6%">供应商</td>
	<td  width="2%">包装计量单位</td>
	<td  width="2%">包装规格</td>
	<td  width="2%">单件重量</td>
	<td  width="2%">采购周期</td>
	<td  width="2%">保质期</td>
	<td  width="2%">保质提醒期</td>
	<td  width="3%">材料大类</td>
	<td  width="4%">子品牌</td>
	<td  width="2%">采购类别</td>
	<td  width="38%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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