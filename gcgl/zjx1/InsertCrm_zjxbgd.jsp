<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT khbh";
	ls_sql+=" FROM crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString(1);
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
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

int leftAjax=100; 
int topAjax=95;
int rowHeightAjax=27;
int widthAjax=108;

%>


<html>
<head>
<title>录入增减项变更单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE2 {color: #0000CC}
.STYLE3 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="insertform" >
  <div align="center">录入增减项变更单（增减项序号：<%=zjxxh%>)</div>
  <table border="1" cellspacing="0" cellpadding="1" width="120%" style='FONT-SIZE: 12px'>

    <tr bgcolor="#CCCCCC"  align="center"> 
		<td width="3%">序号</td>
		<td width="9%"><span class="STYLE3">*</span>类型</td>
		<td width="9%"><span class="STYLE3">*</span>项目编号</td>
		<td width="20%" bgcolor="#CCCCCC"><span class="STYLE2"><span class="STYLE3">*</span>项目名称</span></td>
		<td width="9%" bgcolor="#CCCCCC"><span class="STYLE2"><span class="STYLE3">*</span>计量单位</span></td>
		<td width="9%" bgcolor="#CCCCCC"><span class="STYLE2"><span class="STYLE3">*</span>单价</span></td>
		<td width="9%"><span class="STYLE2">目前数量</span></td>
		<td width="9%"><span class="STYLE3">*</span>增减数量</td>
		<td width="10%"><span class="STYLE2"><span class="STYLE3">*</span>增减金额</span></td>
		<td width="9%">房间</td>
		<td width="32%">说明</td>
    </tr>
<%
for (int row=0;row<20 ;row++ )
{
	%>
    <tr bgcolor="#FFFFF"  align="center"> 
      <td><%=(row+1)%>
          <input type="hidden" name="xh"  value="<%=(row+1)%>" >	  </td>
      <td>
	  <select name="lx" style="FONT-SIZE:12PX;WIDTH:62PX">
		<option value=""></option>
		<%
			cf.selectToken(out,"1+增量＋&2+减量－&<BR>3+增项目＋&4+减项目－","");
		%>	
	  </select>	  </td>
      <td>
		<input name="xmbh" type="text"  value="" size="12" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyIn(insertform,<%=row%>)">
		<div style='position:absolute; WIDTH:300; left: <%=leftAjax%>; top:<%=(topAjax+row*rowHeightAjax)%>; z-index:2' id='cen'> 
        <select name="itemlist" id="sel" style="FONT-SIZE:12px;WIDTH:<%=widthAjax%>%;display:none" size="20" onKeyUp="keyItem(insertform,this,<%=row%>)" onclick ="selectCk(insertform,this,<%=row%>)">
        </select>
		</div>	  </td>
      <td> 
        <input type="text" name="xmmc"  readonly value="" size="30" maxlength="100" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">      </td>
      <td> 
        <input type="text" name="jldw" readonly value="" size="7" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">      </td>
      <td><input type="text" name="dj" readonly value="" size="7" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">      </td>
      <td> 
        <input type="text" name="ysl" readonly value="" size="7" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">      </td>
      <td> 
        <input type="text" name="sl" value="" size="7" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">      </td>
	  <td> 
        <input type="text" name="je" readonly value="" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">      </td>
      <td><input name="fj" type="text"  value="" size="12" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
      <td> 
        <input type="text" name="sm" value="" size="50" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">      </td>
    </tr>
	<%
}
%>

    <tr> 
      <td colspan="10" align="center" > 
          <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
          <input type="button"  value="保存" onClick="f_do(insertform)" >      </td>
    </tr>
  </table>
</form>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

var ajaxlx;
var curRow;

//当在下拉框外单击时，下拉框消失
document.onclick=function()
{
	for (var i=0;i<20 ;i++ )
	{
		insertform.itemlist[i].style.display='none';
	}
}

