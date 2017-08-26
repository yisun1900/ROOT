<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String cxhdmc=cf.GB2Uni(request.getParameter("cxhdmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">录入促销活动时间(促销活动:<%=cxhdmc%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="25%">时间段</td>
	<td  width="25%">开始时间</td>
	<td  width="25%">促销结束时间</td>
	<td  width="25%">签单结束时间</td>
</tr>
<%

try {
	conn=cf.getConnection();

	String kssj=null;
	String cxjssj=null;
	String qdjssj=null;
	int row=0;

	ls_sql="SELECT kssj,cxjssj,qdjssj";
	ls_sql+=" FROM jc_cxhdsj  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  kssj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		kssj=cf.fillNull(rs.getDate("kssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		qdjssj=cf.fillNull(rs.getDate("qdjssj"));

		row++;


		%>
		<tr align="center">
			<td>原时间段【<%=row%>】</td>
			<td>
				<input type="text" name="kssj" value="<%=kssj%>" onDblClick="JSCalendar(this)" size="15" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="cxjssj" value="<%=cxjssj%>" onDblClick="JSCalendar(this)" size="15" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="qdjssj" value="<%=qdjssj%>" onDblClick="JSCalendar(this)" size="15" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
		</tr>
		<%

	}
	rs.close();
	ps.close();

	for (int i=row;i<10 ;i++ )
	{
		%>
		<tr align="center">
			<td>新增时间段【<%=(i+1)%>】</td>
			<td>
				<input type="text" name="kssj" value="" onDblClick="JSCalendar(this)" size="15" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="cxjssj" value="" onDblClick="JSCalendar(this)" size="15" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="qdjssj" value="" onDblClick="JSCalendar(this)" size="15" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
		</tr>
		<%
	}
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="#FFFFFF"> 
      <td colspan="11" > 
	  &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="hidden" name="cxhdbm" value="<%=cxhdbm%>">
	  <input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
      </td>
    </tr>
</table>
</form>
</body>

</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	FormName.action="SaveInsertJc_cxhdsj.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

