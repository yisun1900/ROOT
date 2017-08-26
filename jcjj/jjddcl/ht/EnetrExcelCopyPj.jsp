<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>拷贝Excel文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String gtxh=cf.GB2Uni(request.getParameter("gtxh"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
		<table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td align="center" > 
        <b>拷贝Excel文件－－&gt;柜体配件（柜体序号：<%=gtxh%>）</b>
		<input name="gtxh" type="hidden" value="<%=gtxh%>">
	  <input name="ddbh" type="hidden" value="<%=ddbh%>"></td>
    </tr>
    <tr>
      <td width="68%" height="57"><table width="100%" border="0" style="FONT-SIZE:14">
          <tr>
            <td width="16%" height="25">&nbsp;</td>
            <td width="84%"><strong>第一步</strong>：<a href="拷贝柜体配件模板.xls"><b>点击右键另存为，下载柜体配件拷贝模板</b></a> </td>
          </tr>
          <tr height="25">
            <td>&nbsp;</td>
            <td><strong>第二步</strong>：根据Excel模板格式，录入柜体配件明细，<b><font color="#FF0000">注意：行之间即使数据相同也不要合并</font></b></td>
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
配件编号	配件名称	型号	规格	计量单位	数量	备注
0001	抽屉	贴皮	500*450*120	个	1	海福乐轨加收60元
0002	领带盒	贴皮	600*450	个	2	海福乐轨加收60元
0012	升降衣架	华尔特	6174.1	套	3	广州
0013	挂衣杆	海福乐挂衣杆		根	1	进口
0017	挂衣杆	德迅（黑、红、蓝胶质）	901-1000	根	1	
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
		alert("请拷贝[柜体配件]！");
		FormName.dataStr.focus();
		return false;
	}

	FormName.action="DisplayExcelCopyPj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
