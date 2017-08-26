<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String wheresql="";

	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">设计师（<%=sjs%>）(统计时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>

1、工程签约明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">设计师</td>
	<td  width="4%">合同号</td>
	<td  width="3%">姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="3%">家装标志</td>
	<td  width="5%">促销活动</td>
	<td  width="5%">工程原报价</td>
	<td  width="3%">折扣率</td>
	<td  width="5%">工程签约额</td>
	<td  width="5%">增减项</td>
	<td  width="5%">增减后总额 </td>
	<td  width="4%">设计费</td>
	<td  width="2%">是否返卷</td>
	<td  width="4%">返卷总金额</td>
	<td  width="4%">公司承担返卷额</td>
	<td  width="6%">签约店面</td>
	<td  width="4%">录入时间</td>
	<td  width="5%">签约日期</td>
	<td  width="2%">当月录入</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检员</td>
</tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,DECODE(crm_khxx.sffj,'Y','返卷','N','否'),crm_khxx.fjje,crm_khxx.gsfje,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>'),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.sjs='"+sjs+"' and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by lrsj";

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("fwdz",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>

<P>
2、木门签单明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">预订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="4%">派单工厂</td>
	<td  width="4%"><font color="#0000CC">合同金额</font></td>
	<td  width="4%">增减后总额</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="3%"><font color="#0000CC">签约日期</font></td>
	<td  width="3%">确认退单日期</td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="2%">家装设计师</td>
	<td  width="8%">房屋地址</td>
    <td  width="4%">促销活动</td>
	<td  width="3%">合同安装日期</td>
	<td  width="3%">安装结束日期</td>
	<td  width="3%">录入时间</td>
</tr>
<%
	ls_sql =" SELECT yddbh,clztmc,gysmc pdgc,jc_mmydd.htje,jc_mmydd.zjhze,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.htrq,jc_mmydd.tdsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.sjs,crm_khxx.fwdz,cxhdbm,jc_mmydd.jhazsj,jc_mmydd.azjssj,jc_mmydd.lrsj";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_gysxx,jdm_mmyddzt  ";
    ls_sql+=" where jc_mmydd.pdgc=sq_gysxx.gysbh(+) and jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=wheresql;
	ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt>='04'";
	ls_sql+=" order by jc_mmydd.lrsj";

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey11={"yddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey11;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

2、木门退单明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">预订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="4%">派单工厂</td>
	<td  width="4%"><font color="#0000CC">合同金额</font></td>
	<td  width="4%">增减后总额</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="3%">签约日期</td>
	<td  width="3%"><font color="#0000CC">确认退单日期</font></td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="2%">家装设计师</td>
	<td  width="8%">房屋地址</td>
    <td  width="4%">促销活动</td>
	<td  width="3%">合同安装日期</td>
	<td  width="3%">安装结束日期</td>
	<td  width="3%">录入时间</td>
</tr>
<%
	ls_sql =" SELECT yddbh,clztmc,gysmc pdgc,jc_mmydd.htje,jc_mmydd.zjhze,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.htrq,jc_mmydd.tdsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.sjs,crm_khxx.fwdz,cxhdbm,jc_mmydd.jhazsj,jc_mmydd.azjssj,jc_mmydd.lrsj";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_gysxx,jdm_mmyddzt  ";
    ls_sql+=" where jc_mmydd.pdgc=sq_gysxx.gysbh(+) and jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=wheresql;
	ls_sql+=" and jc_mmydd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmydd.clzt='99'";
	ls_sql+=" order by jc_mmydd.lrsj";

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
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

2、木门增减项明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">增减项序号</td>
	<td  width="3%">增减项总额</td>
	<td  width="3%">增减项录入时间</td>
	<td  width="3%">预订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="4%">派单工厂</td>
	<td  width="4%"><font color="#0000CC">订单合同金额</font></td>
	<td  width="4%">订单增减后总额</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="2%">家装设计师</td>
	<td  width="8%">房屋地址</td>
    <td  width="4%">促销活动</td>
	<td  width="3%">合同安装日期</td>
	<td  width="3%">安装结束日期</td>
</tr>
<%
	ls_sql =" SELECT jc_mmzjx.zjxxh,jc_mmzjx.zjxze,jc_mmzjx.lrsj,jc_mmydd.yddbh,clztmc,gysmc pdgc,jc_mmydd.htje,jc_mmydd.zjhze,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.htrq,crm_khxx.hth,crm_khxx.khxm,crm_khxx.sjs,crm_khxx.fwdz,cxhdbm,jc_mmydd.jhazsj,jc_mmydd.azjssj";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_gysxx,jdm_mmyddzt,jc_mmzjx  ";
    ls_sql+=" where jc_mmydd.pdgc=sq_gysxx.gysbh(+) and jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+) and jc_mmydd.yddbh=jc_mmzjx.yddbh";
	ls_sql+=wheresql;
	ls_sql+=" and jc_mmydd.clzt>='04' and jc_mmydd.clzt!='99'";
	ls_sql+=" and jc_mmzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_mmzjx.clzt!='00'";
	ls_sql+=" order by jc_mmzjx.lrsj";

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey13={"yddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey13;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>


<P>
3、橱柜签单明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">订单编号</td>
	<td  width="3%">处理状态</td>
    <td  width="4%">所派工厂</td>
    <td  width="3%">橱柜款式</td>
	<td  width="3%">增减后总额</td>
	<td  width="3%">合同总额</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">确认退单日期</td>
	<td  width="2%">家居设计师</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">客户姓名</td>
	<td  width="3%">合同号</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">家装设计师</td>
    <td  width="4%">促销活动</td>
	<td  width="3%">录入时间</td>
</tr>
<%
	ls_sql="SELECT jc_cgdd.ddbh,clztmc,gysmc,sdks,jc_cgdd.zjhze,jc_cgdd.htze,jc_cgdd.qhtsj,jc_cgdd.tdsj, jc_cgdd.cgsjs,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm,jc_cgdd.lrsj";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_gysxx";
    ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) ";
	ls_sql+=" and jc_cgdd.pdgc=sq_gysxx.gysbh(+)  ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgdd.clzt>='13'";
	ls_sql+=" order by jc_cgdd.lrsj";

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey21={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey21;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

3、橱柜退单明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">订单编号</td>
	<td  width="3%">处理状态</td>
    <td  width="4%">所派工厂</td>
    <td  width="3%">橱柜款式</td>
	<td  width="3%">增减后总额</td>
	<td  width="3%">合同总额</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">确认退单日期</td>
	<td  width="2%">家居设计师</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">客户姓名</td>
	<td  width="3%">合同号</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">家装设计师</td>
    <td  width="4%">促销活动</td>
	<td  width="3%">录入时间</td>
</tr>
<%
	ls_sql="SELECT jc_cgdd.ddbh,clztmc,gysmc,sdks,jc_cgdd.zjhze,jc_cgdd.htze,jc_cgdd.qhtsj,jc_cgdd.tdsj, jc_cgdd.cgsjs,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm,jc_cgdd.lrsj";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_gysxx";
    ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) ";
	ls_sql+=" and jc_cgdd.pdgc=sq_gysxx.gysbh(+)  ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_cgdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgdd.clzt='99'";
	ls_sql+=" order by jc_cgdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
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

3、橱柜增减项明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">增减项序号</td>
	<td  width="4%">增减项总额</td>
	<td  width="3%">增减项录入时间</td>
	<td  width="3%">订单编号</td>
	<td  width="3%">处理状态</td>
    <td  width="4%">所派工厂</td>
    <td  width="3%">橱柜款式</td>
	<td  width="3%">增减后总额</td>
	<td  width="3%">合同总额</td>
	<td  width="3%">签约日期</td>
	<td  width="2%">家居设计师</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">客户姓名</td>
	<td  width="3%">合同号</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">家装设计师</td>
    <td  width="4%">促销活动</td>
</tr>
<%
	ls_sql="SELECT jc_cgzjx.zjxxh,jc_cgzjx.zjxze,jc_cgzjx.lrsj,jc_cgdd.ddbh,clztmc,gysmc,sdks,jc_cgdd.zjhze,jc_cgdd.htze,jc_cgdd.qhtsj, jc_cgdd.cgsjs,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_gysxx,jc_cgzjx";
    ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) ";
	ls_sql+=" and jc_cgdd.pdgc=sq_gysxx.gysbh(+) and jc_cgdd.ddbh=jc_cgzjx.ddbh ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_cgdd.clzt>='13' and jc_cgdd.clzt!='99'";
	ls_sql+=" and jc_cgzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_cgzjx.clzt!='00'";
	ls_sql+=" order by jc_cgzjx.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey23={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey23;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>


<P>
4、家具签单明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">订单编号</td>
	<td  width="4%">处理状态</td>
	<td  width="5%">家具工厂</td>
	<td  width="5%">型材门工厂</td>
	<td  width="4%">合同总额</td>
	<td  width="4%">增减后总额</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">确认退单日期</td>
	<td  width="2%">家居设计师</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">客户姓名</td>
	<td  width="3%">合同号</td>
	<td  width="9%">房屋地址</td>
	<td  width="2%">家装设计师</td>
    <td  width="4%">促销活动</td>
	<td  width="3%">录入时间</td>
</tr>
<%
	ls_sql="SELECT jc_jjdd.ddbh,clztmc,c.gysmc pdgc,d.gysmc xcmgc,jc_jjdd.htze,jc_jjdd.zjhze,jc_jjdd.qhtsj,jc_jjdd.tdsj,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,crm_khxx.khxm khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm,jc_jjdd.lrsj ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx,sq_gysxx c,sq_gysxx d";
    ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_jjdd.pdgc=c.gysbh(+)and jc_jjdd.xcmgc=d.gysbh(+)";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjdd.clzt>='13'";
	ls_sql+=" order by jc_jjdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey31={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey31;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

4、家具退单明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">订单编号</td>
	<td  width="4%">处理状态</td>
	<td  width="5%">家具工厂</td>
	<td  width="5%">型材门工厂</td>
	<td  width="4%">合同总额</td>
	<td  width="4%">增减后总额</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">确认退单日期</td>
	<td  width="2%">家居设计师</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">客户姓名</td>
	<td  width="3%">合同号</td>
	<td  width="9%">房屋地址</td>
	<td  width="2%">家装设计师</td>
    <td  width="4%">促销活动</td>
	<td  width="3%">录入时间</td>
</tr>
<%
	ls_sql="SELECT jc_jjdd.ddbh,clztmc,c.gysmc pdgc,d.gysmc xcmgc,jc_jjdd.htze,jc_jjdd.zjhze,jc_jjdd.qhtsj,jc_jjdd.tdsj,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,crm_khxx.khxm khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm,jc_jjdd.lrsj ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx,sq_gysxx c,sq_gysxx d";
    ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_jjdd.pdgc=c.gysbh(+)and jc_jjdd.xcmgc=d.gysbh(+)";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_jjdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjdd.clzt='99'";
	ls_sql+=" order by jc_jjdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
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
 
4、家具增减项明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">增减项序号</td>
	<td  width="4%">增减项总额</td>
	<td  width="3%">增减项录入时间</td>
	<td  width="3%">订单编号</td>
	<td  width="4%">处理状态</td>
	<td  width="5%">家具工厂</td>
	<td  width="5%">型材门工厂</td>
	<td  width="4%">订单合同总额</td>
	<td  width="4%">订单增减后总额</td>
	<td  width="3%">签约日期</td>
	<td  width="2%">家居设计师</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">客户姓名</td>
	<td  width="3%">合同号</td>
	<td  width="9%">房屋地址</td>
	<td  width="2%">家装设计师</td>
    <td  width="4%">促销活动</td>
</tr>
<%
	ls_sql="SELECT jc_jjzjx.zjxxh,jc_jjzjx.zjxze,jc_jjzjx.lrsj,jc_jjdd.ddbh,clztmc,c.gysmc pdgc,d.gysmc xcmgc,jc_jjdd.htze,jc_jjdd.zjhze,jc_jjdd.qhtsj,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,crm_khxx.khxm khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,cxhdbm";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx,sq_gysxx c,sq_gysxx d,jc_jjzjx";
    ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+) and jc_jjdd.ddbh=jc_jjzjx.ddbh";
	ls_sql+=" and jc_jjdd.pdgc=c.gysbh(+)and jc_jjdd.xcmgc=d.gysbh(+)";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_jjdd.clzt>='13' and jc_jjdd.clzt!='99'";
	ls_sql+=" and jc_jjzjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjzjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_jjzjx.clzt!='00'";
	ls_sql+=" order by jc_jjzjx.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey33={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey33;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>



