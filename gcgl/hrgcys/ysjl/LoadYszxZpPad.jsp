<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上传验收子项</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
	String khbh=request.getParameter("khbh");
	String ysjlh=request.getParameter("ysjlh");
	String gcysxmbm=request.getParameter("gcysxmbm");
	String zpxmbm=request.getParameter("zpxmbm");
	String zpxm=request.getParameter("zpxm");
	String zpml=request.getParameter("zpml");
%>
<body bgcolor="#FFFFFF">
<CENTER><B>上传验收子项（<%=ysjlh%>:<%=zpxm%>）</B><BR><HR>

<form method="post" action="SaveLoadYszxZpPad.jsp" name="loadform" enctype="multipart/form-data">
	
	<input type="hidden" name="ysjlh" value="<%=ysjlh%>" >
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="hidden" name="gcysxmbm" value="<%=gcysxmbm%>" >
	<input type="hidden" name="zpxmbm" value="<%=zpxmbm%>" >
	<input type="hidden" name="zpxm" value="<%=zpxm%>" >
	<input type="hidden" name="zpml" value="<%=zpml%>" >

    <table width="100%" border="0">
      <tr bgcolor="#FFFFFF"> 
        <td width="26%" height="41" align="right" ><b><span class="STYLE1">*</span>请选择上传文件</b></td>
        <td width="74%" >
        <div id="upload">
        <input  type="file" name="loadname" accept="image/jpeg"  style="display:block" value="" size="60" onChange="dos(this)">
        </div>
        </td>
      </tr>
      <tr bgcolor="#999999"> 
        <td colspan="2" align="center"> 
		
            <input type="button"  value="开始上传" onClick="f_onclick(loadform)">
			&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" onClick="window.open('ViewYszxZp.jsp?ysjlh=<%=ysjlh%>&zpxmbm=<%=zpxmbm%>')" value="查看上传文件" >
       </td>
      </tr>
    </table>
    <div id="list"></div>
</form>
</CENTER>
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

function dos(file)
{
	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		if (file.files && file.files[0]){
		  file.style.display="none";
		  $("#upload").append('<input  type="file" name="loadname" accept="image/jpeg"  style="display:block"   size="60"  onChange="dos(this)">');
		  var reader = new FileReader();
		  reader.onload = function(e) {
			  content=content+"<img name='pic'  width='100px' height='100px' src='"+ e.target.result +"' >";
			  list.innerHTML=content;
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
		alert("请选择上传文件！");
		FormName.loadname.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>