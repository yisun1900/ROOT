<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	
	String ls_sql=null;

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT crm_dgqk.khbh as khbh,crm_dgqk.cpbm as cpbm,dm_cpbm.cpmc as dm_cpbm_cpmc,crm_dgqk.sjfy as crm_dgqk_sjfy,crm_dgqk.yazrq as crm_dgqk_yazrq,crm_dgqk.sazrq as crm_dgqk_sazrq,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,sq_dwxx.dwmc as sq_dwxx_dwmc,sq_dwxx.dwdh as sq_dwxx_dwdh, DECODE(crm_dgqk.azbz,'N','未安装','Y','已安装') as crm_dgqk_azbz  ";
	ls_sql+=" FROM crm_dgqk,crm_khxx,dm_cpbm,sq_dwxx  ";
    ls_sql+=" where crm_dgqk.cpbm=dm_cpbm.cpbm and crm_dgqk.khbh=crm_khxx.khbh and crm_dgqk.gys=sq_dwxx.dwbh";
    ls_sql+=" and crm_dgqk.khbh='"+khbh+"'";
    ls_sql+=" order by crm_dgqk.khbh,crm_dgqk.cpbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditCrm_dgqk.jsp?khbh="+khbh);
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","dm_cpbm_cpmc","crm_dgqk_sjfy","crm_dgqk_yazrq","crm_dgqk_sazrq","sq_dwxx_dwmc","sq_dwxx_dwdh","crm_dgqk_azbz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteDgqk.jsp?khbh="+khbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//列参数对象加入Hash表
	spanColHash.put("crm_khxx_khxm","1");//列参数对象加入Hash表
	spanColHash.put("crm_khxx_fwdz","1");//列参数对象加入Hash表
	spanColHash.put("crm_khxx_lxfs","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	<td  width="7%">客户编号</td>
	<td  width="6%">姓名</td>
	<td  width="18%">房屋地址</td>
	<td  width="7%">客户电话</td>
	<td  width="6%">产品</td>
	<td  width="7%">实际费用</td>
	<td  width="9%">应安装日期</td>
	<td  width="9%">实安装日期</td>
	<td  width="9%">供应商</td>
	<td  width="8%">供应商电话</td>
	<td  width="6%">安装</td>
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