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
<form method="post" action="saveInitCqtjb.jsp" name="editform" >
<div align="center">导入工资初始化信息</div>
<input type="hidden" name="xh" value="<%=xh%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="4%">序号</td>
	<td  width="6%">年</td>
	<td  width="6%">月</td>
	<td  width="14%">所属部门</td>
	<td  width="10%">员工序号</td>
	<td  width="10%">工号</td>
	<td  width="10%">员工姓名</td>
	<td  width="10%">全勤天数</td>
	<td  width="10%">出勤天数</td>
	<td  width="20%">备注</td>
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
      <td><%=outStr[i][0]%> 
        <input name="id" type="hidden" value="<%=outStr[i][0]%>">
        <input name="nian" type="hidden" value="<%=outStr[i][1]%>" >
        <input name="yue" type="hidden" value="<%=outStr[i][2]%>" >
        <input name="ygbh" type="hidden" value="<%=outStr[i][4]%>" >
        <input name="bianhao" type="hidden" value="<%=outStr[i][5]%>">
      </td>
      <td><%=outStr[i][1]%></td>
      <td> <%=outStr[i][2]%></td>
      <td> <%=outStr[i][3]%></td>
      <td> <%=outStr[i][4]%></td>
      <td> <%=outStr[i][5]%></td>
      <td> <%=outStr[i][6]%></td>
      <td> 
        <input name="qqts" type="text" value="<%=outStr[i][7]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(qqts[<%=i%>])">
      </td>
      <td>
        <input name="cqts" type="text" value="<%=outStr[i][8]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(cqts[<%=i%>])">
      </td>
      <td> 
        <input name="bz" type="text" value="<%=outStr[i][9]%>" size="25"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[<%=i%>])">
      </td>
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
