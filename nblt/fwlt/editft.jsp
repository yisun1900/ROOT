<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<link rel="StyleSheet" href="editor/base.css">
<script type="text/javascript" src="editor/editor.js"></script>
<script type="text/javascript">
var guid = "1324481743" ;
var sState = "iframe";
var checkEdit;

function save_article(){
	et.save();
	if(exist('editor_body_textarea')){
		setCopy($('editor_body_textarea').value);
	}else if(exist('editor_body_area')){
		setCopy($('editor_body_area').value);
	}
}
function article_preview(){
	if (check_editor()){
		var editor_win = window.open('', "_blank", '');
			editor_win.document.open('text/html', 'replace');
			editor_win.opener = null 
			editor_win.document.writeln($('editor_body_textarea').value);
			editor_win.document.close();
		}
}
function check_editor(){
	var err_msg = '请先输入文章内容';
	if ($('editor_body_textarea').value.toLowerCase() =="<div>&nbsp;</div>" ||$('editor_body_textarea').value ==""){ 
		alert(err_msg);
		return false;
	}
	else if($('editor_body_textarea').value.toLowerCase() =="<p>&nbsp;</p>" ||$('editor_body_textarea').value ==""){ 
		alert(err_msg);
		return false;
	}
	else
		return true;
}
</script>
<style>
A:link,A:visited ,A:active {TEXT-DECORATION: none}
A:hover {text-decoration : none; position : relative; top : 1px; left : 1px}
#div0{padding:0px;margin:0px;border:1px solid #BBE9FF;background:#9FC8DF}
#div1{padding:10px;margin:0px;border:1px solid #BBE9FF;background:#F5FBFF}
#div222{padding:5px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;}onmouseout=function(){this.style.backgroundColor=#9FC8DF;}
#div2{width:20px;height:22px;padding:0px;margin:0px;border:1px solid #BBE9FF;background:#FFFFFF;star:expression(onmouseover=function(){this.style.backgroundColor="#F5FBFF"; onmouseout=function(){this.style.backgroundColor="#FFFFFF";}})}
#div3{padding:3px;margin:0px;border:0px solid #BBE9FF;background:#FFFFFF}
#div10{padding:10px;margin:0px;border:1px solid #BBE9FF;background:#9FC8DF}
#div4{padding:30px;margin:0px;border:0px solid #BBE9FF;background:#FFFFFF}
#div110{padding:1px;margin:0px;border:0px solid #BBE9FF;background:#9FC8DF}

