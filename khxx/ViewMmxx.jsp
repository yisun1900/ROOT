<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">木门预订单 </div>
<table width="130%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">预订单编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="5%">合同号</td>
	<td  width="6%">五金情况</td>
	<td  width="6%">收取定金</td>
	<td  width="6%">预订单总额</td>
	<td  width="7%">正式合同金额</td>
	<td  width="6%">材料顾问</td>
	<td  width="7%">处理状态</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="11%">录入部门</td>
	<td  width="23%">备注</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT jc_mmydd.yddbh as yddbh,khxm,hth, DECODE(jc_mmydd.wjqk,'1','客户自购','2','公司购买') as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.yddze as jc_mmydd_yddze,jc_mmydd.zshtje as jc_mmydd_zshtje,jc_mmydd.clgw as jc_mmydd_clgw, DECODE(jc_mmydd.clzt,'00','录入未完成','01','店面登记','02','综合经营部已审核','03','已确定初测时间','04','已完成初测','05','签订合同','06','已完成复测','07','已入库','08','发安装通知','09','安装通知已确认','10','安装完成','11','取消购买') as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz  ";
	ls_sql+=" FROM sq_dwxx,jc_mmydd,crm_khxx  ";
    ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_mmydd.khbh='"+khbh+"'";
    ls_sql+=" order by jc_mmydd.lrsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"yddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
</body>
</html>
