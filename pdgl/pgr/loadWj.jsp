<%@ page contentType="text/html;charset=GBK" %>


<html>
<head>
<title>上载工人照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String khbh=request.getParameter("khbh");
String grxm=request.getParameter("grxm");
%>
<body bgcolor="#FFFFFF">
<CENTER><B>上载工人照片</B><BR><HR>
<form method="post" action="saveLoadWj.jsp" name="loadform" enctype="multipart/form-data">
    <table width="100%" border="0">
      
      <tr > 
        <td width="26%" height="41" align="right" ><b><span class="STYLE1">*</span>请选择上传文件</b></td>
        <td width="74%" >
			<input type="hidden" name="khbh" value="<%=khbh%>" >
			<input type="hidden" name="grxm" value="<%=grxm%>" >
        <div id="upload">
        <input  type="file" name="loadname" accept="image/jpeg"  style="display:block" value="" size="60" onChange="dos(this)">
        </div>
        </td>
      </tr>
      <tr bgcolor="#999999"> 
        <td colspan="2" align="center"> 
		
            <input type="button"  value="开始上传" onClick="f_onclick(loadform)">
       </td>
      </tr>
    </table>
    <div id="list"></div>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script type="text/javascript" src="../../../jquery/jquery-1.9.1.min.js"></script>
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
		alert("请选择上传文件！");
		FormName.loadname.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>