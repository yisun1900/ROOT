<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>



<html>
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx not in('5','6','7') order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="hykfk.jsp">
  <table width="100%" border="0">
    <tr> 
      <td colspan="2" height="58" align="center"><font color="#0000CC">请您选择发卡单位</font></td>
    </tr>
    <tr> 
      <td width="44%" align="right" height="39">片区</td>
      <td height="39" width="56%"> 
        <select name="pq" style="FONT-SIZE:12px;WIDTH:152px" onChange="selectItem(pq,dwbh,<%=dwstr%>)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc,ssdw from sq_dwxx where dwlx in('0','1','2') order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td width="44%" align="right" height="38"><font color="#0000CC">单位名称</font></td>
      <td height="38" width="56%"> 
        <select name="dwbh" style="FONT-SIZE:12px;WIDTH:152px">
        </select>
      </td>
    </tr>
    <tr> 
      <td colspan="2" height="62" align="center"> 
        <input type="button" name="Submit" value="提交" onClick="return isValid(form1)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function isValid(FormName)
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位名称]！");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

