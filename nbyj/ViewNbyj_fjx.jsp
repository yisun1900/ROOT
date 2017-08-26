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
#div0{padding:5px;margin:0px;border:1px solid #BBE9FF;background:#9FC8DF}
#div1{padding:10px;margin:0px;border:1px solid #BBE9FF;background:#F5FBFF}
#div2{padding:3px;margin:0px;border:1px solid #BBE9FF;background:#F5FBFF}
#div222{width:20px;height:22px;padding:0px;margin:0px;cursor :pointer;border:1px solid #BBE9FF;background:#FFFFFF;star:expression(onmouseover=function(){this.style.backgroundColor="#F5FBFF"; onmouseout=function(){this.style.backgroundColor="#FFFFFF";}})}
#div3{padding:30px;margin:0px;border:0px solid #BBE9FF;background:#FFFFFF}
</style>
<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
	
	<script src="js/prototype.js" type="text/javascript"></script>
	<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="js/lightbox.js" type="text/javascript"></script>

	<style type="text/css">
		body{ color: #333; font: 13px 'Lucida Grande', Verdana, sans-serif;	}
	</style>
<%
String strAbsPath=new java.io.File(application.getRealPath(request.getRequestURI())).getParent();
String yjbh=null;
String yjzt=null;
String sjr=null;
String fjr=null;
String fssj=null;
String yjlx=null;
String sfyd=null;
String fjmc=null;
String fjym=null;
String yjnr="";
String whereyjbh=null;
String yjygbh=null;
int yyy;
oracle.sql.CLOB clob1;
char ac[] = new char[299];
yjygbh=(String)session.getAttribute("ygbh");
whereyjbh=cf.GB2Uni(request.getParameter("yjbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select yjbh,DECODE(yjlx,'J','<font color=red>紧急邮件</font>','P','普通邮件') yjlx,DECODE(sfyd,'Y','已读','N','未读') sfyd,a.yhmc sjr,b.yhmc fjr,fssj,yjlx,fjmc,fjym,yjnr,yjzt ";
	ls_sql+=" FROM nbyj_fjx,sq_yhxx a,sq_yhxx b";
	ls_sql+="  where nbyj_fjx.sjr=a.ygbh(+) and nbyj_fjx.fjr=b.ygbh(+) and  (yjbh='"+whereyjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yjbh=cf.fillNull(rs.getString("yjbh"));
		yjzt=cf.fillNull(rs.getString("yjzt"));
		sjr=cf.fillNull(rs.getString("sjr"));
		fjr=cf.fillNull(rs.getString("fjr"));
		fssj=cf.fillNull(rs.getDate("fssj"));
		yjlx=cf.fillNull(rs.getString("yjlx"));
		sfyd=cf.fillNull(rs.getString("sfyd"));
		fjmc=cf.fillNull(rs.getString("fjmc"));
		fjym=cf.fillNull(rs.getString("fjym"));
		clob1 = (oracle.sql.CLOB)rs.getObject("yjnr");
		if (clob1!=null)
		{
		Reader reader = clob1.getCharacterStream();
		while((yyy = reader.read(ac, 0, 299)) != -1)
		yjnr+= new String(ac, 0, yyy); //这就是取出来的大文本
		}
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

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#F0FaFa">
<form method="post" action="" name="insertform" target="">

<center>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>

<table style="word-break:break-all;word-wrap:break-word" width="98%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
	<tr>
	<td>
	<DIV id="div0"><span>&nbsp;&nbsp;&nbsp;<input value="返&nbsp;回" name="but2"  class=butt type="button" onClick="f_fh(insertform)" >&nbsp;&nbsp;&nbsp;<input value="删&nbsp;除" name="but3"  class=butt type="button" onClick="f_sc(insertform)" ></span>
	</DIV>
	</td>
	</tr>
	<tr>
	<td>
	<input type="hidden" value="<%=yjbh%>" name="whereyjbh">
<div id="div1"><span style="FONT-SIZE:14">主&nbsp;&nbsp;&nbsp;&nbsp;题：&nbsp;&nbsp;</span><span style="FONT-SIZE:18"><b><%=yjzt%></b></span></div>
<div id="div2"><span style="FONT-SIZE:14">发送时间：&nbsp;&nbsp;<%=fssj%>&nbsp;&nbsp;&nbsp;[<%=yjlx%>]</span></div>
<div id="div2"><span style="FONT-SIZE:14">收&nbsp;件&nbsp;人：&nbsp;&nbsp;<%=sjr%>&nbsp;&nbsp;&nbsp;[<%=sfyd%>]</span></div>
<div id="div2"><span style="FONT-SIZE:14">附&nbsp;&nbsp;&nbsp;&nbsp;件：&nbsp;&nbsp;<% 
if (fjmc!=null && fjmc.equals("N"))
{out.print("未带附件");}
else 
{out.print("<a href =\"download.jsp?filepath="+strAbsPath+"\\fj\\&filename="+fjmc+"&fjym="+fjym+"\" target=\"_back\">下载附件</a>");}
%>&nbsp;&nbsp;&nbsp;（附件上传文件名：<%=fjym%>）</span></div>
	</td>
	</tr>
	<tr>
	<td>
	<div id="div3" height="300px"><span height="300px"><%=yjnr%></span></div></td>
	</td>
	</tr>
	</tr>
	<tr>
	<td>
	<DIV id="div0"><span>&nbsp;&nbsp;&nbsp;<input value="返&nbsp;回" name="but2"  class=butt type="button" onClick="f_fh(insertform)" >&nbsp;&nbsp;&nbsp;<input value="删&nbsp;除" name="but3"  class=butt type="button" onClick="f_sc(insertform)" ></span></div>
	</td>
	</tr>
</table>
</center>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_sc(FormName)//参数FormName:Form的名称
{
	FormName.action="Delete_fjx.jsp?yjygbh=<%=yjygbh%>";
	FormName.submit();
	return true;
}
function f_fh(FormName)//参数FormName:Form的名称
{
	FormName.action="Nbyj_fjxList.jsp?yjygbh=<%=yjygbh%>";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>