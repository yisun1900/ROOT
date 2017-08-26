<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">车辆加油统计</font></B>
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

	String xz_yplydjb_qcph=null;
	String xz_yplydjb_ybh=null;
	String xz_yplydjb_lysl=null;
	String xz_yplydjb_lyrq=null;
	String xz_yplydjb_lyr=null;
	String xz_yplydjb_ssfgs=null;
	String xz_yplydjb_lrr=null;
	String xz_yplydjb_lrsj=null;

	xz_yplydjb_qcph=request.getParameter("xz_yplydjb_qcph");
	if (xz_yplydjb_qcph!=null)
	{
		xz_yplydjb_qcph=cf.GB2Uni(xz_yplydjb_qcph);
		if (!(xz_yplydjb_qcph.equals("")))	wheresql+=" and  (xz_yplydjb.qcph like '%"+xz_yplydjb_qcph+"%')";
	}
	xz_yplydjb_ybh=request.getParameter("xz_yplydjb_ybh");
	if (xz_yplydjb_ybh!=null)
	{
		xz_yplydjb_ybh=cf.GB2Uni(xz_yplydjb_ybh);
		if (!(xz_yplydjb_ybh.equals("")))	wheresql+=" and  (xz_yplydjb.ybh='"+xz_yplydjb_ybh+"')";
	}
	xz_yplydjb_lysl=request.getParameter("xz_yplydjb_lysl");
	if (xz_yplydjb_lysl!=null)
	{
		xz_yplydjb_lysl=xz_yplydjb_lysl.trim();
		if (!(xz_yplydjb_lysl.equals("")))	wheresql+=" and  (xz_yplydjb.lysl>="+xz_yplydjb_lysl+") ";
	}
	xz_yplydjb_lysl=request.getParameter("xz_yplydjb_lysl2");
	if (xz_yplydjb_lysl!=null)
	{
		xz_yplydjb_lysl=xz_yplydjb_lysl.trim();
		if (!(xz_yplydjb_lysl.equals("")))	wheresql+=" and  (xz_yplydjb.lysl<="+xz_yplydjb_lysl+") ";
	}
	xz_yplydjb_lyrq=request.getParameter("xz_yplydjb_lyrq");
	if (xz_yplydjb_lyrq!=null)
	{
		xz_yplydjb_lyrq=xz_yplydjb_lyrq.trim();
		if (!(xz_yplydjb_lyrq.equals("")))	wheresql+="  and (xz_yplydjb.lyrq>=TO_DATE('"+xz_yplydjb_lyrq+"','YYYY/MM/DD'))";
	}
	xz_yplydjb_lyrq=request.getParameter("xz_yplydjb_lyrq2");
	if (xz_yplydjb_lyrq!=null)
	{
		xz_yplydjb_lyrq=xz_yplydjb_lyrq.trim();
		if (!(xz_yplydjb_lyrq.equals("")))	wheresql+="  and (xz_yplydjb.lyrq<=TO_DATE('"+xz_yplydjb_lyrq+"','YYYY/MM/DD'))";
	}
	xz_yplydjb_lyr=request.getParameter("xz_yplydjb_lyr");
	if (xz_yplydjb_lyr!=null)
	{
		xz_yplydjb_lyr=cf.GB2Uni(xz_yplydjb_lyr);
		if (!(xz_yplydjb_lyr.equals("")))	wheresql+=" and  (xz_yplydjb.lyr='"+xz_yplydjb_lyr+"')";
	}

	xz_yplydjb_ssfgs=request.getParameter("xz_yplydjb_ssfgs");
	if (!(xz_yplydjb_ssfgs.equals("")))	wheresql+=" and  (xz_yplydjb.ssfgs='"+xz_yplydjb_ssfgs+"')";

	xz_yplydjb_lrr=request.getParameter("xz_yplydjb_lrr");
	if (xz_yplydjb_lrr!=null)
	{
		xz_yplydjb_lrr=cf.GB2Uni(xz_yplydjb_lrr);
		if (!(xz_yplydjb_lrr.equals("")))	wheresql+=" and  (xz_yplydjb.lrr='"+xz_yplydjb_lrr+"')";
	}
	xz_yplydjb_lrsj=request.getParameter("xz_yplydjb_lrsj");
	if (xz_yplydjb_lrsj!=null)
	{
		xz_yplydjb_lrsj=xz_yplydjb_lrsj.trim();
		if (!(xz_yplydjb_lrsj.equals("")))	wheresql+="  and (xz_yplydjb.lrsj=TO_DATE('"+xz_yplydjb_lrsj+"','YYYY/MM/DD'))";
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(*),sum(xz_yplydjb.lysl),sum(xz_yplydjb.lysl*xz_yplydjb.dj),sum(xz_yplydjb.cllcs)";
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
	<td  width="8%">加油次数</td>
	<td  width="12%">加油数量</td>
	<td  width="15%">总价</td>
	<td  width="15%">车辆里程数</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM sq_dwxx,xz_yplydjb  ";
    ls_sql+=" where xz_yplydjb.ssfgs=sq_dwxx.dwbh";
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