//输入框中输入键值
function keyIn(FormName,row)
{   
	curRow=row;
	//获取型号列表       
	if(event.keyCode==13)//回车
	{
		insertform.itemlist[row].style.display='none';

		ajaxlx=2;
		actionStr="GetCpxxByAjax.jsp?khbh=<%=khbh%>&xmbh="+FormName.xmbh[row].value;

//		window.open(actionStr);
		openAjax(actionStr);
	}
	else if(event.keyCode==38)//上箭头
	{
		FormName.itemlist[row].focus();
		FormName.itemlist[row].options[FormName.itemlist[row].length-1].selected=true;
		mark="last";

		oldtext=FormName.xmbh[row].value;

		FormName.xmbh[row].value =FormName.itemlist[row].options[FormName.itemlist[row].length-1].value;
	}
	else if(event.keyCode==40)//下箭头
	{
		FormName.itemlist[row].focus();
		FormName.itemlist[row].options[0].selected=true;
		mark="first";

		oldtext=FormName.xmbh[row].value;

		FormName.xmbh[row].value =FormName.itemlist[row].options[0].value;
	}
	else{

		if(FormName.xmbh[row].value=="") 
		{
			insertform.itemlist[row].style.display='none';
			return;
		}

		//获取型号列表
		ajaxlx=1;
		actionStr="GetListByAjax.jsp?khbh=<%=khbh%>&xmbh="+FormName.xmbh[row].value ;
//		window.open(actionStr);
		openAjax(actionStr);  
	}

}                                                                                                                                                       


//下拉框中输入键值
function keyItem(FormName,field,row)
{
	if(event.keyCode==38)//上箭头
	{
		if (mark=="last")
		{
			mark="";
		}

		FormName.xmbh[row].value =field.options[field.selectedIndex].value;

		if (field.selectedIndex==0)//到第一行，若再向上则回到输入框，还原当时离开时的数值
		{
			if (mark=="first")
			{
				field.value="";
				mark="";

				FormName.xmbh[row].value=oldtext;
				FormName.xmbh[row].focus();
			}
			else{
				mark="first";
			}
		}
	}
	else if(event.keyCode==40)//下箭头
	{
		if (mark=="first")
		{
			mark="";
		}

		FormName.xmbh[row].value =field.options[field.selectedIndex].value;

		if (field.selectedIndex==field.length-1)//到最后一行，若再向下则回到输入框，还原当时离开时的数值
		{
			if (mark=="last")
			{
				field.value="";
				mark="";

				FormName.xmbh[row].value=oldtext;
				FormName.xmbh[row].focus();
			}
			else{
				mark="last";
			}
		}
	}
	else if(event.keyCode==13)
	{
		insertform.itemlist[row].style.display='none';

		ajaxlx=2;
		actionStr="GetCpxxByAjax.jsp?khbh=<%=khbh%>&xmbh="+field.options[field.selectedIndex].value;
//		window.open(actionStr);
		openAjax(actionStr);
	}
}

//单击下拉框
function selectCk(FormName,field,row)
{
	insertform.itemlist[row].style.display='none';

	ajaxlx=2;
	actionStr="GetCpxxByAjax.jsp?khbh=<%=khbh%>&xmbh="+field.options[field.selectedIndex].value;
//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	//去除前面的换行符
	while (true)
	{
		if (ajaxRetStr.substring(0,1)=="\r")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else if (ajaxRetStr.substring(0,1)=="\n")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else{
			break;
		}
	}

	//生成下拉框
	if(ajaxlx==1)
	{
		insertform.itemlist[curRow].length=0;


		if (ajaxRetStr!="")
		{
			xhsz=ajaxRetStr.split("^");
			len=xhsz.length;

			insertform.itemlist[curRow].style.display='block';

			for(var i=0;i<len;i++)
			{
				insertform.itemlist[0].size=len;

				var pos=xhsz[i].indexOf("~");
				var lsvalue=xhsz[i].substring(0,pos);
				var lstext=xhsz[i].substring(pos+1,xhsz[i].length);

				var op1=document.createElement("option");
				op1.value=lsvalue;
				op1.text=lstext;
				insertform.itemlist[curRow].add(op1);
			}
		}
		else{
			insertform.itemlist[curRow].style.display='none';
		}
	}
	else{//获取下拉框内容
		xhsz2=ajaxRetStr.split("+");

		insertform.xmmc[curRow].value=xhsz2[0];
		insertform.jldw[curRow].value=xhsz2[1];
		insertform.dj[curRow].value=xhsz2[2];
		insertform.ysl[curRow].value=xhsz2[3];
	}

}


function f_do(FormName)//参数FormName:Form的名称
{

	FormName.action="SaveInsertCrm_zjxbgd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>