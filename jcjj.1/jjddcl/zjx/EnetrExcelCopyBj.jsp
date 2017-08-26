<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>拷贝Excel文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String gtxh=cf.GB2Uni(request.getParameter("gtxh"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
	String zjxxh=request.getParameter("zjxxh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>拷贝Excel文件－－&gt;柜体板件（增减项序号：<%=zjxxh%>,柜体序号：<%=gtxh%>）</b>
		<input name="gtxh" type="hidden" value="<%=gtxh%>">
		<input name="ddbh" type="hidden" value="<%=ddbh%>">
		<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
     </td>
    </tr>
    <tr>
      <td width="68%" height="57"><table width="100%" border="0" style="FONT-SIZE:14">
          <tr>
            <td width="16%" height="25">&nbsp;</td>
            <td width="84%"><strong>第一步</strong>：<a href="/jcjj/jjddcl/ht/拷贝柜体板件模板.xls"><b>点击右键另存为，下载柜体板件拷贝模板</b></a> </td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>第二步</strong>：根据Excel模板格式，录入柜体板件明细，<b><font color="#FF0000">注意：行之间即使数据相同也不要合并</font></b></td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>第三步</strong>：清空下面编辑框中演示数据</td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>第四步</strong>：全选Excel文件，拷贝</td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>第五步</strong>：把拷贝内容粘贴到下面编辑框中</td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>第六步</strong>：点击
              <input name="button2" type="button" onClick="f_do(editform)"  value="下一步"></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td width="68%" height="57" align="center"> 
        <textarea name="dataStr" cols="137" rows="27">
板材类型	板件名称	板材厚度(mm)	长(mm)	宽(mm)	数量	备注
露水河(浮雕木纹)	背称	18	110	210	1	备注1
露水河(普通木纹)	侧封板	12	220	131	2	备注21
露水河(浮雕木纹)	踢脚板	25	214	370	1	
露水河(浮雕木纹)	顶底板	36	270	319	4	
</textarea></td>
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
	if(	javaTrim(FormName.dataStr)=="") {
		alert("请拷贝[柜体板件]！");
		FormName.dataStr.focus();
		return false;
	}

	FormName.action="DisplayExcelCopyBj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
