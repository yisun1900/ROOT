<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>公司大中小单统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%">单额分类</td>
  <td  width="10%">签约数</td>
  <td  width="14%">工程签约额</td>
  <td  width="10%">平均单额</td>
  <td  width="10%">平米均价</td>
  <td  width="35%">签约数百分比 </td>
</tr>
<%
	String max=null;
	String all=null;
	int[] mark={3,2,2,4,4,4};//设置显示风格参数
	//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示
		

	//获取总数
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where ";
	ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}

	all=cf.executeQuery(ls_sql);
	
	//获取最大
	ls_sql="SELECT max(count(*))";
	ls_sql+=" FROM crm_khxx,kp_deflbm";
	ls_sql+=" where crm_khxx.qye>=kp_deflbm.dedy and crm_khxx.qye<kp_deflbm.dexy";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by deflbm,deflmc";

	max=cf.executeQuery(ls_sql);

	ls_sql="SELECT deflmc,count(*),sum(qye),ROUND(sum(qye)/count(*)),ROUND(sum(qye)/sum(fwmj)),'<img src=\"/images/ColuGif.gif\" width='||count(*)*150/"+max+"||' height=14>'||ROUND(count(*)/"+all+"*100,1)||'%' ";
	ls_sql+=" FROM crm_khxx,kp_deflbm";
	ls_sql+=" where crm_khxx.qye>=kp_deflbm.dedy and crm_khxx.qye<kp_deflbm.dexy";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by deflbm,deflmc";
	ls_sql+=" order by deflbm";
//	out.println(ls_sql);


	so.addData(ls_sql);


	//输出数据
	so.outData(out,mark);

%>
</table>
<P>
<CENTER >
    <B>城区大中小单统计<BR>
    (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
  </CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="10%">单额分类</td>
  <td  width="10%">城区</td>
  <td  width="10%">签约数</td>
  <td  width="14%">工程签约额</td>
  <td  width="10%">工程平均单额</td>
  <td  width="25%">签约数百分比 </td>
</tr>
<%
	int[] mark1={3,1,2,2,4,4};//设置显示风格参数
	//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示
		

	so.clearData();

	//获取总数
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where ";
	ls_sql+="  qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}

	all=cf.executeQuery(ls_sql);
	
	//获取最大
	ls_sql="SELECT max(count(*))";
	ls_sql+=" FROM crm_khxx,kp_deflbm,dm_cqbm";
	ls_sql+=" where crm_khxx.qye>=kp_deflbm.dedy and crm_khxx.qye<kp_deflbm.dexy";
	ls_sql+=" and crm_khxx.cqbm=dm_cqbm.cqbm";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by deflbm,deflmc,crm_khxx.cqbm,cqmc";

	max=cf.executeQuery(ls_sql);

	ls_sql="SELECT deflmc,cqmc,count(*),sum(qye),ROUND(sum(qye)/count(*)),'<img src=\"/images/ColuGif.gif\" width='||count(*)*150/"+max+"||' height=14>'||ROUND(count(*)/"+all+"*100,1)||'%' ";
	ls_sql+=" FROM crm_khxx,kp_deflbm,dm_cqbm";
	ls_sql+=" where crm_khxx.qye>=kp_deflbm.dedy and crm_khxx.qye<kp_deflbm.dexy";
	ls_sql+=" and crm_khxx.cqbm=dm_cqbm.cqbm";
	ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" group by deflbm,deflmc,crm_khxx.cqbm,cqmc";
	ls_sql+=" order by deflbm,count(*) desc";
//	out.println(ls_sql);


	so.addData(ls_sql);


	//输出数据
	so.outData(out,mark1);

%>
</table>

</body>
</html>