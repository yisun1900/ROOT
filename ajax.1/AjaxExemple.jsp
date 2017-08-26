<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />



<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">签单客户--维护</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">分公司</td>
              <td width="32%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<option value=""></option>
				 <OPTION  value="99999">优铂利总部</OPTION>
				 <OPTION  value="FBJ00">北京分公司</OPTION>
				 <OPTION  value="FQD00">青岛分公司</OPTION>
				 <OPTION  value="FTJ00">天津分公司</OPTION>
 				</select></td>
              <td width="17%" align="right">签约店面</td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
				<option value=""></option>
                </select></td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
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


function changeFgs(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	sql="select dwbh,dwmc from sq_dwxx where ssfgs='"+FormName.fgs.value+"' order by dwbh";

	var actionStr="getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
//	alert("Ajax返回值："+ajaxRetStr);
	
	//需要用javaScript处理返回值
	strToSelect(selectform.dwbh,ajaxRetStr);
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




//-->
</SCRIPT>
