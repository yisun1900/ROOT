<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String wlbm=null;
	String jswlbm=null;
	String glmc=null;
	String cldlbm=null;
	String dqbm=null;

	String qrbz=null;
	qrbz=request.getParameter("qrbz");
	if (qrbz!=null)
	{
		qrbz=cf.GB2Uni(qrbz);
		if (!(qrbz.equals("")))	wheresql+=" and  (bj_jzcljgb.qrbz='"+qrbz+"')";
	}

	wlbm=request.getParameter("wlbm");
	if (wlbm!=null)
	{
		wlbm=cf.GB2Uni(wlbm);
		if (!(wlbm.equals("")))	wheresql+=" and  (bj_jzcljgb.wlbm='"+wlbm+"')";
	}
	jswlbm=request.getParameter("jswlbm");
	if (jswlbm!=null)
	{
		jswlbm=cf.GB2Uni(jswlbm);
		if (!(jswlbm.equals("")))	wheresql+=" and  (bj_jzcljgb.jswlbm='"+jswlbm+"')";
	}
	glmc=request.getParameter("glmc");
	if (glmc!=null)
	{
		glmc=cf.GB2Uni(glmc);
		if (!(glmc.equals("")))	wheresql+=" and  (bj_jzcljgb.glmc like '%"+glmc+"%')";
	}
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (bj_jzcljgb.cldlbm='"+cldlbm+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_jzcljgb.dqbm='"+dqbm+"')";
	}
	ls_sql="SELECT cldlmc,bj_jzcljgb.wlbm,bj_jzcljgb.glmc ,bj_jzcljgb.xhgg,bj_jzcljgb.pp,a.cljldwmc jldwbm,bj_jzcljgb.dj,bj_jzcljgb.jswlbm,bj_jscljgb.glmc jsglmc,b.cljldwmc jsjldwbm,bj_jzcljgb.wljsbz";
	ls_sql+=" FROM bj_jzcljgb,bdm_cldlbm,bdm_cljldwbm a,bdm_cljldwbm b,bj_jscljgb ";
	ls_sql+=" where bj_jzcljgb.cldlbm=bdm_cldlbm.cldlbm(+)";
	ls_sql+=" and bj_jzcljgb.jldwbm=a.cljldwbm(+) and bj_jzcljgb.jsjldwbm=b.cljldwbm(+) and bj_jzcljgb.jswlbm=bj_jscljgb.wlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jzcljgb.dqbm,bj_jzcljgb.cldlbm,bj_jzcljgb.wlbm";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqmc","cldlbm","wlbm","glmc","pp","xhgg","cljldwmc","dj","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

%>
<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">材料类别</td>
	<td  width="7%">物流材料编码</td>
    <td  width="14%">物流材料名称</td>
	<td  width="10%">型号规格</td>
	<td  width="18%">品牌</td>
	<td  width="5%">物流计量单位</td>
	<td  width="5%">单价</td>
	<td  width="5%">结算材料编码</td>
	<td  width="16%">结算物料名称</td>
	<td  width="5%">结算计量单位</td>
	<td  width="5%">物流结算计量单位比</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
</body>
</html>