#table1{border:1px solid #BBE9FF;background:#FFFFFF }
</style>
<%
String wheretzbh=cf.GB2Uni(request.getParameter("tzbh"));
String ygbh=(String)session.getAttribute("ygbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String tzbh= null;
String bkbh= null;
String ftzt= null;
String ftr= null;
String ftsj= null;
String zhxgsj= null;
String djcs= null;
String hfcs= null;
String sfzd= null;
String sfyxhf= null;
String fjmc= null;
String fjym= null;
String ftnr= "";
String ytnr= null;
String zhhfr= null;
String zhhfsj= null;
String ftygbh=null;
String bkmc=null;

oracle.sql.CLOB clob;
String   s=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select tzbh,nblt_ftgl.bkbh bkbh,ftzt,ftr,ftsj,zhxgsj,djcs,hfcs,sfzd,sfyxhf,fjmc,fjym,ftnr,ytnr,zhhfr,zhhfsj,bkmc ";
	ls_sql+=" from nblt_ftgl,nblt_bkgl ";
	ls_sql+=" where nblt_ftgl.bkbh=nblt_bkgl.bkbh and (tzbh='"+wheretzbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bkmc=cf.fillNull(rs.getString("bkmc"));
		ftr=cf.fillNull(rs.getString("ftr"));
		ftzt=cf.fillNull(rs.getString("ftzt"));
		tzbh=cf.fillNull(rs.getString("tzbh"));
		sfyxhf=cf.fillNull(rs.getString("sfyxhf"));

		ftsj=cf.fillNull(rs.getString("ftsj"));
		fjmc=cf.fillNull(rs.getString("fjmc"));
		fjym=cf.fillNull(rs.getString("fjym"));
		zhhfr=cf.fillNull(rs.getString("zhhfr"));
		zhhfsj=cf.fillNull(rs.getString("zhhfsj"));
		bkbh=cf.fillNull(rs.getString("bkbh"));

		clob = (oracle.sql.CLOB)rs.getClob("ftnr");   
		if(clob!=null)
		{
			Reader is=clob.getCharacterStream();   
			BufferedReader br=new BufferedReader(is);   
			s=br.readLine();   
			while(s!=null)
			{   
				ftnr+=s;   
				s=br.readLine();   
			}   
		}   


		sfzd=cf.fillNull(rs.getString("sfzd"));

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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform">
<center>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>
<table style="word-break:break-all;word-wrap:break-word" width="98%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
	<tr>
	<td>
	<div id="div110">
	<table style="word-break:break-all;word-wrap:break-word"><tr>
	<td width="550px"><span style="FONT-SIZE:14">[优铂利论坛系统－编辑帖子]</span></td>
	<td><span style="FONT-SIZE:12">我的：&nbsp;贴子&nbsp;||&nbsp;回复&nbsp;||&nbsp;资料</span></td>
	</tr></table>
	</div>
	</td>
	</tr>
</table><table style="word-break:break-all;word-wrap:break-word" width="98%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
<tr>
    <td colspan="2" bgcolor="#BBE9FF">
	<table style="word-break:break-all;word-wrap:break-word" width="100%" bgcolor="#F5FBFF" >
		<tr>
		<td width="90%">
		<span style="FONT-SIZE:12">&nbsp;&nbsp;<a href="ktz.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>">首页</a>&nbsp;&nbsp;||&nbsp;&nbsp;<a href="zktz.jsp?bkbh=<%=bkbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>"><%=bkmc%></a>&nbsp;&nbsp;||&nbsp;&nbsp;<a href="cktz.jsp?tzbh=<%=tzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>"><%=ftzt%></a></span>
		</td>
		 <td width="10%" align="right">
		 <a href="newtz.jsp?bkbh=<%=bkbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>" onFocus=this.blur()><img src="image/newtopic.gif" border=0></a> 
		</td> 
		</tr>
</table>
<div><span style="FONT-SIZE:4">&nbsp;</span></DIV>


	</td><tr></table>

<!-- 回贴部分 -->

<DIV height="4px">&nbsp;</DIV>
<table style="word-break:break-all;word-wrap:break-word" width="98%" id="table2" border=0 cellpadding=0 cellspacing=1 bgcolor="#BBE9FF">
  <tr align="center">
    <td bgcolor="#FFFFFF"><div id="div3">
<DIV ><b>主&nbsp;&nbsp;题&nbsp;: </b><input type="txt" value="<%=ftzt%>" name="ftzt"  size="88" class=inpt></DIV>
	<input name="tzbh" value="<%=wheretzbh%>" type="hidden">
	<div id="editor_body"></div>
<input type="hidden" value="" name="ftnr"> 
	<br>&nbsp;<br>&nbsp;&nbsp;&nbsp;<input type="button" name="tttr" value=" 编 辑 " onClick="f_ph(insertform)"  class=butt title="编辑">&nbsp;&nbsp;||&nbsp;&nbsp;&nbsp;
	<input type="radio" name="sfyxhf" value="Y" <%if (sfyxhf.equals("Y")){out.print("checked");}%>>
	允许回贴
 <input type="radio" name="sfyxhf" value="N" <%if (sfyxhf.equals("N")){out.print("checked");}%>>
 不许回贴 &nbsp;&nbsp;||&nbsp;</DIV></td>
  </tr>
</table>
</center>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script type="text/javascript">
// "EditerBox" 就是 textarea 的名子
var et;
//自动保存历史开关
function readCookie(name)
{
var cookieValue = "";
var search = name + "=";
if(document.cookie.length > 0)
{ 
offset = document.cookie.indexOf(search);
if (offset != -1)
{ 
 offset += search.length;
 end = document.cookie.indexOf(";", offset);
 if (end == -1) end = document.cookie.length;
 cookieValue = unescape(document.cookie.substring(offset, end))
}
}
return cookieValue;
}

function writeCookie(name, value, hours)
{
var expire = "";
if(hours != null)
{
expire = new Date((new Date()).getTime() + hours * 3600000);
expire = "; expires=" + expire.toGMTString();
}
document.cookie = name + "=" + escape(value) + expire + ";path=/";
}

function init() 
{
	writeCookie("EDiaryEditor_RSave", "true", 1);

	var ftnr="<%=ftnr.replace("\"","\'")%>";

	if(sState == "iframe"){
		EDiaryEditor.initialize("EDiaryEditor", "editor_body", true,ftnr);
		et = EDiaryEditor;
	}else{
		EDiaryEditor.initialize("EDiaryEditor", "editor_body", true, ftnr);
		et = EDiaryEditor;
	}

	try{
		$('editor_body_area').onfocus = function()
		{
			checkEdit = setInterval("save_article()", 300000);
		}

		$('editor_body_area').onblur = function()
		{
			setTimeout("save_article()", 300000);
			clearInterval(checkEdit);
		}
	}
	catch(e)
	{
	}
}

	if(window.Event)
        	window.onload = init;
	else
        	setTimeout(init, 10);
</script>
 <SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_ph(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ftzt)=="") {
		alert("请输入[主题]！");
		FormName.ftzt.focus();
		return false;
	}

	var jcsjr,allsjr,dgsjr;
		var cnt1, cnt2;
		var len1=0;
		var str;
		var FieldName;
	if(	javaTrim(FormName.tzbh)=="") {
		alert("请输入[帖子编号]！");
		FormName.tzbh.focus();
		return false;
	}
	var err_msg = '请输入内容;如果您已经输入内容请点击[显示源代码]!';
	if ($('editor_body_textarea').value.toLowerCase() =="<div>&nbsp;</div>"){ 
		alert(err_msg);
		return false;
	}
	else if($('editor_body_textarea').value.toLowerCase() =="<p>&nbsp;</p>"){ 
		alert(err_msg);
		return false;
	}
	else
	{
//	$("editor_body_textarea").value = this._this.iframe.contentWindow.document.body.innerHTML;
	FormName.ftnr.value=$('editor_body_textarea').value.toLowerCase()
	if (FormName.ftnr.value==null || FormName.ftnr.value=="")
		{
			alert("编辑前必须先[预览文章]或者[显示源代码]!");
			return false;
		}
	}
	FormName.action="saveeditft.jsp?yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>";
	FormName.submit();
	return true;
};
//-->
</SCRIPT>