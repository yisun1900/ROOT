<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String ygbh=(String)session.getAttribute("ygbh");
String whereyjzt=cf.GB2Uni(cf.getParameter(request,"whereyjzt"));
String wherefjrid=cf.GB2Uni(cf.getParameter(request,"wherefjrid"));
String wherefjr=cf.GB2Uni(cf.getParameter(request,"wherefjr"));
String wherefjrid2=wherefjrid.substring(0,wherefjrid.length()-1);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>�Ų����ʼ�ϵͳ</title>
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
	var err_msg = '����������������';
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
<DIV align="left"  style="float: left">&nbsp;
</DIV>
<DIV align="left" width="80%" style="float: left">
<DIV >&nbsp;</DIV>
<DIV width="150px"><b>�ռ���&nbsp;: </b>
<span name="sjrname" id="intSrc" style="width:515px; FONT-SIZE: 12px;" class=inpt>
<span id="<%=wherefjrid%>" title="˫��ɾ��[<%=wherefjr%>]" ondblclick=" removeInput(this,selectform,'<%=wherefjrid2%>');" style="cursor:hand" onMouseOut="this.style.backgroundColor='#F0FAFA'" onMouseOver="this.style.backgroundColor='#FF0000'"><%=wherefjr%></span>
</span>
<span id="qk" title="˫������ռ���"  ondblclick=" removeInput2(this,selectform)" style="cursor:hand" onMouseOut="this.style.backgroundColor='#F0FAFA'" onMouseOver="this.style.backgroundColor='#FF0000'"><b>[���]</b></span></DIV>
<input type="hidden" value="<%=wherefjrid%>" name="sjr" id="intSrc2" size="88">
<DIV>&nbsp;</DIV>
<DIV ><b>��&nbsp;&nbsp;��&nbsp;: </b><input type="txt" value="<%=whereyjzt%>" name="yjzt"  size="88" class=inpt></DIV>
<DIV>&nbsp;</DIV>
<DIV ><b>��&nbsp;&nbsp;��&nbsp;: </b><input type="file" name="yjfj" size="76"  class=inpt></DIV>
<DIV>&nbsp;</DIV>
<div id="editor_body"></div>
<input type="hidden" value="" name="yjnr">
<DIV>&nbsp;</DIV>
<DIV>
&nbsp;&nbsp;&nbsp;<input type="button"  value=" �� �� " onClick="f_ph(selectform)"  class=butt title="�����ʼ�">&nbsp;&nbsp;||&nbsp;&nbsp;<input type="radio" name="yjlx" value="J">
����
  <input type="radio" name="yjlx" value="P" checked>
��ͨ &nbsp;&nbsp;||&nbsp;&nbsp;����ʱ��<input type="text" name="fssj" value="<%=cf.today()%>" size="12" maxlength="10" onDblClick="JSCalendar(this)">&nbsp;&nbsp;||&nbsp;&nbsp;<input type="radio" name="bccg" value="Y" checked>
����ݸ�
  <input type="radio" name="bccg" value="N" >
������
</DIV>
<DIV>&nbsp;</DIV>
</DIV>
</td>
 <td align="right">
&nbsp;
 </td>
 <td align="right">
<DIV align="top" class=ediv style="float: left" width="5%">
  <DIV> 
   <select name="xzfgs" style="FONT-SIZE:12PX;WIDTH:120PX" onChange="getgsyh(selectform);" class=inpt>
   <option value="">ѡ��˾</option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in ('A0','F0') ","");
%> 
</select>  
</DIV>
<DIV>&nbsp;</DIV>
<DIV>
<select name="xzbm" style="FONT-SIZE:12PX;WIDTH:120PX" onChange="getbmyh(selectform)" class=inpt>
<option value="">ѡ����</option>
</select> 
</DIV> 
<DIV>&nbsp;</DIV>
<center><DIV><b>˫��ѡ���ռ���
</b></DIV></center>
<DIV>&nbsp;</DIV>
<DIV>
<select name="ygbh" size="500" ondblclick="removeItem(selectform);" id="sltSrc" style='width: 120px; height: 370px; border-width: 0px; padding-top:8px; FONT-SIZE:12PX;' multiple >
<%
	cf.selectItem(out,"select ygbh,yhmc||'��'||dwmc||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.cxbz='N' and yhdlm is not null and sfzszg in('Y','N') order by yhmc","");
