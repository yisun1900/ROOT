<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

<body bgcolor="#FFFFFF" >

<%

	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";

	String jxc_ckd_ckph=null;
	String jxc_ckd_dqbm=null;
	String jxc_ckd_fgsbh=null;
	String jxc_ckd_ckbh=null;
	String jxc_ckd_ckcllx=null;
	String jxc_ckd_cklx=null;
	String jxc_ckd_ckdzt=null;
	jxc_ckd_ckph=request.getParameter("jxc_ckd_ckph");
	if (jxc_ckd_ckph!=null)
	{
		jxc_ckd_ckph=cf.GB2Uni(jxc_ckd_ckph);
		if (!(jxc_ckd_ckph.equals("")))	wheresql+=" and  (jxc_ckd.ckph='"+jxc_ckd_ckph+"')";
	}
	jxc_ckd_dqbm=request.getParameter("jxc_ckd_dqbm");
	if (jxc_ckd_dqbm!=null)
	{
		jxc_ckd_dqbm=cf.GB2Uni(jxc_ckd_dqbm);
		if (!(jxc_ckd_dqbm.equals("")))	wheresql+=" and  (jxc_ckd.dqbm='"+jxc_ckd_dqbm+"')";
	}
	jxc_ckd_fgsbh=request.getParameter("jxc_ckd_fgsbh");
	if (jxc_ckd_fgsbh!=null)
	{
		jxc_ckd_fgsbh=cf.GB2Uni(jxc_ckd_fgsbh);
		if (!(jxc_ckd_fgsbh.equals("")))	wheresql+=" and  (jxc_ckd.fgsbh='"+jxc_ckd_fgsbh+"')";
	}
	jxc_ckd_ckbh=request.getParameter("jxc_ckd_ckbh");
	if (jxc_ckd_ckbh!=null)
	{
		jxc_ckd_ckbh=cf.GB2Uni(jxc_ckd_ckbh);
		if (!(jxc_ckd_ckbh.equals("")))	wheresql+=" and  (jxc_ckd.ckbh='"+jxc_ckd_ckbh+"')";
	}
	jxc_ckd_ckcllx=request.getParameter("jxc_ckd_ckcllx");
	if (jxc_ckd_ckcllx!=null)
	{
		jxc_ckd_ckcllx=cf.GB2Uni(jxc_ckd_ckcllx);
		if (!(jxc_ckd_ckcllx.equals("")))	wheresql+=" and  (jxc_ckd.ckcllx='"+jxc_ckd_ckcllx+"')";
	}
	jxc_ckd_cklx=request.getParameter("jxc_ckd_cklx");
	if (jxc_ckd_cklx!=null)
	{
		jxc_ckd_cklx=cf.GB2Uni(jxc_ckd_cklx);
		if (!(jxc_ckd_cklx.equals("")))	wheresql+=" and  (jxc_ckd.cklx='"+jxc_ckd_cklx+"')";
	}

	jxc_ckd_ckdzt=request.getParameter("jxc_ckd_ckdzt");
	if (jxc_ckd_ckdzt!=null)
	{
		jxc_ckd_ckdzt=cf.GB2Uni(jxc_ckd_ckdzt);
		if (!(jxc_ckd_ckdzt.equals("")))	wheresql+=" and  (jxc_ckd.ckdzt='"+jxc_ckd_ckdzt+"')";
	}


	String jxc_ckd_lrsj=null;
	String jxc_ckd_cksj=null;
	String lydh=null;
	String jxc_ckd_lrr=null;
	String jxc_ckd_jhshsj=null;



	jxc_ckd_lrsj=request.getParameter("jxc_ckd_lrsj");
	if (jxc_ckd_lrsj!=null)
	{
		jxc_ckd_lrsj=jxc_ckd_lrsj.trim();
		if (!(jxc_ckd_lrsj.equals("")))	wheresql+="  and (jxc_ckd.lrsj>=TO_DATE('"+jxc_ckd_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_lrsj=request.getParameter("jxc_ckd_lrsj2");
	if (jxc_ckd_lrsj!=null)
	{
		jxc_ckd_lrsj=jxc_ckd_lrsj.trim();
		if (!(jxc_ckd_lrsj.equals("")))	wheresql+="  and (jxc_ckd.lrsj<=TO_DATE('"+jxc_ckd_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	jxc_ckd_cksj=request.getParameter("jxc_ckd_cksj");
	if (jxc_ckd_cksj!=null)
	{
		jxc_ckd_cksj=jxc_ckd_cksj.trim();
		if (!(jxc_ckd_cksj.equals("")))	wheresql+="  and (jxc_ckd.cksj>=TO_DATE('"+jxc_ckd_cksj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_cksj=request.getParameter("jxc_ckd_cksj2");
	if (jxc_ckd_cksj!=null)
	{
		jxc_ckd_cksj=jxc_ckd_cksj.trim();
		if (!(jxc_ckd_cksj.equals("")))	wheresql+="  and (jxc_ckd.cksj<=TO_DATE('"+jxc_ckd_cksj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	lydh=request.getParameter("lydh");
	if (lydh!=null)
	{
		lydh=lydh.trim();
		if (!(lydh.equals("")))	wheresql+=" and  (jxc_ckd.lydh='"+lydh+"')";
	}
	jxc_ckd_lrr=request.getParameter("jxc_ckd_lrr");
	if (jxc_ckd_lrr!=null)
	{
		jxc_ckd_lrr=cf.GB2Uni(jxc_ckd_lrr);
		if (!(jxc_ckd_lrr.equals("")))	wheresql+=" and  (jxc_ckd.lrr='"+jxc_ckd_lrr+"')";
	}
	jxc_ckd_jhshsj=request.getParameter("jxc_ckd_jhshsj");
	if (jxc_ckd_jhshsj!=null)
	{
		jxc_ckd_jhshsj=jxc_ckd_jhshsj.trim();
		if (!(jxc_ckd_jhshsj.equals("")))	wheresql+="  and (jxc_ckd.jhshsj>=TO_DATE('"+jxc_ckd_jhshsj+"','YYYY/MM/DD'))";
	}
	jxc_ckd_jhshsj=request.getParameter("jxc_ckd_jhshsj2");
	if (jxc_ckd_jhshsj!=null)
	{
		jxc_ckd_jhshsj=jxc_ckd_jhshsj.trim();
		if (!(jxc_ckd_jhshsj.equals("")))	wheresql+="  and (jxc_ckd.jhshsj<=TO_DATE('"+jxc_ckd_jhshsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}


	String cldlbm=null;
	String clxlbm=null;
	String jxc_ckmx_clbm=null;
	String jxc_ckmx_clmc=null;
	String jxc_ckmx_clmc2=null;
	String jxc_ckmx_xh=null;
	String jxc_ckmx_gg=null;
	String jxc_ckmx_nbbm=null;
	String jxc_ckmx_ppmc=null;
	String jxc_ckmx_gysmc=null;
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (jxc_ckmx.cldlbm='"+cldlbm+"')";
	}
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jxc_ckmx.clxlbm='"+clxlbm+"')";
	}
	jxc_ckmx_clbm=request.getParameter("jxc_ckmx_clbm");
	if (jxc_ckmx_clbm!=null)
	{
		jxc_ckmx_clbm=cf.GB2Uni(jxc_ckmx_clbm);
		if (!(jxc_ckmx_clbm.equals("")))	wheresql+=" and  (jxc_ckmx.clbm='"+jxc_ckmx_clbm+"')";
	}
	jxc_ckmx_clmc=request.getParameter("jxc_ckmx_clmc");
	if (jxc_ckmx_clmc!=null)
	{
		jxc_ckmx_clmc=cf.GB2Uni(jxc_ckmx_clmc);
		if (!(jxc_ckmx_clmc.equals("")))	wheresql+=" and  (jxc_ckmx.clmc='"+jxc_ckmx_clmc+"')";
	}
	jxc_ckmx_clmc2=request.getParameter("jxc_ckmx_clmc2");
	if (jxc_ckmx_clmc2!=null)
	{
		jxc_ckmx_clmc2=cf.GB2Uni(jxc_ckmx_clmc2);
		if (!(jxc_ckmx_clmc2.equals("")))	wheresql+=" and  (jxc_ckmx.clmc like '%"+jxc_ckmx_clmc2+"%')";
	}
	jxc_ckmx_xh=request.getParameter("jxc_ckmx_xh");
	if (jxc_ckmx_xh!=null)
	{
		jxc_ckmx_xh=cf.GB2Uni(jxc_ckmx_xh);
		if (!(jxc_ckmx_xh.equals("")))	wheresql+=" and  (jxc_ckmx.xh like '%"+jxc_ckmx_xh+"%')";
	}
	jxc_ckmx_gg=request.getParameter("jxc_ckmx_gg");
	if (jxc_ckmx_gg!=null)
	{
		jxc_ckmx_gg=cf.GB2Uni(jxc_ckmx_gg);
		if (!(jxc_ckmx_gg.equals("")))	wheresql+=" and  (jxc_ckmx.gg like '%"+jxc_ckmx_gg+"%')";
	}
	jxc_ckmx_nbbm=request.getParameter("jxc_ckmx_nbbm");
	if (jxc_ckmx_nbbm!=null)
	{
		jxc_ckmx_nbbm=cf.GB2Uni(jxc_ckmx_nbbm);
		if (!(jxc_ckmx_nbbm.equals("")))	wheresql+=" and  (jxc_ckmx.nbbm='"+jxc_ckmx_nbbm+"')";
	}
	jxc_ckmx_ppmc=request.getParameter("jxc_ckmx_ppmc");
	if (jxc_ckmx_ppmc!=null)
	{
		jxc_ckmx_ppmc=cf.GB2Uni(jxc_ckmx_ppmc);
		if (!(jxc_ckmx_ppmc.equals("")))	wheresql+=" and  (jxc_ckmx.ppmc='"+jxc_ckmx_ppmc+"')";
	}
	jxc_ckmx_gysmc=request.getParameter("jxc_ckmx_gysmc");
	if (jxc_ckmx_gysmc!=null)
	{
		jxc_ckmx_gysmc=cf.GB2Uni(jxc_ckmx_gysmc);
		if (!(jxc_ckmx_gysmc.equals("")))	wheresql+=" and  (jxc_ckmx.gysmc='"+jxc_ckmx_gysmc+"')";
	}
%>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

double cksl=0;
double ckje=0;

try {
	conn=cf.getConnection();

	ls_sql=" select sum(jxc_ckmx.cksl),sum(jxc_ckmx.ckje)";
	ls_sql+=" FROM jxc_ckd,jxc_ckmx ";
    ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph(+) ";
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cksl=rs.getDouble(1);
		ckje=rs.getDouble(2);
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",sum(jxc_ckmx.cksl),sum(jxc_ckmx.ckje)";
	}
%>

<center>出库单明细统计</center>
<table class="LockHeadTable" ROWHEADNUM=1 COLHEADNUM=1 ROWHEADSTYLE="background:#CC6600; color:white;" COLHEADSTYLE="background:#CCCCCC; color:black;" FOCUSSTYLE="background-image: url(/images/bg.normal.gif);" width="100%" border="1" cellpadding="3" cellspacing="0" align="center" style="FONT-SIZE:12">

<tr bgcolor="#CCCCCC"  align="center"  >
<%

	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"8%\" >"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj3name+"</td>");
	}
	if (!tj4name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj4name+"</td>");
	}
	if (!tj5name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj5name+"</td>");
	}
	if (!tj6name.equals(""))
	{
		out.println("<td  width=\"8%\">"+tj6name+"</td>");
	}

%>

	<td  width="5%">出库数量</td>
	<td  width="8%">出库金额</td>
</tr>
<%

	ls_sql=selectgroupsql;

	ls_sql+=" FROM jxc_ckd,jxc_ckmx ";
    ls_sql+=" where jxc_ckmx.ckph=jxc_ckd.ckph(+) ";
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

<tr bgcolor="#FFFFFF" align='center' >
  <td colspan="<%=groupsl%>">小 计</td>
  <td ><%=cksl%></td>
  <td ><%=ckje%></td>
</tr>
</table>


</body>
</html>




