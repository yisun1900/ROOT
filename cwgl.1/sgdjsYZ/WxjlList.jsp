<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String jsjlh=request.getParameter("gdjsjlh");

	String ls_sql=null;

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_tsjl.tsjlh,DECODE(crm_tsjl.sftsqk,'Y','特殊','N','否') sftsqk,crm_tsjl.tsnr,crm_tsjl.yqjjsj,crm_tsjl.slsj, DECODE(crm_tsjl.clzt,'0','非客服登记','1','客服受理','2','在处理','3','结案','9','不立案') jazt,crm_wxfmx.wxzfy,crm_wxfmx.zrfcdfy,DECODE(crm_wxfmx.jsbz,'N','未结算','Y','已结算') jsbz,crm_wxfmx.jsjlh";
	ls_sql+=" FROM crm_khxx,crm_tsjl,sq_sgd,crm_wxfmx";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_tsjl.tsjlh=crm_wxfmx.tsjlh";
    ls_sql+=" and crm_wxfmx.jsjlh='"+jsjlh+"' ";
    ls_sql+=" order by crm_tsjl.tsjlh,crm_wxfmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"sgd","khxm","tsjlh","sftsqk","tsnr","slsj","jazt","wxzfy","zrfcdfy","jsbz","jsjlh"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sgd","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("tsjlh","1");//列参数对象加入Hash表
	spanColHash.put("sftsqk","1");//列参数对象加入Hash表
	spanColHash.put("tsnr","1");//列参数对象加入Hash表
	spanColHash.put("slsj","1");//列参数对象加入Hash表
	spanColHash.put("jazt","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">维修记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">施工队</td>
	<td  width="6%">客户姓名</td>
	<td  width="6%">报修记录号</td>
	<td  width="5%">是否特殊情况</td>
	<td  width="25%">报修内容</td>
	<td  width="7%">受理时间</td>
	<td  width="7%">结案状态</td>
	<td  width="9%">维修总费用</td>
	<td  width="9%">施工队承担费用</td>
	<td  width="6%">结算标志</td>
	<td  width="8%">结算记录号</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>