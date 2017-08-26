<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");

	String ls_sql=null;

	ls_sql="SELECT jxc_ckd.ckph,DECODE(jxc_ckd.ckdzt,'0','未提交','1','等待报废审核','2','等待退货审核','3','等待调拨入库','4','已结算','5','退货审核通过','6','报废审核未通过','7','退货审核未通过','8','接受方已入库','9','提交'), DECODE(jxc_ckd.cklx,'D','订单出库','B','报废出库','T','退货出库','S','申购出库','P','材料单出库','J','辅材代金券出库','X','销售出库','R','调拨出库'), jxc_ckd.ckzsl,jxc_ckd.ckzje,jxc_ckd.lydh,jxc_ckd.ckr,jxc_ckd.cksj, DECODE(jxc_ckd.sfjz,'Y','结账','N','未结账'),ckmc,jxc_ckd.bz  ";
	ls_sql+=" FROM jxc_ckd,jxc_ckmc  ";
    ls_sql+=" where jxc_ckd.ckbh=jxc_ckmc.ckbh(+)";
	ls_sql+=" and jxc_ckd.ckcllx='1'";//0：主材；1：辅材
	ls_sql+=" and jxc_ckd.khbh='"+khbh+"' and jxc_ckd.cklx='P'";//D：主材订单出库；B：报废出库；T：退货出库； S：申购出库；P：材料单出库；J：代金券出库；X：销售出库；R:调拨出库
    ls_sql+=" order by jxc_ckd.cksj desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


//设置主键
	String[] keyName={"ckph"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ckph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jxcfc/ckgl/ViewJxc_ckd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ckph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料单出库－查询</font></B>
</CENTER>
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">出库批号</td>
	<td  width="7%">出库单状态</td>
	<td  width="7%">出库类型</td>
	<td  width="7%">出库总数量</td>
	<td  width="8%">出库总金额</td>
	<td  width="8%">来源单号</td>
	<td  width="5%">出库人</td>
	<td  width="7%">出库时间</td>
	<td  width="5%">是否结账</td>
	<td  width="8%">出库仓库</td>
	<td  width="31%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate();
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>