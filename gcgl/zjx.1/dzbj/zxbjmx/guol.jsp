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
String zjxxh=request.getParameter("zjxxh");
String dqbm=request.getParameter("dqbm");
String jzbz=request.getParameter("jzbz");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="main">
  <table width="100%" border="0" style="FONT-SIZE:12">
    <tr> 
      <td colspan="2"> 
        <input type="button"  value="项目工程量" onClick="f_lr1(editform)" name="xmlr" >
        <input type="button"  value="房间工程量" onClick="f_lr2(editform)" name="fjlr" >
        <input type="button"  value="自定义项" onClick="f_lr4(editform)" name="cp">
        <input type="button"  value="综合录入" onClick="f_lr3(editform)" name="zhlr">
        <input type="button"  value="删除未用项" onClick="f_scxm(editform)" >
	    名称 
        <input type="text" name="xmmc" size="14" maxlength="200" >
        饰面
        <select name="smbm" style="FONT-SIZE:12PX;WIDTH:80PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%>
        </select>

        <input type="button" value="查找" onClick="f_gl(editform)">
        <input type="button"  value="Execel拷贝" onClick="f_lr5(editform)" name="cp" disabled>
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
		alert("请输入[查找条件]！");
		FormName.xmmc.focus();
		return false;
	}


	FormName.target="main";
	FormName.action="Bj_jzbjbXmbhCxList.jsp?jzbz=<%=jzbz%>&dqbm=<%=dqbm%>&khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	return true;
}
function f_lr1(FormName)//参数FormName:Form的名称
{
	FormName.target="main";
	FormName.action="Bj_khbjmxList1.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	FormName.xmlr.disabled=true;
	return true;
}
function f_lr2(FormName)//参数FormName:Form的名称
{
	FormName.target="main";
	FormName.action="Bj_khbjmxList2.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	FormName.fjlr.disabled=true;
	return true;
}
function f_lr3(FormName)//参数FormName:Form的名称
{
	FormName.target="main";
	FormName.action="Bj_khbjmxList3.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	FormName.zhlr.disabled=true;
	return true;
}
function f_lr4(FormName)//参数FormName:Form的名称
{
	FormName.target="main";
	FormName.action="/dzbjone/bjbz/InsertBj_zdyxmb1.jsp?dqbm=<%=dqbm%>&khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	return true;
}
function f_lr5(FormName)//参数FormName:Form的名称
{
	FormName.target="main";
	FormName.action="EnetrExcelCopy.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	return true;
}
function f_scxm(FormName)//参数FormName:Form的名称
{
	if ( confirm("系统会删除未录工程量的项目，删除后不可恢复，确实要删除吗？") )	
	{
		FormName.target="_blank";
		FormName.action="deleteWyXm.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
		FormName.submit();
		return true;
	}
}
//-->
</SCRIPT>
