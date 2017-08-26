<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='150132'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[导出－工料分析]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);
	
	String ls_sql=null;
	String wheresql="";
	String glbxh=null;
	String dqbm=null;
	String xmbh=null;
	String xmmc=null;
	String xmdlbm=null;
	String xmxlbm=null;
	String glflbm=null;
	String glfxclmc=null;
	String pp=null;
	String xh=null;
	String jldwbm=null;
	String xhl=null;
	String dj=null;
	String lrr=null;
	String lrsj=null;

	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (bj_jzglfxb.bjbbh='"+bjbbh+"')";
	}
	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_jzglfxb.bjjbbm='"+bjjbbm+"')";
	}

	glbxh=request.getParameter("glbxh");
	if (glbxh!=null)
	{
		glbxh=glbxh.trim();
		if (!(glbxh.equals("")))	wheresql+=" and (bj_jzglfxb.glbxh="+glbxh+") ";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_jzglfxb.dqbm='"+dqbm+"')";
	}
	xmbh=request.getParameter("xmbh");
	if (xmbh!=null)
	{
		xmbh=cf.GB2Uni(xmbh);
		if (!(xmbh.equals("")))	wheresql+=" and  (bj_jzglfxb.xmbh='"+xmbh+"')";
	}
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc='"+xmmc+"')";
	}
	xmdlbm=request.getParameter("xmdlbm");
	if (xmdlbm!=null)
	{
		xmdlbm=cf.GB2Uni(xmdlbm);
		if (!(xmdlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmdlbm='"+xmdlbm+"')";
	}
	xmxlbm=request.getParameter("xmxlbm");
	if (xmxlbm!=null)
	{
		xmxlbm=cf.GB2Uni(xmxlbm);
		if (!(xmxlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmxlbm='"+xmxlbm+"')";
	}

	ls_sql="SELECT bj_jzglfxb.xmbh,xmmc,glflmc,DECODE(bj_jzglfxb.wlllbz,'Y','需要','N','否') wlllbz,TO_CHAR(glfxclbm),glfxclmc,bj_jzglfxb.jqsfl,bj_jzglfxb.bsfl,bj_jzglfxb.tvocsfl,jldwmc,xhl,bj_jzglfxb.dj,bj_jzglfxb.bz";
	ls_sql+=" FROM bj_jzglfxb,bj_jzbjb,jdm_jldwbm,bdm_glflbm  ";
    ls_sql+=" where bj_jzglfxb.bjbbh=bj_jzbjb.bjbbh and bj_jzglfxb.dqbm=bj_jzbjb.dqbm and bj_jzglfxb.xmbh=bj_jzbjb.xmbh and bj_jzglfxb.bjjbbm=bj_jzbjb.bjjbbm";
    ls_sql+=" and bj_jzglfxb.glflbm=bdm_glflbm.glflbm(+)";
    ls_sql+=" and bj_jzglfxb.jldwbm=jdm_jldwbm.jldwbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xmbh,bj_jzglfxb.bjjbbm,bj_jzglfxb.glflbm,bj_jzglfxb.glbxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(20000);//设置每页显示记录数



//	pageObj.alignStr[5]="align='left'";
//	pageObj.alignStr[16]="align='left'";

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="210%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">项目编号</td>
	<td  width="11%">项目名称</td>
	<td  width="3%">工料分类</td>
	<td  width="3%">需到物流领料</td>
	<td  width="5%">材料编码</td>
	<td  width="9%">材料名称</td>
	<td  width="4%">甲醛释放量</td>
	<td  width="4%">苯释放量</td>
	<td  width="4%">TVOC释放量</td>
	<td  width="3%">计量单位</td>
	<td  width="4%">数量</td>
	<td  width="4%">单价</td>
	<td  width="18%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
	</table>

</body>
</html>