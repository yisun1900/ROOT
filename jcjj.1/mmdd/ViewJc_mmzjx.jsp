<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String yddbh=request.getParameter("yddbh");

	String ls_sql=null;


	ls_sql="SELECT jc_mmzjx.zjxxh,DECODE(jc_mmzjx.clzt,'00','录入未完成','01','录入已完成','02','工厂已确认','03','已入库','04','安装完成','99','取消订单'),crm_khxx.khxm,mmzjxyymc,jc_mmzjx.zjxze,jc_mmzjx.zjxfssj,jc_mmzjx.lrsj,c.dwmc lrbm, jc_mmydd.pdgc,jc_mmydd.pdgcmc, jc_mmydd.ppmc, jc_mmydd.gys ";
	ls_sql+=" FROM crm_khxx,jc_mmzjx,sq_dwxx c,jdm_mmzjxyybm,jc_mmydd  ";
    ls_sql+=" where jc_mmzjx.khbh=crm_khxx.khbh(+) and jc_mmzjx.mmzjxyybm=jdm_mmzjxyybm.mmzjxyybm(+)";
	ls_sql+=" and jc_mmzjx.dwbh=c.dwbh(+)";
    ls_sql+=" and jc_mmzjx.yddbh=jc_mmydd.yddbh ";
    ls_sql+=" and jc_mmzjx.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_mmzjx.zjxxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"yddbh","zjxxh","jc_jjzjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_zjxm","jc_jjzjx_zjxyybm","jc_jjzjx_jjzjxje","jc_jjzjx_xcmzjxje","jc_jjzjx_wjzjxje","jc_jjzjx_dqzjxje","jc_jjzjx_zjxze","jc_jjzjx_qrsj","jc_jjzjx_qrr","jc_jjzjx_srksj","jc_jjzjx_rkr","jc_jjzjx_rksm","jc_jjzjx_jhazsj","jc_jjzjx_azwcsj","jc_jjzjx_clzt","jc_jjzjx_lrr","jc_jjzjx_lrsj","jc_jjzjx_dwbh","jc_jjzjx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/mmcl/mmzjx/ViewJc_mmzjx.jsp?yddbh="+yddbh;//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">家居增减项（订单编号：<%=yddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">增减项序号</td>
	<td  width="7%">处理状态</td>
	<td  width="6%">客户姓名</td>
	<td  width="10%">增减项原因</td>
	<td  width="10%">增减项总额</td>
	<td  width="8%">增减项发生时间</td>
	<td  width="8%">录入时间</td>
	<td  width="12%">录入部门</td>
	<td  width="5%">派单工厂</td>
	<td  width="9%">派单工厂</td>
	<td  width="9%">品牌</td>
	<td  width="11%">供应商</td>
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