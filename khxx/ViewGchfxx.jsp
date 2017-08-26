<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">工程回访记录 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">回访序号</td>
	<td  width="9%">回访类型</td>
	<td  width="9%">回访结果</td>
	<td  width="27%">回访内容</td>
	<td  width="11%">回访时间</td>
	<td  width="6%">回访人</td>
	<td  width="10%">反馈部门</td>
	<td  width="8%">处理状态</td>
	<td  width="22%">相关部门处理情况</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	

	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT crm_hfjl.hfjlh ,dm_hflxbm.hflxmc,jglxmc,DECODE(sjshfnr,null,'',sjshfnr,'设：'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>质：'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>施：'||sgdhfnr)||DECODE(jchfnr,null,'',jchfnr,'<BR>家居：'||jchfnr) as hfnr,crm_hfjl.hfsj,crm_hfjl.hfr,sq_dwxx.dwmc,DECODE(clzt,'0','不需处理','Y','已处理','N','未处理'),xwtclqk";
	ls_sql+=" FROM crm_hfjl,dm_hflxbm,sq_dwxx,crm_gchffkbm,dm_jglxbm   ";
    ls_sql+=" where crm_gchffkbm.dwbh=sq_dwxx.dwbh(+) and crm_hfjl.hflxbm=dm_hflxbm.hflxbm and crm_hfjl.jglxbm=dm_jglxbm.jglxbm(+)";
    ls_sql+=" and crm_hfjl.hfjlh=crm_gchffkbm.hfjlh(+) and crm_hfjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_hfjl.hfjlh";
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.alignStr[3]="align='left'";//设置每页显示记录数
	pageObj.alignStr[8]="align='left'";//设置每页显示记录数
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hfjlh","1");//列参数对象加入Hash表
	spanColHash.put("hflxmc","1");//列参数对象加入Hash表
	spanColHash.put("jglxmc","1");//列参数对象加入Hash表
	spanColHash.put("hfnr","1");//列参数对象加入Hash表
	spanColHash.put("hfsj","1");//列参数对象加入Hash表
	spanColHash.put("hfr","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>
</body>
</html>
