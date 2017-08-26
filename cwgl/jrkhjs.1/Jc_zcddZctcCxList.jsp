<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");
	String ls_sql=null;

	ls_sql="SELECT jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','代购主材','A','顶配升级','B','顶配独立收费','C','选配主材'),zctcmc,DECODE(jc_zcdd.sfjrht,'Y','计入','N','不计入') sfjrht,ppbm,jc_zcdd.wdzje,jc_zcdd.hkze,jc_zcdd.zqzjhze,jc_zcdd.zjhze ,jc_zcdd.wdzje+jc_zcdd.zqzjhze,jc_zcdd.hkze+jc_zcdd.zjhze,jc_zcdd.qhtsj,jc_zcdd.clgw,jc_zcdd.jssj,jc_zcdd.bz";
	ls_sql+=" FROM jc_zcdd,sq_dwxx a, jdm_zcddzt  ";
	ls_sql+=" where  jc_zcdd.dwbh=a.dwbh(+) ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
 	ls_sql+=" and  (jc_zcdd.khbh='"+khbh+"')";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ls_sql+=" and ddlx in('6','7','8','B','C')";//1：代销品、B:顶配独立收费、C:选配主材；3：补录合同；4：有库存订单；5：套餐分解订单；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：tcmc代购主材
	ls_sql+=" order by jc_zcdd.ddlx,jc_zcdd.ddbh";
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);


//	out.println(ls_sql);

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);



//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
    
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


%>

<html>
<head>
<title>主材套餐</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">主材套餐</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(130);
%>

<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="5%">订单编号</td>
	<td  width="6%">处理状态</td>
	<td  width="6%">订单类型</td>
	<td  width="8%">套餐名称</td>
	<td  width="4%">是否计入合同</td>
	<td  width="6%">子品牌</td>
	<td  width="6%">合同额-折前</td>
	<td  width="6%">合同额-折后</td>
	<td  width="6%">增减项-折前</td>
	<td  width="6%">增减项-折后</td>
	<td  width="6%">全部总额-折前</td>
	<td  width="6%">全部总额-折前</td>
	<td  width="6%">签合同时间</td>
	<td  width="4%">材料顾问</td>
	<td  width="6%">结算时间</td>
	<td  width="56%">备注</td>
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