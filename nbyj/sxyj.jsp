<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>优铂利邮件系统</title>
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
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
String yhdlm=(String)session.getAttribute("yhdlm");
%>
<form method="post" name="selectform" enctype="multipart/form-data">
<DIV>&nbsp;</DIV>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#6996b7" cellpadding="1" cellspacing="1">
<tr bgcolor="#F0FaFa">
  <td align="right">
<DIV align="left"  style="float: left">&nbsp;
</DIV>
<DIV align="left" width="80%" style="float: left">
<DIV >&nbsp;</DIV>
<DIV width="150px"><b>收件人&nbsp;: </b>
<span name="sjrname" id="intSrc" style="width:515px; FONT-SIZE: 12px;" class=inpt></span><span id="qk" title="双击清空收件人"  ondblclick=" removeInput2(this,selectform)" style="cursor:hand" onMouseOut="this.style.backgroundColor='#F0FAFA'" onMouseOver="this.style.backgroundColor='#FF0000'"><b>[清空]</b></span></DIV>
<input type="hidden" value="" name="sjr" id="intSrc2" size="88">
<DIV>&nbsp;</DIV>
<DIV ><b>主&nbsp;&nbsp;题&nbsp;: </b><input type="txt" value="" name="yjzt"  size="76" class=inpt></DIV>
<input type="hidden" value="<%=ygbh%>" name="fjrygbh"  size="88" class=inpt>
<DIV>&nbsp;</DIV>
<DIV ><b>附&nbsp;&nbsp;件&nbsp;: </b><input type="file" name="yjfj" size="76"  class=inpt></DIV>
<DIV ><b>附&nbsp;&nbsp;件&nbsp;: </b><input type="file" name="yjfj1" size="76"  class=inpt></DIV>
<DIV ><b>附&nbsp;&nbsp;件&nbsp;: </b><input type="file" name="yjfj2" size="76"  class=inpt></DIV>
<DIV ><b>附&nbsp;&nbsp;件&nbsp;: </b><input type="file" name="yjfj3" size="76"  class=inpt></DIV>
<DIV>&nbsp;</DIV>
<div id="editor_body"></div>
<input type="hidden" value="" name="yjnr">
<DIV>&nbsp;</DIV>
<DIV>
&nbsp;&nbsp;&nbsp;<input type="button"  value=" 发 送 " onClick="f_ph(selectform)"  class=butt title="发送邮件">&nbsp;&nbsp;||&nbsp;&nbsp;<input type="radio" name="yjlx" value="J">
紧急
  <input type="radio" name="yjlx" value="P" checked>
普通 &nbsp;&nbsp;||&nbsp;&nbsp;发送时间<input type="text" name="fssj" value="<%=cf.today()%>" size="12" maxlength="10" onDblClick="JSCalendar(this)">&nbsp;&nbsp;||&nbsp;&nbsp;<input type="radio" name="bccg" value="Y" checked>
保存草稿
  <input type="radio" name="bccg" value="N" >
不保存
</DIV>
<DIV>&nbsp;</DIV>
</DIV>
</td>
 <td align="right">&nbsp;

 </td>


 <td align="right" valign="top" >

<DIV align="top" class=ediv style="float: left" width="5%">
  <DIV> 
   <select name="xzfgs" style="FONT-SIZE:12PX;WIDTH:120PX" onChange="changeFgs(selectform);" class=inpt>
  <%
	if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\">选择公司</option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
	}
	else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\">选择公司</option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
	else{
		out.println("错误！未进行客户资料授权，请联系系统管理员");
		return;
	}
	%> 
</select>  
</DIV>

