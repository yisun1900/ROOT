<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String ssfgs=null;
String cxhdmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="SELECT ssfgs,cxhdbm";
	ls_sql+=" FROM crm_zxkhxx  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		cxhdmc=cf.fillNull(rs.getString("cxhdbm"));
	}
	rs.close();
	ps.close();


%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">选择活动赠送项目、数量(参加活动：<%=cxhdmc%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="" target="_blank">
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="25%">赠送项目</td>
	<td  width="6%">计量单位</td>
	<td  width="8%">市场单价</td>
	<td  width="6%">赠送数量上限</td>
	<td  width="6%">赠送数量下限</td>
	<td  width="8%">赠送数量</td>
	<td  width="33%">备注</td>
</tr>
<%


	String zsxm=null;
	String jldw=null;
	double cbdj=0;
	double scdj=0;
	String zsslsx=null;
	String zsslxx=null;
	String bz=null;
	int row=0;

	ls_sql="SELECT zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz ";
	ls_sql+=" FROM jc_hdzsxx  ";
	ls_sql+=" where cxhdmc='"+cxhdmc+"' and fgsbh='"+ssfgs+"'";
	ls_sql+=" order by  zsxm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=rs.getDouble("cbdj");
		scdj=rs.getDouble("scdj");
		zsslsx=cf.fillNull(rs.getString("zsslsx"));
		zsslxx=cf.fillNull(rs.getString("zsslxx"));
		bz=cf.fillHtml(rs.getString("bz"));

		row++;

		String sjsl="";
		ls_sql="SELECT sjsl";
		ls_sql+=" FROM crm_khzsxx  ";
		ls_sql+=" where khbh='"+khbh+"' and zsxm='"+zsxm+"'";
		ls_sql+=" order by  zsxm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsl=cf.fillNull(rs1.getString("sjsl"));
		}
		rs1.close();
		ps1.close();

		%>
		<tr align="center">
			<td><%=zsxm%><span class="STYLE3">（可多选）</span>
			  <input type="hidden" name="zsxm" value="<%=zsxm%>" size="80" maxlength="100">
			  <input type="hidden" name="lx" value="1"  >
			</td>
			<td><%=jldw%></td>
			<td><%=scdj%></td>
			<td><%=zsslsx%></td>
			<td><%=zsslxx%></td>
			<td>
				<input type="text" name="sl" value="<%=sjsl%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=bz%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();


	ls_sql="SELECT zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz ";
	ls_sql+=" FROM jc_hddxzsxx  ";
	ls_sql+=" where cxhdmc='"+cxhdmc+"' and fgsbh='"+ssfgs+"'";
	ls_sql+=" order by  zsxm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=rs.getDouble("cbdj");
		scdj=rs.getDouble("scdj");
		zsslsx=cf.fillNull(rs.getString("zsslsx"));
		zsslxx=cf.fillNull(rs.getString("zsslxx"));
		bz=cf.fillHtml(rs.getString("bz"));

		row++;

		String sjsl="";
		ls_sql="SELECT sjsl";
		ls_sql+=" FROM crm_khzsxx  ";
		ls_sql+=" where khbh='"+khbh+"' and zsxm='"+zsxm+"'";
		ls_sql+=" order by  zsxm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsl=cf.fillNull(rs1.getString("sjsl"));
		}
		rs1.close();
		ps1.close();



		%>
		<tr align="center">
			<td><%=zsxm%><span class="STYLE1">（多选一）</span>
			  <input type="hidden" name="zsxm" value="<%=zsxm%>" size="80" maxlength="100">
			  <input type="hidden" name="lx" value="2"  >
			</td>
			<td><%=jldw%></td>
			<td><%=scdj%></td>
			<td><%=zsslsx%></td>
			<td><%=zsslxx%></td>
			<td>
				<input type="text" name="sl" value="<%=sjsl%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=bz%></td>
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
		<input type="hidden" name="khbh" value="<%=khbh%>">
		<input type="hidden" name="cxhdbm" value="<%=cxhdmc%>">
		<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
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
	FormName.action="SaveInsertCrm_khzsxx.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>

