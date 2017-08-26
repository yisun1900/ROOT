<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ddbh=request.getParameter("ddbh");
	String zjxxh=request.getParameter("zjxxh");
%>
<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<form method="POST" name="listform" action="">
<CENTER >
    <B><font size="2">成品家具--增减已有项（订单编号：<%=ddbh%>）</font></B> 
</CENTER>
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">合同数量</td>
	<td  width="5%">目前数量</td>
	<td  width="6%">目前总价-折后</td>
	<td  width="6%">目前总价-折前</td>
	<td  width="6%">增减数量(减为负)</td>
	<td  width="9%">家具名称</td>
	<td  width="9%">型号</td>
	<td  width="11%">规格(mm)</td>
	<td  width="11%">材质</td>
	<td  width="12%">花色纹理</td>
	<td  width="20%">备注</td>
</tr>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor="";

String cpjjbh=null;
String cpjjmc=null;
String cpjjfg=null;
String gg=null;
String xh=null;
String ys=null;
String cpjjcz=null;
String cpjjhs=null;
int sl=0;
int zjhsl=0;
double zjhzj=0;
double zqzjhzj=0;
String bz=null;

int row=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT cpjjbh,cpjjmc,cpjjfg,gg,xh,ys,cpjjcz,cpjjhs,bzdj,khdj,sl,zjhsl,zjhzj,zqzjhzj,bz  ";
	ls_sql+=" FROM jc_cpjjddmx  ";
    ls_sql+=" where ddbh='"+ddbh+"'";
    ls_sql+=" and cpjjbh not in(select cpjjbh from jc_cpjjzjxmx where zjxxh='"+zjxxh+"' and lx='2')";
    ls_sql+=" order by cpjjbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cpjjbh=cf.fillHtml(rs.getString("cpjjbh"));
		cpjjmc=cf.fillHtml(rs.getString("cpjjmc"));
		cpjjfg=cf.fillHtml(rs.getString("cpjjfg"));
		gg=cf.fillHtml(rs.getString("gg"));
		xh=cf.fillHtml(rs.getString("xh"));
		ys=cf.fillHtml(rs.getString("ys"));
		cpjjcz=cf.fillHtml(rs.getString("cpjjcz"));
		cpjjhs=cf.fillHtml(rs.getString("cpjjhs"));
		sl=rs.getInt("sl");
		zjhsl=rs.getInt("zjhsl");
		zjhzj=rs.getDouble("zjhzj");
		zqzjhzj=rs.getDouble("zqzjhzj");
		bz=cf.fillHtml(rs.getString("bz"));

		int zjsl=0;
		int ysl=0;
		int xsl=0;

		//如果是已选增减项，[原数量]、[原总价]从表：成品家具增减项明细（jc_cpjjzjxmx）中重新取值
		ls_sql="SELECT ysl,xsl";
		ls_sql+=" FROM jc_cpjjzjxmx  ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and cpjjbh='"+cpjjbh+"'";
		ls_sql+=" order by cpjjbh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ysl=rs1.getInt("ysl");
			xsl=rs1.getInt("xsl");

			zjsl=xsl-ysl;
		}
		rs1.close();
		ps1.close();


		if (row%2==0)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}
		
		
		%>
		<tr bgcolor="<%=bgcolor%>" align="center"> 
			<td><%=sl%></td>
			<td><%=zjhsl%></td>
			<td><%=zjhzj%></td>
			<td><%=zqzjhzj%></td>
			<td>
				<input name="cpjjbh" type="hidden" value=<%=cpjjbh%>>
				<input type="text" name="xsl" size="5" maxlength="5" value="<%=zjsl%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(xsl[<%=(row+1)%>])" >
			</td>
			<td><%=cpjjmc%></td>
			<td><%=xh%></td>
			<td><%=gg%></td>
			<td><%=cpjjcz%></td>
			<td><%=cpjjhs%></td>
			<td align="left"><%=bz%></td>
	    </tr>
		<%
		row++;
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
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="11" > 
		<input name="ddbh" type="hidden" value=<%=ddbh%>>
		<input name="zjxxh" type="hidden" value=<%=zjxxh%>>
	  <input type=button value='存盘' onClick="cf_submit(listform)" name="sl">
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="reset" value='重输' name="reset" >      </td>
    </tr>
  </table>
</form>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function cf_submit(formName)
{
	formName.action="Jc_cpjjddmxJx.jsp";
	formName.submit();
	return true;
} 
//-->
</script>

