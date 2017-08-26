<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String ls_sql=null;
String xmbm=cf.GB2Uni(request.getParameter("xmbm"));

	
	ls_sql="SELECT gdm_gcxmcfbz.xmbm,gdm_gcxmcfbz.wgjbbm,gdm_wgjbbm.wgjbmc,gdm_gcxmcfbz.xzzwbm,gdm_gcxmcfbz.zgyq,gdm_gcxmcfbz.sgdkf,gdm_gcxmcfbz.sgdfkje,gdm_gcxmcfbz.ygkf,gdm_gcxmcfbz.ygfkje,gdm_gcxmcfbz.bz  ";
	ls_sql+=" FROM gdm_wgjbbm,gdm_gcxmcfbz  ";
    ls_sql+=" where gdm_gcxmcfbz.wgjbbm=gdm_wgjbbm.wgjbbm(+)";
    ls_sql+=" and gdm_gcxmcfbz.xmbm='"+xmbm+"'";
    ls_sql+=" order by gdm_gcxmcfbz.wgjbbm,gdm_gcxmcfbz.xzzwbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditGdm_gcxmcfbz.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xmbm","wgjbbm","gdm_wgjbbm_wgjbmc","xzzwbm","gdm_gcxmcfbz_zgyq","gdm_gcxmcfbz_sgdkf","gdm_gcxmcfbz_sgdfkje","gdm_gcxmcfbz_ygkf","gdm_gcxmcfbz_ygfkje","gdm_gcxmcfbz_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xmbm","wgjbbm","xzzwbm"};
	pageObj.setKey(keyName);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">项目编码</td>
	<td  width="8%">违规级别</td>
	<td  width="8%">违规级别名称</td>
	<td  width="11%">处罚人员职务</td>
	<td  width="11%">整改要求</td>
	<td  width="8%">施工队扣分</td>
	<td  width="8%">施工队罚款金额</td>
	<td  width="8%">员工扣分</td>
	<td  width="8%">员工罚款金额</td>
	<td  width="88%">备注</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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