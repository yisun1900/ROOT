<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">主材送货单</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">送货单编号</td>
	<td  width="10%">送货人</td>
	<td  width="10%">送货时间</td>
	<td  width="10%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="40%">备注</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ddbh=request.getParameter("ddbh");
	String ls_sql=null;

	ls_sql="SELECT shdbh,shr,shsj,lrr,lrsj,bz";
	ls_sql+=" FROM jc_zcshd ";
    ls_sql+=" where ddbh='"+ddbh+"'";
    ls_sql+=" order by shdbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
    
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"shdbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/dygl/DyShd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("shdbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>
</body>
</html>
