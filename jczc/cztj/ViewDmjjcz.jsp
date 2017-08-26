<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";

	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

%>

<CENTER >
  <B><font size="3">店面签约明细（<%=dwmc%>）
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
签单明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">订单编号</td>
	<td  width="8%">订单状态</td>
	<td  width="7%">驻店家居顾问</td>
	<td  width="7%">展厅家居顾问</td>
	<td  width="7%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="7%">客户编号</td>
	<td  width="8%">合同号</td>
	<td  width="8%">姓名</td>
	<td  width="10%">合同金额</td>
	<td  width="8%">合同日期</td>
</tr>


<%
	ls_sql="SELECT '木门' lx,jc_mmydd.yddbh,clztmc,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.xmzy,jc_mmydd.pdgcmc,jc_mmydd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_mmydd.htje,jc_mmydd.htrq";
	ls_sql+=" FROM crm_khxx,jc_mmydd,jdm_mmyddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='98'";//04：签订合同
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" order by jc_mmydd.htrq";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey11={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey11;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey12={"yddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey12;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>
退单明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">订单编号</td>
	<td  width="8%">订单状态</td>
	<td  width="7%">驻店家居顾问</td>
	<td  width="7%">展厅家居顾问</td>
	<td  width="7%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="7%">客户编号</td>
	<td  width="8%">合同号</td>
	<td  width="8%">姓名</td>
	<td  width="10%">合同金额</td>
	<td  width="8%">合同日期</td>
</tr>


<%
	ls_sql="SELECT '木门' lx,jc_mmydd.yddbh,clztmc,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.xmzy,jc_mmydd.pdgcmc,jc_mmydd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_mmydd.zjhze,jc_mmydd.htrq";
	ls_sql+=" FROM crm_khxx,jc_mmydd,jdm_mmyddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt='99' ";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" order by jc_mmydd.htrq";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey13={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey13;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey14={"yddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey14;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

增减项明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">增减项序号</td>
	<td  width="8%">订单状态</td>
	<td  width="7%">驻店家居顾问</td>
	<td  width="7%">展厅家居顾问</td>
	<td  width="7%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="7%">客户编号</td>
	<td  width="8%">合同号</td>
	<td  width="8%">姓名</td>
	<td  width="10%">增减项金额</td>
	<td  width="8%">增减项时间</td>
</tr>


<%
	ls_sql="SELECT '木门' lx,jc_mmzjx.zjxxh,clztmc,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.xmzy,jc_mmydd.pdgcmc,jc_mmydd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_mmzjx.zjxze,jc_mmzjx.zjxfssj";
	ls_sql+=" FROM crm_khxx,jc_mmydd,jc_mmzjx,jdm_mmyddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_mmydd.khbh and jc_mmydd.yddbh=jc_mmzjx.yddbh and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and jc_mmzjx.clzt not in('00')";
	ls_sql+=" and jc_mmzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" order by jc_mmydd.htrq";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey15={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey15;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey16={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey16;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/mmcl/mmzjx/ViewJc_mmzjx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>



<P>
签单明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">订单编号</td>
	<td  width="8%">订单状态</td>
	<td  width="7%">驻店家居顾问</td>
	<td  width="7%">展厅家居顾问</td>
	<td  width="7%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="7%">客户编号</td>
	<td  width="8%">合同号</td>
	<td  width="8%">姓名</td>
	<td  width="10%">合同金额</td>
	<td  width="8%">合同日期</td>
</tr>


<%
	ls_sql="SELECT '橱柜' lx,jc_cgdd.ddbh,clztmc,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.pdgcmc,jc_cgdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_cgdd.htze,jc_cgdd.qhtsj";
	ls_sql+=" FROM crm_khxx,jc_cgdd,jdm_cgddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='98'";//13：签订合同
	ls_sql+=" and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
	ls_sql+=" order by jc_cgdd.qhtsj";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey21={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey21;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey22={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey22;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>
退单明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">订单编号</td>
	<td  width="8%">订单状态</td>
	<td  width="7%">驻店家居顾问</td>
	<td  width="7%">展厅家居顾问</td>
	<td  width="7%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="7%">客户编号</td>
	<td  width="8%">合同号</td>
	<td  width="8%">姓名</td>
	<td  width="10%">合同金额</td>
	<td  width="8%">合同日期</td>
</tr>


<%
	ls_sql="SELECT '橱柜' lx,jc_cgdd.ddbh,clztmc,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.pdgcmc,jc_cgdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_cgdd.zjhze,jc_cgdd.qhtsj";
	ls_sql+=" FROM crm_khxx,jc_cgdd,jdm_cgddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_cgdd.clzt='99' ";
	ls_sql+=" and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
	ls_sql+=" order by jc_cgdd.qhtsj";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey23={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey23;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey24={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey24;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

增减项明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">增减项序号</td>
	<td  width="8%">订单状态</td>
	<td  width="7%">驻店家居顾问</td>
	<td  width="7%">展厅家居顾问</td>
	<td  width="7%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="7%">客户编号</td>
	<td  width="8%">合同号</td>
	<td  width="8%">姓名</td>
	<td  width="10%">增减项金额</td>
	<td  width="8%">增减项时间</td>
</tr>


<%
	ls_sql="SELECT '橱柜' lx,jc_cgzjx.zjxxh,clztmc,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.pdgcmc,jc_cgdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_cgzjx.zjxze,jc_cgzjx.zjxfssj";
	ls_sql+=" FROM crm_khxx,jc_cgdd,jc_cgzjx,jdm_cgddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_cgdd.khbh and jc_cgdd.ddbh=jc_cgzjx.ddbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_cgzjx.clzt not in('00')";
			ls_sql+=" and jc_cgzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_cgzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
	ls_sql+=" order by jc_cgdd.qhtsj";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey25={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey25;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey26={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey26;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgcl/zjx/ViewJc_cgzjx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>





<P>
签单明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">订单编号</td>
	<td  width="8%">订单状态</td>
	<td  width="7%">驻店家居顾问</td>
	<td  width="7%">展厅家居顾问</td>
	<td  width="7%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="7%">客户编号</td>
	<td  width="8%">合同号</td>
	<td  width="8%">姓名</td>
	<td  width="10%">合同金额</td>
	<td  width="8%">合同日期</td>
</tr>


<%
	ls_sql="SELECT '家具' lx,jc_jjdd.ddbh,clztmc,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.pdgcmc,jc_jjdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_jjdd.htze,jc_jjdd.qhtsj";
	ls_sql+=" FROM crm_khxx,jc_jjdd,jdm_jjddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='98'";//13：签订合同
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
	ls_sql+=" order by jc_jjdd.qhtsj";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey31={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey31;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey32={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey32;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>
退单明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">订单编号</td>
	<td  width="8%">订单状态</td>
	<td  width="7%">驻店家居顾问</td>
	<td  width="7%">展厅家居顾问</td>
	<td  width="7%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="7%">客户编号</td>
	<td  width="8%">合同号</td>
	<td  width="8%">姓名</td>
	<td  width="10%">合同金额</td>
	<td  width="8%">合同日期</td>
</tr>


<%
	ls_sql="SELECT '家具' lx,jc_jjdd.ddbh,clztmc,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.pdgcmc,jc_jjdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_jjdd.zjhze,jc_jjdd.qhtsj";
	ls_sql+=" FROM crm_khxx,jc_jjdd,jdm_jjddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_jjdd.clzt='99'";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
	ls_sql+=" order by jc_jjdd.qhtsj";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey33={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey33;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey34={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey34;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

增减项明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">增减项序号</td>
	<td  width="8%">订单状态</td>
	<td  width="7%">驻店家居顾问</td>
	<td  width="7%">展厅家居顾问</td>
	<td  width="7%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="7%">客户编号</td>
	<td  width="8%">合同号</td>
	<td  width="8%">姓名</td>
	<td  width="10%">增减项金额</td>
	<td  width="8%">增减项时间</td>
</tr>


<%
	ls_sql="SELECT '家具' lx,jc_jjzjx.zjxxh,clztmc,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.pdgcmc,jc_jjdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_jjzjx.zjxze,jc_jjzjx.zjxfssj";
	ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjzjx,jdm_jjddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_jjdd.khbh and jc_jjdd.ddbh=jc_jjzjx.ddbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_jjzjx.clzt not in('00')";
			ls_sql+=" and jc_jjzjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_jjzjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
	ls_sql+=" order by jc_jjdd.qhtsj";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey35={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey35;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey36={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey36;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/jjddcl/zjx/ViewJc_jjzjx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>







<P>
签单明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">订单编号</td>
	<td  width="8%">订单状态</td>
	<td  width="9%">小类</td>
	<td  width="6%">驻店家居顾问</td>
	<td  width="6%">展厅家居顾问</td>
	<td  width="6%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="6%">客户编号</td>
	<td  width="7%">合同号</td>
	<td  width="6%">姓名</td>
	<td  width="8%">合同金额</td>
	<td  width="8%">合同日期</td>
</tr>


<%
	ls_sql="SELECT '主材' lx,jc_zcdd.ddbh,clztmc,jc_zcdd.zcxlbm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.ppbm,jc_zcdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_zcdd.hkze,jc_zcdd.qhtsj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='98'";//09：合同已完成
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	ls_sql+=" order by jc_zcdd.qhtsj";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey41={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey41;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey42={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey42;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>
退单明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">订单编号</td>
	<td  width="8%">订单状态</td>
	<td  width="9%">小类</td>
	<td  width="6%">驻店家居顾问</td>
	<td  width="6%">展厅家居顾问</td>
	<td  width="6%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="6%">客户编号</td>
	<td  width="7%">合同号</td>
	<td  width="6%">姓名</td>
	<td  width="8%">合同金额</td>
	<td  width="8%">合同日期</td>
</tr>


<%
	ls_sql="SELECT '主材' lx,jc_zcdd.ddbh,clztmc,jc_zcdd.zcxlbm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.ppbm,jc_zcdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_zcdd.hkze+zjhze,jc_zcdd.tdsj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and jc_zcdd.clzt='99'";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	ls_sql+=" order by jc_zcdd.tdsj";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey43={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey43;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey44={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey44;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

增减项明细
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">类型</td>
	<td  width="8%">增减项序号</td>
	<td  width="8%">订单状态</td>
	<td  width="9%">小类</td>
	<td  width="6%">驻店家居顾问</td>
	<td  width="6%">展厅家居顾问</td>
	<td  width="6%">项目专员</td>
	<td  width="16%">工厂</td>
	<td  width="6%">客户编号</td>
	<td  width="7%">合同号</td>
	<td  width="6%">姓名</td>
	<td  width="8%">增减项总额</td>
	<td  width="8%">增减项发生时间</td>
</tr>


<%
	ls_sql="SELECT '主材' lx,jc_zczjx.zjxbh,clztmc,jc_zcdd.zcxlbm,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.ppbm,jc_zcdd.khbh,crm_khxx.hth,crm_khxx.khxm,jc_zczjx.zjxze,jc_zczjx.zjxfssj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jc_zczjx,jdm_zcddzt";
	ls_sql+=" where  crm_khxx.khbh=jc_zcdd.khbh and jc_zcdd.ddbh=jc_zczjx.ddbh and crm_khxx.dwbh='"+dwbh+"'";
			ls_sql+=" and jc_zczjx.clzt not in('00')";
			ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	ls_sql+=" order by jc_zcdd.qhtsj";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey45={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey45;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey46={"zjxbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey46;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zccl/zjx/ViewJc_zczjx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>


</body>
</html>