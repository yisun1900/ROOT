<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String kpjlh=request.getParameter("kpjlh");

	String ls_sql=null;

	ls_sql="SELECT '',kp_yzfsgdkhpyd.kpjlh,sgdmc,kp_yzfsgdkhpyd.sgdjbbm,kp_yzfsgdkhpyd.zbj,kp_yzfsgdkhpyd.bzs,kp_yzfsgdkhpyd.khmyd||'%',xjgdpjkf,xjgdjf,gdyspjkf,gdysjf,wxtss,yztss,ybtss,qwtss,tsjf,yqgds,yqgdjf,aqsggsrs,aqsggwrs,aqsgjf,sfkpd,kp_yzfsgdkhpyd.pdyxj,kp_yzfsgdkhpyd.kpkssj,kp_yzfsgdkhpyd.kpjzsj,dwmc";
	ls_sql+=" FROM kp_yzfsgdkhpyd,sq_sgd,sq_dwxx";
    ls_sql+=" where kp_yzfsgdkhpyd.sgd=sq_sgd.sgd(+) and kp_yzfsgdkhpyd.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=" and kp_yzfsgdkhpyd.kpjlh='"+kpjlh+"'";
    ls_sql+=" order by kp_yzfsgdkhpyd.kpjlh,kp_yzfsgdkhpyd.ssfgs,kp_yzfsgdkhpyd.khmyd desc,sgdmc";
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(4000);//设置每页显示记录数
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果（考评记录号：<%=kpjlh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">序号</td>
	<td  width="4%">考评记录号</td>
	<td  width="4%">施工队</td>
	<td  width="4%">施工队级别</td>
	<td  width="3%">质保金</td>
	<td  width="3%">班组数</td>
	<td  width="3%">户满意度</td>
	<td  width="3%">巡检工地平均扣分</td>
	<td  width="3%">巡检工地减分</td>
	<td  width="3%">工地验收平均扣分</td>
	<td  width="3%">工地验收减分</td>
	<td  width="3%">危险投诉数</td>
	<td  width="3%">严重投诉数</td>
	<td  width="3%">一般投诉数</td>
	<td  width="3%">轻微投诉数</td>
	<td  width="3%">投诉减分</td>
	<td  width="3%">延期工地数</td>
	<td  width="3%">延期工地减分</td>
	<td  width="3%">安全事故工伤人数</td>
	<td  width="3%">安全事故工亡人数</td>
	<td  width="3%">安全事故减分</td>
	<td  width="3%">是否可派单</td>
	<td  width="3%">派单优先级</td>
	<td  width="4%">考评开始时间</td>
	<td  width="4%">考评截止时间</td>
	<td  width="13%">分公司</td>
</tr>
<%
	pageObj.printDate(true);
	pageObj.printFoot();
%> 

</body>
</html>