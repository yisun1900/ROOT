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
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");

	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");

%>

<body bgcolor="#FFFFFF">
<table width="105%">
  <tr> 
    <td width="94%"> 
      <div align="center"> 
        <p><b><font face="仿宋_GB2312" size="4">用户<font color="#FF0000">&gt;==&gt;==&gt;</font>用户组</font></b></p>
      </div>
    </td>
  </tr>
  <tr> 
    <td width="94%" height="86"> 
      <div align="center"> 
        <form method="post" action="" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="8%" valign="top" align="right">组名</td>
              <td colspan="4"> 
                <select name="yhzbh" style="FONT-SIZE:12px;WIDTH:152px" onChange="selectgroup(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhzbh,yhzmc from sq_yhz where yhzbh='000000' order by yhzmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td rowspan="4" valign="top" align="right" width="8%" bgcolor="#FFCCFF"> 
                <div align="right">已分配用户名</div>
              </td>
              <td rowspan="4" valign="top" width="38%" bgcolor="#FFCCFF"> 
                <select name="yhdlm" style="FONT-SIZE:12px;WIDTH:280px" size="34" multiple  ondblclick="codeDBClick(insertform)">
                </select>
              </td>
              <td colspan="2" valign="middle" align="right" bgcolor="#FFFFCC">分公司</td>
              <td width="42%" bgcolor="#FFFFCC"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectYh(insertform);selectItem(fgs,dwbh,<%=dwstr%>);">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="2" valign="middle" align="right" bgcolor="#FFFFCC">所属单位</td>
              <td width="42%" bgcolor="#FFFFCC"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectYh(insertform)">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2','Y0','S0','S1') and cxbz='N' and ssfgs='"+xzfgs+"' order by dwbh",xzdwbh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="2" valign="middle" align="right" bgcolor="#FFFFCC">职务</td>
              <td width="42%" bgcolor="#FFFFCC"> 
                <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectYh(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xzzwbm,xzzwmc from dm_xzzwbm order by xzzwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="2" valign="middle" bgcolor="#FFFFCC"> 
                <div align="center"> 
                  <p> 未分配用户名 </p>
                  <p>&nbsp;</p>
                  <p>&nbsp;</p>
                  <p>&nbsp;</p>
                  <p> 
                    <input type="button"  value="&lt;==" onclick="add(insertform)">
                  </p>
                  <p> 
                    <input type="button"  value="==&gt;" onclick="remove(insertform)">
                  </p>
                </div>
                <div align="right"></div>
              </td>
              <td width="42%" valign="top" bgcolor="#FFFFCC"> 
                <select name="yhdlm1" style="FONT-SIZE:12px;WIDTH:280px" size="29" multiple ondblclick="code1DBClick(insertform)">
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="5" height="2"> 
                <div align="center"> 
                  <input type="button"  value="存盘" onClick="submit_onclick(insertform)">
                  <input type="reset"  value="重输" name="reset">
                </div>
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
	for (var i=0; i<FormName.yhdlm1.options.length; i++)
	{
		if (FormName.yhdlm1.options[i].selected)
		{
			var op1=document.createElement("OPTION");
			op1.text=FormName.yhdlm1.options[i].text;
			op1.value=FormName.yhdlm1.options[i].value;
			FormName.yhdlm.add(op1);
		}
	}
	for (var i=FormName.yhdlm1.options.length-1; i>=0; --i)
	{
		if (FormName.yhdlm1.options[i].selected)
		{
			FormName.yhdlm1.remove(i);
		}
	}
}
function remove(FormName)//参数FormName:Form的名称
{
	for (var i=0; i<FormName.yhdlm.options.length; i++)
	{
		if (FormName.yhdlm.options[i].selected)
		{
			var op1=document.createElement("OPTION");
			op1.text=FormName.yhdlm.options[i].text;
			op1.value=FormName.yhdlm.options[i].value;
			FormName.yhdlm1.add(op1);
		}
	}
	for (var i=FormName.yhdlm.options.length-1; i>=0; --i)
	{
		if (FormName.yhdlm.options[i].selected)
		{
			FormName.yhdlm.remove(i);
		}
	}
}
function codeDBClick(FormName)//参数FormName:Form的名称
{
	if (FormName.yhdlm.selectedIndex==-1)
	{
		return;
	}
	var op1=document.createElement("OPTION");
	op1.text=FormName.yhdlm.options[FormName.yhdlm.selectedIndex].text;
	op1.value=FormName.yhdlm.options[FormName.yhdlm.selectedIndex].value;
	FormName.yhdlm1.add(op1);
	FormName.yhdlm.remove(FormName.yhdlm.selectedIndex);
}
function code1DBClick(FormName)//参数FormName:Form的名称
{
	if (FormName.yhdlm1.selectedIndex==-1)
	{
		return;
	}
	var op1=document.createElement("OPTION");
	op1.text=FormName.yhdlm1.options[FormName.yhdlm1.selectedIndex].text;
	op1.value=FormName.yhdlm1.options[FormName.yhdlm1.selectedIndex].value;
	FormName.yhdlm.add(op1);
	FormName.yhdlm1.remove(FormName.yhdlm1.selectedIndex);
}

function addYh(str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	insertform.yhdlm.add(op1);
}

function addYh1(str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	insertform.yhdlm1.add(op1);
}

function selectgroup(FormName)//参数FormName:Form的名称
{
	FormName.yhdlm.length=0;

	FormName.target="menu";
	FormName.action="YhxxCx.jsp?lx=1";
	FormName.submit();
}

function selectYh(FormName)//参数FormName:Form的名称
{
	FormName.yhdlm1.length=0;

	for (var i=0; i<FormName.yhdlm.options.length; i++)
	{
		FormName.yhdlm.options[i].selected = true;     
		
	}

	FormName.target="menu";
	FormName.action="YhxxCx.jsp?lx=2";
	FormName.submit();
}
function submit_onclick(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yhzbh)=="") {
		alert("请输入[用户组名称]！");
		FormName.yhzbh.focus();
		return false;
	}
	
	var ls="";
	for (var i=0; i<FormName.yhdlm.options.length; i++)
	{
		FormName.yhdlm.options[i].selected = true;     
		
	}

	FormName.target="_blank";
	FormName.action="saveusertogroupCj.jsp";
//	alert("saveusertogroup.jsp"+ls)
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
