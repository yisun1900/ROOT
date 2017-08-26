<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jCoding" scope="page" class="ybl.jcoding.JCoding"/>

<html>
<head>
<title>选择数据窗口</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
try
{
//	Runtime.getRuntime().exec("copy  previewframe.jsp aa");
	
}
catch (Exception e)
{
	out.println("Exception:"+e);
}
%> 
<form method="post" action="" name="dwform">
  <table width="100%" border="0">
    <tr align="center"> 
      <td>选择文件 
        <select name="filename"  >
<%
		String outPath=jCoding.getOutPath();
		String previewPath=jCoding.getPreviewPath();
		java.io.File dir=new java.io.File(outPath);
		String[] filename;
		if (dir.isDirectory())
		{
			filename=dir.list();
			for (int i=0;i<filename.length ;i++ )
			{
				out.println("<option value="+filename[i]+">"+filename[i]+"</option>");
			}
		}
%> 
        </select>
        <input type="button"  value="预览" onclick="preview(dwform)">
        <input type="button"  value="查看源文件" onClick="viewfile(dwform)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function preview(dwform)
{
//	parent.main.location="<%=previewPath%>/"+dwform.filename.value;
	parent.main.location="previewRef.jsp?filename="+"<%=previewPath%>/"+dwform.filename.value;;
//	parent.main.ref.action="<%=previewPath%>/"+dwform.filename.value;
//	parent.main.ref.submit();
}
function viewfile(dwform)
{
//	parent.main.location="<%=outPath%>/"+dwform.filename.value;
//	parent.main.location="viewCodeRef.jsp?filename="+"<%=outPath%>/"+dwform.filename.value;
	parent.main.location="viewCodeRef.jsp?filename="+dwform.filename.value;

}
//-->
</SCRIPT>
