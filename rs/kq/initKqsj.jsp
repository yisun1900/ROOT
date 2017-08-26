<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>导入工资初始化信息 </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

String xh =null;

try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	xh = up.getParameter("xh");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);

	%> 
<form method="post" action="saveInitKqsj.jsp" name="editform" target="_blank">
<div align="center">导入工资初始化信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="5%">序号</td>
	<td  width="10%">员工姓名</td>
	<td  width="10%">考勤号码</td>
	<td  width="15%">日期</td>
	<td  width="20%">签到时间</td>
	<td  width="20%">签退时间</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(filename); 

	if (outStr==null)
	{
		out.println("错误！Execel文件无法识别，请重新复制一份新文件");
		return;
	}

	for (int i=1;i<outStr.length ;i++ )
	{
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][2].equals(""))
		{
			out.println("提醒!第"+i+"行[员工序号]为空,下面的数据自动被放弃");
			break;
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=i%> 
      <td><%=outStr[i][0]%> 
        <input name="id" type="hidden" value="<%=i%>">
        <input name="yhmc" type="hidden" value="<%=outStr[i][0]%>">
        <input name="kqhm" type="hidden" value="<%=outStr[i][1]%>" >
        <input name="gzr" type="hidden" value="<%=outStr[i][2]%>" >
        <input name="sbsj" type="hidden" value="<%=outStr[i][3]%>" >
        <input name="xbsj" type="hidden" value="<%=outStr[i][4]%>" >
      </td>
      <td><%=outStr[i][1]%></td>
      <td> <%=outStr[i][2]%></td>
      <td> <%=outStr[i][3]%></td>
      <td> <%=outStr[i][4]%></td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("操作失败，Exception:" + e);
	return;
}
finally 
{
	try{
		f.close();
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
