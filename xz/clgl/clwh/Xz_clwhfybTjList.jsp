<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">车辆附加费统计</font></B>
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
	String xz_clwhfyb_qcph=null;
	String xz_clwhfyb_xm=null;
	String xz_clwhfyb_fy=null;
	String xz_clwhfyb_djrq=null;
	String xz_clwhfyb_jsr=null;
	String xz_clwhfyb_pzr=null;
	String xz_clwhfyb_ssfgs=null;
	String xz_clwhfyb_lrr=null;
	String xz_clwhfyb_lrsj=null;

	String fyfsbm=null;
	fyfsbm=request.getParameter("fyfsbm");
	if (fyfsbm!=null)
	{
		if (!(fyfsbm.equals("")))	wheresql+=" and (xz_clwhfyb.fyfsbm='"+fyfsbm+"') ";
	}

	xz_clwhfyb_qcph=request.getParameter("xz_clwhfyb_qcph");
	if (xz_clwhfyb_qcph!=null)
	{
		xz_clwhfyb_qcph=cf.GB2Uni(xz_clwhfyb_qcph);
		if (!(xz_clwhfyb_qcph.equals("")))	wheresql+=" and  (xz_clwhfyb.qcph like '%"+xz_clwhfyb_qcph+"%')";
	}
	xz_clwhfyb_xm=request.getParameter("xz_clwhfyb_xm");
	if (xz_clwhfyb_xm!=null)
	{
		xz_clwhfyb_xm=cf.GB2Uni(xz_clwhfyb_xm);
		if (!(xz_clwhfyb_xm.equals("")))	wheresql+=" and  (xz_clwhfyb.xm='"+xz_clwhfyb_xm+"')";
	}
	xz_clwhfyb_fy=request.getParameter("xz_clwhfyb_fy");
	if (xz_clwhfyb_fy!=null)
	{
		xz_clwhfyb_fy=xz_clwhfyb_fy.trim();
		if (!(xz_clwhfyb_fy.equals("")))	wheresql+=" and  (xz_clwhfyb.fy="+xz_clwhfyb_fy+") ";
	}
	xz_clwhfyb_djrq=request.getParameter("xz_clwhfyb_djrq");
	if (xz_clwhfyb_djrq!=null)
	{
		xz_clwhfyb_djrq=xz_clwhfyb_djrq.trim();
		if (!(xz_clwhfyb_djrq.equals("")))	wheresql+="  and (xz_clwhfyb.djrq>=TO_DATE('"+xz_clwhfyb_djrq+"','YYYY/MM/DD'))";
	}
	xz_clwhfyb_djrq=request.getParameter("xz_clwhfyb_djrq2");
	if (xz_clwhfyb_djrq!=null)
	{
		xz_clwhfyb_djrq=xz_clwhfyb_djrq.trim();
		if (!(xz_clwhfyb_djrq.equals("")))	wheresql+="  and (xz_clwhfyb.djrq<=TO_DATE('"+xz_clwhfyb_djrq+"','YYYY/MM/DD'))";
	}
	xz_clwhfyb_jsr=request.getParameter("xz_clwhfyb_jsr");
	if (xz_clwhfyb_jsr!=null)
	{
		xz_clwhfyb_jsr=cf.GB2Uni(xz_clwhfyb_jsr);
		if (!(xz_clwhfyb_jsr.equals("")))	wheresql+=" and  (xz_clwhfyb.jsr like '%"+xz_clwhfyb_jsr+"%')";
	}
	xz_clwhfyb_pzr=request.getParameter("xz_clwhfyb_pzr");
	if (xz_clwhfyb_pzr!=null)
	{
		xz_clwhfyb_pzr=cf.GB2Uni(xz_clwhfyb_pzr);
		if (!(xz_clwhfyb_pzr.equals("")))	wheresql+=" and  (xz_clwhfyb.pzr like '%"+xz_clwhfyb_pzr+"%')";
	}
	xz_clwhfyb_ssfgs=request.getParameter("xz_clwhfyb_ssfgs");
	if (xz_clwhfyb_ssfgs!=null)
	{
		xz_clwhfyb_ssfgs=cf.GB2Uni(xz_clwhfyb_ssfgs);
		if (!(xz_clwhfyb_ssfgs.equals("")))	wheresql+=" and  (xz_clwhfyb.ssfgs='"+xz_clwhfyb_ssfgs+"')";
	}
	xz_clwhfyb_lrr=request.getParameter("xz_clwhfyb_lrr");
	if (xz_clwhfyb_lrr!=null)
	{
		xz_clwhfyb_lrr=cf.GB2Uni(xz_clwhfyb_lrr);
		if (!(xz_clwhfyb_lrr.equals("")))	wheresql+=" and  (xz_clwhfyb.lrr='"+xz_clwhfyb_lrr+"')";
	}
	xz_clwhfyb_lrsj=request.getParameter("xz_clwhfyb_lrsj");
	if (xz_clwhfyb_lrsj!=null)
	{
		xz_clwhfyb_lrsj=xz_clwhfyb_lrsj.trim();
		if (!(xz_clwhfyb_lrsj.equals("")))	wheresql+="  and (xz_clwhfyb.lrsj>=TO_DATE('"+xz_clwhfyb_lrsj+"','YYYY/MM/DD'))";
	}
	xz_clwhfyb_lrsj=request.getParameter("xz_clwhfyb_lrsj2");
	if (xz_clwhfyb_lrsj!=null)
	{
		xz_clwhfyb_lrsj=xz_clwhfyb_lrsj.trim();
		if (!(xz_clwhfyb_lrsj.equals("")))	wheresql+="  and (xz_clwhfyb.lrsj<=TO_DATE('"+xz_clwhfyb_lrsj+"','YYYY/MM/DD'))";
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(*),sum(xz_clwhfyb.fy)";
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
	<td  width="20%">发生次数</td>
	<td  width="20%">费用</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM sq_dwxx,xz_clwhfyb  ";
    ls_sql+=" where xz_clwhfyb.fyfsbm=sq_dwxx.dwbh(+)";
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