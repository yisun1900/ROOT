<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>有奖调查</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
session.setAttribute("flag1","N");
String wtbh=null;
String wtmc=null;
String szcs =null;
String zybm="";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
int flag=0;
%>
<form method="POST" action="SaveYjdcIndex.jsp" name="listform" target="_blank">
<table width="74%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE:12;BORDER-COLLAPSE: collapse" >

<%
try {
	conn=cf.getConnection();
	int row=0;
	
	String wtkxda=null;//问题可选答案
	String sfkdx=null;
	String sfyxsm="";
	String jgsm="";
	ls_sql="select wtbh,wtmc,decode(sfkdx,'Y','可多选','单选') sfkdx ";
	ls_sql+=" from  hd_scdcwt where wtsfgq='N'";//Y：过期&N：没有过期
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while(rs.next())
	{
		wtbh=cf.fillNull(rs.getString("wtbh"));
		wtmc=cf.fillNull(rs.getString("wtmc"));
		sfkdx=cf.fillNull(rs.getString("sfkdx"));
		
		row++;
%>

		<tr><td height="25" bgcolor="#F1FCFE"><strong><%=row%>.<%=wtmc%>?(<%=sfkdx%>)</strong><input type="hidden" name="wtbh" value="<%=wtbh%>"></td></tr>
<%	

		wtkxda="";
		int count=0;

		ls_sql="select wtkxda,sfyxsm,jgsm ";
		ls_sql+=" from  hd_dcwtkxda where wtbh='"+wtbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		
		while(rs1.next())
		{
			wtkxda=rs1.getString("wtkxda");
			sfyxsm=rs1.getString("sfyxsm");
			jgsm=rs1.getString("jgsm");
			//out.print(ls_sql);
			count++;
			flag=flag+count;
			//out.print(flag);
			if(sfkdx.equals("可多选"))
			{
%>
				<tr><td>&nbsp;&nbsp;&nbsp;<%=count%>).<% out.print("\n<input name=\"wtbh"+row+"\" type=checkbox value=\""+wtkxda+"\" check=\"^0{1,}$\" warning=\"您有至少有一个题目没有选,请仔细查看!谢谢!\">");%> <%=jgsm%><input type="hidden" NAME="sfyxsm<%=row%>" value="<%=sfyxsm%>" ></td></tr>
<%
			}else
			{
			
%>
				<tr><td>&nbsp;&nbsp;&nbsp;<%=count%>).<% out.print("\n<input name=\"wtbh"+row+"\" type=radio value=\""+wtkxda+"\" check=\"^0$\" warning=\"您有至少有一个题目没有选,请仔细查看!谢谢!\">");%><%=jgsm%><input type="hidden" NAME="sfyxsm<%=row%>" value="<%=sfyxsm%>" ></td></tr>


<%			}
		}
		rs1.close();
		ps1.close();

		if(sfyxsm.equals("Y") && sfkdx.equals("可多选") )
		{
%>
			<tr><td>&nbsp;&nbsp;&nbsp;<%=(count+1)%>).<% out.print("\n<input type=checkbox name=\"wtbh"+row+"\"  value=\"其它\">");%>其它.
			<input type="text" name="temp<%=row%>" style="BORDER-RIGHT: black 0px solid; PADDING-RIGHT: 0px; BORDER-TOP: black 0px solid; PADDING-LEFT: 0px; FONT-SIZE: 12px; PADDING-BOTTOM: 0px; MARGIN: 0px; VERTICAL-ALIGN: top; BORDER-LEFT: black 0px solid; WIDTH: 90px; COLOR: #3f8805; LINE-HEIGHT: 17px; PADDING-TOP: 0px; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: '宋体'; TOP: 0px; HEIGHT: 15px;  " > </td></tr>
