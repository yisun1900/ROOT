<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String kpjlh=request.getParameter("kpjlh");
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队派单考评打印（考评记录号：<%=kpjlh%>）</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2" width="3.5%"><b>本期排名</b></td>
    <td rowspan="2" width="3.5%"><b>本期得分</b></td>
    <td rowspan="2" width="4.5%"><b>施工队</b></td>
    <td rowspan="2" width="3.5%"><b>质保金</b></td>
    <td rowspan="2" width="3.5%"><b>班组数</b></td>
    <td rowspan="2" width="3.5%"><b>级别</b></td>
    <td rowspan="2" width="3.5%">接单权重</td>
    <td colspan="3" ><b>接单比率</b></td>
    <td rowspan="2" width="3.5%">扣单比例</td>
    <td colspan="3" ><b>本期派单</b></td>
    <td colspan="3" ><b>上期剩余</b></td>
    <td colspan="3" ><b>上期派单补偿</b></td>
    <td colspan="4" ><b>本期接单总计</b></td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="3.5%">大单</td>
    <td  width="3.5%">中单</td>
    <td  width="3.5%">小单</td>
    <td  width="4.5%"><b>大单</b></td>
    <td  width="4.5%"><b>中单</b></td>
    <td  width="4.5%"><b>小单</b></td>
    <td  width="4.5%"><b>大单</b></td>
    <td  width="4.5%"><b>中单</b></td>
    <td  width="4.5%"><b>小单</b></td>
    <td  width="4.5%"><b>大单</b></td>
    <td  width="4.5%"><b>中单</b></td>
    <td  width="4.5%"><b>小单</b></td>
    <td  width="4.5%"><b>总额</b></td>
    <td  width="4.5%"><b>大单</b></td>
    <td  width="4.5%"><b>中单</b></td>
    <td  width="4.5%"><b>小单</b></td>
  </tr>
  <%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	ls_sql="SELECT kp_pdkpmx.bqpm,TO_CHAR(kp_pdkpmx.bqdf),sq_sgd.sgdmc,kp_pdkpmx.zbj,kp_pdkpmx.bzs,sgdjbmc,TO_CHAR(kp_pdkpmx.jdqz),kp_pdkpmx.ddbl||'%',kp_pdkpmx.zdbl||'%',kp_pdkpmx.xdbl||'%',kp_pdkpmx.kcjdebfb||'%',kp_pdkpmx.ddje,kp_pdkpmx.zdje,kp_pdkpmx.xdje,kp_pdkpmx.sqsydde,kp_pdkpmx.sqsyzde,kp_pdkpmx.sqsyxde,kp_pdkpmx.sqpdbcdde,kp_pdkpmx.sqpdbczde,kp_pdkpmx.sqpdbcxde,kp_pdkpmx.bqjdze,kp_pdkpmx.bqdde,kp_pdkpmx.bqzde,kp_pdkpmx.bqxde";
	ls_sql+=" FROM sq_sgd,kp_pdkpmx,sq_sgdjbbm  ";
    ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.sgdjbbm=sq_sgdjbbm.sgdjbbm(+)";
    ls_sql+=" and kp_pdkpmx.kpjlh='"+kpjlh+"' and kp_pdkpmx.sgdlx='S0'";
    ls_sql+=" order by kp_pdkpmx.kpjlh,kp_pdkpmx.sgdlx,kp_pdkpmx.bqpm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2" width="3.5%"><b>本期排名</b></td>
    <td rowspan="2" width="3.5%"><b>本期得分</b></td>
    <td rowspan="2" width="4.5%"><b>施工队</b></td>
    <td rowspan="2" width="3.5%"><b>质保金</b></td>
    <td rowspan="2" width="3.5%"><b>班组数</b></td>
    <td rowspan="2" width="3.5%"><b>级别</b></td>
    <td rowspan="2" width="3.5%">接单权重</td>
    <td colspan="3" ><b>接单比率</b></td>
    <td rowspan="2" width="3.5%">扣单比例</td>
    <td colspan="3" ><b>本期派单</b></td>
    <td colspan="3" ><b>上期剩余</b></td>
    <td colspan="3" ><b>上期派单补偿</b></td>
    <td colspan="4" ><b>本期接单总计</b></td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="3.5%">大单</td>
    <td  width="3.5%">中单</td>
    <td  width="3.5%">小单</td>
    <td  width="4.5%"><b>大单</b></td>
    <td  width="4.5%"><b>中单</b></td>
    <td  width="4.5%"><b>小单</b></td>
    <td  width="4.5%"><b>大单</b></td>
    <td  width="4.5%"><b>中单</b></td>
    <td  width="4.5%"><b>小单</b></td>
    <td  width="4.5%"><b>大单</b></td>
    <td  width="4.5%"><b>中单</b></td>
    <td  width="4.5%"><b>小单</b></td>
    <td  width="4.5%"><b>总额</b></td>
    <td  width="4.5%"><b>大单</b></td>
    <td  width="4.5%"><b>中单</b></td>
    <td  width="4.5%"><b>小单</b></td>
  </tr>
  <%
	ls_sql="SELECT kp_pdkpmx.bqpm,TO_CHAR(kp_pdkpmx.bqdf),sq_sgd.sgdmc,kp_pdkpmx.zbj,kp_pdkpmx.bzs,sgdjbmc,TO_CHAR(kp_pdkpmx.jdqz),kp_pdkpmx.ddbl||'%',kp_pdkpmx.zdbl||'%',kp_pdkpmx.xdbl||'%',kp_pdkpmx.kcjdebfb||'%',kp_pdkpmx.ddje,kp_pdkpmx.zdje,kp_pdkpmx.xdje,kp_pdkpmx.sqsydde,kp_pdkpmx.sqsyzde,kp_pdkpmx.sqsyxde,kp_pdkpmx.sqpdbcdde,kp_pdkpmx.sqpdbczde,kp_pdkpmx.sqpdbcxde,kp_pdkpmx.bqjdze,kp_pdkpmx.bqdde,kp_pdkpmx.bqzde,kp_pdkpmx.bqxde";
	ls_sql+=" FROM sq_sgd,kp_pdkpmx,sq_sgdjbbm  ";
    ls_sql+=" where kp_pdkpmx.sgd=sq_sgd.sgd and kp_pdkpmx.sgdjbbm=sq_sgdjbbm.sgdjbbm(+)";
    ls_sql+=" and kp_pdkpmx.kpjlh='"+kpjlh+"' and kp_pdkpmx.sgdlx='S1'";
    ls_sql+=" order by kp_pdkpmx.kpjlh,kp_pdkpmx.sgdlx,kp_pdkpmx.bqpm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>

</body>
</html>