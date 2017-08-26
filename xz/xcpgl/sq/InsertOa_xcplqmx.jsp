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
String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
String fgsbh=cf.executeQuery("select fgsbh from oa_xcplqsq where sqxh="+sqxh);
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertOa_xcplqmx.jsp" name="insertform" target="_blank">
  <div align="center">印刷品领取明细</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>印刷品分类</td>
      <td width="32%"> 
        <select name="xcpflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefl(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xcpflbm,xcpflmc from oa_xcpflbm order by xcpflbm","");
%> 
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">申请序号</font></td>
      <td width="32%"> 
        <input type="text" name="sqxh" value="<%=sqxh%>" size="20" maxlength="8" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>印刷品</td>
      <td width="32%"> 
        <select name="xcpbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changebm(insertform)">
          <option value=""></option>
        </select>
      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>计划领取数量</td>
      <td width="32%"> 
        <input type="text" name="jhlqsl" value="" size="20" maxlength="16" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000CC">计量单位</font></td>
      <td width="32%"> 
        <input type="text" name="jldw" value="" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%"><font color="#0000CC">是否需审批</font></td>
      <td width="32%"> 
        <input type="text" name="sfxspmc" value="" size="20" maxlength="20" readonly>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="sfxsp" value="" size="20" maxlength="20" >
        <input type="hidden" name="xcpmc" value="" size="20" maxlength="50" >
        <input type="hidden" name="dj" value="" size="20" maxlength="17" >
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
//查询页面使用，增加下拉框内容
function addOption(field,str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	field.add(op1);
}

function changefl(FormName)
{
	if(	javaTrim(FormName.xcpflbm)=="") 
	{
		return false;
	}
	
	FormName.xcpmc.value=""
	FormName.jldw.value=""
	FormName.dj.value=""
	FormName.xcpbm.length=1;
	
	var str="InsertOa_xcplqmxCx.jsp?fgsbh=<%=fgsbh%>&sqxh=<%=sqxh%>&xcpflbm="+FormName.xcpflbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function changebm(FormName)
{
	if(	javaTrim(FormName.xcpbm)=="") 
	{
		return false;
	}
	
	FormName.xcpmc.value=""
	FormName.jldw.value=""
	FormName.dj.value=""
	
	var str="InsertOa_xcplqmxCx.jsp?fgsbh=<%=fgsbh%>&xcpbm="+FormName.xcpbm.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sqxh)=="") {
		alert("请输入[申请序号]！");
		FormName.sqxh.focus();
		return false;
	}
	if(!(isNumber(FormName.sqxh, "申请序号"))) {
		return false;
	}
	if(	javaTrim(FormName.xcpflbm)=="") {
		alert("请选择[印刷品分类]！");
		FormName.xcpflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xcpbm)=="") {
		alert("请输入[印刷品]！");
		FormName.xcpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xcpmc)=="") {
		alert("请输入[印刷品名称]！");
		FormName.xcpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	if(	javaTrim(FormName.jhlqsl)=="") {
		alert("请输入[计划领取数量]！");
		FormName.jhlqsl.focus();
		return false;
	}
	if(!(isFloat(FormName.jhlqsl, "计划领取数量"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
