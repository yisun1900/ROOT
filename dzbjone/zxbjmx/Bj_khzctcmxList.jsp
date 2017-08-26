<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tcbm=request.getParameter("tcbm");

String tcmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;
try {
	conn=cf.getConnection();

	ls_sql="SELECT tcmc";
	ls_sql+=" FROM bj_khzctcmc";
	ls_sql+=" where khbh='"+khbh+"' and tcbm='"+tcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcmc=rs.getString("tcmc");
	}
	rs.close();
	ps.close();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3"><%=tcmc%>(<span class="STYLE2">名称相同项多选一</span>)</font></B>
</CENTER>

<form method="post" action="SaveBj_khzctcmx.jsp" name="editform" >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="18%">产品名称</td>
	<td  width="8%">选择</td>
	<td  width="29%">型号</td>
	<td  width="20%">规格</td>
	<td  width="15%">品牌</td>
	<td  width="10%">数量</td>
</tr>
<%

	String cpmc=null;
	int cpsl=0;
	String khcpbm=null;
	String xh=null;
	String gg=null;
	String ppmc=null;
	String jldw=null;
	String ydj=null;
	String tcdj=null;
	String sl=null;

	ls_sql="SELECT cpmc,cpsl,cpbm,xh,gg,ppmc,jldw,ydj,tcdj,sl";
	ls_sql+=" FROM bj_khzctcmx  ";
	ls_sql+=" where khbh='"+khbh+"' and tcbm='"+tcbm+"'";
    ls_sql+=" order by cpmc,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cpmc=cf.fillHtml(rs.getString("cpmc"));
		cpsl=rs.getInt("cpsl");
		khcpbm=cf.fillNull(rs.getString("cpbm"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		ydj=cf.fillNull(rs.getString("ydj"));
		tcdj=cf.fillNull(rs.getString("tcdj"));
		sl=cf.fillNull(rs.getString("sl"));


		if (cpsl==1)
		{
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td><%=cpmc%></td>
				<td>默认选择</td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=ppmc%></td>
				<td><%=sl%><%=jldw%></td>
			</tr>
			<%
		}
		else{

			row++;

			String cpbm=null;
			ls_sql="SELECT cpmc,cpbm,xh,gg,ppmc,jldw,ydj,tcdj,sl";
			ls_sql+=" FROM bj_zctcmx";
			ls_sql+=" where tcbm='"+tcbm+"' and cpmc='"+cpmc+"'";
			ls_sql+=" order by xh";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cpmc=cf.fillHtml(rs1.getString("cpmc"));
				cpbm=cf.fillNull(rs1.getString("cpbm"));
				xh=cf.fillHtml(rs1.getString("xh"));
				gg=cf.fillHtml(rs1.getString("gg"));
				ppmc=cf.fillHtml(rs1.getString("ppmc"));
				jldw=cf.fillHtml(rs1.getString("jldw"));
				ydj=cf.fillNull(rs1.getString("ydj"));
				tcdj=cf.fillNull(rs1.getString("tcdj"));
				sl=cf.fillNull(rs1.getString("sl"));

				String check="";
				if (khcpbm.equals(cpbm))//被选择
				{
					check="checked";
				}


				%>
				<tr bgcolor="#FFFFF"  align="center">
					<td rowspan="<%=cpsl%>"><%=cpmc%>
						<input name="cpmc" type="hidden" value="<%=cpmc%>" >
					</td>
					<td><input name="cpbm<%=row%>" type="radio" value="<%=cpbm%>" <%=check%>></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=ppmc%></td>
					<td><%=sl%><%=jldw%></td>
				</tr>
				<%
			}

			while (rs1.next())
			{
				cpmc=cf.fillHtml(rs1.getString("cpmc"));
				cpbm=cf.fillNull(rs1.getString("cpbm"));
				xh=cf.fillHtml(rs1.getString("xh"));
				gg=cf.fillHtml(rs1.getString("gg"));
				ppmc=cf.fillHtml(rs1.getString("ppmc"));
				jldw=cf.fillHtml(rs1.getString("jldw"));
				ydj=cf.fillNull(rs1.getString("ydj"));
				tcdj=cf.fillNull(rs1.getString("tcdj"));
				sl=cf.fillNull(rs1.getString("sl"));

				String check="";
				if (khcpbm.equals(cpbm))//被选择
				{
					check="checked";
				}

				%>
				<tr bgcolor="#FFFFF"  align="center">
					<td><input name="cpbm<%=row%>" type="radio" value="<%=cpbm%>" <%=check%>></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=ppmc%></td>
					<td><%=sl%><%=jldw%></td>
				</tr>
				<%
			}
			rs1.close();
			ps1.close();
		}

	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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

<tr bgcolor="#FFFFF"  align="center">
  <td colspan="8" > 
		<input type="hidden" name="tcbm"  value="<%=tcbm%>" >
		<input type="hidden" name="khbh" value="<%=khbh%>" >
		<input type="hidden" name="row" value="<%=row%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)"  >
	  <input type="reset"  value="重输">
  </td>
</tr>

</table>
</form>
</body>

</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
