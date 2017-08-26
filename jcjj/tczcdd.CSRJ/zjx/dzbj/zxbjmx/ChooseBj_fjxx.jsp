<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
	String khbh=request.getParameter("khbh");
	String zjxxh=request.getParameter("zjxxh");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%" height="42" > 
      <div align="center">
        <p><b>增加房间信息</b></p>
      </div>
    </td>
  </tr>
  <tr> 
    <td width="100%" height="86"> 
      <div align="center"> 
        <form method="post" action="" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="31%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="存盘" onClick="submit_onclick(insertform)">
                  &nbsp;&nbsp;&nbsp;&nbsp; </div>
              </td>
              <td width="8%" height="2" align="left">&nbsp;</td>
              <td width="15%" height="2" align="left"> &nbsp;&nbsp;&nbsp;&nbsp; 
                <input type="reset"  value="重输" name="reset">
              </td>
              <td width="31%" height="2">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" valign="middle"> 
                <div align="right">被选择房间</div>
              </td>
              <td width="31%"> 
                <input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <select name="jgwzbm" style="FONT-SIZE:14px;WIDTH:190px" size="25" multiple  ondblclick="codeDBClick(insertform)">
                </select>
              </td>
              <td width="8%" valign="middle"> 
                <div align="center"> 
                  <p> 
                    <input type="button"  value="&lt;==" onClick="add(insertform)">
                  </p>
                  <p> 
                    <input type="button"  value="==&gt;" onClick="remove(insertform)">
                  </p>
                </div>
              </td>
              <td width="15%" valign="middle"> 
                <div align="right">可供选择房间</div>
              </td>
              <td width="31%"> 
                <select name="jgwzbm1" style="FONT-SIZE:14px;WIDTH:190px" size="25" multiple ondblclick="code1DBClick(insertform)">
                  <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc c2 from bdm_jgwzbm where jgwzmc not in(select jgwzbm from bj_fjxx where  khbh='"+khbh+"') order by jgwzbm","");
%> 
                </select>
              </td>
            </tr>
          </table>
        </form>
      </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function add(FormName)//参数FormName:Form的名称
{
	for (var i=0; i<FormName.jgwzbm1.options.length; i++)
	{
		if (FormName.jgwzbm1.options[i].selected)
		{
			var op1=document.createElement("OPTION");
			op1.text=FormName.jgwzbm1.options[i].text;
			op1.value=FormName.jgwzbm1.options[i].value;
			FormName.jgwzbm.add(op1);
		}
	}
	for (var i=FormName.jgwzbm1.options.length-1; i>=0; --i)
	{
		if (FormName.jgwzbm1.options[i].selected)
		{
			FormName.jgwzbm1.remove(i);
		}
	}
}
function remove(FormName)//参数FormName:Form的名称
{
	for (var i=0; i<FormName.jgwzbm.options.length; i++)
	{
		if (FormName.jgwzbm.options[i].selected)
		{
			var op1=document.createElement("OPTION");
			op1.text=FormName.jgwzbm.options[i].text;
			op1.value=FormName.jgwzbm.options[i].value;
			FormName.jgwzbm1.add(op1);
		}
	}
	for (var i=FormName.jgwzbm.options.length-1; i>=0; --i)
	{
		if (FormName.jgwzbm.options[i].selected)
		{
			FormName.jgwzbm.remove(i);
		}
	}
}
function codeDBClick(FormName)//参数FormName:Form的名称
{
	if (FormName.jgwzbm.selectedIndex==-1)
	{
		return;
	}
	var op1=document.createElement("OPTION");
	op1.text=FormName.jgwzbm.options[FormName.jgwzbm.selectedIndex].text;
	op1.value=FormName.jgwzbm.options[FormName.jgwzbm.selectedIndex].value;
	FormName.jgwzbm1.add(op1);
	FormName.jgwzbm.remove(FormName.jgwzbm.selectedIndex);
}
function code1DBClick(FormName)//参数FormName:Form的名称
{
	if (FormName.jgwzbm1.selectedIndex==-1)
	{
		return;
	}
	var op1=document.createElement("OPTION");
	op1.text=FormName.jgwzbm1.options[FormName.jgwzbm1.selectedIndex].text;
	op1.value=FormName.jgwzbm1.options[FormName.jgwzbm1.selectedIndex].value;
	FormName.jgwzbm.add(op1);
	FormName.jgwzbm1.remove(FormName.jgwzbm1.selectedIndex);
}

function submit_onclick(FormName)//参数FormName:Form的名称
{
	if (FormName.jgwzbm.length==0)
	{
		alert("请[选择房间]！");
		FormName.jgwzbm.focus();
		return false;
	}
	for(i=0;i<FormName.jgwzbm.length;i++){                                                                         
		FormName.jgwzbm.options[i].selected = true;                                                                         
	}                                                                        


	FormName.action="SaveChooseBj_fjxx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
