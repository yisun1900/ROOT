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

String jc_zcjgb_zcbm=null;
String jc_zcjgb_zcmc=null;
String zcdlbm=null;
String jc_zcjgb_xh=null;
String jc_zcjgb_gg=null;
String jc_zcjgb_lsj=null;
String jc_zcjgb_yhj=null;
String jc_zcjgb_zp=null;
String zclbbm=null;
String jc_zcjgb_zcysbm=null;
String jc_zcjgb_jldwbm=null;
String jc_zcjgb_sfbhpj=null;
String jc_zcjgb_pjts=null;

String sftjcp=null;
sftjcp=request.getParameter("sftjcp");
if (sftjcp!=null)
{
	sftjcp=cf.GB2Uni(sftjcp);
	if (!(sftjcp.equals("")))	wheresql+=" and  (jc_zcjgb.sftjcp='"+sftjcp+"')";
}

String xhlist[]=request.getParameterValues("xhlist");
jc_zcjgb_xh=request.getParameter("jc_zcjgb_xh");

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
			lsxh+=" or (jc_zcjgb.xh like '%"+getxh+"%')";
		}
		wheresql+=" and  ("+lsxh.substring(3)+")";
	}
	else{
		if (jc_zcjgb_xh!=null)
		{
			jc_zcjgb_xh=cf.GB2Uni(jc_zcjgb_xh);
			if (!(jc_zcjgb_xh.equals("")))	wheresql+=" and  (jc_zcjgb.xh like '%"+jc_zcjgb_xh+"%')";
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
			lsxh+=" or (jc_zcjgb.xh='"+getxh+"')";
		}
		wheresql+=" and  ("+lsxh.substring(3)+")";
	}
	else{
		if (jc_zcjgb_xh!=null)
		{
			jc_zcjgb_xh=cf.GB2Uni(jc_zcjgb_xh);
			if (!(jc_zcjgb_xh.equals("")))	wheresql+=" and  (jc_zcjgb.xh='"+jc_zcjgb_xh+"')";
		}
	}
}


String cxhdbl=null;
cxhdbl=request.getParameter("cxhdbl");
if (cxhdbl!=null)
{
	cxhdbl=cf.GB2Uni(cxhdbl);
	if (!(cxhdbl.equals("")))	wheresql+=" and  (jc_zcjgb.cxhdbl>="+cxhdbl+")";
}
cxhdbl=request.getParameter("cxhdbl2");
if (cxhdbl!=null)
{
	cxhdbl=cf.GB2Uni(cxhdbl);
	if (!(cxhdbl.equals("")))	wheresql+=" and  (jc_zcjgb.cxhdbl<="+cxhdbl+")";
}

String dqbm=null;
dqbm=request.getParameter("dqbm");
if (!(dqbm.equals("")))	wheresql+=" and  (jc_zcjgb.dqbm='"+dqbm+"')";

String dwbh=null;
dwbh=request.getParameter("dwbh");
if (dwbh!=null)
{
	dwbh=cf.GB2Uni(dwbh);
	if (!(dwbh.equals("")))	wheresql+=" and  (jc_zcjgb.dwbh='"+dwbh+"')";
}
String dwbh2=null;
dwbh2=request.getParameter("dwbh2");
if (dwbh2!=null)
{
	dwbh2=cf.GB2Uni(dwbh2);
	if (!(dwbh2.equals("")))	wheresql+=" and  (jc_zcjgb.dwbh like '%"+dwbh2+"%')";
}
String ppmc=null;
ppmc=request.getParameter("ppmc");
if (ppmc!=null)
{
	ppmc=cf.GB2Uni(ppmc);
	if (!(ppmc.equals("")))	wheresql+=" and  (jc_zcjgb.ppmc='"+ppmc+"')";
}
String ppmc2=null;
ppmc2=request.getParameter("ppmc2");
if (ppmc2!=null)
{
	ppmc2=cf.GB2Uni(ppmc2);
	if (!(ppmc2.equals("")))	wheresql+=" and  (jc_zcjgb.ppmc like '%"+ppmc2+"%')";
}
String gys=null;
gys=request.getParameter("gys");
if (gys!=null)
{
	gys=cf.GB2Uni(gys);
	if (!(gys.equals("")))	wheresql+=" and  (jc_zcjgb.gys='"+gys+"')";
}
String gys2=null;
gys2=request.getParameter("gys2");
if (gys2!=null)
{
	gys2=cf.GB2Uni(gys2);
	if (!(gys2.equals("")))	wheresql+=" and  (jc_zcjgb.gys like '%"+gys2+"%')";
}

