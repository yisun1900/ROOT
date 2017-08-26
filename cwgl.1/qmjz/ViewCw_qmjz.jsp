<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String jzrq=request.getParameter("jzrq");
String dwbh=request.getParameter("dwbh");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT dwmc,crm_khxx.sjs,DECODE(crm_khxx.zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>'),crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.qyrq,crm_khxx.tdsj,sgdmc,crm_khxx.zjxm,crm_khxx.wdzgce,crm_khxx.qye,crm_khxx.guanlif,crm_khxx.suijin,crm_khxx.suijinbfb,crm_khxx.sjf,crm_khxx.sjhtsjf,crm_khxx.zkl,crm_khxx.cxhdbm,crm_khxx.sfke,cw_fkcs.fkcsmc,crm_khxx.jzkscsj,crm_khxx.jzkfksj,crm_khxx.cwsfke,crm_khxx.cwjzkfkcs,crm_khxx.cwjzkscsj,crm_khxx.cwjzkfksj,crm_khxx.ywy ";
	ls_sql+=" FROM cw_qmjzmx,crm_khxx,sq_dwxx,sq_sgd,cw_fkcs  ";
    ls_sql+=" where cw_qmjzmx.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
    ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
    ls_sql+=" order by crm_khxx.zt desc,crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.sjs,crm_khxx.qyrq";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("ViewCw_qmjz.jsp?jzrq="+jzrq,"","","");
	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jzrq","khbh","zt","khxm","hth","sjs","wdzgce","qye","suijin","suijinbfb","sjf","glf","guanlif","zjxje","zhzjxje","zjxsuijin","kglf","kqtk","zkl","cxhdbm","qyrq","tdsj","sgd","zjxm","sfke","jzkfkcs","jzkscsj","jzkfksj","cwsfke","cwjzkfkcs","cwjzkscsj","cwjzkfksj","ywy","fgsbh","dwbh"};
	pageObj.setDisColName(disColName);
*/

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
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果（业绩结转时间：<%=jzrq%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">签约店面</td>
	<td  width="2%">设计师</td>
	<td  width="2%">客户类型</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">退单时间</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检</td>
	<td  width="4%">折前合同额</td>
	<td  width="4%">折后合同额</td>
	<td  width="3%">管理费</td>
	<td  width="3%">税金</td>
	<td  width="2%">税金百分比</td>
	<td  width="3%">设计费</td>
	<td  width="3%">设计合同设计费</td>
	<td  width="2%">实际折扣率</td>
	<td  width="7%">参加促销活动</td>
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