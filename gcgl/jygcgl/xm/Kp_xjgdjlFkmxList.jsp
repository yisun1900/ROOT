<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String gdm_gdjcjl_jcjlh=null;
	String gdm_gdjcjl_khbh=null;
	String gdm_gdjcjl_xjr=null;
	String gdm_gdjcjl_xjsj=null;
	String jclxbm=null;
	String gdm_gdjcjl_lrr=null;
	String gdm_gdjcjl_lrsj=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;


	String jcjgbm=null;
	jcjgbm=request.getParameter("jcjgbm");
	if (jcjgbm!=null)
	{
		if (!(jcjgbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcjgbm='"+jcjgbm+"')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String lrdw=null;
	lrdw=request.getParameter("lrdw");
	if (lrdw!=null)
	{
		if (!(lrdw.equals("")))	wheresql+=" and  (gdm_gdjcjl.lrdw='"+lrdw+"')";
	}


	String cfspbz=null;
	cfspbz=request.getParameter("cfspbz");
	if (cfspbz!=null)
	{
		if (!(cfspbz.equals("")))	wheresql+=" and  (gdm_gdjcjl.cfspbz='"+cfspbz+"')";
	}
	String kpbz=null;
	kpbz=request.getParameter("kpbz");
	if (kpbz!=null)
	{
		if (!(kpbz.equals("")))	wheresql+=" and  (gdm_gdjcjl.kpbz='"+kpbz+"')";
	}
	String kpjlh=null;
	kpjlh=request.getParameter("kpjlh");
	if (kpjlh!=null)
	{
		if (!(kpjlh.equals("")))	wheresql+=" and  (gdm_gdjcjl.kpjlh='"+kpjlh+"')";
	}
	String jsbz=null;
	jsbz=request.getParameter("jsbz");
	if (jsbz!=null)
	{
		if (!(jsbz.equals("")))	wheresql+=" and  (gdm_gdjcjl.jsbz='"+jsbz+"')";
	}
	String jsjlh=null;
	jsjlh=request.getParameter("jsjlh");
	if (jsjlh!=null)
	{
		if (!(jsjlh.equals("")))	wheresql+=" and  (gdm_gdjcjl.jsjlh='"+jsjlh+"')";
	}

	gdm_gdjcjl_jcjlh=request.getParameter("gdm_gdjcjl_jcjlh");
	if (gdm_gdjcjl_jcjlh!=null)
	{
		gdm_gdjcjl_jcjlh=cf.GB2Uni(gdm_gdjcjl_jcjlh);
		if (!(gdm_gdjcjl_jcjlh.equals("")))	wheresql+=" and  (gdm_gdjcjl.jcjlh='"+gdm_gdjcjl_jcjlh+"')";
	}
	gdm_gdjcjl_khbh=request.getParameter("gdm_gdjcjl_khbh");
	if (gdm_gdjcjl_khbh!=null)
	{
		gdm_gdjcjl_khbh=cf.GB2Uni(gdm_gdjcjl_khbh);
		if (!(gdm_gdjcjl_khbh.equals("")))	wheresql+=" and  (gdm_gdjcjl.khbh='"+gdm_gdjcjl_khbh+"')";
	}
	gdm_gdjcjl_xjr=request.getParameter("gdm_gdjcjl_xjr");
	if (gdm_gdjcjl_xjr!=null)
	{
		gdm_gdjcjl_xjr=cf.GB2Uni(gdm_gdjcjl_xjr);
		if (!(gdm_gdjcjl_xjr.equals("")))	wheresql+=" and  (gdm_gdjcjl.xjr='"+gdm_gdjcjl_xjr+"')";
	}
	gdm_gdjcjl_xjsj=request.getParameter("gdm_gdjcjl_xjsj");
	if (gdm_gdjcjl_xjsj!=null)
	{
		gdm_gdjcjl_xjsj=gdm_gdjcjl_xjsj.trim();
		if (!(gdm_gdjcjl_xjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.xjsj>=TO_DATE('"+gdm_gdjcjl_xjsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_xjsj=request.getParameter("gdm_gdjcjl_xjsj2");
	if (gdm_gdjcjl_xjsj!=null)
	{
		gdm_gdjcjl_xjsj=gdm_gdjcjl_xjsj.trim();
		if (!(gdm_gdjcjl_xjsj.equals("")))	wheresql+="  and (gdm_gdjcjl.xjsj<=TO_DATE('"+gdm_gdjcjl_xjsj+"','YYYY/MM/DD'))";
	}
	jclxbm=request.getParameter("jclxbm");
	if (jclxbm!=null)
	{
		jclxbm=cf.GB2Uni(jclxbm);
		if (!(jclxbm.equals("")))	wheresql+=" and  (gdm_gdjcjl.jclxbm='"+jclxbm+"')";
	}
	gdm_gdjcjl_lrr=request.getParameter("gdm_gdjcjl_lrr");
	if (gdm_gdjcjl_lrr!=null)
	{
		gdm_gdjcjl_lrr=cf.GB2Uni(gdm_gdjcjl_lrr);
		if (!(gdm_gdjcjl_lrr.equals("")))	wheresql+=" and  (gdm_gdjcjl.lrr='"+gdm_gdjcjl_lrr+"')";
	}
	gdm_gdjcjl_lrsj=request.getParameter("gdm_gdjcjl_lrsj");
	if (gdm_gdjcjl_lrsj!=null)
	{
		gdm_gdjcjl_lrsj=gdm_gdjcjl_lrsj.trim();
		if (!(gdm_gdjcjl_lrsj.equals("")))	wheresql+="  and (gdm_gdjcjl.lrsj>=TO_DATE('"+gdm_gdjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	gdm_gdjcjl_lrsj=request.getParameter("gdm_gdjcjl_lrsj2");
	if (gdm_gdjcjl_lrsj!=null)
	{
		gdm_gdjcjl_lrsj=gdm_gdjcjl_lrsj.trim();
		if (!(gdm_gdjcjl_lrsj.equals("")))	wheresql+="  and (gdm_gdjcjl.lrsj<=TO_DATE('"+gdm_gdjcjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (gdm_gdjcjl.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");
	
	ls_sql="SELECT crm_khxx.khxm,sgdmc,crm_khxx.fwdz,gdm_gdjcjl.xjsj,gdm_gdjcjl.xjr,gdm_gdjcjl.kfzs,gdm_gdjcjl.fkze,gdm_gdjcjl.kcjdebl,gdm_gdjcjl.bz,kpxmmc,gdm_jcjlmx.bz fksm ";
	ls_sql+=" FROM gdm_gdjcjl,crm_khxx,sq_sgd,gdm_jcjlmx,gdm_gcxm  ";
    ls_sql+=" where gdm_gdjcjl.jcjlh=gdm_jcjlmx.jcjlh(+) and gdm_jcjlmx.xmbm=gdm_gcxm.xmbm(+) and gdm_jcjlmx.kpjg=gdm_gcxm.kpjg(+)";
    ls_sql+=" and gdm_gdjcjl.khbh=crm_khxx.khbh and gdm_gdjcjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_gdjcjl.xjsj desc,gdm_gdjcjl.jcjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Gdm_gdjcjlFkmxList.jsp","SelectCxAllGdm_gdjcjl.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"jcjlh","gdm_gdjcjl_khbh","gdm_gdjcjl_xjr","gdm_gdjcjl_xjsj","jclxbm","dm_jcjgbm_xjjgmc","gdm_gdjcjl_lrr","gdm_gdjcjl_lrsj","gdm_gdjcjl_bz","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("sgdmc","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("xjsj","1");//列参数对象加入Hash表
	spanColHash.put("xjr","1");//列参数对象加入Hash表
	spanColHash.put("kfzs","1");//列参数对象加入Hash表
	spanColHash.put("fkze","1");//列参数对象加入Hash表
	spanColHash.put("kcjdebl","1");//列参数对象加入Hash表
	spanColHash.put("bz","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.alignStr[8]="align='left'";
	pageObj.alignStr[9]="align='left'";
	pageObj.alignStr[10]="align='left'";

}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队检查记录--查询全部</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">客户姓名</td>
	<td  width="4%">施工队</td>
	<td  width="14%">房屋地址</td>
	<td  width="5%">处罚日期</td>
	<td  width="4%">处罚人</td>
	<td  width="5%">扣分</td>
	<td  width="5%">罚款总额</td>
	<td  width="5%">扣除接单额百分比</td>
	<td  width="20%">备注说明</td>
	<td  width="12%">检查项目</td>
	<td  width="22%">具体原因</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>