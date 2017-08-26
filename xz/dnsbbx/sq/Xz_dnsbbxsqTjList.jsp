<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询－电脑及设备报修申请</font></B>
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
	String bxxh=null;
	String dwbh=null;
	String fgsbh=null;
	String sqr=null;
	String bxrq=null;
	String jhlqrq=null;
	String dnsbflmc=null;
	String bgr=null;
	String sfyzysj=null;
	String dnsbgzmc=null;
	String gsbh=null;
	String gdzcmc=null;
	String bmbh=null;
	String gdzcflmc=null;
	String xh=null;
	String pp=null;
	String pz1=null;
	String pz2=null;
	String pz3=null;
	String pz4=null;
	String pz5=null;
	String pz6=null;
	String jsr=null;
	String jssj=null;
	String wxr=null;
	String wxlrsj=null;
	String wcsj=null;
	String wxfy=null;
	String lrr=null;
	String clzt=null;
	bxxh=request.getParameter("bxxh");
	if (bxxh!=null)
	{
		bxxh=bxxh.trim();
		if (!(bxxh.equals("")))	wheresql+=" and (xz_dnsbbxsq.bxxh="+bxxh+") ";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.dwbh='"+dwbh+"')";
	}
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.fgsbh='"+fgsbh+"')";
	}
	sqr=request.getParameter("sqr");
	if (sqr!=null)
	{
		sqr=cf.GB2Uni(sqr);
		if (!(sqr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.sqr='"+sqr+"')";
	}
	bxrq=request.getParameter("bxrq");
	if (bxrq!=null)
	{
		bxrq=bxrq.trim();
		if (!(bxrq.equals("")))	wheresql+="  and (bxrq>=TO_DATE('"+bxrq+"','YYYY/MM/DD'))";
	}
	bxrq=request.getParameter("bxrq2");
	if (bxrq!=null)
	{
		bxrq=bxrq.trim();
		if (!(bxrq.equals("")))	wheresql+="  and (bxrq<=TO_DATE('"+bxrq+"','YYYY/MM/DD'))";
	}
	jhlqrq=request.getParameter("jhlqrq");
	if (jhlqrq!=null)
	{
		jhlqrq=jhlqrq.trim();
		if (!(jhlqrq.equals("")))	wheresql+="  and (jhlqrq>=TO_DATE('"+jhlqrq+"','YYYY/MM/DD'))";
	}
	jhlqrq=request.getParameter("jhlqrq2");
	if (jhlqrq!=null)
	{
		jhlqrq=jhlqrq.trim();
		if (!(jhlqrq.equals("")))	wheresql+="  and (jhlqrq<=TO_DATE('"+jhlqrq+"','YYYY/MM/DD'))";
	}
	dnsbflmc=request.getParameter("dnsbflmc");
	if (dnsbflmc!=null)
	{
		dnsbflmc=cf.GB2Uni(dnsbflmc);
		if (!(dnsbflmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.dnsbflmc='"+dnsbflmc+"')";
	}
	bgr=request.getParameter("bgr");
	if (bgr!=null)
	{
		bgr=cf.GB2Uni(bgr);
		if (!(bgr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.bgr='"+bgr+"')";
	}
	sfyzysj=request.getParameter("sfyzysj");
	if (sfyzysj!=null)
	{
		sfyzysj=cf.GB2Uni(sfyzysj);
		if (!(sfyzysj.equals("")))	wheresql+=" and  (xz_dnsbbxsq.sfyzysj='"+sfyzysj+"')";
	}
	dnsbgzmc=request.getParameter("dnsbgzmc");
	if (dnsbgzmc!=null)
	{
		dnsbgzmc=cf.GB2Uni(dnsbgzmc);
		if (!(dnsbgzmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.dnsbgzmc='"+dnsbgzmc+"')";
	}
	gsbh=request.getParameter("gsbh");
	if (gsbh!=null)
	{
		gsbh=cf.GB2Uni(gsbh);
		if (!(gsbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.gsbh='"+gsbh+"')";
	}
	gdzcmc=request.getParameter("gdzcmc");
	if (gdzcmc!=null)
	{
		gdzcmc=cf.GB2Uni(gdzcmc);
		if (!(gdzcmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.gdzcmc='"+gdzcmc+"')";
	}
	bmbh=request.getParameter("bmbh");
	if (bmbh!=null)
	{
		bmbh=cf.GB2Uni(bmbh);
		if (!(bmbh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.bmbh='"+bmbh+"')";
	}
	gdzcflmc=request.getParameter("gdzcflmc");
	if (gdzcflmc!=null)
	{
		gdzcflmc=cf.GB2Uni(gdzcflmc);
		if (!(gdzcflmc.equals("")))	wheresql+=" and  (xz_dnsbbxsq.gdzcflmc='"+gdzcflmc+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (xz_dnsbbxsq.xh='"+xh+"')";
	}
	pp=request.getParameter("pp");
	if (pp!=null)
	{
		pp=cf.GB2Uni(pp);
		if (!(pp.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pp='"+pp+"')";
	}
	pz1=request.getParameter("pz1");
	if (pz1!=null)
	{
		pz1=cf.GB2Uni(pz1);
		if (!(pz1.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz1='"+pz1+"')";
	}
	pz2=request.getParameter("pz2");
	if (pz2!=null)
	{
		pz2=cf.GB2Uni(pz2);
		if (!(pz2.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz2='"+pz2+"')";
	}
	pz3=request.getParameter("pz3");
	if (pz3!=null)
	{
		pz3=cf.GB2Uni(pz3);
		if (!(pz3.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz3='"+pz3+"')";
	}
	pz4=request.getParameter("pz4");
	if (pz4!=null)
	{
		pz4=cf.GB2Uni(pz4);
		if (!(pz4.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz4='"+pz4+"')";
	}
	pz5=request.getParameter("pz5");
	if (pz5!=null)
	{
		pz5=cf.GB2Uni(pz5);
		if (!(pz5.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz5='"+pz5+"')";
	}
	pz6=request.getParameter("pz6");
	if (pz6!=null)
	{
		pz6=cf.GB2Uni(pz6);
		if (!(pz6.equals("")))	wheresql+=" and  (xz_dnsbbxsq.pz6='"+pz6+"')";
	}
	jsr=request.getParameter("jsr");
	if (jsr!=null)
	{
		jsr=cf.GB2Uni(jsr);
		if (!(jsr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.jsr='"+jsr+"')";
	}
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jssj>=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jssj=request.getParameter("jssj2");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jssj<=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	wxr=request.getParameter("wxr");
	if (wxr!=null)
	{
		wxr=cf.GB2Uni(wxr);
		if (!(wxr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.wxr='"+wxr+"')";
	}
	wxlrsj=request.getParameter("wxlrsj");
	if (wxlrsj!=null)
	{
		wxlrsj=wxlrsj.trim();
		if (!(wxlrsj.equals("")))	wheresql+="  and (wxlrsj>=TO_DATE('"+wxlrsj+"','YYYY/MM/DD'))";
	}
	wxlrsj=request.getParameter("wxlrsj2");
	if (wxlrsj!=null)
	{
		wxlrsj=wxlrsj.trim();
		if (!(wxlrsj.equals("")))	wheresql+="  and (wxlrsj<=TO_DATE('"+wxlrsj+"','YYYY/MM/DD'))";
	}
	wcsj=request.getParameter("wcsj");
	if (wcsj!=null)
	{
		wcsj=wcsj.trim();
		if (!(wcsj.equals("")))	wheresql+="  and (wcsj>=TO_DATE('"+wcsj+"','YYYY/MM/DD'))";
	}
	wcsj=request.getParameter("wcsj2");
	if (wcsj!=null)
	{
		wcsj=wcsj.trim();
		if (!(wcsj.equals("")))	wheresql+="  and (wcsj<=TO_DATE('"+wcsj+"','YYYY/MM/DD'))";
	}
	wxfy=request.getParameter("wxfy");
	if (wxfy!=null)
	{
		wxfy=wxfy.trim();
		if (!(wxfy.equals("")))	wheresql+=" and  (xz_dnsbbxsq.wxfy="+wxfy+") ";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (xz_dnsbbxsq.lrr='"+lrr+"')";
	}
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (xz_dnsbbxsq.clzt='"+clzt+"')";
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
			selectgroupsql+=","+tj1+" as c1";
			groupsl++;
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			groupsql+=","+tj2;
			selectgroupsql+=","+tj2+" as c2";
			groupsl++;
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			groupsql+=","+tj3;
			selectgroupsql+=","+tj3+" as c3";
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(*),sum(wxfy)";
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
	<td  width="15%">报修次数</td>
	<td  width="25%">维修费用</td>
</tr>

<%
	ls_sql=selectgroupsql;

	ls_sql+=" FROM xz_dnsbbxsq,sq_dwxx a,sq_dwxx b,sq_dwxx c";
	ls_sql+=" where xz_dnsbbxsq.fgsbh=a.dwbh(+) and xz_dnsbbxsq.dwbh=b.dwbh(+) and xz_dnsbbxsq.wxbm=c.dwbh(+)";
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
			spanColHash.put("c1","1");//列参数对象加入Hash表
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			//设置显示合并列
			spanColHash.put("c2","1");//列参数对象加入Hash表
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			//设置显示合并列
			spanColHash.put("c3","1");//列参数对象加入Hash表
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