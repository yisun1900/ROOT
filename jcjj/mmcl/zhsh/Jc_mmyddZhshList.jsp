<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql="SELECT jc_mmydd.yddbh as yddbh,jc_mmydd.khbh as khbh,khxm, DECODE(jc_mmydd.wjqk,'1','客户自购','2','公司购买') as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.yddze as jc_mmydd_yddze,jc_mmydd.mmzkl mmzkl,jc_mmydd.clgw as jc_mmydd_clgw,clztmc,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz  ";
	ls_sql+=" FROM sq_dwxx,jc_mmydd,crm_khxx,jdm_mmyddzt   ";
    ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
    ls_sql+=" and jc_mmydd.clzt='01'";
    ls_sql+=" order by jc_mmydd.lrsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","ZhshJc_mmydd.jsp");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.setEditStr("审核");
//设置显示列
	String[] disColName={"yddbh","khxm","jc_mmydd_wjqk","jc_mmydd_sqdj","jc_mmydd_yddze","mmzkl","jc_mmydd_clgw","clztmc","jc_mmydd_lrr","jc_mmydd_lrsj","sq_dwxx_dwmc","jc_mmydd_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"yddbh"};
	pageObj.setKey(keyName);

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

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">木门预订单---综合经营部审核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="7%">预订单编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="6%">五金情况</td>
	<td  width="6%">收取定金</td>
	<td  width="8%">预订单总额</td>
	<td  width="5%">木门折扣率</td>
	<td  width="6%">驻店家居顾问</td>
	<td  width="8%">处理状态</td>
	<td  width="5%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="11%">录入部门</td>
	<td  width="19%">备注</td>
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