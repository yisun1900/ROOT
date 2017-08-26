<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
	String bkbh=cf.GB2Uni(request.getParameter("bkbh"));
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>优铂利论坛系统</title>
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

</head>
<body>

<form method="post" name="selectform" enctype="multipart/form-data">
<DIV>&nbsp;</DIV>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#6996b7" cellpadding="1" cellspacing="1">
<tr bgcolor="#F0FaFa">
  <td align="right">
</DIV>
<DIV align="center" width="80%">
<DIV>&nbsp;</DIV>
<DIV ><b>主&nbsp;&nbsp;题&nbsp;: </b><input type="txt" value="" name="ftzt"  size="88" class=inpt></DIV>
<input type="hidden" value="<%=bkbh%>" name="bkbh" >
<DIV>&nbsp;</DIV>
<DIV ><b>附&nbsp;&nbsp;件&nbsp;: </b><input type="file" name="ftfj" size="76"  class=inpt></DIV>
<DIV>&nbsp;</DIV>
<div id="editor_body"></div>
<input type="hidden" value="" name="ftnr">
<DIV>&nbsp;</DIV>
<DIV>
&nbsp;&nbsp;&nbsp;<input type="button"  value=" 发 帖 " onClick="f_ph(selectform)"  class=butt title="提交发帖">&nbsp;&nbsp;||&nbsp;&nbsp;&nbsp;<input type="radio" name="sfyxhf" value="Y" checked>允许回贴
 <input type="radio" name="sfyxhf" value="N" >
 不许回贴 &nbsp;&nbsp;||&nbsp;&nbsp;<input type="hidden" name="sfzd" value="N" >

</DIV>
<DIV>&nbsp;</DIV>
</DIV>

</form>
</body>
</html>
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
function init() {
	writeCookie("EDiaryEditor_RSave", "true", 1);
	//et = new word("editor_body", "");
	if(sState == "iframe"){
		EDiaryEditor.initialize("EDiaryEditor", "editor_body", true, "<div>&nbsp;</div>");
		et = EDiaryEditor;
	}else{
		EDiaryEditor.initialize("EDiaryEditor", "editor_body", true, "");
		et = EDiaryEditor;
	}
		try{
		$('editor_body_area').onfocus = function(){
			checkEdit = setInterval("save_article()", 300000);
		}
		$('editor_body_area').onblur = function(){
			setTimeout("save_article()", 300000);
			clearInterval(checkEdit);
		}
	}catch(e){}
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
	var jcsjr,allsjr,dgsjr;
		var cnt1, cnt2;
		var len1=0;
		var str;
		var FieldName;
	if(	javaTrim(FormName.ftzt)=="") {
		alert("请输入[主题]！");
		FormName.ftzt.focus();
		return false;
	}
	if(	javaTrim(FormName.bkbh)=="") {
		alert("请输入[板块编号]！");
		FormName.bkbh.focus();
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
		alert("发帖前必须先[预览文章]或者[显示源代码]!");
		return false;
	}
	
//	alert(FormName.editor_body_textarea.value);
//	alert(FormName.ftnr.value);
	FormName.action="tjtz.jsp";
	FormName.submit();
	return true;
	}
};
//-->
</SCRIPT>
