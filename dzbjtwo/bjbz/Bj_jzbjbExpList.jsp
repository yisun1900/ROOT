<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='150321'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[导出－报价项目]："+xtrzyhmc+"') ";
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
	String bj_jzbjb_dqbm=request.getParameter("bj_jzbjb_dqbm");
	String bjjbbm=request.getParameter("bjjbbm");
	String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));


	ls_sql="SELECT xmdlmc,xmxlmc,xmflmc,xmbh,bj_jzbjb.xmmc,DECODE(bj_jzbjb.sfbxx,'1','<font color=\"#FF0000\">必报项</font>','2','<font color=\"#CC00CC\">必列项</font>','3','可选项','9','<font color=\"#0000FF\">作废项</font>') sfbxx,smmc,jdm_jldwbm.jldwmc,bj_jzbjb.cbenj,bj_jzbjb.clcb,bj_jzbjb.rgcb,bj_jzbjb.sgcbj,bj_jzbjb.bj,bj_jzbjb.clbj,bj_jzbjb.rgbj,DECODE(bj_jzbjb.sfyxdz,'Y','允许','N','否') sfyxdz,bj_jzbjb.zdzk,gycl,flmcgg,bz,bj_jzbjb.glxmbh,bj_jzbjb.xh,DECODE(bj_jzbjb.sfxycl,'Y','需要','N','否') sfxycl,DECODE(bj_jzbjb.sfxyyjd,'Y','需要','N','否') sfxyyjd";
	ls_sql+=" FROM bj_jzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,jdm_jldwbm,bdm_xmflbm  ";
    ls_sql+=" where bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
    ls_sql+=" and bj_jzbjb.smbm=bdm_smbm.smbm(+) and bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm(+) ";
	ls_sql+=" and bj_jzbjb.xmflbm=bdm_xmflbm.xmflbm(+)"; 	
	ls_sql+=" and bj_jzbjb.dqbm='"+bj_jzbjb_dqbm+"' and bj_jzbjb.bjjbbm='"+bjjbbm+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
    ls_sql+=" order by bj_jzbjb.dqbm,bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xmbh,bj_jzbjb.bjjbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数



%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="310%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">项目大类</td>
	<td  width="4%">项目小类</td>
	<td  width="4%">项目分类</td>
	<td  width="4%">项目编号</td>
	<td  width="9%">项目名称</td>
	<td  width="3%">是否必选项</td>
	<td  width="4%">饰面</td>
	<td  width="2%">计量单位</td>
	<td  width="3%">成本价＝材料成本＋人工成本</td>
	<td  width="3%">材料成本</td>
	<td  width="3%">人工成本</td>
	<td  width="2%">施工队报价</td>
	<td  width="3%">客户报价＝材料报价＋人工报价</td>
	<td  width="3%">材料报价</td>
	<td  width="3%">人工报价</td>
	<td  width="2%">是否允许打折</td>
	<td  width="2%">最低折扣</td>
	<td  width="14%">工艺做法及材料说明</td>
	<td  width="10%">辅料名称规格</td>
	<td  width="6%">备注</td>
	<td  width="5%">关联项目编号</td>
	<td  width="2%">排序序号</td>
	<td  width="2%">是否需要材料</td>
	<td  width="2%">是否需预交底</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>