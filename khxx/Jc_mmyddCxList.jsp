<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String khbh=request.getParameter("khbh");


	ls_sql="SELECT  yddbh,clztmc,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.pdgc,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,c.dwmc,ysgcjdmc,cxhdbm,jc_mmydd.sccsj,jc_mmydd.htrq,jc_mmydd.jhazsj,kazsj,aztzsj,jc_mmydd.azkssj,jc_mmydd.azjssj,jc_mmydd.tdsj,TO_CHAR(jc_mmydd.mmzkl) mmzkl,jc_mmydd.dzyy,jc_mmydd.wdzje,jc_mmydd.htje,jc_mmydd.zqzjhze,jc_mmydd.zjhze,DECODE(jc_mmydd.wjqk,'1','客户自购','2','公司购买') wjqk,DECODE(jc_mmydd.wjsgsbz,'Y','已送公司','N','未送公司') wjsgsbz,jc_mmydd.lrr,jc_mmydd.lrsj,jc_mmydd.khbh ";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_dwxx c,jdm_mmyddzt,dm_gcjdbm  ";
    ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=c.dwbh(+) and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and jc_mmydd.khbh='"+khbh+"'";
    ls_sql+=" order by yddbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"yddbh","khbh","crm_khxx_khxm","crm_khxx_hth","jc_mmydd_wjqk","jc_mmydd_sqdj","jc_mmydd_clgw","jc_mmydd_pdgc","jc_mmydd_htje","jc_mmydd_wjsgsbz","jc_mmydd_clzt","jc_mmydd_lrsj","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
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

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">木门订单明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">预订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">派单工厂</td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="2%">家装设计师</td>
	<td  width="4%">签约店面</td>
	<td  width="2%">工程进度</td>
    <td  width="6%">促销活动</td>
	<td  width="3%">初测日期</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">合同安装日期</td>
	<td  width="3%">协商安装时间</td>
	<td  width="3%">通知安装时间</td>
	<td  width="3%">安装开始日期</td>
	<td  width="3%">安装结束日期</td>
	<td  width="3%">确认退单日期</td>
	<td  width="2%">折扣率</td>
	<td  width="10%">打折原因</td>
	<td  width="3%">折前合同额</td>
	<td  width="3%">合同金额</td>
	<td  width="3%">增减后总额-折前</td>
	<td  width="3%">增减后总额-折后</td>
	<td  width="3%">五金情况</td>
	<td  width="3%">自购五金件送公司</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="2%">客户编号</td>
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