<%
		}else if(sfyxsm.equals("Y") && sfkdx.equals("单选"))
		{
				%>
				<tr><td>&nbsp;&nbsp;&nbsp;<%=(count+1)%>).<% out.print("\n<input name=\"wtbh"+row+"\" type=radio  value=\"其它\">");%>其它.<input type="text" name="temp<%=row%>" style="BORDER-RIGHT: black 0px solid; PADDING-RIGHT: 0px; BORDER-TOP: black 0px solid; PADDING-LEFT: 0px; FONT-SIZE: 12px; PADDING-BOTTOM: 0px; MARGIN: 0px; VERTICAL-ALIGN: top; BORDER-LEFT: black 0px solid; WIDTH: 90px; COLOR: #3f8805; LINE-HEIGHT: 17px; PADDING-TOP: 0px; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: '宋体'; TOP: 0px; HEIGHT: 15px;  " ></td></tr>
				<%
		}
		else{}
		%>
		<input type="hidden" name="sfyxsm<%=row%>" value="<%=sfyxsm%>">
		<%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
  <TR><TD>

  </td></tr>
  <%
  if(flag>0)
  {
%>
  <tr bgcolor="#FFFFFF">

	<td > 
	<table width="60%" height="25" border="0" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td align="center">
              <input type="button" name="Submit" value="确定" onClick="CheckForm(listform)">
              <input type="button" name="Submit2" value="重置" onClick="listform.reset()">
              <input type="button" name="Submit3" value="查看" onclick="window.open('ckjg.jsp',target='_self')">
            </td>
                            </tr>
                          </table>
	</td>
	</tr>
<%}else
	{
%>
<tr bgcolor="#FFFFFF">

	<td > 
	<table width="100%" style="FONT-SIZE: 12px;border-collapse:collapse" >
	<TR><TD WIDTH="253"></TD><TD WIDTH="385">
          
        <table width="96%" height="100" border="1" cellpadding="0" cellspacing="1" bordercolor="#999999"  style="FONT-SIZE: 12px;border-collapse:collapse" >
          <TR>
            <TD width="100%" height="27" bgcolor="#D0D0FF"><font size="3"><strong>[系统提示]</strong></font></TD>
          </TR>
		  <TR>
            <TD width="100%" height="51"><div align="center">对不起，暂时还没有数据信息！</div></TD>
          </TR>
		  <TR>
            <TD width="100%" height="16" bgcolor="#D0D0FF"><div align="center">
               <!--  <input type="submit"  value="确定"> -->
                <input type="button"  value="返回" onClick="window.history.back()"> 
              </div></TD>
          </TR>
		  </TABLE>
		 </TD><TD WIDTH="339"></TD>
		  <TR>
</TABLE>
	</td>
	</tr>

<%
	}
%>

</table>
</form>

</body>
</html>
<SCRIPT language=javascript >


<!--
function f_to(xxx,listform,row)
{
	if(listform.item("temp"+row).value=="")
	{
		alert("请输入相应的信息!");
		listform.item("temp"+row).focus();
		//return;
	}else
	{
		listform.item("wtbh"+row)[xxx].value=listform.item("temp"+row).value;
		//listform.item("wwp"+row).value=listform.item("temp"+row).value;
	}


}
function CheckForm(oForm)
{
	var els = oForm.elements;

	for(var i=0;i<els.length;i++)
	{
		//是否需要验证
		if(els[i].check)
		{
			//取得验证的正则字符串
			var sReg = els[i].check;
			var sVal = GetValue(els[i]);
			var reg = new RegExp(sReg,"i");
			if(!reg.test(sVal))
			{
				//验证不通过,弹出提示warning
				alert(els[i].warning);
				GoBack(els[i])
				return false;
				
			}
		}
	}
	//oForm.pe.disabled="true"
	oForm.submit();
	return true;
}

function GetValue(el)
{
//取得表单元素的类型
var sType = el.type;
switch(sType)
{
case "text":
case "hidden":
case "password":
case "file":
case "textarea": return el.value;
case "checkbox":
case "radio": return GetValueChoose(el);
case "select-one":
case "select-multiple": return GetValueSel(el);
}
function GetValueChoose(el)
{
var sValue = "";
var tmpels = document.getElementsByName(el.name);
for(var i=0;i<tmpels.length;i++)
{
if(tmpels[i].checked)
{
sValue += "0";
}
}
return sValue;
}
function GetValueSel(el)
{
var sValue = "";
for(var i=0;i<el.options.length;i++)
{
if(el.options[i].selected && el.options[i].value!="")
{
sValue += "0";
}
}
return sValue;
}
}


function GoBack(el)
{
var sType = el.type;
switch(sType)
{
case "text":
case "hidden":
case "password":
case "file":
case "textarea": el.focus();var rng = el.createTextRange(); rng.collapse(false); rng.select();
case "checkbox":
case "radio": var els = document.getElementsByName(el.name);els[0].focus();
case "select-one":
case "select-multiple":el.focus();
}
}

//-->
</script>