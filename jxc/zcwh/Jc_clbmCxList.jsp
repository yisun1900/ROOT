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
	String clbm=null;
	String clmc=null;
	String cldlbm=null;
	String xh=null;
	String gg=null;
	String lsj=null;
	String xsj=null;
	String zp=null;
	String cllbbm=null;
	String clysbm=null;
	String jldwbm=null;
	String sfbhpj=null;
	String pjts=null;

	String nbbm=null;
	nbbm=request.getParameter("nbbm");
	if (nbbm!=null)
	{
		nbbm=cf.GB2Uni(nbbm);
		if (!(nbbm.equals("")))	wheresql+=" and  (jxc_clbm.nbbm like '%"+nbbm+"%')";
	}

	String sftjcp=null;
	sftjcp=request.getParameter("sftjcp");
	if (sftjcp!=null)
	{
		sftjcp=cf.GB2Uni(sftjcp);
		if (!(sftjcp.equals("")))	wheresql+=" and  (jxc_cljgb.sftjcp='"+sftjcp+"')";
	}

	String xhlist[]=request.getParameterValues("xhlist");
	xh=request.getParameter("xh");

	String mhcx=request.getParameter("mhcx");
	if (mhcx.equals("Y"))
	{
		if (xhlist!=null)
		{
			String lsxh="";
			String getxh="";
			for (int i=0;i<xhlist.length ;i++ )
			{
				getxh=cf.GB2Uni(xhlist[i]);
				lsxh+=" or (jxc_clbm.xh like '%"+getxh+"%')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (xh!=null)
			{
				xh=cf.GB2Uni(xh);
				if (!(xh.equals("")))	wheresql+=" and  (jxc_clbm.xh like '%"+xh+"%')";
			}
		}
	}
	else{
		if (xhlist!=null)
		{
			String lsxh="";
			String getxh="";
			for (int i=0;i<xhlist.length ;i++ )
			{
				getxh=cf.GB2Uni(xhlist[i]);
				lsxh+=" or (jxc_clbm.xh='"+getxh+"')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (xh!=null)
			{
				xh=cf.GB2Uni(xh);
				if (!(xh.equals("")))	wheresql+=" and  (jxc_clbm.xh='"+xh+"')";
			}
		}
	}

	String cxhdbl=null;
	cxhdbl=request.getParameter("cxhdbl");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jxc_cljgb.cxhdbl>="+cxhdbl+")";
	}
	String clxlbm=null;
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_clbm.clxlbm='"+clxlbm+"')";
	}
	cxhdbl=request.getParameter("cxhdbl2");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jxc_cljgb.cxhdbl<="+cxhdbl+")";
	}

	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jxc_cljgb.dqbm='"+dqbm+"')";

	String scsmc=null;
	scsmc=request.getParameter("scsmc");
	if (scsmc!=null)
	{
		scsmc=cf.GB2Uni(scsmc);
		if (!(scsmc.equals("")))	wheresql+=" and  (jxc_clbm.scsmc='"+scsmc+"')";
	}
	String scsmc2=null;
	scsmc2=request.getParameter("scsmc2");
	if (scsmc2!=null)
	{
		scsmc2=cf.GB2Uni(scsmc2);
		if (!(scsmc2.equals("")))	wheresql+=" and  (jxc_clbm.scsmc like '%"+scsmc2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jxc_clbm.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jxc_clbm.ppmc like '%"+ppmc2+"%')";
	}
	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (jxc_cljgb.gysmc='"+gysmc+"')";
	}
	String gysmc2=null;
	gysmc2=request.getParameter("gysmc2");
	if (gysmc2!=null)
	{
		gysmc2=cf.GB2Uni(gysmc2);
		if (!(gysmc2.equals("")))	wheresql+=" and  (jxc_cljgb.gysmc like '%"+gysmc2+"%')";
	}



	String sfyh=null;
	sfyh=request.getParameter("sfyh");
	if (sfyh!=null)
	{
		if (!(sfyh.equals("")))	wheresql+=" and  (jxc_cljgb.sfyh='"+sfyh+"')";
	}

	String sfycx=null;
	sfycx=request.getParameter("sfycx");
	if (sfycx!=null)
	{
		if (!(sfycx.equals("")))	wheresql+=" and  (jxc_cljgb.sfycx='"+sfycx+"')";
	}
	String cxkssj=null;
	cxkssj=request.getParameter("cxkssj");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (jxc_cljgb.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	cxkssj=request.getParameter("cxkssj2");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (jxc_cljgb.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	String cxjzsj=null;
	cxjzsj=request.getParameter("cxjzsj");
	if (cxjzsj!=null)
	{
		if (!(cxjzsj.equals("")))	wheresql+="  and (jxc_cljgb.cxjzsj>=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
	}
	cxjzsj=request.getParameter("cxjzsj2");
	if (cxjzsj!=null)
	{
		if (!(cxjzsj.equals("")))	wheresql+="  and (jxc_cljgb.cxjzsj<=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
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
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (jxc_clbm.gg like '%"+gg+"%')";
	}
	lsj=request.getParameter("lsj");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (jxc_cljgb.lsj>="+lsj+") ";
	}
	lsj=request.getParameter("lsj2");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (jxc_cljgb.lsj<="+lsj+") ";
	}
	xsj=request.getParameter("xsj");
	if (xsj!=null)
	{
		xsj=xsj.trim();
		if (!(xsj.equals("")))	wheresql+=" and  (jxc_cljgb.xsj>="+xsj+") ";
	}
	xsj=request.getParameter("xsj2");
	if (xsj!=null)
	{
		xsj=xsj.trim();
		if (!(xsj.equals("")))	wheresql+=" and  (jxc_cljgb.xsj<="+xsj+") ";
	}
	zp=request.getParameter("zp");
	if (zp!=null)
	{
		zp=cf.GB2Uni(zp);
		if (!(zp.equals("")))	wheresql+=" and  (jxc_clbm.zp='"+zp+"')";
	}
	cllbbm=request.getParameter("cllbbm");
	if (cllbbm!=null)
	{
		cllbbm=cf.GB2Uni(cllbbm);
		if (!(cllbbm.equals("")))	wheresql+=" and  (jxc_clbm.cllbbm like '%"+cllbbm+"%')";
	}
	clysbm=request.getParameter("clysbm");
	if (clysbm!=null)
	{
		clysbm=cf.GB2Uni(clysbm);
		if (!(clysbm.equals("")))	wheresql+=" and  (jxc_clbm.clysbm like '%"+clysbm+"%')";
	}
	jldwbm=request.getParameter("jldwbm");
	if (jldwbm!=null)
	{
		jldwbm=cf.GB2Uni(jldwbm);
		if (!(jldwbm.equals("")))	wheresql+=" and  (jxc_clbm.jldwbm='"+jldwbm+"')";
	}
	sfbhpj=request.getParameter("sfbhpj");
	if (sfbhpj!=null)
	{
		sfbhpj=cf.GB2Uni(sfbhpj);
		if (!(sfbhpj.equals("")))	wheresql+=" and  (jxc_clbm.sfbhpj='"+sfbhpj+"')";
	}
	pjts=request.getParameter("pjts");
	if (pjts!=null)
	{
		pjts=pjts.trim();
		if (!(pjts.equals("")))	wheresql+=" and (jxc_clbm.pjts>="+pjts+") ";
	}
	pjts=request.getParameter("pjts2");
	if (pjts!=null)
	{
		pjts=pjts.trim();
		if (!(pjts.equals("")))	wheresql+=" and (jxc_clbm.pjts<="+pjts+") ";
	}

	String jgpx=request.getParameter("jgpx");
	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT jxc_clbm.clbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.ppmc,DECODE(jxc_cljgb.sftjcp,'Y','是','N','否'),DECODE(jxc_cljgb.sfyh,'Y','有货','N','<font color=\"#FF0000\">无货</font>'),DECODE(jxc_cljgb.sfycx,'N','无','Y','<font color=\"#FF0000\">有促销</font>'),jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,jxc_clbm.cllbbm,jxc_clbm.clysbm,jxc_clbm.jldwbm,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_cljgb.cxhdbl||'%',jxc_cljgb.cxj,jxc_cljgb.lscxhdbl||'%',DECODE(jxc_clbm.sfbhpj,'Y','<font color=\"#FF0000\">含</font>','N','不含'),jxc_clbm.pjts,jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cpsm,jxc_clbm.cd,jxc_clbm.zp,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.scsmc,jxc_cljgb.gysmc,jxc_clbm.lrr,jxc_clbm.lrsj,jxc_clbm.bz";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb";
    ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
    ls_sql+=" and jxc_cljgb.xsfs!='1'";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
    ls_sql+=" and jxc_clbm.cllb='2'";//0：代销品主材；1：辅材；2：库存品主材";
    ls_sql+=wheresql;
	if (jgpx==null || jgpx.equals(""))
	{
		ls_sql+=" order by cldlbm,clxlbm,ppmc,clbm";
	}
	else{
		ls_sql+=" order by "+jgpx;
	}

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_clbmCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"clbm","clmc","jdm_cldlbm_zcdlmc","xh","gg","lsj","xsj","sq_dwxx_dwmc","zp","bz","ppbm","cllbbm","clysbm","jldwbm","sfbhpj","pjts","pjjg"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//设置显示合并列
/*
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cldlbm","1");//列参数对象加入Hash表
	spanColHash.put("clxlbm","1");//列参数对象加入Hash表
	spanColHash.put("ppmc","1");//列参数对象加入Hash表
	spanColHash.put("ppmc","1");//列参数对象加入Hash表
	spanColHash.put("gysmc","1");//列参数对象加入Hash表
	spanColHash.put("cllbbm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
*/
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>

