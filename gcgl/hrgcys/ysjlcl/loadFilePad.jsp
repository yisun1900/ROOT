<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>������Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<%
String ysjlh=request.getParameter("ysjlh");
String zplx=request.getParameter("zplx");

String zpxm=java.net.URLDecoder.decode(request.getParameter("zpxm"),"UTF-8");
String zpsm=java.net.URLDecoder.decode(request.getParameter("zpsm"),"UTF-8");
%>
<body bgcolor="#FFFFFF">

<CENTER><B>�����ϴ�(��¼�ţ�<%=ysjlh%>)</B></CENTER>
<BR>
<STRONG>��Ƭ˵����<%=zpsm%></STRONG>
<HR>


<form method="post" action="SaveloadFilePad.jsp" name="loadform" enctype="multipart/form-data">

    <table width="100%" border="0">
      
      <tr > 
        <td width="26%" height="41" align="right" ><b><span class="STYLE1">*</span>��ѡ���ϴ��ļ�</b></td>
        <td width="74%" >
			<input type="hidden" name="ysjlh" value="<%=ysjlh%>" >
			<input type="hidden" name="zplx" value="<%=zplx%>" >
			<input type="hidden" name="zpxm" value="<%=zpxm%>" >
			<input type="hidden" name="zpsm" value="<%=zpsm%>" >
        <div id="upload">
        <input  type="file" name="loadname" accept="image/jpeg"  style="display:block" value="" size="60" onChange="dos(this)">
        </div>
        </td>
      </tr>
      <tr bgcolor="#999999"> 
        <td colspan="2" align="center"> 
		
            <input type="button"  value="��ʼ�ϴ�" onClick="f_onclick(loadform)">
			&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" onClick="window.open('viewPhoto.jsp?ysjlh=<%=ysjlh%>&zplx=<%=zplx%>&zpxm=<%=zpxm%>&zpsm=<%=zpsm%>')" value="�鿴�ϴ��ļ�" >
       </td>
      </tr>
    </table>
    <div id="list"></div>
</form>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<SCRIPT language=javascript >
<!--
var list=document.getElementById('list');
var upload=document.getElementById('upload');
var img=new Image();
var content="";
function dos(file){
	if(new RegExp('Linux').test(navigator.platform.toString())){
		//file.style.display="none";
		//$("#upload").append('<input  type="file" name="loadname" accept="image/jpeg"  style="display:block"   size="60"  onChange="dos(this)">');
		if (file.files && file.files[0]){
			var reader = new FileReader();
			reader.onload = function(e) {		  
				content=content+"<img name='pic'  width='100px' height='100px' src='"+ e.target.result +"' >";
				list.innerHTML=content;
				//file.style.display="none";
				$("#upload").append('<input  type="file" name="loadname" accept="image/jpeg"  style="display:block"   size="60"  onChange="dos(this)">');
			}
			reader.readAsDataURL(file.files[0]);
		}
	}
	else{
		if (file.files && file.files[0]){
		  var reader = new FileReader();
		  reader.onload = function(e) {
			  content=content+"<img name='pic'  width='100px' height='100px' src='"+ e.target.result +"' >";
			  list.innerHTML=content;
			  file.style.display="none";
			   $("#upload").append('<input  type="file" name="loadname" accept="image/jpeg"  style="display:block"   size="60"  onChange="dos(this)">');
		  }
		  reader.readAsDataURL(file.files[0]);
		}	
	}
}
function f_onclick(FormName)
{
	if(	FormName.loadname.value=="") 
	{
		alert("��ѡ���ϴ��ļ���");
		FormName.loadname.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>