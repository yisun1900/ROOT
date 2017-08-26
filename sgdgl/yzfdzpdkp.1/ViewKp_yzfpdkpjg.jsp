<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String ssfgs=request.getParameter("ssfgs");

	ls_sql="SELECT '',kpsj,dwmc,sgdmc,(NVL(-1*sq_sgd.sgdpdjf,0)+NVL(sq_sgd.sgdwgjf,0)+NVL(pdkpf,0)+(NVL(sq_sgd.zdzsgds,0)-NVL(sq_sgd.mqzsgds,0))) zf,sq_sgd.khmyd||'%',DECODE(tdbz,'Y','<font color=\"#FF0000\">已停单</font>','N','正常'),sgdjbmc,ROUND(sq_sgd.zbj/10000,1)||'万',sq_sgd.bzs,DECODE(kp_yzfpdkpjg.zbjsfdb,'Y','达标','N','<font color=\"#FF0000\">否</font>'),NVL(sq_sgd.zdzsgds,0),NVL(sq_sgd.mqzsgds,0),(NVL(sq_sgd.zdzsgds,0)-NVL(sq_sgd.mqzsgds,0))||'分',sgdjbjf||'分',NVL(-1*sq_sgd.sgdpdjf,0)||'分',NVL(sq_sgd.sgdwgjf,0)||'分',xjgdpjkf,-1*xjgdjf||'分',gdyspjkf,-1*gdysjf||'分',wxtss,yztss,ybtss,qwtss,-1*tsjf||'分',yqgds,-1*yqgdjf||'分',aqsggsrs,aqsggwrs,-1*aqsgjf||'分' ";
	ls_sql+=" FROM kp_yzfpdkpjg,sq_sgd,sq_sgdjbbm,sq_dwxx  ";
    ls_sql+=" where kp_yzfpdkpjg.sgd=sq_sgd.sgd and kp_yzfpdkpjg.sgdjbbm=sq_sgdjbbm.sgdjbbm";
    ls_sql+=" and kp_yzfpdkpjg.ssfgs=sq_dwxx.dwbh";
    ls_sql+=" and  kp_yzfpdkpjg.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by kp_yzfpdkpjg.ssfgs,tdbz,kp_yzfpdkpjg.zbjsfdb desc,zf desc,sq_sgd.khmyd desc,sq_sgd.sgdjbbm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//设置每页显示记录数
	pageObj.setDateType("long");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队派单考评记录（排序：队长分值、队长客户满意度、队长级别）</font></B>
</CENTER>
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">排名</td>
	<td  width="7%">考评时间</td>
	<td  width="5%">所属分公司</td>
	<td  width="4%">施工队</td>
	<td  width="3%">总分</td>
	<td  width="3%">客户满意度</td>
	<td  width="3%">停单</td>
	<td  width="3%">施工队级别</td>
	<td  width="4%">质保金</td>
	<td  width="3%">班组数</td>
	<td  width="3%">质保金达标</td>
	<td  width="3%">最大在施工地数</td>
	<td  width="3%">目前在施工地数</td>
	<td  width="3%"><strong><font color="#0000FF">闲置施工力量加分</font></strong></td>
	<td  width="3%"><strong><font color="#0000FF">施工队级别加分</font></strong></td>
	<td  width="3%"><strong><font color="#0000FF">施工队派单减分</font></strong></td>
	<td  width="3%"><strong><font color="#0000FF">施工队完工加分</font></strong></td>

	<td  width="3%">巡检工地平均扣分</td>
	<td  width="3%"><strong><font color="#0000FF">巡检工地减分</font></strong></td>
	<td  width="3%">工地验收平均扣分</td>
	<td  width="3%"><font color="#0000FF"><strong>工地验收减分</strong></font></td>
	<td  width="3%">危险投诉次数</td>
	<td  width="3%">严重投诉次数</td>
	<td  width="3%">一般投诉次数</td>
	<td  width="3%">轻微投诉次数</td>
	<td  width="3%"><strong><font color="#0000FF">投诉减分</font></strong></td>
	<td  width="3%">延期工地数</td>
	<td  width="3%"><strong><font color="#0000FF">延期工地减分</font></strong></td>
	<td  width="3%">安全事故工伤人数</td>
	<td  width="3%">安全事故工亡人数</td>
	<td  width="3%"><strong><font color="#0000FF">安全事故减分</font></strong></td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate(true);
%> 
</table>

</body>
</html>