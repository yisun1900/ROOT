<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" >

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	
	
	
	
	
	
	
	
	
	String ppgys=null;
	String zcdlbm=null;
	String zcxlbm=null;
	String jc_khzcgmmx_yj=null;
	String jc_khzcgmmx_zhj=null;
	String jc_khzcgmmx_dj=null;
	String jc_khzcgmmx_ssk=null;
	String jc_khzcgmmx_rq=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;

	ppgys=request.getParameter("ppgys");
	if (ppgys!=null)
	{
		ppgys=cf.GB2Uni(ppgys);
		if (!(ppgys.equals("")))	wheresql+=" and  (jc_khzcgmmx.ppgys='"+ppgys+"')";
	}
	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql+=" and  (jc_khzcgmmx.zcdlbm='"+zcdlbm+"')";
	}
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql+=" and  (jc_khzcgmmx.zcxlbm='"+zcxlbm+"')";
	}
	jc_khzcgmmx_yj=request.getParameter("jc_khzcgmmx_yj");
	if (jc_khzcgmmx_yj!=null)
	{
		jc_khzcgmmx_yj=jc_khzcgmmx_yj.trim();
		if (!(jc_khzcgmmx_yj.equals("")))	wheresql+=" and  (jc_khzcgmmx.yj="+jc_khzcgmmx_yj+") ";
	}
	jc_khzcgmmx_zhj=request.getParameter("jc_khzcgmmx_zhj");
	if (jc_khzcgmmx_zhj!=null)
	{
		jc_khzcgmmx_zhj=jc_khzcgmmx_zhj.trim();
		if (!(jc_khzcgmmx_zhj.equals("")))	wheresql+=" and  (jc_khzcgmmx.zhj="+jc_khzcgmmx_zhj+") ";
	}
	jc_khzcgmmx_dj=request.getParameter("jc_khzcgmmx_dj");
	if (jc_khzcgmmx_dj!=null)
	{
		jc_khzcgmmx_dj=jc_khzcgmmx_dj.trim();
		if (!(jc_khzcgmmx_dj.equals("")))	wheresql+=" and  (jc_khzcgmmx.dj="+jc_khzcgmmx_dj+") ";
	}
	jc_khzcgmmx_ssk=request.getParameter("jc_khzcgmmx_ssk");
	if (jc_khzcgmmx_ssk!=null)
	{
		jc_khzcgmmx_ssk=jc_khzcgmmx_ssk.trim();
		if (!(jc_khzcgmmx_ssk.equals("")))	wheresql+=" and  (jc_khzcgmmx.ssk="+jc_khzcgmmx_ssk+") ";
	}
	jc_khzcgmmx_rq=request.getParameter("jc_khzcgmmx_rq");
	if (jc_khzcgmmx_rq!=null)
	{
		jc_khzcgmmx_rq=jc_khzcgmmx_rq.trim();
		if (!(jc_khzcgmmx_rq.equals("")))	wheresql+="  and (jc_khzcgmmx.rq>=TO_DATE('"+jc_khzcgmmx_rq+"','YYYY/MM/DD'))";
	}
	jc_khzcgmmx_rq=request.getParameter("jc_khzcgmmx_rq2");
	if (jc_khzcgmmx_rq!=null)
	{
		jc_khzcgmmx_rq=jc_khzcgmmx_rq.trim();
		if (!(jc_khzcgmmx_rq.equals("")))	wheresql+="  and (jc_khzcgmmx.rq<=TO_DATE('"+jc_khzcgmmx_rq+"','YYYY/MM/DD'))";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
%>

<%
	String tj1=cf.GB2Uni(request.getParameter("tj1"));
	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj4=cf.GB2Uni(request.getParameter("tj4"));
	String tj5=cf.GB2Uni(request.getParameter("tj5"));
	String tj6=cf.GB2Uni(request.getParameter("tj6"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));
	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));
	String tj4name=cf.GB2Uni(request.getParameter("tj4name"));
	String tj5name=cf.GB2Uni(request.getParameter("tj5name"));
	String tj6name=cf.GB2Uni(request.getParameter("tj6name"));

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
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			groupsql+=","+tj4;
			selectgroupsql+=","+tj4;
			groupsl++;
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			groupsql+=","+tj5;
			selectgroupsql+=","+tj5;
			groupsl++;
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			groupsql+=","+tj6;
			selectgroupsql+=","+tj6;
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",sum(jc_khzcgmmx.dj),sum(jc_khzcgmmx.ssk)";
	}
%>


<table width="100%" border="1" cellpadding="3" cellspacing="0" align="center" style="FONT-SIZE:12">

<tr bgcolor="#CCCCCC"  align="center"  >
<%

	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"10%\" >"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj3name+"</td>");
	}
	if (!tj4name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj4name+"</td>");
	}
	if (!tj5name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj5name+"</td>");
	}
	if (!tj6name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj6name+"</td>");
	}

%>

	<td  width="10%" >订金</td>
	<td  width="10%" >实收款</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM jc_khzcgmmx,crm_khxx  ";
    ls_sql+=" where jc_khzcgmmx.khbh=crm_khxx.khbh(+)";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);


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
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj4,"1");//列参数对象加入Hash表
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj5,"1");//列参数对象加入Hash表
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj6,"1");//列参数对象加入Hash表
		}
	}
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>


</body>
</html>