<P>
5、主材订单明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="3%">订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="5%">品牌</td>
	<td  width="4%">合同总额</td>
	<td  width="4%">增减项金额</td>
	<td  width="4%">计入促销活动金额</td>
	<td  width="3%">订货日期</td>
	<td  width="3%">退单时间</td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="4%">参加促销活动</td>
	<td  width="2%">家装设计师</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">家居设计师</td>
	<td  width="3%">录入时间</td>
</tr>
<%
	ls_sql="SELECT jc_zcdd.ddbh,clztmc,jc_zcdd.ppbm,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.htcxhdje,jc_zcdd.qhtsj,jc_zcdd.tdsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,jc_zcdd.lrsj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt>='09'";
	ls_sql+=" order by jc_zcdd.lrsj";

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey41={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey41;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

5、主材退单明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="3%">订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="5%">品牌</td>
	<td  width="4%">合同总额</td>
	<td  width="4%">增减项金额</td>
	<td  width="4%">计入促销活动金额</td>
	<td  width="3%">订货日期</td>
	<td  width="3%">退单时间</td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="4%">参加促销活动</td>
	<td  width="2%">家装设计师</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">家居设计师</td>
	<td  width="3%">录入时间</td>
</tr>
<%
	ls_sql="SELECT jc_zcdd.ddbh,clztmc,jc_zcdd.ppbm,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.htcxhdje,jc_zcdd.qhtsj,jc_zcdd.tdsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,jc_zcdd.lrsj";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_zcdd.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.clzt='99'";
	ls_sql+=" order by jc_zcdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
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


5、主材增减项明细
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="3%">增减项编号</td>
   	<td  width="4%">增减项总额</td>
   	<td  width="3%">增减项录入时间</td>
   	<td  width="3%">订单编号</td>
	<td  width="3%">订单状态</td>
	<td  width="5%">品牌</td>
	<td  width="4%">订单合同总额</td>
	<td  width="4%">订单增减总额</td>
	<td  width="4%">计入促销活动金额</td>
	<td  width="3%">订货日期</td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="4%">参加促销活动</td>
	<td  width="2%">家装设计师</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">家居设计师</td>
</tr>
<%
	ls_sql="SELECT jc_zczjx.zjxbh,jc_zczjx.zjxze,jc_zczjx.lrsj,jc_zcdd.ddbh,clztmc,jc_zcdd.ppbm,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.htcxhdje,jc_zcdd.qhtsj,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt,jc_zczjx ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.ddbh=jc_zczjx.ddbh ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=wheresql;
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt!='99'";
	ls_sql+=" and jc_zczjx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zczjx.clzt!='00'";
	ls_sql+=" order by jc_zczjx.lrsj";

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey43={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey43;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>


</body>
</html>