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


	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过'),crm_zxkhxx.sjhtje,crm_zxkhxx.qsjhtsj,sjf,jsjfsj,crm_zxkhxx.fwdz,b.dwmc as zxdm,crm_zxkhxx.sjs,khjl,ywy,dzbjze,bjjbmc,lfdj,jlfdjsj,cxhdbm,hddj,jhddjsj,lfsj,ctsj,cxgtsj,csgtsj,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),crm_zxkhxx.lrsj,fwlxmc";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx b,bdm_bjjbbm ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) ";
	ls_sql+=" and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"'";
	ls_sql+=" and crm_zxkhxx.qsjhtbz='Y'";
	ls_sql+=" and crm_zxkhxx.qsjhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.qsjhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" order by b.dwmc,khxm";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);



//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<noscript><iframe scr="*.htm"></iframe></noscript>

<CENTER >
  <B><font size="3">设计合同明细（<%=dwmc%>）</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">客户编号</td>
	<td  width="4%">姓名</td>
	<td  width="3%">咨询状态</td>
	<td  width="3%">设计合同金额</td>
	<td  width="4%">签设计合同时间</td>
	<td  width="3%">实收设计费</td>
	<td  width="4%">交设计费时间</td>
	<td  width="10%">房屋地址</td>
	<td  width="4%">咨询店面</td>
	<td  width="3%">设计师</td>
	<td  width="3%">客户经理</td>
	<td  width="3%">业务员</td>
	<td  width="4%">电子报价总额</td>
	<td  width="3%">报价级别</td>
	<td  width="4%">家装订金</td>
	<td  width="4%">交家装订金时间</td>
	<td  width="7%">参加促销活动</td>
	<td  width="4%">套餐意向订金</td>
	<td  width="4%">交套餐意向订金时间</td>
	<td  width="4%">量房时间</td>
	<td  width="4%">出平面图时间</td>
	<td  width="4%">出效果图时间</td>
	<td  width="4%">出施工图时间</td>
	<td  width="2%">家装标志</td>
	<td  width="4%">录入时间</td>
	<td  width="3%">房屋类型</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">

<%
	pageObj.printScript();
%> 

//-->
</script>
</html>