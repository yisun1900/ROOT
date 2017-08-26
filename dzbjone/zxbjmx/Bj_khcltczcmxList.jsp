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
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String tcmc=cf.GB2Uni(cf.getParameter(request,"tcmc"));
String lx=request.getParameter("lx");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;
try {
	conn=cf.getConnection();


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3"><%=tcmc%></font></B>
</CENTER>

<form method="post" action="SaveEditBj_khcltcmx.jsp" name="editform" >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">删除</td>
	<td  width="10%">房间位置</td>
	<td  width="10%">产品编码</td>
	<td  width="16%">产品名称</td>
	<td  width="17%">型号</td>
	<td  width="13%">规格</td>
	<td  width="10%">品牌</td>
	<td  width="8%">计量单位</td>
	<td  width="15%">数量</td>
</tr>
<%

	String cpbm=null;
	String jgwzbm=null;
	String cpmc=null;
	int cpsl=0;
	String khcpbm=null;
	String xh=null;
	String gg=null;
	String ppmc=null;
	String jldw=null;
	String ydj=null;
	String tcdj=null;
	double sl=0;

	ls_sql="SELECT cpbm,jgwzbm,cpmc,cpbm,xh,gg,ppmc,jldw,ydj,tcdj,sl";
	ls_sql+=" FROM bj_khcltcmx  ";
	ls_sql+=" where khbh='"+khbh+"' and tcmc='"+tcmc+"'";
    ls_sql+=" order by jgwzbm,cpmc,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cpbm=cf.fillHtml(rs.getString("cpbm"));
		jgwzbm=cf.fillHtml(rs.getString("jgwzbm"));
		cpmc=cf.fillHtml(rs.getString("cpmc"));
		khcpbm=cf.fillNull(rs.getString("cpbm"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		ydj=cf.fillNull(rs.getString("ydj"));
		tcdj=cf.fillNull(rs.getString("tcdj"));
		sl=rs.getDouble("sl");

		String slStr="";
		if (sl!=0)
		{
			slStr=sl+"";
		}


		row++;


		%>
		<tr bgcolor="#FFFFF"  align="center">
			<td><A HREF="DeleteBj_khcltcmx.jsp?khbh=<%=khbh%>&cpbm=<%=cpbm%>&jgwzbm=<%=jgwzbm%>&tcmc=<%=tcmc%>" target="_blank">删除</A></td>
			<td ><%=jgwzbm%>
				<input name="cpbm" type="hidden" value="<%=cpbm%>" >
				<input name="jgwzbm" type="hidden" value="<%=jgwzbm%>" >
			</td>
			<td><%=cpbm%></td>
			<td><%=cpmc%>
			</td>
			<td><%=xh%></td>
			<td><%=gg%></td>
			<td><%=ppmc%></td>
			<td><%=jldw%></td>
			<td>
				<input type="text" name="sl" size="5" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  value="<%=slStr%>">
			</td>
		</tr>
		<%

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
  <td colspan="9" > 
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="hidden" name="lx" value="<%=lx%>" >
	<input type="hidden" name="dqbm" value="<%=dqbm%>" >
	<input type="hidden" name="tcmc" value="<%=tcmc%>" >
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
