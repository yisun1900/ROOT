<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String wheresql="";
	String ddbh=request.getParameter("ddbh");


	ls_sql="SELECT jc_cgzjx.ddbh,TO_CHAR(jc_cgzjx.zjxxh) zjxxh,DECODE(jc_cgzjx.clzt,'00','录入未完成','01','录入完成','02','工厂已确认','04','安装完成','99','退单'),crm_khxx.khxm,mmzjxyymc,jc_cgzjx.gtzjxje,jc_cgzjx.tmzjxje,jc_cgzjx.wjzjxje,jc_cgzjx.dqzjxje,jc_cgzjx.zjxze,jc_cgzjx.qrsj,jc_cgzjx.qrr,jc_cgzjx.jhazsj,jc_cgzjx.azwcsj,jc_cgzjx.lrr,jc_cgzjx.lrsj,dwmc,jc_cgzjx.bz  ";
	ls_sql+=" FROM crm_khxx,jc_cgzjx,sq_dwxx,jdm_mmzjxyybm  ";
    ls_sql+=" where jc_cgzjx.khbh=crm_khxx.khbh and jc_cgzjx.dwbh=sq_dwxx.dwbh and jc_cgzjx.cgzjxyybm=jdm_mmzjxyybm.mmzjxyybm";
    ls_sql+=" and jc_cgzjx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_cgzjx.ddbh,jc_cgzjx.zjxxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ddbh","zjxxh","jc_cgzjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_zjxm","jc_cgzjx_cgzjxyybm","jc_cgzjx_gtzjxje","jc_cgzjx_tmzjxje","jc_cgzjx_wjzjxje","jc_cgzjx_dqzjxje","jc_cgzjx_zjxze","jc_cgzjx_qrsj","jc_cgzjx_qrr","jc_cgzjx_srksj","jc_cgzjx_rkr","jc_cgzjx_rksm","jc_cgzjx_jhazsj","jc_cgzjx_azwcsj","jc_cgzjx_clzt","jc_cgzjx_lrr","jc_cgzjx_lrsj","jc_cgzjx_dwbh","jc_cgzjx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ddbh","zjxxh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ddbh","zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgcl/zjx/ViewJc_cgzjx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">订单编号</td>
	<td  width="3%">增减项序号</td>
	<td  width="5%">处理状态</td>
	<td  width="4%">客户姓名</td>
	<td  width="9%">增减项原因</td>
	<td  width="6%">柜体增减项金额</td>
	<td  width="6%">台面增减项金额</td>
	<td  width="6%">五金增减项金额</td>
	<td  width="6%">电器增减项金额</td>
	<td  width="6%">增减项总额</td>
	<td  width="5%">确认时间</td>
	<td  width="4%">确认录入人</td>
	<td  width="5%">计划安装时间</td>
	<td  width="5%">安装完成时间</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="7%">录入部门</td>
	<td  width="10%">备注</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>