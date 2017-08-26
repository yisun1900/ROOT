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

String ssfgs =null;

try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	ssfgs = up.getParameter("ssfgs");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\exec\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);
	f.close();

	%> 
<form method="post" action="saveInitGz.jsp" name="editform" >
<div align="center">导入工资初始化信息</div>
<input type="hidden" name="ssfgs" value="<%=ssfgs%>">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" onClick="f_do(editform)">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="14%">所属部门</td>
	<td  width="6%">员工序号</td>
	<td  width="8%">工号</td>
	<td  width="8%">员工姓名</td>
	<td  width="10%">行政职务</td>
	<td  width="6%">工资类别</td>
	<td  width="6%">绩效工资基数</td>
	<td  width="6%">基本工资</td>
	<td  width="6%">岗位工资</td>
	<td  width="6%">工龄工资</td>
	<td  width="6%">交通补贴</td>
	<td  width="6%">通讯补贴</td>
	<td  width="6%">餐饮补贴</td>
	<td  width="6%">其它补贴</td>
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


		String gzlb="";
		if (outStr[i][5].trim().equals("固定工资"))
		{
			gzlb="1";
		}
		else if (outStr[i][5].trim().equals("浮动工资"))
		{
			gzlb="2";
		}
		else{
			out.println("员工["+outStr[i][3]+"]错误！[工资类别]只能是[固定工资]或[浮动工资]");
			return;
		}

		if (outStr[i][6].trim().equals(""))
		{
			out.println("员工["+outStr[i][3]+"]错误！[绩效工资基数]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][6].trim());
			}
			catch (Exception e){
				out.println("员工["+outStr[i][3]+"]错误！[绩效工资基数]是数字");
				return;
			}
		}
		if (outStr[i][7].trim().equals(""))
		{
			out.println("员工["+outStr[i][3]+"]错误！[基本工资]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][7].trim());
			}
			catch (Exception e){
				out.println("员工["+outStr[i][3]+"]错误！[基本工资]是数字");
				return;
			}
		}

		if (outStr[i][8].trim().equals(""))
		{
			out.println("员工["+outStr[i][3]+"]错误！[岗位工资]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][8].trim());
			}
			catch (Exception e){
				out.println("员工["+outStr[i][3]+"]错误！[岗位工资]是数字");
				return;
			}
		}
		if (outStr[i][9].trim().equals(""))
		{
			out.println("员工["+outStr[i][3]+"]错误！[工龄工资]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][9].trim());
			}
			catch (Exception e){
				out.println("员工["+outStr[i][3]+"]错误！[工龄工资]是数字");
				return;
			}
		}

		if (outStr[i][10].trim().equals(""))
		{
			out.println("员工["+outStr[i][3]+"]错误！[交通补贴]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][10].trim());
			}
			catch (Exception e){
				out.println("员工["+outStr[i][3]+"]错误！[交通补贴]是数字");
				return;
			}
		}

		if (outStr[i][11].trim().equals(""))
		{
			out.println("员工["+outStr[i][3]+"]错误！[通讯补贴]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][11].trim());
			}
			catch (Exception e){
				out.println("员工["+outStr[i][3]+"]错误！[通讯补贴]是数字");
				return;
			}
		}

		if (outStr[i][12].trim().equals(""))
		{
			out.println("员工["+outStr[i][3]+"]错误！[餐饮补贴]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][12].trim());
			}
			catch (Exception e){
				out.println("员工["+outStr[i][3]+"]错误！[餐饮补贴]是数字");
				return;
			}
		}

		if (outStr[i][13].trim().equals(""))
		{
			out.println("员工["+outStr[i][3]+"]错误！[其它补贴]不能为空");
			return;
		}
		else{
			try{
				Double.parseDouble(outStr[i][13].trim());
			}
			catch (Exception e){
				out.println("员工["+outStr[i][3]+"]错误！[其它补贴]是数字");
				return;
			}
		}

		%> 
    <tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=outStr[i][0]%> 
      </td>
      <td><%=outStr[i][1]%>
        <input name="ygbh" type="hidden" value="<%=outStr[i][1]%>" >
	  </td>
      <td> <%=outStr[i][2]%></td>
      <td> <%=outStr[i][3]%></td>
      <td> <%=outStr[i][4]%></td>
      <td><%=outStr[i][5]%>
        <input name="gzlb" type="hidden" value="<%=gzlb%>">
      </td>
      <td><%=outStr[i][6]%>
        <input name="khgz" type="hidden" value="<%=outStr[i][6]%>">
      </td>
      <td> <%=outStr[i][7]%>
        <input name="jbgz" type="hidden" value="<%=outStr[i][7]%>" >
	  </td>
      <td><%=outStr[i][8]%> 
        <input name="gwgz" type="hidden" value="<%=outStr[i][8]%>" >
      </td>
      <td><%=outStr[i][9]%> 
        <input name="glgz" type="hidden" value="<%=outStr[i][9]%>" >
      </td>
      <td><%=outStr[i][10]%> 
        <input name="jtbt" type="hidden" value="<%=outStr[i][10]%>" >
      </td>
      <td><%=outStr[i][11]%> 
        <input name="dhbt" type="hidden" value="<%=outStr[i][11]%>" >
      </td>
      <td><%=outStr[i][12]%> 
        <input name="cb" type="hidden" value="<%=outStr[i][12]%>" >
      </td>
      <td><%=outStr[i][13]%> 
        <input name="buzhu" type="hidden" value="<%=outStr[i][13]%>">
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
