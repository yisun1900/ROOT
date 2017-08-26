<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>维护模板</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String khbh=request.getParameter("khbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>拷贝Excel文件－－&gt;电子报价</b>
		<input name="khbh" type="hidden" value="<%=khbh%>">
          <input name="button" type="button" onClick="f_do(editform)"  value="下一步">
          &nbsp;&nbsp;&nbsp;&nbsp;<A HREF="拷贝电子报价模板.xls"><B>点击右键另存为，下载Excel报价模板</B></A>
     </td>
    </tr>
    <tr>
      <td width="68%" height="57"> <b><font color="#FF0000">把Excel文件拷贝到编辑框中，格式如下，注意：行之间即使数据相同也不要合并，用您的数据替换编辑框中演示数据</font></b>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
          <tr align="center" bgcolor="#FFFFFF">
            <td width="14%"><strong>房间</strong></td>
            <td width="20%"><strong>项目编号</strong></td>
            <td width="41%"><strong>项目名称</strong></td>
            <td width="12%"><strong>计量单位</strong></td>
            <td width="13%"><strong>工程量</strong></td>
          </tr>
		<tr align="center" bgcolor="#FFFFFF"> 
            <td>主卧</td>
            <td>JC-03-16</td>
            <td>都芳五合一内墙漆</td>
            <td>㎡</td>
            <td>6.71</td>
          </tr>
			<tr align="center" bgcolor="#FFFFFF"> 
            <td>主卧</td>
            <td>JC-12-08</td>
            <td>墙面基层刮耐水腻子处理</td>
            <td>㎡</td>
            <td>9</td>
          </tr>
			<tr align="center" bgcolor="#FFFFFF">
              <td>客厅</td>
			  <td>JC-03-16</td>
			  <td>都芳五合一内墙漆</td>
			  <td>㎡</td>
			  <td>21.71</td>
		  </tr>
		<tr align="center" bgcolor="#FFFFFF"> 
            <td>餐厅</td>
            <td>PT-01-13</td>
            <td>普通石膏线</td>
            <td>米</td>
            <td>12.5</td>
          </tr>
      </table></td>
    </tr>
    <tr> 
      <td width="68%" height="57" align="center"> 
        <textarea name="dzbj" cols="112" rows="27">
房间	项目编号	项目名称	计量单位	工程量
主卧	JC-03-16	都芳五合一内墙漆	㎡	6.71
主卧	JC-12-08	墙面基层刮耐水腻子处理	㎡	9
客厅	JC-03-16	都芳五合一内墙漆	㎡	21.71
餐厅	PT-01-13	普通石膏线	米	12.5
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
	if(	javaTrim(FormName.dzbj)=="") {
		alert("请拷贝[报价内容]！");
		FormName.dzbj.focus();
		return false;
	}

	FormName.action="DisplayExcelCopy.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
