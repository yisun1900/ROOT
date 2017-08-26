<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String gysddph=null;
gysddph=cf.GB2Uni(request.getParameter("gysddph"));
String dqbm=null;
String gysmc=null;
String cgjhph=null;   

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,gysmc ";
	ls_sql+=" from  jxc_gysdd";
	ls_sql+=" where gysddph='"+gysddph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
	}
	rs.close();
	ps.close();
	ls_sql="select cgjhph ";
	ls_sql+=" from  jxc_cgjhddb";
	ls_sql+=" where gysddph='"+gysddph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		cgjhph=cf.fillNull(rs.getString("cgjhph"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_rkdjh.jsp" name="insertform" target="">
<div align="center">请录入数据</div>
<div align="center">
<a href="#" onClick="window.open('/jxc/bz/ckbh.jsp','center','width=400,height=350,top=300,left=350');" title="为何我的入库仓库不能显示？"><font size="-1"><b>帮助</b></font></a> 
</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">入库人</td>
  <td><input type="text" name="rkr" value="<%=yhmc%>" size="20"  readonly></td>
  <td align="right">入库材料类型</td>
  <td><select name="rkcllx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="1">辅材</option>
  </select></td>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">地区编码</td> 
  <td width="35%"> 
  <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changedqbm(insertform)">
    <%
//	if (yhjs.equals("A0") || yhjs.equals("A1"))
//	{
//		out.print("<option value=\"\"></option>");
//		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where (1=1)  order by dqmc","");
//	}
//	else
//	{
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqmc","");
//	}
%>
  </select>    </td>
  <td align="right" width="15%">入库仓库</td> 
  <td width="35%"> 
	<select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
//	if (yhjs.equals("A0") || yhjs.equals("A1"))
//	{
//		out.print("<option value=\"\"></option>");
//	}
//	else
//	{
	out.print("<option value=\"\"></option>");
	cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' and dqbm='"+dqbm+"'  order by ckmc","");
//	}
%>
  </select></td>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">供货单位</td> 
  <td colspan="3">
  <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:352PX" >
    <%
	cf.selectItem(out,"select gysmc mc,gysmc from jxc_gysxx where gysmc='"+gysmc+"'  order by gysmc","");
%>
  </select>
<!--   <input type="text" name="gysmc" id="txt" size="60" maxlength="100"  onKeyup="changheIn(insertform,this);" onDblClick="changheIn2(insertform,this);">（双击可选择）
	
	<div style='position:absolute; WIDTH:153; left: 80; top:40; z-index:2' id='cen'> 
		<select name="xhlist" id="sel" style="FONT-SIZE:12px;WIDTH:100%;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
		</select>
	</div> -->
	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">采购单号</td> 
  <td width="35%"> 
    <input type="text" name="cgdh" value="<%=cgjhph%>" size="20" maxlength="13" readonly>
	 <input type="hidden" name="rklx" value="C" size="20" maxlength="13" ></td>
  <td align="right" width="15%">来源单号</td> 
  <td width="35%"> 
    <input type="text" name="lydh" value="<%=gysddph%>" size="20" maxlength="50" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">生产日期</td> 
  <td width="35%"> 
    <input type="text" name="scrq" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
	</td>
  <td align="right" width="15%">生产批号</td> 
  <td width="35%"> 
    <input type="text" name="scph" value="" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="2" ></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
&nbsp;<br>
<center><span id="wcp">数据未存盘</span><font color="blue" ><span id="ycp"></span></font></center>
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

function openAjax3(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax3;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}
function openAjax4(actionStr) 
{
	creatAjax();
	xmlHttp.onreadystatechange = responseAjax4;
	xmlHttp.open("GET",actionStr, true);
	xmlHttp.send(null);
}

function responseAjax3() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax3(retStr);
		}
		else
		{	
			alert("错误！Ajax响应失败！");
		}
    }

}


function responseAjax4() 
{
    if (xmlHttp.readyState == 4)
	{	
		if(xmlHttp.status == 200)
		{
			var retStr = xmlHttp.responseText;
			getAjax4(retStr);
		}
		else
		{	
			alert("错误！Ajax响应失败！");
		}
    }
}
//初始化Ajax＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


function changedqbm(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.ckbh.length=1;

	if (FormName.dqbm.value=="")
	{
		return;
	}
	else
	{
	var sql;

	sql="select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='<%=yhdlm%>' and dqbm='"+FormName.dqbm.value+"' order by ckmc";
//	alert(sql);
	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax3(actionStr);
	}
}

function getAjax3(ajaxRetStr) 
{
//	alert("Ajax返回值："+ajaxRetStr);
	
	//需要用javaScript处理返回值
	strToSelect(insertform.ckbh,ajaxRetStr);
}
function changeckbh(FormName) //改变下拉列表的值，触发Ajax
{
	FormName.hjbh.length=1;

	if (FormName.ckbh.value=="")
	{
		return;
	}
	else
	{
	var sql;
	sql="select hjbh,hjmc from jxc_hjmc where ckbh='"+FormName.ckbh.value+"' order by hjmc";

	var actionStr="/ajax/getAjaxRetValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax4(actionStr);
	}
}

function getAjax4(ajaxRetStr) 
{
//	alert("Ajax返回值："+ajaxRetStr);
	
	//需要用javaScript处理返回值
	strToSelect(insertform.hjbh,ajaxRetStr);
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("请输入[入库仓库]！");
		FormName.ckbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("请输入[供货单位]！");
		FormName.gysmc.focus();
		return false;
	}
	if(	javaTrim(FormName.cgdh)=="") {
		alert("请输入[采购单号]！");
		FormName.cgdh.focus();
		return false;
	}
	if(	javaTrim(FormName.lydh)=="") {
		alert("请输入[来源单号]！");
		FormName.lydh.focus();
		return false;
	}
	
	if(	javaTrim(FormName.rklx)=="") {
		alert("请输入[入库类型]！");
		FormName.rklx.focus();
		return false;
	}
	wcp.innerHTML="";
	ycp.innerHTML="您已经点击过存盘，如果失败请继续，如果成功请关闭本页！";
	FormName.submit();
	return true;
}



//-->
</SCRIPT>