%>
</select>
</DIV>
<DIV>&nbsp;</DIV>
<center><DIV><input value="ȫ��ѡ��" type="button" name="but" onClick="all_xz(selectform)"></DIV></center>
<DIV>&nbsp;</DIV>
</DIV>
</td>
</tr>
</table>
</form>
</body>
</html>
<script type="text/javascript">
// "EditerBox" ���� textarea ������
var et;
//�Զ�������ʷ����
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
function f_ph(FormName)//����FormName:Form������
{
	var jcsjr,allsjr,dgsjr;
		var cnt1, cnt2;
		var len1=0;
		var str;
		var FieldName;
	if (javaTrim(FormName.sjr)==""){                                     
		alert("��ѡ��[�ռ���]��");                                     
		FormName.ygbh.focus();
		return false;
	}
	if(	javaTrim(FormName.yjzt)=="") {
		alert("������[����]��");
		FormName.yjzt.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("������[����ʱ��]!");
		FormName.fssj.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("������[����ʱ��]��");
		FormName.fssj.focus();
		return false;
	}
	var err_msg = '����������;������Ѿ�������������[��ʾԴ����]!';
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
		alert("�����ʼ�ǰ������[Ԥ������]����[��ʾԴ����]!");
		return false;
	}
	
//	alert(FormName.yjfj.value);
	FormName.action="plfs.jsp?yhdlm=<%=yhdlm%>&fjrygbh=<%=ygbh%>";
	FormName.submit();
	return true;
	}
};
//-->
</SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

//-->
//��ʼ��Ajax����������������������������������������������ʼ���̶����벻��ı�
function creatAjax() 
{
   if(window.XMLHttpRequest)
	{ 
		xmlHttp = new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{
		try
		{
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e)
		{
			try
			{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (e)
			{
			}
		}
	}
}
function openAjax3(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax3;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function responseAjax3() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax3(retStr);
		}
		else
		{	
			alert("����Ajax��Ӧʧ�ܣ�");
		}
    }
//	else
//	{
//		alert(xmlHttp.readyState);
//	}
}
function openAjax4(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax4;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function responseAjax4() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax4(retStr);
		}
		else
		{	
			alert("����Ajax��Ӧʧ�ܣ�");
		}
    }
//	else
//	{
//		alert(xmlHttp.readyState);
//	}
}
//��ʼ��Ajax������������������������������������������

function changedqbm(FormName) //�ı������б��ֵ������Ajax
{
	FormName.ckbh.length=1;

	if (FormName.dqbm.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select ckbh,ckmc from jxc_ckmc where dqbm='"+FormName.dqbm.value+"' order by ckmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax3(actionStr);
	}
}

function getbmyh(FormName) //�ı������б��ֵ������Ajax
{
	FormName.ygbh.length=1;

	if (FormName.xzbm.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select ygbh,yhmc||'��'||dwmc||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.cxbz='N' and yhdlm is not null and sfzszg in('Y','N') and sq_yhxx.dwbh='"+FormName.xzbm.value+"' order by sq_yhxx.ssfgs,sq_yhxx.dwbh,yhmc ";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax4(actionStr);
	}
}

function getAjax3(ajaxRetStr) 
{
//	alert("Ajax����ֵ��"+ajaxRetStr);
	
	//��Ҫ��javaScript������ֵ
	strToSelect(selectform.ckbh,ajaxRetStr);
}
function getAjax4(ajaxRetStr) 
{
//	alert("Ajax����ֵ��"+ajaxRetStr);
	
	//��Ҫ��javaScript������ֵ
	strToSelect2(selectform.ygbh,ajaxRetStr);
}

