<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bj_gzbjb_dqbm=request.getParameter("bj_gzbjb_dqbm");
	String bjjbbm=request.getParameter("bjjbbm");


	ls_sql="SELECT xmdlmc,xmxlmc,xmbh,xmmc,DECODE(bj_gzbjb.sfbxx,'1','<font color=\"#FF0000\">必选</font>','2','非必选','3','<font color=\"#0000FF\">不可选</font>') sfbxx,jldwmc,smmc,cbenj,sgdbj,bj_gzbjb.bj,DECODE(sfxycl,'1','需要','2','不需要') sfxycl,zcmc,zcgg,zcf,clf,rgf,jjf,glfbl,gycl";
	ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,jdm_jldwbm  ";
    ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
    ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+) and bjlx='1'";
	ls_sql+=" and bj_gzbjb.dqbm='"+bj_gzbjb_dqbm+"' and bj_gzbjb.bjjbbm='"+bjjbbm+"'";
    ls_sql+=" order by bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

	pageObj.alignStr[18]="align='left'";
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">项目大类</td>
	<td  width="6%">项目小类</td>
	<td  width="5%">项目编号</td>
	<td  width="9%">项目名称</td>
	<td  width="3%">是否必选项</td>
	<td  width="3%">计量单位</td>
	<td  width="5%">饰面</td>
	<td  width="4%">成本价</td>
	<td  width="4%">施工队报价</td>
	<td  width="4%">客户报价</td>
	<td  width="3%">是否需要主材</td>
	<td  width="7%">主材名称</td>
	<td  width="7%">主材规格</td>
	<td  width="4%">主材费</td>
	<td  width="4%">辅材费</td>
	<td  width="4%">人工费</td>
	<td  width="4%">机械费</td>
	<td  width="3%">管理费百分比</td>
	<td  width="24%">工艺做法及材料说明</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>