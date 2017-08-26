<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">固定资产统计</font></B>
</CENTER>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String wheresql="";
	String xz_gdzcb_gsbh=null;
	String xz_gdzcb_gdzcmc=null;
	String xz_gdzcb_bmbh=null;
	String xz_gdzcb_gdzcflbm=null;
	String xz_gdzcb_xh=null;
	String xz_gdzcb_pp=null;
	String xz_gdzcb_grsj=null;
	String xz_gdzcb_bgr=null;
	String xz_gdzcb_dwbh=null;
	String xz_gdzcb_fgsbh=null;
	String xz_gdzcb_sfybf=null;
	String xz_gdzcb_lrr=null;
	String xz_gdzcb_lrsj=null;
	String yjsj=null;

	String pz1=null;
	pz1=request.getParameter("pz1");
	if (pz1!=null)
	{
		pz1=cf.GB2Uni(pz1);
		if (!(pz1.equals("")))	wheresql+=" and  (xz_gdzcb.pz1='"+pz1+"')";
	}
	String pz2=null;
	pz2=request.getParameter("pz2");
	if (pz2!=null)
	{
		pz2=cf.GB2Uni(pz2);
		if (!(pz2.equals("")))	wheresql+=" and  (xz_gdzcb.pz2='"+pz2+"')";
	}
	String pz3=null;
	pz3=request.getParameter("pz3");
	if (pz3!=null)
	{
		pz3=cf.GB2Uni(pz3);
		if (!(pz3.equals("")))	wheresql+=" and  (xz_gdzcb.pz3='"+pz3+"')";
	}
	String pz4=null;
	pz4=request.getParameter("pz4");
	if (pz4!=null)
	{
		pz4=cf.GB2Uni(pz4);
		if (!(pz4.equals("")))	wheresql+=" and  (xz_gdzcb.pz4='"+pz4+"')";
	}
	String pz5=null;
	pz5=request.getParameter("pz5");
	if (pz5!=null)
	{
		pz5=cf.GB2Uni(pz5);
		if (!(pz5.equals("")))	wheresql+=" and  (xz_gdzcb.pz5='"+pz5+"')";
	}
	String pz6=null;
	pz6=request.getParameter("pz6");
	if (pz6!=null)
	{
		pz6=cf.GB2Uni(pz6);
		if (!(pz6.equals("")))	wheresql+=" and  (xz_gdzcb.pz6='"+pz6+"')";
	}

	xz_gdzcb_gsbh=request.getParameter("xz_gdzcb_gsbh");
	if (xz_gdzcb_gsbh!=null)
	{
		xz_gdzcb_gsbh=cf.GB2Uni(xz_gdzcb_gsbh);
		if (!(xz_gdzcb_gsbh.equals("")))	wheresql+=" and  (xz_gdzcb.gsbh='"+xz_gdzcb_gsbh+"')";
	}
	xz_gdzcb_gdzcmc=request.getParameter("xz_gdzcb_gdzcmc");
	if (xz_gdzcb_gdzcmc!=null)
	{
		xz_gdzcb_gdzcmc=cf.GB2Uni(xz_gdzcb_gdzcmc);
		if (!(xz_gdzcb_gdzcmc.equals("")))	wheresql+=" and  (xz_gdzcb.gdzcmc like '%"+xz_gdzcb_gdzcmc+"%')";
	}
	xz_gdzcb_bmbh=request.getParameter("xz_gdzcb_bmbh");
	if (xz_gdzcb_bmbh!=null)
	{
		xz_gdzcb_bmbh=cf.GB2Uni(xz_gdzcb_bmbh);
		if (!(xz_gdzcb_bmbh.equals("")))	wheresql+=" and  (xz_gdzcb.bmbh='"+xz_gdzcb_bmbh+"')";
	}
	xz_gdzcb_gdzcflbm=request.getParameter("xz_gdzcb_gdzcflbm");
	if (xz_gdzcb_gdzcflbm!=null)
	{
		xz_gdzcb_gdzcflbm=cf.GB2Uni(xz_gdzcb_gdzcflbm);
		if (!(xz_gdzcb_gdzcflbm.equals("")))	wheresql+=" and  (xz_gdzcb.gdzcflbm='"+xz_gdzcb_gdzcflbm+"')";
	}
	xz_gdzcb_xh=request.getParameter("xz_gdzcb_xh");
	if (xz_gdzcb_xh!=null)
	{
		xz_gdzcb_xh=cf.GB2Uni(xz_gdzcb_xh);
		if (!(xz_gdzcb_xh.equals("")))	wheresql+=" and  (xz_gdzcb.xh like '%"+xz_gdzcb_xh+"%')";
	}
	xz_gdzcb_pp=request.getParameter("xz_gdzcb_pp");
	if (xz_gdzcb_pp!=null)
	{
		xz_gdzcb_pp=cf.GB2Uni(xz_gdzcb_pp);
		if (!(xz_gdzcb_pp.equals("")))	wheresql+=" and  (xz_gdzcb.pp like '%"+xz_gdzcb_pp+"%')";
	}
	xz_gdzcb_grsj=request.getParameter("xz_gdzcb_grsj");
	if (xz_gdzcb_grsj!=null)
	{
		xz_gdzcb_grsj=xz_gdzcb_grsj.trim();
		if (!(xz_gdzcb_grsj.equals("")))	wheresql+="  and (xz_gdzcb.grsj>=TO_DATE('"+xz_gdzcb_grsj+"','YYYY/MM/DD'))";
	}
	xz_gdzcb_grsj=request.getParameter("xz_gdzcb_grsj2");
	if (xz_gdzcb_grsj!=null)
	{
		xz_gdzcb_grsj=xz_gdzcb_grsj.trim();
		if (!(xz_gdzcb_grsj.equals("")))	wheresql+="  and (xz_gdzcb.grsj<=TO_DATE('"+xz_gdzcb_grsj+"','YYYY/MM/DD'))";
	}
	xz_gdzcb_bgr=request.getParameter("xz_gdzcb_bgr");
	if (xz_gdzcb_bgr!=null)
	{
		xz_gdzcb_bgr=cf.GB2Uni(xz_gdzcb_bgr);
		if (!(xz_gdzcb_bgr.equals("")))	wheresql+=" and  (xz_gdzcb.bgr like '%"+xz_gdzcb_bgr+"%')";
	}
	xz_gdzcb_dwbh=request.getParameter("xz_gdzcb_dwbh");
	if (xz_gdzcb_dwbh!=null)
	{
		xz_gdzcb_dwbh=cf.GB2Uni(xz_gdzcb_dwbh);
		if (!(xz_gdzcb_dwbh.equals("")))	wheresql+=" and  (xz_gdzcb.dwbh='"+xz_gdzcb_dwbh+"')";
	}
	xz_gdzcb_fgsbh=request.getParameter("xz_gdzcb_fgsbh");
	if (xz_gdzcb_fgsbh!=null)
	{
		xz_gdzcb_fgsbh=cf.GB2Uni(xz_gdzcb_fgsbh);
		if (!(xz_gdzcb_fgsbh.equals("")))	wheresql+=" and  (xz_gdzcb.fgsbh='"+xz_gdzcb_fgsbh+"')";
	}
	xz_gdzcb_sfybf=request.getParameter("xz_gdzcb_sfybf");
	if (xz_gdzcb_sfybf!=null)
	{
		xz_gdzcb_sfybf=cf.GB2Uni(xz_gdzcb_sfybf);
		if (!(xz_gdzcb_sfybf.equals("")))	wheresql+=" and  (xz_gdzcb.sfybf='"+xz_gdzcb_sfybf+"')";
	}
	xz_gdzcb_lrr=request.getParameter("xz_gdzcb_lrr");
	if (xz_gdzcb_lrr!=null)
	{
		xz_gdzcb_lrr=cf.GB2Uni(xz_gdzcb_lrr);
		if (!(xz_gdzcb_lrr.equals("")))	wheresql+=" and  (xz_gdzcb.lrr='"+xz_gdzcb_lrr+"')";
	}
	xz_gdzcb_lrsj=request.getParameter("xz_gdzcb_lrsj");
	if (xz_gdzcb_lrsj!=null)
	{
		xz_gdzcb_lrsj=xz_gdzcb_lrsj.trim();
		if (!(xz_gdzcb_lrsj.equals("")))	wheresql+="  and (xz_gdzcb.lrsj>=TO_DATE('"+xz_gdzcb_lrsj+"','YYYY/MM/DD'))";
	}
	xz_gdzcb_lrsj=request.getParameter("xz_gdzcb_lrsj2");
	if (xz_gdzcb_lrsj!=null)
	{
		xz_gdzcb_lrsj=xz_gdzcb_lrsj.trim();
		if (!(xz_gdzcb_lrsj.equals("")))	wheresql+="  and (xz_gdzcb.lrsj<=TO_DATE('"+xz_gdzcb_lrsj+"','YYYY/MM/DD'))";
	}
	yjsj=request.getParameter("yjsj");
	if (yjsj!=null)
	{
		yjsj=yjsj.trim();
		if (!(yjsj.equals("")))	wheresql+="  and (xz_gdzcb.yjsj>=TO_DATE('"+yjsj+"','YYYY/MM/DD'))";
	}
	yjsj=request.getParameter("yjsj2");
	if (yjsj!=null)
	{
		yjsj=yjsj.trim();
		if (!(yjsj.equals("")))	wheresql+="  and (xz_gdzcb.yjsj<=TO_DATE('"+yjsj+"','YYYY/MM/DD'))";
	}


	String tj1=cf.GB2Uni(request.getParameter("tj1"));
	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));
	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));

	String groupsql="";
	String selectgroupsql="";
	int groupsl=0;
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			groupsql+=","+tj1;
			selectgroupsql+=","+tj1;
			groupsl++;
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			groupsql+=","+tj2;
			selectgroupsql+=","+tj2;
			groupsl++;
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			groupsql+=","+tj3;
			selectgroupsql+=","+tj3;
			groupsl++;
		}
	}
	if (groupsl==0)
	{
		out.println("请选择统计列");
		return;
	}
	else{
		groupsql=" group by "+groupsql.substring(1);
		selectgroupsql=" select "+selectgroupsql.substring(1)+",sum(xz_gdzcb.sl),sum(xz_gdzcb.sl*xz_gdzcb.grj)";
	}
