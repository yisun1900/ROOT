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



	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,wdzgce,qye,dwmc,TO_CHAR(crm_khxx.lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(crm_khxx.qyrq,'YYYY-MM-DD')";
	ls_sql+=" FROM crm_khxx,crm_zxkhxx ,sq_dwxx,sq_sgd";
    ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
		ls_sql+=" and crm_khxx.zt in('2') ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.dwbh='"+dwbh+"' ";
		ls_sql+=" and crm_zxkhxx.hddjbz='N'";
		ls_sql+=" and crm_zxkhxx.lfdjbz='N'";

	ls_sql+=" order by crm_khxx.sjs,crm_khxx.lrsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">未交定金签单数量（<%=dwmc%>）
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">客户编号</td>
	<td  width="7%">合同号</td>
	<td  width="7%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="7%">设计师</td>
 	<td  width="7%">施工队</td>
	<td  width="7%">质检员</td>
 	<td  width="8%">未打折金额</td>
	<td  width="8%">签约额</td>
 	<td  width="10%">签约店面</td>
	<td  width="10%">咨询客户录入时间</td>
	<td  width="7%">签约日期</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 
</table>
</body>
</html>