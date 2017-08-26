<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String xsph=request.getParameter("xsph");
String dqbm=request.getParameter("dqbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_cljgbCxList.jsp" name="insertform">
<div align="center">销售单－选择材料（销售单号：<%=xsph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">所属地区</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqmc","");
%>
      </select>    </td>
    <td align="right">是否常用</td>
    <td><input type="radio" name="sfcy" value="Y">常用
      <input type="radio" name="sfcy" value="N">非常用    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">销售方式</td>
    <td colspan="3">
		<input type="radio" name="xsfs" value="1">代销品（无库存）
		<input type="radio" name="xsfs" value="2">现货下单，现货出库 
		<input type="radio" name="xsfs" value="3">库存无货可下单，现货出库 	
		<input type="radio" name="xsfs" value="4">允许负库存	
	</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right">材料大类</td>
  <td><select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeClxlbm(insertform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc mc,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
  </select></td>
  <td align="right">材料小类</td>
  <td><select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">品牌</td>
  <td><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changePp(insertform)">
    <option value=""></option>
    <%
	cf.selectItem(out,"select scsmc mc,scsmc from jxc_scsxx where scslb in('1','3') order by scsmc","");
%>
  </select></td>
  <td align="right">子品牌</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">材料编码</td> 
  <td width="32%"> 
    <input type="text" name="clbm" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">内部编码</td> 
  <td width="32%"><input type="text" name="nbbm" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">材料名称</td>
  <td><input type="text" name="clmc" size="20" maxlength="50" >（模糊）</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">型号</td> 
  <td width="32%"><input type="text" name="xh" size="20" maxlength="100" ></td>
  <td align="right" width="18%">规格</td> 
  <td width="32%"><input type="text" name="gg" size="20" maxlength="100" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">每页显示数量</td>
  <td><input type="text" name="myxssl" size="20" value="100"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
	  <input type="hidden" name="xsph" value="<%=xsph%>" >
    <input type="button"  value="查询" onClick="f_do(insertform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

//初始化Ajax＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始，固定代码不需改变
function creatAjax() 
{
   if(window.XMLHttpRequest)
	{ 
		xmlHttp = new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{
		try
		{
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e)
		{
			try
			{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (e)
			{
			}
		}
	}
}
function openAjax(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function openAjax2(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax2;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function responseAjax2() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax2(retStr);
		}
		else
		{	
			alert("错误！Ajax响应失败！");
		}
    }
}

function responseAjax() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax(retStr);
		}
		else
		{	
			alert("错误！Ajax响应失败！");
		}
    }
}
//初始化Ajax＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


function changeClxlbm(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.clxlbm.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select clxlmc mc,clxlmc from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
	}
}
function changePp(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.ppmc.length=1;

	if (FormName.scsmc.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select ppmc mc,ppmc from jxc_ppxx where scsmc='"+FormName.scsmc.value+"' order by ppmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax2(actionStr);
	}
}

function getAjax(ajaxRetStr) 
{
//	alert("Ajax返回值："+ajaxRetStr);
	
	//需要用javaScript处理返回值
	strToSelect(insertform.clxlbm,ajaxRetStr);
}
function getAjax2(ajaxRetStr) 
{
//	alert("Ajax返回值："+ajaxRetStr);
	
	//需要用javaScript处理返回值
	strToSelect(insertform.ppmc,ajaxRetStr);
}



//把字符串转换为下拉列表数据，用%、+分割
//不同行%分割，同一行用＋分割
function strToSelect(field,str)
{ 
	//返回值多一个回车换行，需取消＋＋＋＋＋＋＋＋＋开始
	while (true)
	{
		if (str.substring(0,1)=="\r")
		{
			str=str.substring(1);
		}
		else if (str.substring(0,1)=="\n")
		{
			str=str.substring(1);
		}
		else{
			break;
		}
	}
	//返回值多一个回车换行，需取消＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	if (str=="")//空值返回
	{
		return;
	}


	if (str.substring(0,1)=="%")//第一个字符是%，删除
	{
		str=str.substring(1);
	}
	
	//加入下拉框中
	var i=0;
	field.options[i] = new Option("","" );
	i++;
	while((str!="")&&(str!=null))
	{
		lstart=str.indexOf("+");
		lend=str.indexOf("%");
		if (lend==-1)
		{
			lend=str.length;
		}
		lcode=str.substring(0,lstart);
		lname=str.substring(lstart+1,lend);

		field.options[i] = new Option(lname,lcode );
		i++;
		str=str.substring(lend+1,str.length);
	}
	field.length = i;
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.myxssl)=="") {
		alert("请选择[每页显示数量]！");
		FormName.myxssl.focus();
		return false;
	}
	if(!(isNumber(FormName.myxssl, "每页显示数量"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