String zcxlbm=null;
zcxlbm=request.getParameter("zcxlbm");
if (zcxlbm!=null)
{
	zcxlbm=cf.GB2Uni(zcxlbm);
	if (!(zcxlbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcxlbm='"+zcxlbm+"')";
}


String sfyh=null;
sfyh=request.getParameter("sfyh");
if (sfyh!=null)
{
	if (!(sfyh.equals("")))	wheresql+=" and  (jc_zcjgb.sfyh='"+sfyh+"')";
}

String sfycx=null;
sfycx=request.getParameter("sfycx");
if (sfycx!=null)
{
	if (!(sfycx.equals("")))	wheresql+=" and  (jc_zcjgb.sfycx='"+sfycx+"')";
}
String cxkssj=null;
cxkssj=request.getParameter("cxkssj");
if (cxkssj!=null)
{
	if (!(cxkssj.equals("")))	wheresql+="  and (jc_zcjgb.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
}
cxkssj=request.getParameter("cxkssj2");
if (cxkssj!=null)
{
	if (!(cxkssj.equals("")))	wheresql+="  and (jc_zcjgb.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
}
String cxjzsj=null;
cxjzsj=request.getParameter("cxjzsj");
if (cxjzsj!=null)
{
	if (!(cxjzsj.equals("")))	wheresql+="  and (jc_zcjgb.cxjzsj>=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
}
cxjzsj=request.getParameter("cxjzsj2");
if (cxjzsj!=null)
{
	if (!(cxjzsj.equals("")))	wheresql+="  and (jc_zcjgb.cxjzsj<=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
}


jc_zcjgb_zcbm=request.getParameter("jc_zcjgb_zcbm");
if (jc_zcjgb_zcbm!=null)
{
	jc_zcjgb_zcbm=cf.GB2Uni(jc_zcjgb_zcbm);
	if (!(jc_zcjgb_zcbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcbm='"+jc_zcjgb_zcbm+"')";
}
jc_zcjgb_zcmc=request.getParameter("jc_zcjgb_zcmc");
if (jc_zcjgb_zcmc!=null)
{
	jc_zcjgb_zcmc=cf.GB2Uni(jc_zcjgb_zcmc);
	if (!(jc_zcjgb_zcmc.equals("")))	wheresql+=" and  (jc_zcjgb.zcmc like '%"+jc_zcjgb_zcmc+"%')";
}
zcdlbm=request.getParameter("zcdlbm");
if (zcdlbm!=null)
{
	zcdlbm=cf.GB2Uni(zcdlbm);
	if (!(zcdlbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcdlbm='"+zcdlbm+"')";
}
jc_zcjgb_gg=request.getParameter("jc_zcjgb_gg");
if (jc_zcjgb_gg!=null)
{
	jc_zcjgb_gg=cf.GB2Uni(jc_zcjgb_gg);
	if (!(jc_zcjgb_gg.equals("")))	wheresql+=" and  (jc_zcjgb.gg like '%"+jc_zcjgb_gg+"%')";
}
jc_zcjgb_lsj=request.getParameter("jc_zcjgb_lsj");
if (jc_zcjgb_lsj!=null)
{
	jc_zcjgb_lsj=jc_zcjgb_lsj.trim();
	if (!(jc_zcjgb_lsj.equals("")))	wheresql+=" and  (jc_zcjgb.lsj>="+jc_zcjgb_lsj+") ";
}
jc_zcjgb_lsj=request.getParameter("jc_zcjgb_lsj2");
if (jc_zcjgb_lsj!=null)
{
	jc_zcjgb_lsj=jc_zcjgb_lsj.trim();
	if (!(jc_zcjgb_lsj.equals("")))	wheresql+=" and  (jc_zcjgb.lsj<="+jc_zcjgb_lsj+") ";
}
jc_zcjgb_yhj=request.getParameter("jc_zcjgb_yhj");
if (jc_zcjgb_yhj!=null)
{
	jc_zcjgb_yhj=jc_zcjgb_yhj.trim();
	if (!(jc_zcjgb_yhj.equals("")))	wheresql+=" and  (jc_zcjgb.yhj>="+jc_zcjgb_yhj+") ";
}
jc_zcjgb_yhj=request.getParameter("jc_zcjgb_yhj2");
if (jc_zcjgb_yhj!=null)
{
	jc_zcjgb_yhj=jc_zcjgb_yhj.trim();
	if (!(jc_zcjgb_yhj.equals("")))	wheresql+=" and  (jc_zcjgb.yhj<="+jc_zcjgb_yhj+") ";
}
jc_zcjgb_zp=request.getParameter("jc_zcjgb_zp");
if (jc_zcjgb_zp!=null)
{
	jc_zcjgb_zp=cf.GB2Uni(jc_zcjgb_zp);
	if (!(jc_zcjgb_zp.equals("")))	wheresql+=" and  (jc_zcjgb.zp='"+jc_zcjgb_zp+"')";
}
zclbbm=request.getParameter("zclbbm");
if (zclbbm!=null)
{
	zclbbm=cf.GB2Uni(zclbbm);
	if (!(zclbbm.equals("")))	wheresql+=" and  (jc_zcjgb.zclbbm like '%"+zclbbm+"%')";
}
jc_zcjgb_zcysbm=request.getParameter("jc_zcjgb_zcysbm");
if (jc_zcjgb_zcysbm!=null)
{
	jc_zcjgb_zcysbm=cf.GB2Uni(jc_zcjgb_zcysbm);
	if (!(jc_zcjgb_zcysbm.equals("")))	wheresql+=" and  (jc_zcjgb.zcysbm like '%"+jc_zcjgb_zcysbm+"%')";
}
jc_zcjgb_jldwbm=request.getParameter("jc_zcjgb_jldwbm");
if (jc_zcjgb_jldwbm!=null)
{
	jc_zcjgb_jldwbm=cf.GB2Uni(jc_zcjgb_jldwbm);
	if (!(jc_zcjgb_jldwbm.equals("")))	wheresql+=" and  (jc_zcjgb.jldwbm='"+jc_zcjgb_jldwbm+"')";
}
jc_zcjgb_sfbhpj=request.getParameter("jc_zcjgb_sfbhpj");
if (jc_zcjgb_sfbhpj!=null)
{
	jc_zcjgb_sfbhpj=cf.GB2Uni(jc_zcjgb_sfbhpj);
	if (!(jc_zcjgb_sfbhpj.equals("")))	wheresql+=" and  (jc_zcjgb.sfbhpj='"+jc_zcjgb_sfbhpj+"')";
}
jc_zcjgb_pjts=request.getParameter("jc_zcjgb_pjts");
if (jc_zcjgb_pjts!=null)
{
	jc_zcjgb_pjts=jc_zcjgb_pjts.trim();
	if (!(jc_zcjgb_pjts.equals("")))	wheresql+=" and (jc_zcjgb.pjts>="+jc_zcjgb_pjts+") ";
}
jc_zcjgb_pjts=request.getParameter("jc_zcjgb_pjts2");
if (jc_zcjgb_pjts!=null)
{
	jc_zcjgb_pjts=jc_zcjgb_pjts.trim();
	if (!(jc_zcjgb_pjts.equals("")))	wheresql+=" and (jc_zcjgb.pjts<="+jc_zcjgb_pjts+") ";
}


try {
/*
	ls_sql="SELECT dwbh,gys,ppmc,zcdlbm,zcxlbm,zclbbm,zcbm,jc_zcjgb.zcmc,jc_zcjgb.xh,jc_zcjgb.gg,zcysbm,jldwbm,jc_zcjgb.lsj,jc_zcjgb.yhj,jc_zcjgb.cbj,jc_zcjgb.jsbl,jc_zcjgb.cxhdbl,DECODE(sfycx,'N','否','Y','是'),jc_zcjgb.cxkssj,jc_zcjgb.cxjzsj,jc_zcjgb.cxj,jc_zcjgb.cxcbj,jc_zcjgb.lscxhdbl,DECODE(jc_zcjgb.sfbhpj,'Y','是','N','否'),jc_zcjgb.pjts,DECODE(sfyh,'Y','是','N','否'),jc_zcjgb.cpjb,jc_zcjgb.fgsx,jc_zcjgb.cpsm,jc_zcjgb.cd,jc_zcjgb.zp,jc_zcjgb.bz";
	ls_sql+=" FROM jc_zcjgb";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by  zcdlbm,zcxlbm,dwbh,jc_zcjgb.xh";

	String rootPath=getServletContext().getRealPath("");
	String fileName=rootPath+"\\jcjj\\zcbj\\expdata\\主材报价";
	String sheetName="one";

	String[] title={"品牌供应商","供应商","品牌","主材大类","主材小类","类别系列","主材编码","主材名称","型号","规格","颜色","计量单位","市场标价","销售限价","结算价","结算比例","计入活动比例","是否有促销","促销开始时间","促销结束时间","促销价","促销结算价","促销期计入活动比例","包含配件","配件套数","是否有货","产品级别","风格属性","产品说明","产地","照片名称","备注"};
*/	
	
	ls_sql="SELECT dwbh,zclbbm,zcbm,jc_zcjgb.zcmc,jc_zcjgb.xh,jc_zcjgb.gg,zcysbm,jldwbm,jc_zcjgb.lsj,jc_zcjgb.yhj,jc_zcjgb.cbj,jc_zcjgb.jsbl,jc_zcjgb.cxhdbl,DECODE(sfycx,'N','否','Y','是'),jc_zcjgb.cxkssj,jc_zcjgb.cxjzsj,jc_zcjgb.cxj,jc_zcjgb.cxcbj,jc_zcjgb.lscxhdbl,DECODE(jc_zcjgb.sfbhpj,'Y','是','N','否'),jc_zcjgb.pjts,DECODE(sfyh,'Y','是','N','否'),jc_zcjgb.cpjb,jc_zcjgb.fgsx,jc_zcjgb.cpsm,jc_zcjgb.cd,DECODE(jc_zcjgb.sftjcp,'Y','是','N','否'),jc_zcjgb.zp,jc_zcjgb.bz";
	ls_sql+=" FROM jc_zcjgb";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by  zcdlbm,zcxlbm,dwbh,jc_zcjgb.xh";

	String rootPath=getServletContext().getRealPath("");
	String fileName=rootPath+"\\jcjj\\zcbj\\expdata\\主材报价";
	String sheetName="one";

	String[] title={"品牌供应商","类别系列","主材编码","主材名称","型号","规格","颜色","计量单位","市场标价","销售限价","结算价","结算比例","计入活动比例","是否有促销","促销开始时间","促销结束时间","促销价","促销结算价","促销期计入活动比例","包含配件","配件套数","是否有货","产品级别","风格属性","产品说明","产地","是否推荐产品","照片名称","备注"};

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

			out.println("<P>导出文件：<A HREF='\\jcjj\\zcbj\\expdata\\"+dcFile+"' target='_blank'>"+dcFile+"</A>");
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