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
  <B><font size="3">未结算维修记录</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">序号</td>
	<td  width="6%">施工队</td>
	<td  width="6%">客户姓名</td>
	<td  width="6%">报修记录号</td>
	<td  width="5%">是否特殊情况</td>
	<td  width="25%">报修内容</td>
	<td  width="7%">受理时间</td>
	<td  width="7%">结案状态</td>
	<td  width="8%">维修总费用</td>
	<td  width="8%">施工队承担费用</td>
	<td  width="5%">结算标志</td>
</tr>
<%	
	String lrxh=null;
	String sgdmc=null;
	String khxm=null;
	String khbh=null;
	String tsjlh=null;
	String sftsqk=null;
	String tsnr=null;
	String slsj=null;
	String jazt=null;
	double wxzfy=0;
	double zrfcdfy=0;
	String jsbz=null;
	double allwxzfy=0;
	double allzrfcdfy=0;

	ls_sql="SELECT lrxh,sgdmc,crm_khxx.khxm,crm_khxx.khbh,crm_tsjl.tsjlh,DECODE(crm_tsjl.sftsqk,'Y','特殊','N','否') sftsqk";
	ls_sql+=" ,crm_tsjl.tsnr,crm_tsjl.slsj, DECODE(crm_tsjl.clzt,'0','非客服登记','1','客服受理','2','在处理','3','结案','9','不立案') jazt";
	ls_sql+=" ,crm_wxfmx.wxzfy,crm_wxfmx.zrfcdfy,DECODE(crm_wxfmx.jsbz,'N','未结算','Y','已结算') jsbz";
	ls_sql+=" FROM crm_khxx,crm_tsjl,sq_sgd,crm_wxfmx";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_tsjl.tsjlh=crm_wxfmx.tsjlh";
    ls_sql+=" and crm_khxx.sgd='"+sgd+"' and crm_wxfmx.jsbz='N'";
    ls_sql+=" order by crm_tsjl.khbh,crm_tsjl.tsjlh,crm_wxfmx.lrxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lrxh=cf.fillNull(rs.getString("lrxh"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		sftsqk=cf.fillHtml(rs.getString("sftsqk"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		slsj=cf.fillHtml(rs.getDate("slsj"));
		jazt=cf.fillHtml(rs.getString("jazt"));
		wxzfy=rs.getDouble("wxzfy");
		zrfcdfy=rs.getDouble("zrfcdfy");
		jsbz=cf.fillHtml(rs.getString("jsbz"));

		allwxzfy+=wxzfy;
		allzrfcdfy+=zrfcdfy;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td >
				<input name="lrxh" type="checkbox" value="<%=lrxh%>">
			</td>
			<td><%=lrxh%></td>
			<td><%=sgdmc%></td>
			<td><%=khxm%></td>
			<td><A target='_blank' HREF="/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>"><%=tsjlh%></A></td>
			<td><%=sftsqk%></td>
			<td><%=tsnr%></td>
			<td><%=slsj%></td>
			<td><%=jazt%></td>
			<td><%=wxzfy%></td>
			<td><%=zrfcdfy%></td>
			<td><%=jsbz%></td>
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
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=allwxzfy%></td>
	<td><%=allzrfcdfy%></td>
	<td >&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
	<td colspan="12" > 
	<input type="button" value='结算' onclick="f_js(listform)">
	</td>
</tr>
</table>


<CENTER >
  <B><font size="3">已结算维修记录（结算记录号：<%=gdjsjlh%>）</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">序号</td>
	<td  width="6%">施工队</td>
	<td  width="6%">客户姓名</td>
	<td  width="6%">报修记录号</td>
	<td  width="5%">是否特殊情况</td>
	<td  width="25%">报修内容</td>
	<td  width="7%">受理时间</td>
	<td  width="7%">结案状态</td>
	<td  width="8%">维修总费用</td>
	<td  width="8%">施工队承担费用</td>
	<td  width="5%">结算标志</td>
</tr>

<%
	allwxzfy=0;
	allzrfcdfy=0;
	ls_sql="SELECT lrxh,sgdmc,crm_khxx.khxm,crm_khxx.khbh,crm_tsjl.tsjlh,DECODE(crm_tsjl.sftsqk,'Y','特殊','N','否') sftsqk";
	ls_sql+=" ,crm_tsjl.tsnr,crm_tsjl.slsj, DECODE(crm_tsjl.clzt,'0','非客服登记','1','客服受理','2','在处理','3','结案','9','不立案') jazt";
	ls_sql+=" ,crm_wxfmx.wxzfy,crm_wxfmx.zrfcdfy,DECODE(crm_wxfmx.jsbz,'N','未结算','Y','已结算') jsbz";
	ls_sql+=" FROM crm_khxx,crm_tsjl,sq_sgd,crm_wxfmx";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_tsjl.tsjlh=crm_wxfmx.tsjlh";
    ls_sql+=" and crm_wxfmx.jsjlh='"+gdjsjlh+"' ";
    ls_sql+=" order by crm_tsjl.khbh,crm_tsjl.tsjlh,crm_wxfmx.lrxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lrxh=cf.fillNull(rs.getString("lrxh"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		sftsqk=cf.fillHtml(rs.getString("sftsqk"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		slsj=cf.fillHtml(rs.getDate("slsj"));
		jazt=cf.fillHtml(rs.getString("jazt"));
		wxzfy=rs.getDouble("wxzfy");
		zrfcdfy=rs.getDouble("zrfcdfy");
		jsbz=cf.fillHtml(rs.getString("jsbz"));

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td >
				<input name="lrxh" type="checkbox" value="<%=lrxh%>">
			</td>
			<td><%=lrxh%></td>
			<td><%=sgdmc%></td>
			<td><%=khxm%></td>
			<td><A target='_blank' HREF="/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>"><%=tsjlh%></A></td>
			<td><%=sftsqk%></td>
			<td><%=tsnr%></td>
			<td><%=slsj%></td>
			<td><%=jazt%></td>
			<td><%=wxzfy%></td>
			<td><%=zrfcdfy%></td>
			<td><%=jsbz%></td>
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
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=allwxzfy%></td>
	<td><%=allzrfcdfy%></td>
	<td >&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
	<td colspan="12" > 
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

	FormName.action="SaveJsWxjl.jsp";
	FormName.submit();
	return true;
}

function f_scjs(FormName)//参数FormName:Form的名称
{

	FormName.action="DeleteJsWxjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>

