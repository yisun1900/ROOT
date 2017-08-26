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
	String yhdlm=request.getParameter("yhdlm");
	if ((yhdlm==null)||(yhdlm.equals("")))
	{
		yhdlm="-1";
	}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="94%"> 
      <div align="center"> 
        <p><b><font face="仿宋_GB2312" size="4">供应商<font color="#FF0000">&gt;==&gt;==&gt;</font>用户组</font></b></p>
        <p>&nbsp;</p>
      </div>
    </td>
  </tr>
  <tr> 
    <td width="94%" height="184"> 
      <div align="center"> 
        <form method="post" action="" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" valign="top" height="26"> 
                <div align="right">用户名称</div>
              </td>
              <td colspan="4" valign="top" height="26"> 
                <select name="yhdlm" style="FONT-SIZE:12px;WIDTH:300px" onchange="selectgroup(insertform)">
<%
	String sql="";
	sql=" select yhdlm,yhdlm||yhmc||'（供应商用户）' from jxc_ppgysdzb where yhdlm='"+yhdlm+"' order by yhmc";
	cf.selectItem(out,sql,yhdlm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" valign="top"> 
                <div align="right">已分配用户组</div>
              </td>
              <td width="31%"> 
                <select name="yhzbh" style="FONT-SIZE:12px;WIDTH:160px;" size="13" multiple  ondblclick="codeDBClick(insertform)">
                  <%
	cf.selectItem(out,"select sq_yhssz.yhzbh,yhzmc  from sq_yhssz,sq_yhz where sq_yhssz.yhzbh=sq_yhz.yhzbh and  sq_yhz.yhzbh!='000000' and jb='2' and yhdlm='"+yhdlm+"' order by yhzmc","");
%> 
                </select>
              </td>
              <td width="8%" valign="middle"> 
                <div align="center"> 
                  <p> 
                    <input type="button"  value="&lt;==" onclick="add(insertform)">
                  </p>
                  <p> 
                    <input type="button"  value="==&gt;" onclick="remove(insertform)">
                  </p>
                </div>
              </td>
              <td width="15%" valign="top"> 
                <div align="right">未分配用户组</div>
              </td>
              <td width="31%"> 
                <select name="yhzbh1" style="FONT-SIZE:12px;WIDTH:160px" size="13" multiple ondblclick="code1DBClick(insertform)">
                  <%
cf.selectItem(out,"select yhzbh,yhzmc from sq_yhz where sq_yhz.yhzbh!='000000' and jb='2' and yhzbh not in(select yhzbh from sq_yhssz where yhdlm='"+yhdlm+"') order by yhzmc","");
%> 
                </select>
              </td>
            </tr>
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
          </table>
        </form>
      </div>
    </td>
  </tr>
  <tr> 
    <td width="94%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function add(FormName)//参数FormName:Form的名称
{
	for (var i=0; i<FormName.yhzbh1.options.length; i++)
	{
		if (FormName.yhzbh1.options[i].selected)
		{
			var op1=document.createElement("OPTION");
			op1.text=FormName.yhzbh1.options[i].text;
			op1.value=FormName.yhzbh1.options[i].value;
			FormName.yhzbh.add(op1);
		}
	}
	for (var i=FormName.yhzbh1.options.length-1; i>=0; --i)
	{
		if (FormName.yhzbh1.options[i].selected)
		{
			FormName.yhzbh1.remove(i);
		}
	}
}
function remove(FormName)//参数FormName:Form的名称
{
	for (var i=0; i<FormName.yhzbh.options.length; i++)
	{
		if (FormName.yhzbh.options[i].selected)
		{
			var op1=document.createElement("OPTION");
			op1.text=FormName.yhzbh.options[i].text;
			op1.value=FormName.yhzbh.options[i].value;
			FormName.yhzbh1.add(op1);
		}
	}
	for (var i=FormName.yhzbh.options.length-1; i>=0; --i)
	{
		if (FormName.yhzbh.options[i].selected)
		{
			FormName.yhzbh.remove(i);
		}
	}
}
function codeDBClick(FormName)//参数FormName:Form的名称
{
	if (FormName.yhzbh.selectedIndex==-1)
	{
		return;
	}
	var op1=document.createElement("OPTION");
	op1.text=FormName.yhzbh.options[FormName.yhzbh.selectedIndex].text;
	op1.value=FormName.yhzbh.options[FormName.yhzbh.selectedIndex].value;
	FormName.yhzbh1.add(op1);
	FormName.yhzbh.remove(FormName.yhzbh.selectedIndex);
}
function code1DBClick(FormName)//参数FormName:Form的名称
{
	if (FormName.yhzbh1.selectedIndex==-1)
	{
		return;
	}
	var op1=document.createElement("OPTION");
	op1.text=FormName.yhzbh1.options[FormName.yhzbh1.selectedIndex].text;
	op1.value=FormName.yhzbh1.options[FormName.yhzbh1.selectedIndex].value;
	FormName.yhzbh.add(op1);
	FormName.yhzbh1.remove(FormName.yhzbh1.selectedIndex);
}
function selectgroup(FormName)//参数FormName:Form的名称
{

	FormName.action="grouptouser.jsp";
	FormName.submit();
	return true;
}
function submit_onclick(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yhdlm)=="") {
		alert("请输入[用户名称]！");
		FormName.yhdlm.focus();
		return false;
	}
	
	var ls="";
	for (var i=0; i<FormName.yhzbh.options.length; i++)
	{
		FormName.yhzbh.options[i].selected = true;     
	}

	FormName.action="savegrouptouserGys.jsp";
//	alert("saveusertogroup.jsp"+ls)
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