%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<%
	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"20%\">"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"20%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"20%\">"+tj3name+"</td>");
	}

%>
	<td  width="15%">数量</td>
	<td  width="25%">金额</td>
</tr>
<%

	ls_sql=selectgroupsql;

	String ssfgsbh=request.getParameter("ssfgsbh");
	if ( ssfgsbh!=null && !ssfgsbh.equals("") )
	{
		ls_sql+=" FROM sq_dwxx,xz_gdzcflbm,xz_gdzcb,xz_gdzcssfw  ";
		ls_sql+=" where xz_gdzcb.dwbh=sq_dwxx.dwbh and xz_gdzcb.gdzcflbm=xz_gdzcflbm.gdzcflbm";
		ls_sql+=" and xz_gdzcb.gsbh=xz_gdzcssfw.gsbh and xz_gdzcssfw.fgsbh='"+ssfgsbh+"'";
	}
	else{
		ls_sql+=" FROM sq_dwxx,xz_gdzcflbm,xz_gdzcb  ";
		ls_sql+=" where xz_gdzcb.dwbh=sq_dwxx.dwbh and xz_gdzcb.gdzcflbm=xz_gdzcflbm.gdzcflbm";
	}
	
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

//	pageObj.alignStr[groupsl+1]="align='left'";


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj1,"1");//列参数对象加入Hash表
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj2,"1");//列参数对象加入Hash表
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj3,"1");//列参数对象加入Hash表
		}
	}
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>