<div style="height:100%;width:100%;overflow:auto;">


<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(390,2,3);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">主材编码</td>
	<td  width="5%">主材名称</td>
	<td  width="4%">型号</td>
	<td  width="4%">规格</td>
	<td  width="4%">子品牌</td>
	<td  width="2%">是否推荐产品</td>
	<td  width="2%">是否有货</td>
	<td  width="2%">是否有促销</td>
	<td  width="3%">促销开始时间</td>
	<td  width="3%">促销结束时间</td>
	<td  width="4%">类别系列</td>
	<td  width="2%">颜色</td>
	<td  width="2%">计量单位</td>
	<td  width="2%">市场标价</td>
	<td  width="2%">销售价</td>
	<td  width="2%">计入活动比例</td>
	<td  width="2%">促销价</td>
	<td  width="2%">促销期计入比例</td>
	<td  width="2%">包含配件</td>
	<td  width="2%">配件套数</td>
	<td  width="2%">产品级别</td>
	<td  width="3%">风格属性</td>
	<td  width="4%">产品说明</td>
	<td  width="2%">产地</td>
	<td  width="3%">照片名称</td>
	<td  width="4%">大类</td>
	<td  width="4%">小类</td>
	<td  width="4%">品牌</td>
	<td  width="6%">供应商</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="9%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</div>

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>