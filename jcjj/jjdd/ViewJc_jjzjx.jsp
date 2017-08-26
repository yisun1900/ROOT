<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ddbh=request.getParameter("ddbh");

	String ls_sql=null;


	ls_sql="SELECT jc_jjzjx.zjxxh,DECODE(jc_jjzjx.clzt,'00','录入未完成','01','录入完成','02','工厂已确认','04','安装完成','99','退单'),crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,mmzjxyymc,jc_jjzjx.jjzjxje,jc_jjzjx.xcmzjxje,jc_jjzjx.zjxze,jc_jjzjx.qrsj,jc_jjzjx.qrr,jc_jjzjx.srksj,jc_jjzjx.rkr,jc_jjzjx.rksm,jc_jjzjx.jhazsj,jc_jjzjx.azwcsj,jc_jjzjx.lrr,jc_jjzjx.lrsj,dwmc,jc_jjzjx.bz  ";
	ls_sql+=" FROM crm_khxx,jc_jjzjx,sq_dwxx,jdm_mmzjxyybm  ";
    ls_sql+=" where jc_jjzjx.dwbh=sq_dwxx.dwbh and jc_jjzjx.zjxyybm=jdm_mmzjxyybm.mmzjxyybm";
    ls_sql+=" and jc_jjzjx.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_jjzjx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_jjzjx.zjxxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ddbh","zjxxh","jc_jjzjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_zjxm","jc_jjzjx_zjxyybm","jc_jjzjx_jjzjxje","jc_jjzjx_xcmzjxje","jc_jjzjx_wjzjxje","jc_jjzjx_dqzjxje","jc_jjzjx_zjxze","jc_jjzjx_qrsj","jc_jjzjx_qrr","jc_jjzjx_srksj","jc_jjzjx_rkr","jc_jjzjx_rksm","jc_jjzjx_jhazsj","jc_jjzjx_azwcsj","jc_jjzjx_clzt","jc_jjzjx_lrr","jc_jjzjx_lrsj","jc_jjzjx_dwbh","jc_jjzjx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/jjddcl/zjx/ViewJc_jjzjx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">家居增减项（订单编号：<%=ddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">增减项序号</td>
	<td  width="3%">处理状态</td>
	<td  width="2%">客户姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="3%">合同号</td>
	<td  width="5%">增减项原因</td>
	<td  width="4%">家具增减项金额</td>
	<td  width="4%">型材门增减项金额</td>
	<td  width="4%">增减项总额</td>
	<td  width="3%">确认时间</td>
	<td  width="2%">确认录入人</td>
	<td  width="3%">实入库时间</td>
	<td  width="2%">入库录入人</td>
	<td  width="7%">入库说明</td>
	<td  width="3%">计划安装时间</td>
	<td  width="3%">安装完成时间</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="10%">备注</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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