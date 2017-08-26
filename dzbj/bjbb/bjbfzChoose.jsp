<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE4 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<%
String dqbm=request.getParameter("dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String oldbjbbh=cf.GB2Uni(request.getParameter("oldbjbbh"));
String newbjbbh=cf.GB2Uni(request.getParameter("newbjbbh"));
String gcbj=request.getParameter("gcbj");
String tcjg=request.getParameter("tcjg");
String tcsj=request.getParameter("tcsj");
String tcbzgc=request.getParameter("tcbzgc");
String tcbzzc=request.getParameter("tcbzzc");
String tczcbj=request.getParameter("tczcbj");

String count=cf.executeQuery("select count(*) from bj_jzbjb where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+oldbjbbh+"'");
%>


<body bgcolor="#FFFFFF">
<CENTER>
  <B>电子报价－版本复制</B><BR>
  <HR>
<form method="post" action="" name="insertform" >
    <table width="100%" border="0">
      
      <tr align="center">
        <td height="33" align="right">该级别报价项目已存在『<%=count%>』条：</td>
        <td height="33" align="left"><input name="button" type="button" onClick="f_delete(loadform)"  value="删除报价项目"></td>
      </tr>
      <tr align="center">
        <td height="34" align="right"><span class="STYLE1">*</span>地区：</td>
        <td height="34" align="left"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
%>
          </select>        </td>
      </tr>
      <tr align="center"> 
        <td width="36%" height="33" align="right"><span class="STYLE1">*</span>被复制版本号</td>
        <td width="64%" height="33" align="left"><input type="text" name="oldbjbbh" value="<%=oldbjbbh%>" size="40" maxlength="50" readonly>		</td>
      </tr>
      <tr align="center">
        <td height="33" align="right"><span class="STYLE1">*</span>复制版本号</td>
        <td height="33" align="left"><input type="text" name="newbjbbh" value="<%=newbjbbh%>" size="40" maxlength="50" readonly>        </td>
      </tr>
      <tr align="center">
        <td height="157" align="right"><span class="STYLE1">*</span>复制内容</td>
        <td height="157" align="left">
			工程报价
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%if(gcbj!=null) out.println("<span class=\"STYLE4\">选择复制</span>"); else out.println("<span class=\"STYLE2\">不复制</span>");%>
			<BR>
			套餐－价格表
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%if(tcjg!=null) out.println("<span class=\"STYLE4\">选择复制</span>"); else out.println("<span class=\"STYLE2\">不复制</span>");%>
			<BR>
			套餐－升级差价表
			&nbsp;
			<%if(tcsj!=null) out.println("<span class=\"STYLE4\">选择复制</span>"); else out.println("<span class=\"STYLE2\">不复制</span>");%>
			<BR>
			套餐－标准工程项目
			<%if(tcbzgc!=null) out.println("<span class=\"STYLE4\">选择复制</span>"); else out.println("<span class=\"STYLE2\">不复制</span>");%>
			<BR>
			套餐－标准主材项目
			<%if(tcbzzc!=null) out.println("<span class=\"STYLE4\">选择复制</span>"); else out.println("<span class=\"STYLE2\">不复制</span>");%>
			<BR>
			套餐－主材报价	    
			&nbsp;&nbsp;&nbsp;
			<%if(tczcbj!=null) out.println("<span class=\"STYLE4\">选择复制</span>"); else out.println("<span class=\"STYLE2\">不复制</span>");%>		</td>
		
		</td>
      </tr>
      
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="开始复制" onClick="f_onclick(insertform)">
            <input type="hidden" name="gcbj" value="<%=gcbj%>"  >
            <input type="hidden" name="tcjg" value="<%=tcjg%>"  >
            <input type="hidden" name="tcsj" value="<%=tcsj%>"  >
            <input type="hidden" name="tcbzgc" value="<%=tcbzgc%>"  >
            <input type="hidden" name="tcbzzc" value="<%=tcbzzc%>"  >
            <input type="hidden" name="tczcbj" value="<%=tczcbj%>"  >
          </p>        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_delete(FormName)
{
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请选择[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	if (!confirm("注意：删除后不可恢复，确实要继续吗？") )	
	{
		return;
	}

	FormName.target="_blank";
	FormName.action="deleteBjxm.jsp";
	FormName.submit();
	return true;
} 

function f_onclick(FormName)
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.oldbjbbh)=="") {
		alert("请选择[被复制版本号]！");
		FormName.oldbjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.newbjbbh)=="") {
		alert("请选择[复制版本号]！");
		FormName.newbjbbh.focus();
		return false;
	}

	if (FormName.oldbjbbh.value==FormName.newbjbbh.value)
	{
		alert("错误！[被复制版本号]不能与[复制版本号]相同");
		FormName.newbjbbh.focus();
		return false;
	}

	FormName.target="";
	FormName.action="SaveBjbfz.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>