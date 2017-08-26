<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">出车情况统计</font></B>
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
	String xz_pcsq_sqxh=null;
	String xz_pcsq_ycsj=null;
	String xz_pcsq_fhsj=null;
	String xz_pcsq_ycsy=null;
	String xz_pcsq_mdd=null;
	String xz_pcsq_dwbh=null;
	String xz_pcsq_sqr=null;
	String xz_pcsq_sqrq=null;
	String xz_pcsq_clzt=null;
	String xz_pcsq_qcph=null;
	String xz_qcdm_qcxh=null;
	String xz_pcsq_sjxm=null;
	String xz_pcsq_pzr=null;
	String xz_pcsq_pzsj=null;
	String xz_pcsq_lrr=null;
	String xz_pcsq_lrsj=null;
	xz_pcsq_sqxh=request.getParameter("xz_pcsq_sqxh");
	if (xz_pcsq_sqxh!=null)
	{
		xz_pcsq_sqxh=xz_pcsq_sqxh.trim();
		if (!(xz_pcsq_sqxh.equals("")))	wheresql+=" and (xz_pcsq.sqxh="+xz_pcsq_sqxh+") ";
	}
	xz_pcsq_ycsj=request.getParameter("xz_pcsq_ycsj");
	if (xz_pcsq_ycsj!=null)
	{
		xz_pcsq_ycsj=xz_pcsq_ycsj.trim();
		if (!(xz_pcsq_ycsj.equals("")))	wheresql+="  and (xz_pcsq.ycsj>=TO_DATE('"+xz_pcsq_ycsj+" 00:00:00','YYYY-MM-DD HH24:MI:SS'))";
	}
	xz_pcsq_ycsj=request.getParameter("xz_pcsq_ycsj2");
	if (xz_pcsq_ycsj!=null)
	{
		xz_pcsq_ycsj=xz_pcsq_ycsj.trim();
		if (!(xz_pcsq_ycsj.equals("")))	wheresql+="  and (xz_pcsq.ycsj<=TO_DATE('"+xz_pcsq_ycsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}
	xz_pcsq_fhsj=request.getParameter("xz_pcsq_fhsj");
	if (xz_pcsq_fhsj!=null)
	{
		xz_pcsq_fhsj=xz_pcsq_fhsj.trim();
		if (!(xz_pcsq_fhsj.equals("")))	wheresql+="  and (xz_pcsq.fhsj>=TO_DATE('"+xz_pcsq_fhsj+" 00:00:00','YYYY-MM-DD HH24:MI:SS'))";
	}
	xz_pcsq_fhsj=request.getParameter("xz_pcsq_fhsj2");
	if (xz_pcsq_fhsj!=null)
	{
		xz_pcsq_fhsj=xz_pcsq_fhsj.trim();
		if (!(xz_pcsq_fhsj.equals("")))	wheresql+="  and (xz_pcsq.fhsj<=TO_DATE('"+xz_pcsq_fhsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}
	xz_pcsq_ycsy=request.getParameter("xz_pcsq_ycsy");
	if (xz_pcsq_ycsy!=null)
	{
		xz_pcsq_ycsy=cf.GB2Uni(xz_pcsq_ycsy);
		if (!(xz_pcsq_ycsy.equals("")))	wheresql+=" and  (xz_pcsq.ycsy like '%"+xz_pcsq_ycsy+"%')";
	}
	xz_pcsq_mdd=request.getParameter("xz_pcsq_mdd");
	if (xz_pcsq_mdd!=null)
	{
		xz_pcsq_mdd=cf.GB2Uni(xz_pcsq_mdd);
		if (!(xz_pcsq_mdd.equals("")))	wheresql+=" and  (xz_pcsq.mdd like '%"+xz_pcsq_mdd+"%')";
	}
	xz_pcsq_dwbh=request.getParameter("xz_pcsq_dwbh");
	if (xz_pcsq_dwbh!=null)
	{
		xz_pcsq_dwbh=cf.GB2Uni(xz_pcsq_dwbh);
		if (!(xz_pcsq_dwbh.equals("")))	wheresql+=" and  (xz_pcsq.dwbh='"+xz_pcsq_dwbh+"')";
	}
	xz_pcsq_sqr=request.getParameter("xz_pcsq_sqr");
	if (xz_pcsq_sqr!=null)
	{
		xz_pcsq_sqr=cf.GB2Uni(xz_pcsq_sqr);
		if (!(xz_pcsq_sqr.equals("")))	wheresql+=" and  (xz_pcsq.sqr like '%"+xz_pcsq_sqr+"%')";
	}
	xz_pcsq_sqrq=request.getParameter("xz_pcsq_sqrq");
	if (xz_pcsq_sqrq!=null)
	{
		xz_pcsq_sqrq=xz_pcsq_sqrq.trim();
		if (!(xz_pcsq_sqrq.equals("")))	wheresql+="  and (xz_pcsq.sqrq>=TO_DATE('"+xz_pcsq_sqrq+"','YYYY/MM/DD'))";
	}
	xz_pcsq_sqrq=request.getParameter("xz_pcsq_sqrq2");
	if (xz_pcsq_sqrq!=null)
	{
		xz_pcsq_sqrq=xz_pcsq_sqrq.trim();
		if (!(xz_pcsq_sqrq.equals("")))	wheresql+="  and (xz_pcsq.sqrq<=TO_DATE('"+xz_pcsq_sqrq+"','YYYY/MM/DD'))";
	}
	xz_pcsq_clzt=request.getParameter("xz_pcsq_clzt");
	if (xz_pcsq_clzt!=null)
	{
		xz_pcsq_clzt=cf.GB2Uni(xz_pcsq_clzt);
		if (!(xz_pcsq_clzt.equals("")))	wheresql+=" and  (xz_pcsq.clzt='"+xz_pcsq_clzt+"')";
	}
	xz_pcsq_qcph=request.getParameter("xz_pcsq_qcph");
	if (xz_pcsq_qcph!=null)
	{
		xz_pcsq_qcph=cf.GB2Uni(xz_pcsq_qcph);
		if (!(xz_pcsq_qcph.equals("")))	wheresql+=" and  (xz_pcsq.qcph like '%"+xz_pcsq_qcph+"%')";
	}
	xz_qcdm_qcxh=request.getParameter("xz_qcdm_qcxh");
	if (xz_qcdm_qcxh!=null)
	{
		xz_qcdm_qcxh=cf.GB2Uni(xz_qcdm_qcxh);
		if (!(xz_qcdm_qcxh.equals("")))	wheresql+=" and  (xz_qcdm.qcxh like '%"+xz_qcdm_qcxh+"%')";
	}
	xz_pcsq_sjxm=request.getParameter("xz_pcsq_sjxm");
	if (xz_pcsq_sjxm!=null)
	{
		xz_pcsq_sjxm=cf.GB2Uni(xz_pcsq_sjxm);
		if (!(xz_pcsq_sjxm.equals("")))	wheresql+=" and  (xz_pcsq.sjxm like '%"+xz_pcsq_sjxm+"%')";
	}
	xz_pcsq_pzr=request.getParameter("xz_pcsq_pzr");
	if (xz_pcsq_pzr!=null)
	{
		xz_pcsq_pzr=cf.GB2Uni(xz_pcsq_pzr);
		if (!(xz_pcsq_pzr.equals("")))	wheresql+=" and  (xz_pcsq.pzr like '%"+xz_pcsq_pzr+"%')";
	}
	xz_pcsq_pzsj=request.getParameter("xz_pcsq_pzsj");
	if (xz_pcsq_pzsj!=null)
	{
		xz_pcsq_pzsj=xz_pcsq_pzsj.trim();
		if (!(xz_pcsq_pzsj.equals("")))	wheresql+="  and (xz_pcsq.pzsj>=TO_DATE('"+xz_pcsq_pzsj+"','YYYY/MM/DD'))";
	}
	xz_pcsq_pzsj=request.getParameter("xz_pcsq_pzsj2");
	if (xz_pcsq_pzsj!=null)
	{
		xz_pcsq_pzsj=xz_pcsq_pzsj.trim();
		if (!(xz_pcsq_pzsj.equals("")))	wheresql+="  and (xz_pcsq.pzsj<=TO_DATE('"+xz_pcsq_pzsj+"','YYYY/MM/DD'))";
	}
	xz_pcsq_lrr=request.getParameter("xz_pcsq_lrr");
	if (xz_pcsq_lrr!=null)
	{
		xz_pcsq_lrr=cf.GB2Uni(xz_pcsq_lrr);
		if (!(xz_pcsq_lrr.equals("")))	wheresql+=" and  (xz_pcsq.lrr='"+xz_pcsq_lrr+"')";
	}
	xz_pcsq_lrsj=request.getParameter("xz_pcsq_lrsj");
	if (xz_pcsq_lrsj!=null)
	{
		xz_pcsq_lrsj=xz_pcsq_lrsj.trim();
		if (!(xz_pcsq_lrsj.equals("")))	wheresql+="  and (xz_pcsq.lrsj=TO_DATE('"+xz_pcsq_lrsj+"','YYYY/MM/DD'))";
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(*),sum(xz_pcsq.gls),sum(ROUND((xz_pcsq.fhsj-xz_pcsq.ycsj)*24*60))";
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
	<td  width="10%">次数</td>
	<td  width="15%">公里数</td>
	<td  width="15%">用车时间(分钟)</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM sq_dwxx,xz_pcsq  ";
    ls_sql+=" where xz_pcsq.dwbh=sq_dwxx.dwbh ";
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