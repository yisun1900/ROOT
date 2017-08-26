<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

	ls_sql="SELECT '',cw_khfkjl.fkxh,cw_khfkjl.fkje,cw_khfkjl.sksj,cw_khfkjl.sjsj,cw_khfkjl.ddbh,cw_khfkjl.zjxbh,clztmc,DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','集成','A','顶配升级','B','顶配独立收费','C','选配','D','套餐外主材','E','散客'),ppbm,jc_zcdd.wdzje,jc_zcdd.hkze,cw_khfkjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,jc_zcdd.clgw,dwmc dm,gys,jc_zcdd.qhtsj,jc_zcdd.ddqrsj,jc_zcdd.tdsj";
	ls_sql+=" FROM cw_khfkjl,crm_khxx,jc_zcdd,sq_dwxx,jdm_zcddzt ";
	ls_sql+=" where cw_khfkjl.ddbh=jc_zcdd.ddbh(+) ";
	ls_sql+=" and cw_khfkjl.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";

	ls_sql+=" and cw_khfkjl.scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('23')";//23:主材
	ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
	ls_sql+=" and cw_khfkjl.dwbh='"+dwbh+"'";

	ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" order by jc_zcdd.ddlx,jc_zcdd.ddqrsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"zjxbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zccl/zjx/ViewJc_zczjx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey3={"fkxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey3;//设置列参数：coluParm.key的主键
	coluParm.link="/cwgl/qyecx/ViewCw_khfkjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("fkxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">店面主材实收款（<%=dwmc%>）
  <BR>(实收款时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="2%">&nbsp;</td>
   	<td  width="4%">收款序号</td>
	<td  width="5%" bgcolor="#99FFFF"><strong>收款额</strong></td>
	<td  width="4%">收款时间</td>
	<td  width="4%">审核时间</td>
   	<td  width="4%">订单编号</td>
   	<td  width="4%">增减项编号</td>
	<td  width="4%">处理状态</td>
	<td  width="4%">订单类型</td>
	<td  width="5%">子品牌</td>

	<td  width="5%" bgcolor="#99FFFF"><strong>合同额-折前</strong></td>
	<td  width="5%" bgcolor="#99FFFF"><strong><font color="#0000CC">合同额-折后</font></strong></td>

	<td  width="3%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="3%">家装设计师</td>
	<td  width="3%">家居顾问</td>
	<td  width="6%">签约店面</td>


	<td  width="9%">供应商</td>
	<td  width="4%">签合同时间</td>
	<td  width="4%">订单确认时间</td>
	<td  width="4%">退单时间</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>