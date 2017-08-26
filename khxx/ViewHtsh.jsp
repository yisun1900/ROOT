<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String khbh=request.getParameter("khbh");

	String ls_sql=null;


	ls_sql="SELECT dm_shxmbm.shxmmc as dm_shxmbm_shxmmc,dm_shxmdlbm.shxmdlmc as dm_shxmdlbm_shxmdlmc,dm_shxmxlbm.shxmxlmc as dm_shxmxlbm_shxmxlmc,crm_htshmx.bhgsl as crm_htshmx_bhgsl,TO_CHAR(crm_htshmx.kf) as crm_htshmx_kf,crm_htshmx.bhgsl*crm_htshmx.kf zf ";
	ls_sql+=" FROM dm_shxmxlbm,dm_shxmdlbm,dm_shxmbm,crm_htshmx  ";
    ls_sql+=" where dm_shxmbm.shxmxlbm=dm_shxmxlbm.shxmxlbm and dm_shxmbm.shxmdlbm=dm_shxmdlbm.shxmdlbm and  crm_htshmx.shxmbm=dm_shxmbm.shxmbm";
    ls_sql+=" and crm_htshmx.khbh='"+khbh+"'";
    ls_sql+=" order by dm_shxmbm.shxmdlbm,dm_shxmbm.shxmxlbm,crm_htshmx.shxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"dm_shxmdlbm_shxmdlmc","dm_shxmxlbm_shxmxlmc","dm_shxmbm_shxmmc","crm_htshmx_bhgsl","crm_htshmx_kf","zf"};
	pageObj.setDisColName(disColName);
/*
*/

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dm_shxmdlbm_shxmdlmc","1");//列参数对象加入Hash表
	spanColHash.put("dm_shxmxlbm_shxmxlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">合同审核扣分明细（客户编号：<%=khbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="14%">审核项目大类</td>
	<td  width="18%">审核项目小类</td>
	<td  width="42%">不合格项目</td>
	<td  width="10%">不合格数</td>
	<td  width="8%">单项扣分</td>
	<td  width="8%">总分</td>
</tr>
<%
	pageObj.printDateSum();
%> 
</table>

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>