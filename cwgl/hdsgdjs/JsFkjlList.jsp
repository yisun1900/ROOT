<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<%

	String sgd=request.getParameter("sgd");
	String gdjsjlh=request.getParameter("gdjsjlh");

	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;

try {
	conn=cf.getConnection();
%>

<form method="POST" name="listform" target="_blank">
<input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
<CENTER >
  <B><font size="3">未结算罚款记录</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="7%">处罚记录号</td>
	<td  width="6%">施工队</td>
	<td  width="6%">客户姓名</td>
	<td  width="8%">罚款总额</td>
	<td  width="5%">处罚人</td>
	<td  width="8%">处罚时间</td>
	<td  width="10%">处罚类型</td>
	<td  width="6%">审批标志</td>
	<td  width="6%">考评标志</td>
	<td  width="6%">结算标志</td>
	<td  width="29%">处罚情况说明</td>
</tr>
<%	
	String xjjlh=null;
	String sgdmc=null;
	String khxm=null;
	String khbh=null;
	double fkze=0;
	String xjr=null;
	String xjsj=null;
	String xjlxmc=null;
	String cfspbz=null;
	String kpbz=null;
	String jsbz=null;
	String bz=null;
	double allfkze=0;

	ls_sql="SELECT kp_xjgdjl.xjjlh,sgdmc,crm_khxx.khxm,crm_khxx.khbh,fkze,kp_xjgdjl.xjr,kp_xjgdjl.xjsj,xjlxmc,DECODE(cfspbz,'2','未审批','3','审批通过','4','审批未通过') cfspbz,DECODE(kp_xjgdjl.kpbz,'N','未考评','Y','已考评') kpbz,DECODE(kp_xjgdjl.jsbz,'N','未结算','Y','已结算') jsbz,kp_xjgdjl.bz ";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd,kp_xjlxbm  ";
    ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm";
    ls_sql+=" and kp_xjgdjl.sgd='"+sgd+"' and kp_xjgdjl.jsbz='N' and fkze>0 and kp_xjgdjl.cfspbz!='4'";
    ls_sql+=" order by kp_xjgdjl.khbh,kp_xjgdjl.xjjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xjjlh=cf.fillNull(rs.getString("xjjlh"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		fkze=rs.getDouble("fkze");
		xjr=cf.fillHtml(rs.getString("xjr"));
		xjsj=cf.fillHtml(rs.getDate("xjsj"));
		xjlxmc=cf.fillNull(rs.getString("xjlxmc"));
		cfspbz=cf.fillHtml(rs.getString("cfspbz"));
		kpbz=cf.fillHtml(rs.getString("kpbz"));
		jsbz=cf.fillHtml(rs.getString("jsbz"));
		bz=cf.fillHtml(rs.getString("bz"));
		allfkze+=fkze;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td >
				<input name="xjjlh" type="checkbox" value="<%=xjjlh%>">
			</td>
			<td>
				<A target='_blank' HREF="/gcgl/zjygl/xjgd/ViewKp_xjgdjl.jsp?xjjlh=<%=xjjlh%>"><%=xjjlh%></A>
			</td>
			<td><%=sgdmc%></td>
			<td><%=khxm%></td>
			<td><%=fkze%></td>
			<td><%=xjr%></td>
			<td><%=xjsj%></td>
			<td><%=xjlxmc%></td>
			<td><%=cfspbz%></td>
			<td><%=kpbz%></td>
			<td><%=jsbz%></td>
			<td><%=bz%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

%>
<tr bgcolor="#FFFFFF" align='center'>
	<td>小 计</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=allfkze%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
	<td colspan="13" > 
	<input type="button" value='结算' onclick="f_js(listform)">
	</td>
</tr>
</table>


<CENTER >
  <B><font size="3">已结算罚款记录（结算记录号：<%=gdjsjlh%>）</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="7%">处罚记录号</td>
	<td  width="6%">施工队</td>
	<td  width="6%">客户姓名</td>
	<td  width="8%">罚款总额</td>
	<td  width="5%">处罚人</td>
	<td  width="8%">处罚时间</td>
	<td  width="10%">处罚类型</td>
	<td  width="6%">审批标志</td>
	<td  width="6%">考评标志</td>
	<td  width="6%">结算标志</td>
	<td  width="29%">处罚情况说明</td>
</tr>

<%
	allfkze=0;
	ls_sql="SELECT kp_xjgdjl.xjjlh,sgdmc,crm_khxx.khxm,crm_khxx.khbh,fkze,kp_xjgdjl.xjr,kp_xjgdjl.xjsj,xjlxmc,DECODE(cfspbz,'2','未审批','3','审批通过','4','审批未通过') cfspbz,DECODE(kp_xjgdjl.kpbz,'N','未考评','Y','已考评') kpbz,DECODE(kp_xjgdjl.jsbz,'N','未结算','Y','已结算') jsbz,kp_xjgdjl.bz ";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd,kp_xjlxbm  ";
    ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm";
    ls_sql+=" and kp_xjgdjl.jsjlh='"+gdjsjlh+"'";
    ls_sql+=" order by kp_xjgdjl.khbh,kp_xjgdjl.xjjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xjjlh=cf.fillNull(rs.getString("xjjlh"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		fkze=rs.getDouble("fkze");
		xjr=cf.fillHtml(rs.getString("xjr"));
		xjsj=cf.fillHtml(rs.getDate("xjsj"));
		xjlxmc=cf.fillNull(rs.getString("xjlxmc"));
		cfspbz=cf.fillHtml(rs.getString("cfspbz"));
		kpbz=cf.fillHtml(rs.getString("kpbz"));
		jsbz=cf.fillHtml(rs.getString("jsbz"));
		bz=cf.fillHtml(rs.getString("bz"));
		allfkze+=fkze;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td >
				<input name="xjjlh" type="checkbox" value="<%=xjjlh%>">
			</td>
			<td>
				<A target='_blank' HREF="/gcgl/zjygl/xjgd/ViewKp_xjgdjl.jsp?xjjlh=<%=xjjlh%>"><%=xjjlh%></A>
			</td>
			<td><%=sgdmc%></td>
			<td><%=khxm%></td>
			<td><%=fkze%></td>
			<td><%=xjr%></td>
			<td><%=xjsj%></td>
			<td><%=xjlxmc%></td>
			<td><%=cfspbz%></td>
			<td><%=kpbz%></td>
			<td><%=jsbz%></td>
			<td><%=bz%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();
%>
<tr bgcolor="#FFFFFF" align='center'>
	<td>小 计</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=allfkze%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
	<td colspan="13" > 
	<input type="button" value='删除结算' onclick="f_scjs(listform)">
	</td>
</tr>
</table>




<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</form> 

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_js(FormName)//参数FormName:Form的名称
{

	FormName.action="SaveJsFkjl.jsp";
	FormName.submit();
	return true;
}

function f_scjs(FormName)//参数FormName:Form的名称
{

	FormName.action="DeleteJsFkjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>

