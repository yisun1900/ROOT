<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>

<html>
<head>
<title>配置系统参数</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
ybl.jcoding.EnvParam ep=new ybl.jcoding.EnvParam();
String txtpath=null;
String outpath=null;
String previewpath=null;
String style=null;
String size=null;
String database=null;
String appserver=null;
String viewcodetools=null;
try
{
	txtpath = ep.getProperty("txtpath", "c:/tomcat/webapps/ROOT/jcoding/template");
	outpath = ep.getProperty("outpath", "c:/tomcat/webapps/ROOT/jcoding/outpath");
	previewpath = ep.getProperty("previewpath", "/jcoding/outpath");
	style = ep.getProperty("style", "FONT-SIZE:12PX;WIDTH:152PX");
	size = ep.getProperty("size", "20");
	database = ep.getProperty("database", "oracle");
	appserver = ep.getProperty("appserver", "tomcat");
	viewcodetools = ep.getProperty("viewcodetools", "C:/Program Files/EditPlus 2/editplus.exe");

}
catch(Exception e)
{
	out.println("Exception："+e);
	return;
}

%>
<body bgcolor="#FFFFFF">
<form method="post" action="saveparam.jsp">
  <table width="100%" border="0">
    <tr align="center"> 
      <td colspan="2" height="40">配置系统参数</td>
    </tr>
    <tr> 
      <td align="right" width="25%">模板路径：</td>
      <td width="75%"> 
        <input type="text" name="txtpath" size="60" value="<%=txtpath%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="25%">输出路径：</td>
      <td width="75%">
        <input type="text" name="outpath" size="60" value="<%=outpath%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="25%">预览路径：</td>
      <td width="75%">
        <input type="text" name="previewpath" size="60" value="<%=previewpath%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="25%">编辑框宽度：</td>
      <td width="75%">
        <input type="text" name="size" size="60" value="<%=size%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="25%">下拉列表框宽度：</td>
      <td width="75%">
        <input type="text" name="style" size="60" value="<%=style%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="25%">数据库：</td>
      <td width="75%">
        <input type="text" name="database" size="60" value="<%=database%>">
      </td>
    </tr>
    <tr>
      <td align="right" width="25%">应用服务器：</td>
      <td width="75%">
        <input type="text" name="appserver" size="60" value="<%=appserver%>">
      </td>
    </tr>
    <tr>
      <td align="right" width="25%">查看代码工具：</td>
      <td width="75%">
        <input type="text" name="viewcodetools" size="60" value="<%=viewcodetools%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="25%">&nbsp;</td>
      <td width="75%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="2"> 
        <input type="submit" value="保存">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