//���ַ���ת��Ϊ�����б����ݣ���%��+�ָ�
//��ͬ��%�ָͬһ���ã��ָ�
function strToSelect(field,str)
{ 
	//����ֵ��һ���س����У���ȡ����������������������ʼ
	while (true)
	{
		if (str.substring(0,1)=="\r")
		{
			str=str.substring(1);
		}
		else if (str.substring(0,1)=="\n")
		{
			str=str.substring(1);
		}
		else{
			break;
		}
	}
	//����ֵ��һ���س����У���ȡ��������������������������������

	if (str=="")//��ֵ����
	{
		return;
	}


	if (str.substring(0,1)=="%")//��һ���ַ���%��ɾ��
	{
		str=str.substring(1);
	}
	
	//������������
	var i=0;
	field.options[i] = new Option("","" );
	i++;
	while((str!="")&&(str!=null))
	{
		lstart=str.indexOf("+");
		lend=str.indexOf("%");
		if (lend==-1)
		{
			lend=str.length;
		}
		lcode=str.substring(0,lstart);
		lname=str.substring(lstart+1,lend);

		field.options[i] = new Option(lname,lcode );
		i++;
		str=str.substring(lend+1,str.length);
	}
	field.length = i;
}
function strToSelect2(field,str)
{ 
	//����ֵ��һ���س����У���ȡ����������������������ʼ
	while (true)
	{
		if (str.substring(0,1)=="\r")
		{
			str=str.substring(1);
		}
		else if (str.substring(0,1)=="\n")
		{
			str=str.substring(1);
		}
		else{
			break;
		}
	}
	//����ֵ��һ���س����У���ȡ��������������������������������

	if (str=="")//��ֵ����
	{
		return;
	}


	if (str.substring(0,1)=="%")//��һ���ַ���%��ɾ��
	{
		str=str.substring(1);
	}
	
	//������������
	var i=0;
//	field.options[i] = new Option("","" );
//	i++;
	while((str!="")&&(str!=null))
	{
		lstart=str.indexOf("+");
		lend=str.indexOf("%");
		if (lend==-1)
		{
			lend=str.length;
		}
		lcode=str.substring(0,lstart);
		lname=str.substring(lstart+1,lend);

		field.options[i] = new Option(lname,lcode );
		i++;
		str=str.substring(lend+1,str.length);
	}
	field.length = i;
}
<%
	//����Ajax
	cf.ajax(out);
%>
function getgsyh(FormName)
{
	if (FormName.xzfgs.value=='')
	{
		return;
	}

//	FormName.jxc_rkd_ckbh.length=0;

	var actionStr="myajax.jsp?fgs="+FormName.xzfgs.value;

//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
		selectform.xzbm.length=1;
		var value3=getStrValue(ajaxRetStr,3);
		strToSelect(selectform.xzbm,value3);

		selectform.ygbh.length=1;
		var value4=getStrValue(ajaxRetStr,4);
		strToSelect2(selectform.ygbh,value4);

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
					intSrc.innerHTML+="<span id="+tempOption.value+" title=\"˫��ɾ��["+tempOption.text+"]\"  ondblclick=\" removeInput(this,selectform,"+tempOption.value+");\" style=\"cursor:hand\" onMouseOut=\"this.style.backgroundColor='#F0FAFA'\" onMouseOver=\"this.style.backgroundColor='#FF0000'\">"+tempOption.text+",</span>";
					FormName.sjr.value+=tempOption.value+",";
                }   
            }
        }
		function removeInput(sp,FormName,spanid){
//			alert(spanid);
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
					intSrc.innerHTML+="<span id="+tempOption.value+" title=\"˫��ɾ��["+tempOption.text+"]\"  ondblclick=\" removeInput(this,selectform,"+tempOption.value+");\" style=\"cursor:hand\" onMouseOut=\"this.style.backgroundColor='#F0FAFA'\" onMouseOver=\"this.style.backgroundColor='#FF0000'\" >"+tempOption.text+",</span>";
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