<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;
%>

<body bgcolor="#FFFFFF">

<div align="center">增减项信息(客户编号：<%=khbh%>) </div>
<table width="220%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">增减项序号</td>
	<td  width="3%">审核</td>
	<td  width="2%">状态</td>
	<td  width="4%">类型</td>
	<td  width="4%">增减总额－折前</td>
	<td  width="4%">增减总额－折后</td>
	<td  width="4%">增减工程费－折前</td>
	<td  width="4%">增减工程费－折后</td>
	<td  width="4%">增减管理费－折前</td>
	<td  width="4%">增减管理费－折后</td>
	<td  width="4%">增减税金－折前</td>
	<td  width="4%">增减税金－折后</td>
	<td  width="3%">记入业绩其它费－折前</td>
	<td  width="3%">记入业绩其它费－折后</td>
	<td  width="3%">不记业绩其它费－折前</td>
	<td  width="3%">不记业绩其它费－折后</td>
	<td  width="3%">设计费－折前</td>
	<td  width="3%">设计费－折后</td>
	<td  width="3%">扣管理费</td>
	<td  width="3%">扣其它款</td>
	<td  width="3%">发生阶段</td>
	<td  width="4%">增减项发生时间</td>
	<td  width="3%">录入人</td>
	<td  width="4%">合同号</td>
	<td  width="27%">增减项原因</td>
</tr>

<%

	ls_sql="SELECT  crm_zjxdj.zjxxh,DECODE(crm_zjxdj.shbz,'N','未审核','Y','审核通过','S','审核未通过','M','不需审核'),DECODE(crm_zjxdj.sfwc,'N','未完成','Y','已完成'),DECODE(crm_zjxdj.lx,'1','工程增减项','2','工程增减项无明细','3','套餐退补货','4','套餐调换产品'),crm_zjxdj.zqzjze,crm_zjxdj.zhzjze,crm_zjxdj.zjje,crm_zjxdj.jzjje,crm_zjxdj.zqguanlif,crm_zjxdj.zhguanlif,crm_zjxdj.zqzjxsuijin,crm_zjxdj.zjxsuijin,crm_zjxdj.zqqtsf,crm_zjxdj.zhqtsf,crm_zjxdj.zqwjrqyexm,crm_zjxdj.zhwjrqyexm,crm_zjxdj.zqsjf,crm_zjxdj.zhsjf,crm_zjxdj.kglf,crm_zjxdj.kqtk,zjxfsjdmc,fssj,crm_zjxdj.lrr,hth,crm_zjxdj.zjxyysm ";
	ls_sql+=" FROM crm_zjxdj,crm_khxx,dm_zjxfsjd  ";
    ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_zjxdj.zjxfsjd=dm_zjxfsjd.zjxfsjd(+)";
    ls_sql+=" and crm_zjxdj.khbh='"+khbh+"'";
    ls_sql+=" order by crm_zjxdj.zjxxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/zjx/ViewCrm_zjxdj.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>


</body>
</html>
