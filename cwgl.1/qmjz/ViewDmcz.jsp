<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String dwbh=request.getParameter("dwbh");
	String jzrq=request.getParameter("jzrq");

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");



	ls_sql="SELECT '',sjs,DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>'),khbh,hth,khxm,qyrq,tdsj,sgdmc,zjxm,wdzgce,qye,suijin,suijinbfb,sjf,guanlif,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy ";
	ls_sql+=" FROM crm_khxx,sq_sgd  ";
    ls_sql+=" where crm_khxx.yjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD') and crm_khxx.dwbh='"+dwbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" order by zt desc,crm_khxx.fgsbh,crm_khxx.dwbh,sjs,qyrq";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">店面签约明细（<%=dwmc%>）
  <b>(业绩结转时间：<%=jzrq%>)</b><BR>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">设计师</td>
	<td  width="2%">客户类型</td>
	<td  width="2%">客户编号</td>
	<td  width="3%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">退单时间</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检</td>
	<td  width="4%">折前合同额</td>
	<td  width="4%">折后合同额</td>
	<td  width="3%">税金</td>
	<td  width="2%">税金百分比</td>
	<td  width="3%">设计费</td>
	<td  width="3%">管理费</td>
	<td  width="3%">折前累计工程增减项</td>
	<td  width="3%">折后累计工程增减项</td>
	<td  width="2%">增减项税金</td>
	<td  width="3%">累计减项管理费</td>
	<td  width="3%">累计减项扣其它款</td>
	<td  width="2%">实际折扣率</td>
	<td  width="4%">参加促销活动</td>
	<td  width="4%">家装实付款额</td>
	<td  width="2%">家装付款次数</td>
	<td  width="3%">首次付家装款时间</td>
	<td  width="3%">家装最近付款时间</td>
	<td  width="4%">财务家装实收款额</td>
	<td  width="2%">财务家装收款期数</td>
	<td  width="3%">财务首次收家装款时间</td>
	<td  width="3%">财务家装最近收款时间</td>
	<td  width="2%">业务员</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>