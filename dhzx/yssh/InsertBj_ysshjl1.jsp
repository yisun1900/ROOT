<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String ysshjl=cf.GB2Uni(request.getParameter("ysshjl"));

//String lrr=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String lrbm=null;
String dwmc=null;
String ggbh=null;
String lrr=null;
String lrsj=null;
int count=0;
String ysshyj=null;
oracle.sql.CLOB   clob=null;   
String   s="";
try {
	conn=cf.getConnection();

	ls_sql="select ysshyj ";
	ls_sql+=" from  bj_ysshjlyj";
	ls_sql+=" where ysshjl='"+ysshjl+"'";
	ls_sql+=" order by ysshjl ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("ysshyj");   
		if(clob!=null)
		{
			Reader   is=clob.getCharacterStream();   
			BufferedReader   br=new   BufferedReader(is);   
			s =   br.readLine();   
			while(s!=null)
			{   
				ysshyj+=s;   
				s=br.readLine();   
			}  
		}
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="editform" target="_blank">

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr> 
		<td colspan="4" align="center"> 
			<input type="button"  value="存盘" onClick="f_do(editform)" name="bc">
			<input type="reset"  value="重输" name="reset">
			<input type="hidden" name="ysshjl" value="<%=ysshjl%>" >
		</td>
	</tr>

	<tr bgcolor="#FFFFFF"> 
		<td width="15%" align="right">审核意见
		  <input name="button4" type="button" onClick="window.open('getShyj.jsp','','height=800,width=800,top=0,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="选择意见">
		
		</td>
		<td width="87%"> 
			<div id="editor_body"></div>
			<input type="hidden" value="" name="ysshyj">           
		</td>
	</tr>
</table>


</table>
</form>

</body>
</html>

<link rel="StyleSheet" href="editor/base.css">


<script type="text/javascript" src="editor/editor.js"></script>
<script type="text/javascript">

var guid = "1324481743" ;
var sState = "iframe";
var checkEdit;

function save_article()
{
	et.save();

	if(exist('editor_body_textarea'))
	{
		setCopy($('editor_body_textarea').value);
	}
	else if(exist('editor_body_area'))
	{
		setCopy($('editor_body_area').value);
	}
}

function article_preview()
{
	if (check_editor())
	{
		var editor_win = window.open('', "_blank", '');
		editor_win.document.open('text/html', 'replace');
		editor_win.opener = null 
		editor_win.document.writeln($('editor_body_textarea').value);
		editor_win.document.close();
	}
}

function check_editor()
{
	var err_msg = '请先输入文章内容';

	if ($('editor_body_textarea').value.toLowerCase() =="<div>&nbsp;</div>" ||$('editor_body_textarea').value =="")
	{ 
		alert(err_msg);
		return false;
	}
	else if($('editor_body_textarea').value.toLowerCase() =="<p>&nbsp;</p>" ||$('editor_body_textarea').value =="")
	{ 
		alert(err_msg);
		return false;
	}
	else
	{
		return true;
	}
}
</script>

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
			if (end == -1)
			{
				end = document.cookie.length;
			}
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
	//et = new word("editor_body", "");
	var ysshyj='';
	
	<%if(ysshyj!=null)
	{%>
	ysshyj="<%=ysshyj.replace("\"","\'")%>";
	
	<%}%>

	//var ysshyj="<div><strong><font style=\"background-color: #ff0000\">ceshi<img src=\"face/001.gif\"></font></strong></div>";
	if(sState == "iframe"){
		EDiaryEditor.initialize("EDiaryEditor", "editor_body", true,ysshyj);
		et = EDiaryEditor;
	}else{
		EDiaryEditor.initialize("EDiaryEditor", "editor_body", true, ysshyj);
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



var mark="";

//查询页面使用，增加下拉框内容
function addOption(field,str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	field.add(op1);
}


function radioGgjt(FormName)
{
	mark=getRadio(FormName.ggfw);

	id0101.style.display ='none';
	id0102.style.display ='none';
	id0103.style.display ='none';
	id0104.style.display ='none';
}

function radioGggs(FormName)
{
	mark=getRadio(FormName.ggfw);

	id0101.style.display ='block';
	id0102.style.display ='none';
	id0103.style.display ='none';
	id0104.style.display ='none';
}

function radioGgyhz(FormName)
{
	mark=getRadio(FormName.ggfw);

	id0103.style.display ='block';
	id0101.style.display ='none';
	id0102.style.display ='none';
	id0104.style.display ='none';
}








function f_do(FormName)//参数FormName:Form的名称
{
	var err_msg = '请输入内容;如果您已经输入内容请点击[显示源代码]!';

	if ($('editor_body_textarea').value.toLowerCase() =="<div>&nbsp;</div>")
	{ 
		alert(err_msg);
		return false;
	}
	else if($('editor_body_textarea').value.toLowerCase() =="<p>&nbsp;</p>")
	{ 
		alert(err_msg);
		return false;
	}
	else
	{
		FormName.ysshyj.value=$('editor_body_textarea').value.toLowerCase()
		if (FormName.ysshyj.value==null || FormName.ysshyj.value=="")
		{
			alert("发送邮件前必须先[预览文章]或者[显示源代码]!");
			return false;
		}
	}

	FormName.action="SaveInsertBj_ysshjl1.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
