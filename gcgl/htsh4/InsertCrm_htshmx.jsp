<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String khxm=cf.executeQuery("select khxm from crm_khxx where khbh='"+khbh+"'");
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">合同审核项目（客户姓名：<%=khxm%>）</font></B>
</CENTER>
<form method="POST" name="listform" action="SaveInsertCrm_htshmx.jsp">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#FFFFFF">
	<td colspan="7" align="center"> 
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
	<input type="button" value='保存审核结果' onclick="f_do(listform)">
	</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">项目编码</td>
	<td  width="7%">不合格数</td>
	<td  width="47%">审核项目</td>
	<td  width="7%">单项扣分</td>
	<td  width="16%">项目小类</td>
	<td  width="12%">项目大类</td>
</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String shxmbm=null;
String shxmmc=null;
String shxmdlmc=null;
String shxmxlmc=null;
String kf=null;

String bgcolor="#FFFFFF"  ;
int row=0;
try {
	conn=cf.getConnection();



	ls_sql="SELECT dm_shxmbm.shxmbm,dm_shxmbm.shxmmc,dm_shxmdlbm.shxmdlmc,dm_shxmxlbm.shxmxlmc,dm_shxmbm.kf";
	ls_sql+=" FROM dm_shxmxlbm,dm_shxmdlbm,dm_shxmbm  ";
    ls_sql+=" where dm_shxmbm.shxmxlbm=dm_shxmxlbm.shxmxlbm";
    ls_sql+=" and dm_shxmbm.shxmdlbm=dm_shxmdlbm.shxmdlbm ";
    ls_sql+=" order by dm_shxmbm.shxmdlbm,dm_shxmbm.shxmxlbm,dm_shxmbm.shxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		shxmbm=cf.fillNull(rs.getString("shxmbm"));
		shxmmc=cf.fillNull(rs.getString("shxmmc"));
		shxmdlmc=cf.fillNull(rs.getString("shxmdlmc"));
		shxmxlmc=cf.fillNull(rs.getString("shxmxlmc"));
		kf=cf.fillNull(rs.getString("kf"));


		String bhgsl="";

		ls_sql="select bhgsl";
		ls_sql+=" from  crm_htshmx";
		ls_sql+=" where  khbh='"+khbh+"' and shxmbm='"+shxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			bhgsl=rs1.getString(1);
		}
		rs1.close();
		ps1.close();


		if (row%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td><%=shxmbm%></td>
			<td>
				<input name="shxmbm" type="hidden" value="<%=shxmbm%>">
				<select name="bhgsl" style="FONT-SIZE:12PX;WIDTH:52PX">
				  <option value=""></option>
		<%
			cf.selectToken(out,"1+1项&2+2项&3+3项&4+4项&5+5项&6+6项&7+7项&8+8项&9+9项&10+10项",bhgsl);
		%>
			</td>
			<td align="left"><%=shxmmc%></td>
			<td><%=kf%></td>
			<td><%=shxmxlmc%></td>
			<td><%=shxmdlmc%></td>
		</tr>

		<%
		row++;
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<tr bgcolor="#FFFFFF">
	<td colspan="7" align="center"> 
	<input type="button" value='保存审核结果' onclick="f_do(listform)">
	</td>
</tr>
</table>
</form> 
</html>

<script  LANGUAGE="javascript">
<!--

function f_do(formName)
{
	formName.submit();
	return true;
} 
//-->
</script>
