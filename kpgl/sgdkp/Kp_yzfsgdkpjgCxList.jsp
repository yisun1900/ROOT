<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String kpjlh=request.getParameter("kpjlh");

	ls_sql="SELECT sq_sgd.sgdmc,kp_yzfsgdkpjg.zbj,kp_yzfsgdkpjg.zbjxs,kp_yzfsgdkpjg.bzs,kp_yzfsgdkpjg.khpjdf,kp_yzfsgdkpjg.tsdf,kp_yzfsgdkpjg.wxdf,kp_yzfsgdkpjg.kpdf,kp_yzfsgdkpjg.fdfs,kp_yzfsgdkpjg.bqzf,kp_yzfsgdkpjg.bqpm,kp_yzfsgdkpjg.sqpm,kp_yzfsgdkpjg.sqsyddje,kp_yzfsgdkpjg.sqsyzdje,kp_yzfsgdkpjg.sqsyxdje,kp_yzfsgdkpjg.sqpjqde,kp_yzfsgdkpjg.gdjdexs,kp_yzfsgdkpjg.bqbzjdze,kp_yzfsgdkpjg.gsddbl,kp_yzfsgdkpjg.gdddbl,kp_yzfsgdkpjg.ddbzjde,kp_yzfsgdkpjg.gszdbl,kp_yzfsgdkpjg.gdzdbl,kp_yzfsgdkpjg.zdbzjde,kp_yzfsgdkpjg.gsxdbl,kp_yzfsgdkpjg.gdxdbl,kp_yzfsgdkpjg.xdbzjde,kp_yzfsgdkpjg.ddhdje,kp_yzfsgdkpjg.zdhdje,kp_yzfsgdkpjg.xdhdje,kp_yzfsgdkpjg.zdtscs,kp_yzfsgdkpjg.tskddje,kp_yzfsgdkpjg.tskzdje,kp_yzfsgdkpjg.tskxdje,kp_yzfsgdkpjg.tsjcdd,kp_yzfsgdkpjg.tsjczd,kp_yzfsgdkpjg.tsjcxd,kp_yzfsgdkpjg.kjddze,kp_yzfsgdkpjg.kjzdze,kp_yzfsgdkpjg.kjxdze,kp_yzfsgdkpjg.kjdze,kp_yzfsgdkpjg.yjddje,kp_yzfsgdkpjg.yjzdje,kp_yzfsgdkpjg.yjxdje,kp_yzfsgdkpjg.syddje,kp_yzfsgdkpjg.syzdje,kp_yzfsgdkpjg.syxdje, DECODE(kp_yzfsgdkpjg.djbz,'N','未冻结','Y','已冻结'),kp_yzfsgdkpjg.bz  ";
	ls_sql+=" FROM sq_sgd,kp_yzfsgdkpjg  ";
    ls_sql+=" where kp_yzfsgdkpjg.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and kp_yzfsgdkpjg.kpjlh="+kpjlh;
    ls_sql+=" order by kp_yzfsgdkpjg.kpjlh,kp_yzfsgdkpjg.bqpm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队考评结果（考评记录号：<%=kpjlh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">施工队</td>
	<td  width="1%">质保金</td>
	<td  width="1%">质保金系数</td>
	<td  width="1%">班组数</td>
	<td  width="1%">客户评价得分</td>
	<td  width="1%">投诉项得分</td>
	<td  width="1%">维修项得分</td>
	<td  width="1%">考评得分</td>
	<td  width="1%">浮动分数</td>
	<td  width="1%">本期总分</td>
	<td  width="1%">本期排名</td>
	<td  width="1%">上期排名</td>
	<td  width="1%">上期剩余大单金额</td>
	<td  width="1%">上期剩余中单金额</td>
	<td  width="1%">上期剩余小单金额</td>
	<td  width="1%">上期平均签单额</td>
	<td  width="1%">工队接单额系数</td>
	<td  width="1%">本期准接接单总额</td>
	<td  width="1%">公司大单所占比例</td>
	<td  width="1%">施工队大单比例</td>
	<td  width="1%">大单标准接单额</td>
	<td  width="1%">公司中单所占比例</td>
	<td  width="1%">施工队中单比例</td>
	<td  width="1%">中单标准接单额</td>
	<td  width="1%">公司小单所占比例</td>
	<td  width="1%">施工队小单比例</td>
	<td  width="1%">小单标准接单额</td>
	<td  width="1%">大单回单金额</td>
	<td  width="1%">中单回单金额</td>
	<td  width="1%">小单回单金额</td>
	<td  width="1%">重大投诉次数</td>
	<td  width="1%">重大投诉扣大单</td>
	<td  width="1%">重大投诉扣中单</td>
	<td  width="1%">重大投诉扣小单</td>
	<td  width="1%">特殊奖励或处罚大单</td>
	<td  width="1%">特殊奖励或处罚中单</td>
	<td  width="1%">特殊奖励或处罚小单</td>
	<td  width="1%">下期可接大单总额</td>
	<td  width="1%">下期可接中单总额</td>
	<td  width="1%">下期可接小单总额</td>
	<td  width="1%">下期可接单总额</td>
	<td  width="1%">已接大单金额</td>
	<td  width="1%">已接中单金额</td>
	<td  width="1%">已接小单金额</td>
	<td  width="1%">剩余大单金额</td>
	<td  width="1%">剩余中单金额</td>
	<td  width="1%">剩余小单金额</td>
	<td  width="1%">冻结标志</td>
	<td  width="1%">备注</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>