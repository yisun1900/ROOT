<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">领取明细统计表</font></B>
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
	String oa_xcplqsq_sqxh=null;
	String oa_xcplqsq_dwbh=null;
	String oa_xcplqsq_fgsbh=null;
	String oa_xcplqsq_slr=null;
	String oa_xcplqsq_jhlqrq=null;
	String oa_xcplqsq_lrr=null;
	String oa_xcplqsq_lrrq=null;
	String oa_xcplqsq_sfxsp=null;
	String oa_xcplqsq_lqzt=null;
	String oa_xcplqsq_yjspr=null;
	String oa_xcplqsq_yjspsj=null;
	String oa_xcplqsq_yjspjl=null;
	String oa_xcplqsq_ejspr=null;
	String oa_xcplqsq_ejspsj=null;
	String oa_xcplqsq_ejspjl=null;
	String oa_xcplqsq_sjspr=null;
	String oa_xcplqsq_sjspsj=null;
	String oa_xcplqsq_sjspjl=null;
	String oa_xcplqsq_blr=null;
	String oa_xcplqsq_lqsj=null;

	
	String xcpbm=null;
	xcpbm=request.getParameter("xcpbm");
	if (xcpbm!=null)
	{
		xcpbm=cf.GB2Uni(xcpbm);
		if (!(xcpbm.equals("")))	wheresql+=" and  (oa_xcplqmx.xcpbm='"+xcpbm+"')";
	}
	String xcpmc=null;
	xcpmc=request.getParameter("xcpmc");
	if (xcpmc!=null)
	{
		xcpmc=cf.GB2Uni(xcpmc);
		if (!(xcpmc.equals("")))	wheresql+=" and  (oa_xcplqmx.xcpmc='"+xcpmc+"')";
	}
	String xcpflbm=null;
	xcpflbm=request.getParameter("xcpflbm");
	if (xcpflbm!=null)
	{
		xcpflbm=cf.GB2Uni(xcpflbm);
		if (!(xcpflbm.equals("")))	wheresql+=" and  (oa_xcplqmx.xcpflbm='"+xcpflbm+"')";
	}

	oa_xcplqsq_sqxh=request.getParameter("oa_xcplqsq_sqxh");
	if (oa_xcplqsq_sqxh!=null)
	{
		oa_xcplqsq_sqxh=oa_xcplqsq_sqxh.trim();
		if (!(oa_xcplqsq_sqxh.equals("")))	wheresql+=" and (oa_xcplqsq.sqxh="+oa_xcplqsq_sqxh+") ";
	}
	oa_xcplqsq_dwbh=request.getParameter("oa_xcplqsq_dwbh");
	if (oa_xcplqsq_dwbh!=null)
	{
		oa_xcplqsq_dwbh=cf.GB2Uni(oa_xcplqsq_dwbh);
		if (!(oa_xcplqsq_dwbh.equals("")))	wheresql+=" and  (oa_xcplqsq.dwbh='"+oa_xcplqsq_dwbh+"')";
	}
	oa_xcplqsq_fgsbh=request.getParameter("oa_xcplqsq_fgsbh");
	if (oa_xcplqsq_fgsbh!=null)
	{
		oa_xcplqsq_fgsbh=cf.GB2Uni(oa_xcplqsq_fgsbh);
		if (!(oa_xcplqsq_fgsbh.equals("")))	wheresql+=" and  (oa_xcplqsq.fgsbh='"+oa_xcplqsq_fgsbh+"')";
	}
	oa_xcplqsq_slr=request.getParameter("oa_xcplqsq_slr");
	if (oa_xcplqsq_slr!=null)
	{
		oa_xcplqsq_slr=cf.GB2Uni(oa_xcplqsq_slr);
		if (!(oa_xcplqsq_slr.equals("")))	wheresql+=" and  (oa_xcplqsq.slr='"+oa_xcplqsq_slr+"')";
	}
	oa_xcplqsq_jhlqrq=request.getParameter("oa_xcplqsq_jhlqrq");
	if (oa_xcplqsq_jhlqrq!=null)
	{
		oa_xcplqsq_jhlqrq=oa_xcplqsq_jhlqrq.trim();
		if (!(oa_xcplqsq_jhlqrq.equals("")))	wheresql+="  and (oa_xcplqsq.jhlqrq>=TO_DATE('"+oa_xcplqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_jhlqrq=request.getParameter("oa_xcplqsq_jhlqrq2");
	if (oa_xcplqsq_jhlqrq!=null)
	{
		oa_xcplqsq_jhlqrq=oa_xcplqsq_jhlqrq.trim();
		if (!(oa_xcplqsq_jhlqrq.equals("")))	wheresql+="  and (oa_xcplqsq.jhlqrq<=TO_DATE('"+oa_xcplqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_lrr=request.getParameter("oa_xcplqsq_lrr");
	if (oa_xcplqsq_lrr!=null)
	{
		oa_xcplqsq_lrr=cf.GB2Uni(oa_xcplqsq_lrr);
		if (!(oa_xcplqsq_lrr.equals("")))	wheresql+=" and  (oa_xcplqsq.lrr='"+oa_xcplqsq_lrr+"')";
	}
	oa_xcplqsq_lrrq=request.getParameter("oa_xcplqsq_lrrq");
	if (oa_xcplqsq_lrrq!=null)
	{
		oa_xcplqsq_lrrq=oa_xcplqsq_lrrq.trim();
		if (!(oa_xcplqsq_lrrq.equals("")))	wheresql+="  and (oa_xcplqsq.lrrq>=TO_DATE('"+oa_xcplqsq_lrrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_lrrq=request.getParameter("oa_xcplqsq_lrrq2");
	if (oa_xcplqsq_lrrq!=null)
	{
		oa_xcplqsq_lrrq=oa_xcplqsq_lrrq.trim();
		if (!(oa_xcplqsq_lrrq.equals("")))	wheresql+="  and (oa_xcplqsq.lrrq<=TO_DATE('"+oa_xcplqsq_lrrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_sfxsp=request.getParameter("oa_xcplqsq_sfxsp");
	if (oa_xcplqsq_sfxsp!=null)
	{
		oa_xcplqsq_sfxsp=cf.GB2Uni(oa_xcplqsq_sfxsp);
		if (!(oa_xcplqsq_sfxsp.equals("")))	wheresql+=" and  (oa_xcplqsq.sfxsp='"+oa_xcplqsq_sfxsp+"')";
	}
	oa_xcplqsq_lqzt=request.getParameter("oa_xcplqsq_lqzt");
	if (oa_xcplqsq_lqzt!=null)
	{
		oa_xcplqsq_lqzt=cf.GB2Uni(oa_xcplqsq_lqzt);
		if (!(oa_xcplqsq_lqzt.equals("")))	wheresql+=" and  (oa_xcplqsq.lqzt='"+oa_xcplqsq_lqzt+"')";
	}
	oa_xcplqsq_yjspr=request.getParameter("oa_xcplqsq_yjspr");
	if (oa_xcplqsq_yjspr!=null)
	{
		oa_xcplqsq_yjspr=cf.GB2Uni(oa_xcplqsq_yjspr);
		if (!(oa_xcplqsq_yjspr.equals("")))	wheresql+=" and  (oa_xcplqsq.yjspr='"+oa_xcplqsq_yjspr+"')";
	}
	oa_xcplqsq_yjspsj=request.getParameter("oa_xcplqsq_yjspsj");
	if (oa_xcplqsq_yjspsj!=null)
	{
		oa_xcplqsq_yjspsj=oa_xcplqsq_yjspsj.trim();
		if (!(oa_xcplqsq_yjspsj.equals("")))	wheresql+="  and (oa_xcplqsq.yjspsj>=TO_DATE('"+oa_xcplqsq_yjspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_yjspsj=request.getParameter("oa_xcplqsq_yjspsj2");
	if (oa_xcplqsq_yjspsj!=null)
	{
		oa_xcplqsq_yjspsj=oa_xcplqsq_yjspsj.trim();
		if (!(oa_xcplqsq_yjspsj.equals("")))	wheresql+="  and (oa_xcplqsq.yjspsj<=TO_DATE('"+oa_xcplqsq_yjspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_yjspjl=request.getParameter("oa_xcplqsq_yjspjl");
	if (oa_xcplqsq_yjspjl!=null)
	{
		oa_xcplqsq_yjspjl=cf.GB2Uni(oa_xcplqsq_yjspjl);
		if (!(oa_xcplqsq_yjspjl.equals("")))	wheresql+=" and  (oa_xcplqsq.yjspjl='"+oa_xcplqsq_yjspjl+"')";
	}
	oa_xcplqsq_ejspr=request.getParameter("oa_xcplqsq_ejspr");
	if (oa_xcplqsq_ejspr!=null)
	{
		oa_xcplqsq_ejspr=cf.GB2Uni(oa_xcplqsq_ejspr);
		if (!(oa_xcplqsq_ejspr.equals("")))	wheresql+=" and  (oa_xcplqsq.ejspr='"+oa_xcplqsq_ejspr+"')";
	}
	oa_xcplqsq_ejspsj=request.getParameter("oa_xcplqsq_ejspsj");
	if (oa_xcplqsq_ejspsj!=null)
	{
		oa_xcplqsq_ejspsj=oa_xcplqsq_ejspsj.trim();
		if (!(oa_xcplqsq_ejspsj.equals("")))	wheresql+="  and (oa_xcplqsq.ejspsj>=TO_DATE('"+oa_xcplqsq_ejspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_ejspsj=request.getParameter("oa_xcplqsq_ejspsj2");
	if (oa_xcplqsq_ejspsj!=null)
	{
		oa_xcplqsq_ejspsj=oa_xcplqsq_ejspsj.trim();
		if (!(oa_xcplqsq_ejspsj.equals("")))	wheresql+="  and (oa_xcplqsq.ejspsj<=TO_DATE('"+oa_xcplqsq_ejspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_ejspjl=request.getParameter("oa_xcplqsq_ejspjl");
	if (oa_xcplqsq_ejspjl!=null)
	{
		oa_xcplqsq_ejspjl=cf.GB2Uni(oa_xcplqsq_ejspjl);
		if (!(oa_xcplqsq_ejspjl.equals("")))	wheresql+=" and  (oa_xcplqsq.ejspjl='"+oa_xcplqsq_ejspjl+"')";
	}
	oa_xcplqsq_sjspr=request.getParameter("oa_xcplqsq_sjspr");
	if (oa_xcplqsq_sjspr!=null)
	{
		oa_xcplqsq_sjspr=cf.GB2Uni(oa_xcplqsq_sjspr);
		if (!(oa_xcplqsq_sjspr.equals("")))	wheresql+=" and  (oa_xcplqsq.sjspr='"+oa_xcplqsq_sjspr+"')";
	}
	oa_xcplqsq_sjspsj=request.getParameter("oa_xcplqsq_sjspsj");
	if (oa_xcplqsq_sjspsj!=null)
	{
		oa_xcplqsq_sjspsj=oa_xcplqsq_sjspsj.trim();
		if (!(oa_xcplqsq_sjspsj.equals("")))	wheresql+="  and (oa_xcplqsq.sjspsj>=TO_DATE('"+oa_xcplqsq_sjspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_sjspsj=request.getParameter("oa_xcplqsq_sjspsj2");
	if (oa_xcplqsq_sjspsj!=null)
	{
		oa_xcplqsq_sjspsj=oa_xcplqsq_sjspsj.trim();
		if (!(oa_xcplqsq_sjspsj.equals("")))	wheresql+="  and (oa_xcplqsq.sjspsj<=TO_DATE('"+oa_xcplqsq_sjspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_sjspjl=request.getParameter("oa_xcplqsq_sjspjl");
	if (oa_xcplqsq_sjspjl!=null)
	{
		oa_xcplqsq_sjspjl=cf.GB2Uni(oa_xcplqsq_sjspjl);
		if (!(oa_xcplqsq_sjspjl.equals("")))	wheresql+=" and  (oa_xcplqsq.sjspjl='"+oa_xcplqsq_sjspjl+"')";
	}
	oa_xcplqsq_blr=request.getParameter("oa_xcplqsq_blr");
	if (oa_xcplqsq_blr!=null)
	{
		oa_xcplqsq_blr=cf.GB2Uni(oa_xcplqsq_blr);
		if (!(oa_xcplqsq_blr.equals("")))	wheresql+=" and  (oa_xcplqsq.blr='"+oa_xcplqsq_blr+"')";
	}
	oa_xcplqsq_lqsj=request.getParameter("oa_xcplqsq_lqsj");
	if (oa_xcplqsq_lqsj!=null)
	{
		oa_xcplqsq_lqsj=oa_xcplqsq_lqsj.trim();
		if (!(oa_xcplqsq_lqsj.equals("")))	wheresql+="  and (oa_xcplqsq.lqsj>=TO_DATE('"+oa_xcplqsq_lqsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_lqsj=request.getParameter("oa_xcplqsq_lqsj2");
	if (oa_xcplqsq_lqsj!=null)
	{
		oa_xcplqsq_lqsj=oa_xcplqsq_lqsj.trim();
		if (!(oa_xcplqsq_lqsj.equals("")))	wheresql+="  and (oa_xcplqsq.lqsj<=TO_DATE('"+oa_xcplqsq_lqsj+"','YYYY/MM/DD'))";
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",sum(oa_xcplqmx.jhlqsl),ROUND(sum(oa_xcplqmx.jhlqsl*oa_xcplqmx.dj),2),sum(oa_xcplqmx.slqsl),ROUND(sum(oa_xcplqmx.slqsl*oa_xcplqmx.dj),2)";
	}
%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<%
	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"15%\">"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"15%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"15%\">"+tj3name+"</td>");
	}

%>
	<td  width="10%">计划领取数量</td>
	<td  width="15%">计划领取金额</td>
	<td  width="10%">实领取数量</td>
	<td  width="15%">实领取金额</td>
</tr>
<%
	ls_sql=selectgroupsql;
	ls_sql+=" FROM oa_xcplqsq,sq_dwxx,oa_xcplqmx,oa_xcpflbm  ";
    ls_sql+=" where oa_xcplqsq.dwbh=sq_dwxx.dwbh(+) ";
    ls_sql+=" and oa_xcplqsq.sqxh=oa_xcplqmx.sqxh and oa_xcplqmx.xcpflbm=oa_xcpflbm.xcpflbm(+)";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

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




