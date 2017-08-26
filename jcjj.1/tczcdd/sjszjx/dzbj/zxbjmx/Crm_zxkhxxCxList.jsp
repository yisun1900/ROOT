<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yhmc=(String)session.getAttribute("yhmc");
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	String copykhbh=request.getParameter("copykhbh");
	String khxm=cf.GB2Uni(request.getParameter("khxm"));
	String ssfgs=request.getParameter("ssfgs");

	String khbh=request.getParameter("khbh");
	String dqbm=request.getParameter("dqbm");

	ls_sql="SELECT crm_zxkhxx.khxm,cqmc,crm_zxkhxx.xqbm,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','店面退回客户','3','已签约','4','公司签单失败','5','重新分配店面'),dzbjze,bjjbmc,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),sq_dwxx.dwmc as zxdm,sjs,lrsj,crm_zxkhxx.khbh as khbh";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx,bdm_bjjbbm,dm_cqbm ";
    ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and crm_zxkhxx.cqbm=dm_cqbm.cqbm(+)";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.ssfgs='"+ssfgs+"' and crm_zxkhxx.khxm='"+khxm+"' and crm_zxkhxx.khbh='"+copykhbh+"'";
    ls_sql+=" order by crm_zxkhxx.khbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","CopyKhbj.jsp?drkhbh="+khbh+"&dqbm="+dqbm);
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.setEditBolt("");//设置每页显示记录数
	pageObj.setEditStr("复制");//设置每页显示记录数


//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">复制报价『不同设计师间也可复制报价』</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="8%">姓名</td>
	<td  width="8%">城区</td>
	<td  width="14%">小区/街道</td>
	<td  width="8%">咨询状态</td>
	<td  width="10%">电子报价总额</td>
	<td  width="7%">报价级别</td>
	<td  width="6%">家装标志</td>
	<td  width="13%">咨询店面</td>
	<td  width="7%">设计师</td>
	<td  width="9%">录入时间</td>
	<td  width="6%">客户编号</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
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