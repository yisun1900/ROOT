<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");

	ls_sql="SELECT jc_zczjx.zjxbh,DECODE(jc_zczjx.clzt,'00','录入未完成','01','录入已完成','02','已确认','04','厂家已接收','03','已送货','99','退单'),crm_khxx.khxm,crm_khxx.fwdz,jc_zczjx.ppbm,jc_zczjx.zqzjxze,jc_zczjx.zjxze,TO_CHAR(jc_zczjx.zjxzkl) zjxzkl,jc_zczjx.zjxcxhdje,jc_zczjx.dzyy,jc_zczjx.ddbh,jc_zczjx.zcxlbm,jc_zczjx.clgw,jc_zczjx.ztjjgw,jc_zczjx.xmzy,jc_zczjx.zjxfssj,zczjxyymc,jc_zczjx.lrsj,dwmc lrbm,crm_khxx.hth,crm_khxx.khbh,jc_zczjx.ppmc,jc_zczjx.gys,jc_zczjx.bz";
	ls_sql+=" FROM crm_khxx,jc_zczjx,sq_dwxx,jdm_zczjxyybm";
    ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh and jc_zczjx.dwbh=sq_dwxx.dwbh and jc_zczjx.zczjxyybm=jdm_zczjxyybm.zczjxyybm(+)";
    ls_sql+=" and jc_zczjx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_zczjx.lrsj desc,jc_zczjx.zjxbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ddbh","zjxbh","jc_zczjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","jc_zczjx_zjxbz","jc_zczjx_zjxze","jc_zczjx_clzt","jc_zczjx_lrsj","jc_zczjx_dwbh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zjxbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"zjxbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zccl/zjx/ViewJc_zczjx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表



%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">增减项记录（订单编号：<%=ddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">增减项序号</td>
	<td  width="3%">处理状态</td>
	<td  width="3%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="5%">子品牌</td>
	<td  width="3%">折前增减项总额</td>
	<td  width="3%">折后增减项总额</td>
	<td  width="2%">增减项折扣</td>
	<td  width="3%">增减项计入活动金额</td>
	<td  width="10%">打折原因</td>
	<td  width="3%">订单编号</td>
	<td  width="5%">主材小类</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">项目专员</td>
	<td  width="3%">增减项发生时间</td>
	<td  width="4%">增减项原因</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户编号</td>
	<td  width="4%">品牌</td>
	<td  width="8%">供应商</td>
	<td  width="13%">备注</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>