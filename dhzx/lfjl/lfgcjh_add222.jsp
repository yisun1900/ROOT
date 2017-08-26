<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");

%>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
	font-family: "宋体";
}
-->
</style>
<body>
<form name="form1">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style="FONT-SIZE:12">
  <tr>
    <td colspan="4" bgcolor="#cccccc"><div align="center" class="STYLE1">量房计划录入</div></td>
  </tr>
  <tr>
    <td width="20%" bgcolor="#FFFFFF"><div align="right">量房类型       </div></td>
    <td width="30%" bgcolor="#FFFFFF">      <select name="lflxbm">
	<option></option>
	  <%
		cf.selectItem(out,"select lflxbm,lflxmc from dm_lflxbm ","");
	%> 
    </select></td>
    <td width="20%" bgcolor="#FFFFFF"><div align="right">上门目标</div></td>
    <td width="28%" bgcolor="#FFFFFF"><input type="text" name="smmb" /></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><div align="right">计划上门时间</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="jhsmsj" /></td>
    <td bgcolor="#FFFFFF"> <div align="right">实际上门时间</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="sjsmsj" /></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><div align="right">计划上门人员</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="jhsmry" /></td>
    <td bgcolor="#FFFFFF"><div align="right">实际上门人员</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="sjsmry" /></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><div align="right">上门结果</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="lfjgsm" /></td>
    <td bgcolor="#FFFFFF"><div align="right">上传照片</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="sczp" /></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><div align="right">厨房卫生间参数</div></td>
    <td bgcolor="#FFFFFF"><input type="text" name="cfwsjcs" /></td>
    <td bgcolor="#FFFFFF"><div align="right">备注说明</div></td>
    <td bgcolor="#FFFFFF">      <textarea name="bzsm"></textarea>    </td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#FFFFFF">      <div align="center">
        <input type="submit" name="Submit" value="提交" />
		 <input type="hidden" name="khbh" value="<%=khbh%>" />
      </div></td></tr>
</table>
</form>
</body>
</html>