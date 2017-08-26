<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String bgcolor="";

int row=0;

String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String bfcs=cf.GB2Uni(request.getParameter("bfcs"));

String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
double qye=0;

try {
	conn=cf.getConnection();

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队级别调结算比例－－设置<font color="#FF0000">（可根据不同的级别，增加或减少结算比例）</font></font></B>
</CENTER>


<form method="POST" name="listform" action=""  >
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">施工队级别</td>
	<td  width="11%">结算比例</td>
	<td  width="11%">作用范围</td>
</tr>
<%
	String sgdjbbm=null;
	double jsbl=0;
	String zyfw=null;

	ls_sql="SELECT sgdjbbm,jsbl,zyfw ";
	ls_sql+=" FROM dm_jbtjsbl ";
	ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs='"+bfcs+"' ";
    ls_sql+=" order by sgdjbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sgdjbbm=rs.getString("sgdjbbm");
		jsbl=rs.getDouble("jsbl");
		zyfw=rs.getString("zyfw");

		row++;


		if (row%2==0)
		{
			bgcolor="E8E8FF";
		}
		else{
			bgcolor="FFFFFF";
		}


		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
		  <td>
				<select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm",sgdjbbm);
%>
                </select>			</td>
			<td>
				<input type="text" name="jsbl" value="<%=jsbl%>" size="8" maxlength="12" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >%
			</td>
		  <td>
				<select name="zyfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+全部&2+影响工程直接费&3+影响其它收费",zyfw);
%>
                </select>			</td>
		</tr>

		<%	

	
	}
	rs.close();
	ps.close();

	for (int i=row;i<10 ;i++ )
	{
		%>
		<tr bgcolor="<%=bgcolor%>" align="center">
		  <td>
				<select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm","");
%>
                </select>			</td>
			<td>
				<input type="text" name="jsbl" value="" size="8" maxlength="12" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >%
			</td>
		  <td>
				<select name="zyfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+全部&2+影响工程直接费&3+影响其它收费","");
%>
                </select>			</td>
		</tr>

		<%	
	}




}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
	<td colspan="14" align="center" > 
		<input type="hidden" name="fgsbh" value="<%=fgsbh%>">
		<input type="hidden" name="bfcs" value="<%=bfcs%>">
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value=' 重 输 ' name="reset" >	</td>
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
	FormName.action="SaveInsertDm_jbtjsbl.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

