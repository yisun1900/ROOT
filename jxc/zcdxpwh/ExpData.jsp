<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="EXCEL; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px'>


<%
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

String clxlbm=null;
clxlbm=request.getParameter("clxlbm");
if (clxlbm!=null)
{
	clxlbm=cf.GB2Uni(clxlbm);
	if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_clbm.clxlbm='"+clxlbm+"')";
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


try {

	ls_sql="SELECT jxc_clbm.ppmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.cllbbm,jxc_clbm.clbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clysbm,jxc_clbm.jldwbm,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_cljgb.zdxsj,jxc_cljgb.yjjrbl,DECODE(jxc_cljgb.jsfs,'1','结算价','2','结算比例') jsfs,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_cljgb.cxhdbl,DECODE(jxc_cljgb.sfycx,'N','否','Y','是'),jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,jxc_cljgb.cxj,jxc_cljgb.cxcbj,jxc_cljgb.cxjsbl,jxc_cljgb.lscxhdbl,jxc_cljgb.cxyjjrbl,DECODE(jxc_clbm.sfbhpj,'Y','是','N','否'),jxc_clbm.pjts,DECODE(jxc_cljgb.sfyh,'Y','是','N','否'),jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cpsm,jxc_clbm.cd,DECODE(jxc_cljgb.sftjcp,'Y','是','N','否'),DECODE(jxc_cljgb.xsfs,'1','代销品','2','现货销售','3','期货销售','4','虚拟出入库'),jxc_clbm.zp,jxc_clbm.bz";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb";
    ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
    ls_sql+=" and jxc_cljgb.xsfs in('1','4')";//1：代销品；2：现货销售；3：期货销售；4：虚拟出入库
    ls_sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
    ls_sql+=wheresql;
    ls_sql+=" order by  jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.ppmc,jxc_clbm.xh";

	String rootPath=getServletContext().getRealPath("");
	String fileName=rootPath+"\\jxc\\zcdxpwh\\expdata\\主材报价";
	String sheetName="one";

	String[] title={"子品牌","材料大类","材料小类","类别系列","主材编码","主材名称","型号","规格","颜色","计量单位","市场标价","销售价","最低销售限价","业绩记入比例","结算方式","结算价","结算比例","计入活动比例","是否有促销","促销开始时间","促销结束时间","促销价","促销结算价","促销结算比例","促销期计入活动比例","促销期业绩记入比例","包含配件","配件套数","是否有货","产品级别","风格属性","产品说明","产地","是否推荐产品","销售方式 ","照片名称","备注"};

	out.println("<P>开始导出文件，请稍候................");

	ybl.common.RWExce rwe=new ybl.common.RWExce();
	String[] retFile=rwe.writeJxlExecel(fileName,sheetName,ls_sql,title,5000);

	if (retFile==null)
	{
		out.println("<P>没有复合条件的数据被导出！");
	}
	else{
		int i=0;
		for (i=0;i<retFile.length ;i++ )
		{
			if (retFile[i]==null || retFile[i].equals(""))
			{
				break;
			}

			String dcFile=retFile[i].substring(retFile[i].lastIndexOf("\\")+1);

			out.println("<P>导出文件：<A HREF='\\jxc\\zcdxpwh\\expdata\\"+dcFile+"' target='_blank'>"+dcFile+"</A>");
		}
		
		out.println("<P>导出成功！共导出文件["+i+"]个，请点击下载");
	}

}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}




%>



</body>
</html>