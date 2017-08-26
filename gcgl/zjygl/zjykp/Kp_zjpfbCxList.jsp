<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String kpjlh=null;
	kpjlh=request.getParameter("kpjlh");

	ls_sql="SELECT kpjlh,zjxm,jcf,xjykf,gscckf,gchfdf,tssgdkf,tszjkf,bxkf,zf,bqpm  ";
	ls_sql+=" FROM kp_zjpfb  ";
    ls_sql+=" where kpjlh="+kpjlh;
    ls_sql+=" order by bqpm";
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
  <B><font size="3">工程担当评分结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">考评记录号</td>
	<td  width="9%">工程担当</td>
	<td  width="9%">基础分</td>
	<td  width="9%">巡检员扣分</td>
	<td  width="9%">公司抽查扣分</td>
	<td  width="9%">工程回访得分</td>
	<td  width="9%">投诉施工队扣分</td>
	<td  width="9%">投诉工程担当扣分</td>
	<td  width="9%">报修扣分</td>
	<td  width="9%">总分</td>
	<td  width="9%">本期排名</td>
</tr>
<%
	pageObj.printDate();
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