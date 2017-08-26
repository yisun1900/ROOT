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
<form method="post" action="saveInitGz.jsp" name="editform" target="_blank">
<div align="center">导入工资初始化信息</div>
<input type="hidden" name="xh" value="<%=xh%>">
  <table width="140%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" onClick="f_do(editform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
    <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="3%">序号</td>
	<td  width="7%">所属部门</td>
	<td  width="4%">员工序号</td>
	<td  width="5%">工号</td>
	<td  width="5%">员工姓名</td>
	<td  width="3%">全勤天数</td>
	<td  width="3%">出勤天数</td>
	<td  width="6%">工龄工资</td>
	<td  width="6%">岗位工资</td>
	<td  width="6%">底薪</td>
	<td  width="6%">交通补贴</td>
	<td  width="6%">餐补</td>
	<td  width="6%">电话补</td>
	<td  width="6%">扣保费</td>
	<td  width="6%">奖金</td>
	<td  width="5%">其它补贴</td>
	<td  width="6%">其它扣款</td>
	<td  width="6%">提成</td>
	<td  width="5%">税前工资</td>
	<td  width="5%">扣税款</td>
	<td  width="5%">税后工资</td>
	<td  width="6%">备注</td>
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
        <input name="ygbh" type="hidden" value="<%=outStr[i][2]%>" >
        <input name="bianhao" type="hidden" value="<%=outStr[i][3]%>">
      </td>
      <td><%=outStr[i][1]%></td>
      <td> <%=outStr[i][2]%></td>
      <td> <%=outStr[i][3]%></td>
      <td> <%=outStr[i][4]%></td>
      <td> <%=outStr[i][5]%></td>
      <td> <%=outStr[i][6]%></td>
      <td> 
        <input name="glgz" type="text" value="<%=outStr[i][7]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(glgz[<%=i%>])">
      </td>
      <td>
        <input name="gwgz" type="text" value="<%=outStr[i][8]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(gwgz[<%=i%>])">
      </td>
      <td> 
        <input name="jbgz" type="text" value="<%=outStr[i][9]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jbgz[<%=i%>])">
      </td>
      <td> 
        <input name="jtbt" type="text" value="<%=outStr[i][10]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jtbt[<%=i%>])">
      </td>
      <td> 
        <input name="cb" type="text" value="<%=outStr[i][11]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(cb[<%=i%>])">
      </td>
      <td> 
        <input name="dhbt" type="text" value="<%=outStr[i][12]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(dhbt[<%=i%>])">
      </td>
      <td> 
        <input name="yjsxe" type="text" value="<%=outStr[i][13]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(yjsxe[<%=i%>])">
      </td>
      <td> 
        <input name="jj" type="text" value="<%=outStr[i][14]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jj[<%=i%>])">
      </td>
      <td> 
        <input name="qtbt" type="text" value="<%=outStr[i][15]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(qtbt[<%=i%>])">
      </td>
      <td> 
        <input name="qtkk" type="text" value="<%=outStr[i][16]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(qtkk[<%=i%>])">
      </td>
      <td> 
        <input name="tc" type="text" value="<%=outStr[i][17]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(tc[<%=i%>])">
      </td>
      <td> 
        <input name="sqgz" type="text" value="<%=outStr[i][18]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sqgz[<%=i%>])">
      </td>
      <td> 
        <input name="ksk" type="text" value="<%=outStr[i][19]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(ksk[<%=i%>])">
      </td>
      <td> 
        <input name="shgz" type="text" value="<%=outStr[i][20]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(shgz[<%=i%>])">
      </td>
      <td> 
        <input name="bz" type="text" value="<%=outStr[i][21]%>" size="7"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[<%=i%>])">
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
