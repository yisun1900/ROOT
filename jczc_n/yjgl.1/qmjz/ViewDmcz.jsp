<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String dwbh=request.getParameter("dwbh");
	String yjjzsj=request.getParameter("yjjzsj");

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");



	ls_sql="SELECT '',b.dwmc dwbh,sjs,DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>'),khbh,hth,khxm,qyrq,tdsj,sgdmc,zjxm,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,a.dwmc fgsbh  ";
	ls_sql+=" FROM cw_qmjzmx,sq_dwxx a,sq_dwxx b,sq_sgd  ";
    ls_sql+=" where cw_qmjzmx.yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD') and cw_qmjzmx.dwbh='"+dwbh+"' and cw_qmjzmx.fgsbh=a.dwbh(+) and cw_qmjzmx.dwbh=b.dwbh(+) and cw_qmjzmx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" order by zt desc,cw_qmjzmx.fgsbh,cw_qmjzmx.dwbh,sjs,qyrq";

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
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">店面签约明细（<%=dwmc%>）
  <b>(业绩结转时间：<%=yjjzsj%>)</b><BR>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="4%">签约店面</td>
	<td  width="2%">设计师</td>
	<td  width="2%">客户类型</td>
	<td  width="2%">客户编号</td>
	<td  width="3%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">退单时间</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检</td>
	<td  width="4%">未打折工程额</td>
	<td  width="4%">工程签约额</td>
	<td  width="3%">税金</td>
	<td  width="2%">税金百分比</td>
	<td  width="3%">设计费</td>
	<td  width="3%">服务费</td>
	<td  width="3%">管理费</td>
	<td  width="2%">环保项目签约额</td>
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
	<td  width="4%">所属分公司编号</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printSum();
%> 
</table>
</body>
</html>
