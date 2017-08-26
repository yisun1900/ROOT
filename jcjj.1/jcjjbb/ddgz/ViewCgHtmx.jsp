<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yhdlm=(String)session.getAttribute("yhdlm");
	String zdyhbz=cf.executeQuery("select zdyhbz from sq_yhxx where yhdlm='"+yhdlm+"'");
	String wheresql="";
	String xmzymc="";
	if (zdyhbz.equals("Y"))
	{
		xmzymc="全部项目专员";
	}
	else 
	{
		xmzymc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"'");
		wheresql+=" and jc_cgdd.xmzy='"+xmzymc+"'";
	}

	String ls_sql=null;


	ls_sql="SELECT jc_cgdd.ddbh as ddbh,jc_cgdd.clgw,jc_cgdd.xmzy,jc_cgdd.khbh as khbh,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.cgsjs as jc_cgdd_cgsjs,jgrq, DECODE(jc_cgdd.clzt,'00','预订单未完成','01','预订单已完成','02','已派单','03','已初测','04','已复测','05','签订合同','06','合同已确认','07','已入库','08','已安装') as jc_cgdd_clzt, DECODE(jc_cgdd.khlx,'1','装修客户','2','橱柜客户') as jc_cgdd_khlx,jc_cgdd.khxm as jc_cgdd_khxm,jc_cgdd.fwdz as jc_cgdd_fwdz,jc_cgdd.hth as jc_cgdd_hth,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
	ls_sql+=" FROM jc_cgdd,sq_dwxx,crm_khxx  ";
    ls_sql+=" where jc_cgdd.dwbh=sq_dwxx.dwbh and jc_cgdd.khbh=crm_khxx.khbh ";
	ls_sql+=" and jgrq-SYSDATE<25";
	ls_sql+=" and jc_cgdd.clzt<'05'";
	ls_sql+=wheresql;
	ls_sql+=" order by jgrq-SYSDATE";
//	out.println(ls_sql);
	
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置显示列
	String[] disColName={"ddbh","jc_cgdd_clzt","jc_cgdd_khxm","jc_cgdd_hth","jgrq","clgw","xmzy","jc_cgdd_dj","jc_cgdd_cgsjs","jc_cgdd_khlx","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jc_cgdd_khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">橱柜签合同延期（项目专员：<%=xmzymc%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">订单编号</td>
	<td  width="10%">处理状态</td>
	<td  width="6%">客户姓名</td>
	<td  width="7%">合同号</td>
	<td  width="8%">合同竣工日期</td>
	<td  width="6%">驻店家居顾问</td>
	<td  width="7%">项目专员</td>
	<td  width="6%">订金</td>
	<td  width="6%">家居设计师</td>
	<td  width="6%">客户类型</td>
	<td  width="19%">录入部门</td>
</tr>
<%
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>