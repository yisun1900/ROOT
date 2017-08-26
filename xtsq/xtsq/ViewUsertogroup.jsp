<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%//weblogic@ page session=true%>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhzbh=request.getParameter("yhzbh");
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">所属分公司</td>
	<td  width="20%">所属部门</td>
	<td  width="9%">工号</td>
	<td  width="15%">用户登陆名</td>
	<td  width="11%" >姓名</td>
	<td  width="13%" >职务</td>
	<td  width="8%" >员工状态</td>
	<td  width="9%" >入职日期</td>
</tr>
<%
	String ls_sql=null;
	ls_sql="SELECT a.dwmc ssfgs,b.dwmc bm,sq_yhxx.bianhao,sq_yhssz.yhdlm,yhmc,xzzwbm,DECODE(sq_yhxx.sfzszg,'M','<font color=\"#009999\">实习生</font>','Y','转正','N','<font color=\"#0000CC\">试用期</font>','D','<font color=\"#CCCC00\">待岗</font>','S','<font color=\"#CC0000\">辞职</font>','T','<font color=\"#CC00CC\">辞退</font>'),rzsj  ";
	ls_sql+=" FROM sq_yhssz,sq_yhxx,sq_dwxx b,sq_dwxx a  ";
    ls_sql+=" where sq_yhssz.yhdlm=sq_yhxx.yhdlm  and sq_yhxx.dwbh=b.dwbh(+) and sq_yhxx.ssfgs=a.dwbh(+)";
	ls_sql+=" and sq_yhssz.yhzbh='"+yhzbh+"'  ";
	ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc  ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ssfgs","1");//列参数对象加入Hash表
	spanColHash.put("bm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.displayFoot();
%>
  
</table>
</body>
</html>
