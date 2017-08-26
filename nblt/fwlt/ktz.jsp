<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<link rel="StyleSheet" href="editor/base.css">
<script type="text/javascript" src="editor/editor.js"></script>
<style>
A:link,A:visited ,A:active {TEXT-DECORATION: none}
A:hover {text-decoration : none; position : relative; top : 1px; left : 1px}
#div0{padding:0px;margin:0px;border:1px solid #BBE9FF;background:#9FC8DF}
#div1{padding:10px;margin:0px;border:0px solid #BBE9FF;background:#F5FBFF}
#div222{padding:5px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;}onmouseout=function(){this.style.backgroundColor=#9FC8DF;}
#div2{padding:10px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;star:expression(onmouseover=function(){this.style.backgroundColor="#F5FBFF"; onmouseout=function(){this.style.backgroundColor="#FFFFFF";}})}
#div3{padding:50px;margin:10px;border:1px solid #BBE9FF;background:#FFFFFF}
#div4{padding:0px;margin:0px;border:1px solid #BBE9FF;background:#FFFFD9}
#div110{padding:1px;margin:0px;border:0px solid #BBE9FF;background:#9FC8DF}
#div10{padding:5px;margin:0px;border:1px solid #BBE9FF;background:#FFFFD9}
</style>
<%
//String ygbh=cf.GB2Uni(request.getParameter("gtltygbh"));
//String yhdlm=cf.GB2Uni(request.getParameter("gtltygbh"));
String ygbh=(String)session.getAttribute("ygbh");
String yhdlm=(String)session.getAttribute("yhdlm");
//out.print("asdasd"+ygbh+yhdlm);
String dlygbh=ygbh;
String ltnc=null;
String wherebkbh=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;

String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select ltnc ";
	ls_sql+=" from  nblt_grzl";
	ls_sql+=" where ltid="+dlygbh+" ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ltnc=cf.fillNull(rs.getString("ltnc"));
	}
	rs.close();
	ps.close();

	ls_sql="select bkbh ";
	ls_sql+=" from  nblt_bkgl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		wherebkbh=cf.fillNull(rs.getString("bkbh"));

		ls_sql="update nblt_bkgl set tzs=(select count(*) from nblt_ftgl where bkbh='"+wherebkbh+"'),hfs=(select count(*) from nblt_hfgl,nblt_ftgl where nblt_hfgl.tzbh=nblt_ftgl.tzbh and bkbh='"+wherebkbh+"') ";
		ls_sql+=" where  (bkbh='"+wherebkbh+"')  ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body onkeydown="f_srtz(insertform)">
<form method="post" action="" name="insertform" target="">
<center>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<table style="word-break:break-all;word-wrap:break-word" width="98%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
	<tr bgcolor="#9FC8DF">
	<td>
	<div id="div110">
	<table style="word-break:break-all;word-wrap:break-word" width="100%"  border=0><tr>
	<td width="70%">
	<select name="ssfw" id="ssfwid">
	<option value=""></option>
	<option value="1">主题</option>
	<option value="2">内容</option>
	<option value="3">回复</option>
	</select>
	<input name="ssnr" id="ssnrid" value="" type="text" size="20">
	<input type="button" name="tttr" value=" 搜 索 " onClick="f_ss(insertform)"  class=butt title="搜索贴子">
	</td>
	<td><span style="FONT-SIZE:12">我的：&nbsp;<a href="/nblt/fwlt/mytz.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>" >[贴子]</a>&nbsp;||&nbsp;<a href="/nblt/fwlt/myhf.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>">[回复]</a>&nbsp;||&nbsp;<a href="/nblt/grzlgl/xsgrzl.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>">[资料]</a></span></td>
	</tr></table>
	</div>
	</td>
	</tr>
</table>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div>
<%
String xsnc=null;
if (ltnc!=null && !(ltnc.equals("")))
{xsnc="&nbsp;&nbsp;&nbsp;欢迎：["+ltnc+"]";}
else
{xsnc="&nbsp;&nbsp;&nbsp;您还没有论坛昵称，<font color=red>不能看帖</font>，请点击右上角[资料]修改您的昵称";}
%>
<b><span id="anima" style="FONT-SIZE:16">
<%=xsnc%>
</span></b>

</DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
		<table style="word-break:break-all;word-wrap:break-word" width="98%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
		<tr>
		<td width="100%">
		<div id="div1"><span style="FONT-SIZE:14">&nbsp;</span></div>
		</td>
		</tr>
</table>

<table style="word-break:break-all;word-wrap:break-word" width="98%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
<tr  bgcolor="#FFFFFF" width="50px"  id="div10">
<td>
<table width="100%">
<tr>
	<td  width="80%">
	<span style="FONT-SIZE:12">&nbsp;&nbsp;&nbsp;板块</span>
	</td>
	<td  width="100px" align="center">
	<span style="FONT-SIZE:12">主题</span>
	</td>
	<td  width="100px" align="center">
	<span style="FONT-SIZE:12">回复</span>
	</td>
	</tr>
	</table>
</td>
</tr>

<%

String bkbh=null;
String bkmc=null;
String sfnmt="N";
int tzs=0;
int hfs=0;
try {
	conn=cf.getConnection();
	ls_sql="select bkbh,bkmc,tzs,hfs,sfnmt ";
	ls_sql+=" from  nblt_bkgl";
	if (ltnc!=null && !(ltnc.equals("")))
	{
		ls_sql+=" where (1=1) ";
	}
	else
	{
		ls_sql+=" where (1=2) ";
	}
	ls_sql+=" order by bkbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		bkbh=cf.fillNull(rs.getString("bkbh"));
		bkmc=cf.fillNull(rs.getString("bkmc"));
		tzs=rs.getInt("tzs");
		hfs=rs.getInt("hfs");
		sfnmt=cf.fillNull(rs.getString("sfnmt"));
		%>
		<tr  bgcolor="#FFFFFF" width="50px"   id="div2">
		<td>
			<table width="100%" height="100%">
			<tr>
			<td   width="80%">
			<span style="FONT-SIZE:14">&nbsp;&nbsp;<a href="zktz.jsp?bkbh=<%=bkbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>"><%=bkmc%></a>&nbsp;&nbsp;<% if (sfnmt!=null && sfnmt.equals("Y")) {out.print("<font color=red>匿名帖</font>");}%></span>
			</td>
			<td  width="100px" align="center">
			<span style="FONT-SIZE:14"><%=tzs%></span>
			</td>
			<td  width="100px" align="center">
			<span style="FONT-SIZE:14"><%=hfs%></span>
			</td>
			</tr>
			</table>
		</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<tr  bgcolor="#FFFFFF" width="50px" id="div10">
<td>
<table width="100%">
	<tr>
	<td  width="80%">
	<span style="FONT-SIZE:12">&nbsp;&nbsp;&nbsp;板块</span>
	</td>
	<td  width="100px" align="center">
	<span style="FONT-SIZE:12">主题</span>
	</td>
	<td  width="100px" align="center">
	<span style="FONT-SIZE:12">回复</span>
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
</center>
</form>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_srtz(FormName)//参数FormName:Form的名称
{
 if (FormName.ssnr.value!="" || FormName.ssfw.value!="")
	{
		if (event.keyCode==13)
		{
		f_ss(insertform);
		}
	}
}
function f_ss(FormName)//参数FormName:Form的名称
{
	var jsssfw
	var jsssnr
	jsssfw=document.getElementById('ssfwid').value
	jsssnr=document.getElementById('ssnrid').value
	if (jsssfw==null || jsssfw=="")
	{
		alert("请选择[范围]！");
		FormName.ssfw.focus();
		return false;
	}
	if (jsssnr==null || jsssnr=="")
	{
		alert("请输入[内容]！");
		FormName.ssnr.focus();
		return false;
	}
	if (jsssfw=="3")
	{
		FormName.action="mysshf.jsp?ssfw="+jsssfw+"&ssnr="+jsssnr+"&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
	}
	else
	{
		FormName.action="mysstz.jsp?ssfw="+jsssfw+"&ssnr="+jsssnr+"&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
	}
	FormName.submit();
	return true;
}

//-->
</SCRIPT>