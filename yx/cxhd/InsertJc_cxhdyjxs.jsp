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
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">录入促销活动业绩系数(促销活动:<%=cxhdmc%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">业绩系数编码</td>
	<td  width="25%">业绩系数名称</td>
	<td  width="25%">业绩系数</td>
</tr>
<%

try {
	conn=cf.getConnection();

	String yjxsbm=null;
	String yjxsmc=null;
	String yjxsstr=null;
	double yjxs=0;

	ls_sql="SELECT yjxsbm,yjxsmc";
	ls_sql+=" FROM jc_cxhdyjxsbm  ";
	ls_sql+=" order by  yjxsbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yjxsbm=cf.fillNull(rs.getString("yjxsbm"));
		yjxsmc=cf.fillNull(rs.getString("yjxsmc"));

		yjxs=0;
		ls_sql="SELECT yjxs";
		ls_sql+=" FROM jc_cxhdyjxs";
		ls_sql+=" where jc_cxhdyjxs.cxhdbm='"+cxhdbm+"' and yjxsbm='"+yjxsbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yjxs=rs1.getDouble("yjxs");
		}
		rs1.close();
		ps1.close();

		if (yjxs==0)
		{
			yjxsstr="";
		}
		else{
			yjxsstr=""+yjxs;
		}


		%>
		<tr align="center">
			<td><%=yjxsbm%>
				<input type="hidden" name="yjxsbm" value="<%=yjxsbm%>">
			</td>
			<td><%=yjxsmc%></td>
			<td>
				<input type="text" name="yjxs" value="<%=yjxsstr%>" size="15" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
		</tr>
		<%

	}
	rs.close();
	ps.close();
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	FormName.action="SaveInsertJc_cxhdyjxs.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