<DIV>
<select name="xzbm" style="FONT-SIZE:12PX;WIDTH:120PX" onChange="getYg(selectform)" class=inpt>

	  <%
		if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\">选择部门</option>");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			out.println("<option value=\"\">选择部门</option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
		%> 
</select> 
</DIV> 

<BR>

<DIV>
<select name="xzzwmc" style="FONT-SIZE:12PX;WIDTH:120PX" onChange="getYg(selectform)" class=inpt>
<option value="">选择职位</option>
<%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
</select> 
</DIV> 

<BR>

<DIV>
<select name="yhzbh" style="FONT-SIZE:12PX;WIDTH:120PX" onChange="getYg(selectform)" class=inpt>
<option value="">选择用户组</option>
<%
	cf.selectItem(out,"select yhzbh,yhzmc from sq_yhz order by yhzmc","");
%> 
</select> 
</DIV> 

<BR>

<center><DIV><b>双击选择收件人
</b></DIV></center>

<DIV>
<select name="ygbh" size="500" ondblclick="removeItem(selectform);" id="sltSrc" style='width: 120px; height: 370px; border-width: 0px; padding-top:8px; FONT-SIZE:12PX;' multiple >
  <%
	if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{

	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
	{
		cf.selectItem(out,"select ygbh,yhmc||'（'||dwmc||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.cxbz='N' and yhdlm is not null and sfzszg in('Y','N') and sq_yhxx.ssfgs='"+ssfgs+"' order by yhmc","");
	}
	else{
		out.println("错误！未进行客户资料授权，请联系系统管理员");
		return;
	}
	%> 

</select>
</DIV>

 <center><DIV><input value="全部选中" type="button" name="but" onClick="all_xz(selectform)"></DIV></center>

</DIV>

</td>
</tr>
</table>
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
        	setTimeout(init, 100);
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
	if (javaTrim(FormName.sjr)==""){                                     
		alert("请选择[收件人]！");                                     
		FormName.ygbh.focus();
		return false;
	}
	if(	javaTrim(FormName.yjzt)=="") {
		alert("请输入[主题]！");
		FormName.yjzt.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("请输入[发送时间]!");
		FormName.fssj.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("请输入[发送时间]！");
		FormName.fssj.focus();
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
	FormName.yjnr.value=$('editor_body_textarea').value.toLowerCase()
	if (FormName.yjnr.value==null || FormName.yjnr.value=="")
	{
		alert("请输入内容;如果您已经输入内容请点击[显示源代码]!");
		return false;
	}
	
//	alert(FormName.yjfj.value);
	FormName.action="plfs.jsp";
	FormName.submit();
	return true;
	}
};
//-->
</SCRIPT>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//启用Ajax
	cf.ajax(out);
%>


var fieldName="";

function changeFgs(FormName)
{
	FormName.ygbh.length=1;
	FormName.xzbm.length=1;

	if (FormName.xzfgs.value=='')
	{
//		return;
	}

	fieldName="fgs";

	var sql;

	sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.xzfgs.value+"' order by dwbh";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}


function getYg(FormName)
{
	FormName.ygbh.length=1;

	fieldName="bm";

	var sql;

	sql="select ygbh,yhmc||'（'||dwmc||'）'  ";
	sql+=" from sq_yhxx,sq_dwxx ";
	sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sfzszg in('Y','N')";

	var sl=0;
	if (FormName.xzfgs.value!="")
	{
		sql+=" and sq_yhxx.ssfgs='"+FormName.xzfgs.value+"'";
		sl++;
	}
	
	if (FormName.xzbm.value!="")
	{
		sql+=" and sq_yhxx.dwbh='"+FormName.xzbm.value+"'";
		sl++;
	}
	
	if (FormName.xzzwmc.value!="")
	{
		sql+=" and sq_yhxx.xzzwbm='"+FormName.xzzwmc.value+"'";
		sl++;
	}

	if (FormName.yhzbh.value!="")
	{
		sql+=" and sq_yhxx.yhdlm in(select yhdlm from sq_yhssz where yhzbh='"+FormName.yhzbh.value+"')";
		sl++;
	}

	sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc ";

	if (sl==0)//不选条件退出
	{
		return;
	}


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="fgs")
	{
		strToSelect(selectform.xzbm,ajaxRetStr);
		getYg(selectform);
	}
	else if (fieldName=="bm")
	{
		strToSelect(selectform.ygbh,ajaxRetStr);
	}
}


//-->
</SCRIPT>



<script>
        function removeItem(FormName){
            var sltSrc=document.getElementById('sltSrc');
            for(var i=0;i<sltSrc.options.length;i++)
            {
                var tempOption=sltSrc.options[i];
                if(tempOption.selected){
//                    sltSrc.removeChild(tempOption);
//					intSrc.innerHTML+=tempOption.text+",";
					intSrc.innerHTML+="<span id="+tempOption.value+" title=\"双击删除["+tempOption.text+"]\"  ondblclick=\" removeInput(this,selectform,"+tempOption.value+");\" style=\"cursor:hand\" onMouseOut=\"this.style.backgroundColor='#F0FAFA'\" onMouseOver=\"this.style.backgroundColor='#FF0000'\">"+tempOption.text+",</span>";
					FormName.sjr.value+=tempOption.value+",";
                }   
            }
        }
		function removeInput(sp,FormName,spanid){
            var sltSrc=document.getElementById('sltSrc');
			sp.innerText="";
			var allsjr=FormName.sjr.value;
			dgsjr=allsjr.split(","); 
			FormName.sjr.value="";
			for (kkqq=0;kkqq<dgsjr.length;kkqq++)
			{
				if (dgsjr[kkqq]!=spanid && dgsjr[kkqq]!="")
				{FormName.sjr.value+=dgsjr[kkqq]+",";}
			}
			
		}
		function removeInput2(sp,FormName){
            var sltSrc=document.getElementById('sltSrc');
			intSrc.innerText="";
			FormName.sjr.value="";
			
		}
		function all_xz(FormName){
            var sltSrc=document.getElementById('sltSrc');
			var tempOption;
			var m=sltSrc.options.length-0;
			var my=new Array();
			var mm;
            for(var i=0;i<m;i++)
            {
                tempOption=sltSrc.options[i];
                if(tempOption.selected)
				{
					my[i]=i;
//                  sltSrc.removeChild(tempOption);
					intSrc.innerHTML+="<span id="+tempOption.value+" title=\"双击删除["+tempOption.text+"]\"  ondblclick=\" removeInput(this,selectform,"+tempOption.value+");\" style=\"cursor:hand\" onMouseOut=\"this.style.backgroundColor='#F0FAFA'\" onMouseOver=\"this.style.backgroundColor='#FF0000'\" >"+tempOption.text+",</span>";
					FormName.sjr.value+=tempOption.value+",";
                }  
				
				else
				{
					my[i]=-1;
				}
            }

//			for(var k=0;k<m;k++)
//            {
//				mm=my[k];
//				if (mm>=0)
//				{
//					tempOption=sltSrc.options[k];
//                 sltSrc.removeChild(tempOption);
//				}
//            }
        }

</script>