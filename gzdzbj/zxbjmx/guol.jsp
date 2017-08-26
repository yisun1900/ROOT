<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>过滤</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String bjjb=request.getParameter("bjjb");
String jzbz=request.getParameter("jzbz");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="main">
  <table width="100%" border="0" style="FONT-SIZE:12">
    <tr> 
      <td colspan="2"> 
        <input type="button"  value="项目工程量" onClick="f_lr1(editform)" >
        <input type="button"  value="房间工程量" onClick="f_lr2(editform)" >
        <input type="button"  value="删除未用项" onClick="f_scxm(editform)" >
	  &nbsp;&nbsp;项目名称 
        <input type="text" name="xmmc" size="10" maxlength="50" >
        饰面 
        <select name="smbm" style="FONT-SIZE:12PX;WIDTH:80PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
        </select>
        <input type="button" value="过滤" onClick="f_gl(editform)">
        <input type="reset" name="Reset" value="清除条件">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_gl(FormName)//参数FormName:Form的名称
{

	if(FormName.xmmc.value=="" && FormName.smbm.value=="") {
		alert("请输入[过滤条件]！");
		FormName.xmmc.focus();
		return false;
	}


	FormName.target="main";
	FormName.action="Bj_jzbjbCxList.jsp?jzbz=<%=jzbz%>&bjjb=<%=bjjb%>&dqbm=<%=dqbm%>&khbh=<%=khbh%>&xmdlbm="+parent.main.listform.xmdlbm.value+"&xmxlbm="+parent.main.listform.xmxlbm.value;
	FormName.submit();
	return true;
}
function f_lr1(FormName)//参数FormName:Form的名称
{
	FormName.target="main";
	FormName.action="Bj_khbjmxList1.jsp?khbh=<%=khbh%>";
	FormName.submit();
	return true;
}
function f_lr2(FormName)//参数FormName:Form的名称
{
	FormName.target="main";
	FormName.action="Bj_khbjmxList2.jsp?khbh=<%=khbh%>";
	FormName.submit();
	return true;
}

function f_scxm(FormName)//参数FormName:Form的名称
{
	if ( confirm("系统会删除未录工程量的项目，删除后不可恢复，确实要删除吗？") )	
	{
		FormName.target="_blank";
		FormName.action="deleteWyXm.jsp?khbh=<%=khbh%>";
		FormName.submit();
		return true;
	}
}
//-->
</SCRIPT>
