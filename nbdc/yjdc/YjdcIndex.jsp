<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>�н�����</title>
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
	
	String wtkxda=null;//�����ѡ��
	String sfkdx=null;
	String sfyxsm="";
	String jgsm="";
	ls_sql="select wtbh,wtmc,decode(sfkdx,'Y','�ɶ�ѡ','��ѡ') sfkdx ";
	ls_sql+=" from  hd_scdcwt where wtsfgq='N'";//Y������&N��û�й���
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
			if(sfkdx.equals("�ɶ�ѡ"))
			{
%>
				<tr><td>&nbsp;&nbsp;&nbsp;<%=count%>).<% out.print("\n<input name=\"wtbh"+row+"\" type=checkbox value=\""+wtkxda+"\" check=\"^0{1,}$\" warning=\"����������һ����Ŀû��ѡ,����ϸ�鿴!лл!\">");%> <%=jgsm%><input type="hidden" NAME="sfyxsm<%=row%>" value="<%=sfyxsm%>" ></td></tr>
<%
			}else
			{
			
%>
				<tr><td>&nbsp;&nbsp;&nbsp;<%=count%>).<% out.print("\n<input name=\"wtbh"+row+"\" type=radio value=\""+wtkxda+"\" check=\"^0$\" warning=\"����������һ����Ŀû��ѡ,����ϸ�鿴!лл!\">");%><%=jgsm%><input type="hidden" NAME="sfyxsm<%=row%>" value="<%=sfyxsm%>" ></td></tr>


<%			}
		}
		rs1.close();
		ps1.close();

		if(sfyxsm.equals("Y") && sfkdx.equals("�ɶ�ѡ") )
		{
%>
			<tr><td>&nbsp;&nbsp;&nbsp;<%=(count+1)%>).<% out.print("\n<input type=checkbox name=\"wtbh"+row+"\"  value=\"����\">");%>����.
			<input type="text" name="temp<%=row%>" style="BORDER-RIGHT: black 0px solid; PADDING-RIGHT: 0px; BORDER-TOP: black 0px solid; PADDING-LEFT: 0px; FONT-SIZE: 12px; PADDING-BOTTOM: 0px; MARGIN: 0px; VERTICAL-ALIGN: top; BORDER-LEFT: black 0px solid; WIDTH: 90px; COLOR: #3f8805; LINE-HEIGHT: 17px; PADDING-TOP: 0px; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: '����'; TOP: 0px; HEIGHT: 15px;  " > </td></tr>
<%
		}else if(sfyxsm.equals("Y") && sfkdx.equals("��ѡ"))
		{
				%>
				<tr><td>&nbsp;&nbsp;&nbsp;<%=(count+1)%>).<% out.print("\n<input name=\"wtbh"+row+"\" type=radio  value=\"����\">");%>����.<input type="text" name="temp<%=row%>" style="BORDER-RIGHT: black 0px solid; PADDING-RIGHT: 0px; BORDER-TOP: black 0px solid; PADDING-LEFT: 0px; FONT-SIZE: 12px; PADDING-BOTTOM: 0px; MARGIN: 0px; VERTICAL-ALIGN: top; BORDER-LEFT: black 0px solid; WIDTH: 90px; COLOR: #3f8805; LINE-HEIGHT: 17px; PADDING-TOP: 0px; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: '����'; TOP: 0px; HEIGHT: 15px;  " ></td></tr>
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
              <input type="button" name="Submit" value="ȷ��" onClick="CheckForm(listform)">
              <input type="button" name="Submit2" value="����" onClick="listform.reset()">
              <input type="button" name="Submit3" value="�鿴" onclick="window.open('ckjg.jsp',target='_self')">
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
            <TD width="100%" height="27" bgcolor="#D0D0FF"><font size="3"><strong>[ϵͳ��ʾ]</strong></font></TD>
          </TR>
		  <TR>
            <TD width="100%" height="51"><div align="center">�Բ�����ʱ��û��������Ϣ��</div></TD>
          </TR>
		  <TR>
            <TD width="100%" height="16" bgcolor="#D0D0FF"><div align="center">
               <!--  <input type="submit"  value="ȷ��"> -->
                <input type="button"  value="����" onClick="window.history.back()"> 
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
		alert("��������Ӧ����Ϣ!");
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
		//�Ƿ���Ҫ��֤
		if(els[i].check)
		{
			//ȡ����֤�������ַ���
			var sReg = els[i].check;
			var sVal = GetValue(els[i]);
			var reg = new RegExp(sReg,"i");
			if(!reg.test(sVal))
			{
				//��֤��ͨ��,������ʾwarning
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
//ȡ�ñ�Ԫ�ص�����
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