<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String dwbh=request.getParameter("dwbh");
	String hfr=cf.GB2Uni(cf.getParameter(request,"hfr"));
	String hfsj=request.getParameter("hfsj");
	String hfsj2=request.getParameter("hfsj2");
	
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<CENTER >
  <B><font size="3">咨询客户－回访明细（<%=hfr%>）</font></B>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">客户姓名</td>
	<td  width="5%">咨询状态</td>
	<td  width="4%">回访时间</td>
	<td  width="3%">回访人</td>
	<td  width="22%">客户回访情况</td>
	<td  width="5%">回访部门</td>
	<td  width="4%">量房标志</td>
	<td  width="4%">量房时间</td>
	<td  width="4%">出平面图标志</td>
	<td  width="4%">出平面图时间</td>
	<td  width="4%">要求更换店面</td>
	<td  width="4%">要求更换设计师</td>
	<td  width="4%">设计师专业水平</td>
	<td  width="4%">设计师服务</td>
	<td  width="4%">其它人员服务</td>
	<td  width="4%">工程报价</td>
	<td  width="4%">公司总体印象</td>
	<td  width="5%">希望改进方面</td>
</tr>
<%
	ls_sql="SELECT crm_zxkhxx.khxm,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') zxzt,crm_zxhfjl.hfsj,crm_zxhfjl.hfr,crm_zxhfjl.khhfqk,sq_dwxx.dwmc hfbm, DECODE(crm_zxhfjl.lfbz,'N','未量房','Y','已量房'),crm_zxhfjl.lfsj, DECODE(crm_zxhfjl.ctbz,'N','未出图','Y','已出图'),crm_zxhfjl.ctsj, DECODE(crm_zxhfjl.yqghdm,'N','不要求','Y','要求更换'), DECODE(crm_zxhfjl.yqghsjs,'N','不要求','Y','要求更换'),c.hfjgmc sjszysp,d.hfjgmc sjsfw,e.hfjgmc qtryfw,f.hfjgmc gcbj,g.hfjgmc gsztyx,h.hfjgmc xwgjfm";
	ls_sql+=" FROM crm_zxhfjl,crm_zxkhxx,sq_dwxx";
	ls_sql+=" ,dm_hfjgbm c,dm_hfjgbm d,dm_hfjgbm e,dm_hfjgbm f,dm_hfjgbm g,dm_hfjgbm h";
    ls_sql+=" where crm_zxhfjl.hfbm=sq_dwxx.dwbh and crm_zxhfjl.khbh=crm_zxkhxx.khbh ";
	ls_sql+=" and crm_zxhfjl.sjszysp=c.hfjgbm(+) and crm_zxhfjl.sjsfw=d.hfjgbm(+)";
	ls_sql+=" and crm_zxhfjl.qtryfw=e.hfjgbm(+) and crm_zxhfjl.gcbj=f.hfjgbm(+)";
	ls_sql+=" and crm_zxhfjl.gsztyx=g.hfjgbm(+) and crm_zxhfjl.xwgjfm=h.hfjgbm(+)";
	ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"' and crm_zxhfjl.hfr='"+hfr+"'";
	ls_sql+=" and crm_zxhfjl.hfsj>=TO_DATE('"+hfsj+"','YYYY-MM-DD') and crm_zxhfjl.hfsj<=TO_DATE('"+hfsj2+"','YYYY-MM-DD')";
    ls_sql+=" order by crm_zxhfjl.hfsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
   pageObj.setPageRow(500);//设置每页显示记录数


//设置主键
	pageObj.alignStr[4]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.displayFoot();
%>
</body>
</html>
