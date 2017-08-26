<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String yhdlm=(String)session.getAttribute("yhdlm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String xmmc=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT xmmc";
	ls_sql+=" FROM bj_zdyxmb";
	ls_sql+=" where bj_zdyxmb.lrr='"+lrr+"' and bj_zdyxmb.xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=rs.getString("xmmc");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertBj_zdyglfxb.jsp" name="insertform" target="_blank">
<div align="center">录入－自定义项目工料分析表</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">项目录入人</span></td> 
  <td width="32%"><input type="text" name="xmlrr" value="<%=lrr%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>工料分类</td> 
  <td width="32%"><%
	cf.radioItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm","glflbm","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">项目编号</span></td> 
  <td width="32%"> 
    <input type="text" name="xmbh" value="<%=xmbh%>" size="20" maxlength="16" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE2">项目名称</span></td> 
  <td width="32%"><%=xmmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>工料分析材料</td>
  <td colspan="3">
	<input type="text" name="glfxclmc" value="" size="72" maxlength="100" onKeyUp="changheIn(insertform)">
	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>计量单位</td> 
  <td width="32%">
    <select name="valuelist" id="sel" style="position:absolute;WIDTH:300; left:19%;FONT-SIZE:12px;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
	</select>  
  
  <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>单价</td> 
  <td width="32%"><input type="text" name="dj" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>消耗量</td> 
  <td width="32%"><input type="text" name="xhl" value="" size="20" maxlength="17" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>甲醛释放量</td> 
  <td width="32%"><input type="text" name="jqsfl" value="0" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>苯释放量</td> 
  <td width="32%"><input type="text" name="bsfl" value="0" size="20" maxlength="17" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>TVOC释放量</td> 
  <td width="32%"><input type="text" name="tvocsfl" value="0" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>类型</td> 
  <td width="32%"> 
    <input type="radio" name="lx"  value="1">打印
    <input type="radio" name="lx"  value="2">不打印  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否需要物流领料</td> 
  <td width="32%"> 
    <input type="radio" name="wlllbz"  value="Y">需要
    <input type="radio" name="wlllbz"  value="N">否  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="32%"> 
    <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="32%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
	<input type="button"  value="存盘" onClick="f_do(insertform)"></td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>

//当在下拉框外单击时，下拉框消失
document.onclick=function()
{
	insertform.valuelist.style.display='none';
}

//改变输入值
function changheIn(FormName)
{   

	if(event.keyCode==13)//回车
	{
		insertform.valuelist.style.display='none';
	}
	else if(event.keyCode==38)//上箭头
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[FormName.valuelist.length-1].selected=true;
		mark="last";

		oldtext=FormName.glfxclmc.value;

		FormName.glfxclmc.value=FormName.valuelist.options[FormName.valuelist.length-1].text;
	}
	else if(event.keyCode==40)//下箭头
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[0].selected=true;
		mark="first";

		oldtext=FormName.glfxclmc.value;

		FormName.glfxclmc.value=FormName.valuelist.options[0].text;
	}
	else{//其它键
		if(FormName.glfxclmc.value=="") 
		{
			insertform.valuelist.style.display='none';
			return;
		}

		//获取列表
		var actionStr="GetListByAjax.jsp?dqbm=<%=dqbm%>&invalue="+FormName.glfxclmc.value;

//		window.open(actionStr);
		openAjax(actionStr);  
	}

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
	insertform.valuelist.length=0;

	if (ajaxRetStr!="")
	{
		insertform.valuelist.style.display='block';
		strToItem3(insertform.valuelist,ajaxRetStr);
	}
	else{
		insertform.valuelist.style.display='none';
	}

}

//改变下拉框条目
function changeItem(FormName,field)
{
	if(event.keyCode==38)//上箭头
	{
		if (mark=="last")
		{
			mark="";
		}

		FormName.glfxclmc.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==0)
		{
			if (mark=="first")
			{
				field.value="";
				mark="";

				FormName.glfxclmc.value=oldtext;

				FormName.glfxclmc.focus();
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

		FormName.glfxclmc.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==field.length-1)
		{
			if (mark=="last")
			{
				field.value="";
				mark="";

				FormName.glfxclmc.value=oldtext
				FormName.glfxclmc.focus();
			}
			else{
				mark="last";
			}
		}
	}
	else if(event.keyCode==13)//回车
	{
		insertform.valuelist.style.display='none';
		FormName.glfxclmc.focus();
	}
}

//双击下拉框条目
function selectCk(FormName,field)
{
	insertform.valuelist.style.display='none';
	FormName.glfxclmc.value=field.options[field.selectedIndex].text;
	FormName.glfxclmc.focus();
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xmlrr)=="") {
		alert("请输入[项目录入人]！");
		FormName.xmlrr.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.glflbm)) {
		alert("请选择[工料分类]！");
		FormName.glflbm[0].focus();
		return false;
	}
	if(	javaTrim(FormName.glfxclmc)=="") {
		alert("请输入[工料分析材料名称]！");
		FormName.glfxclmc.focus();
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
	if(	javaTrim(FormName.xhl)=="") {
		alert("请输入[消耗量]！");
		FormName.xhl.focus();
		return false;
	}
	if(!(isFloat(FormName.xhl, "消耗量"))) {
		return false;
	}
	if(	javaTrim(FormName.jqsfl)=="") {
		alert("请输入[甲醛释放量]！");
		FormName.jqsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.jqsfl, "甲醛释放量"))) {
		return false;
	}
	if(	javaTrim(FormName.bsfl)=="") {
		alert("请输入[苯释放量]！");
		FormName.bsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.bsfl, "苯释放量"))) {
		return false;
	}
	if(	javaTrim(FormName.tvocsfl)=="") {
		alert("请输入[TVOC释放量]！");
		FormName.tvocsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.tvocsfl, "TVOC释放量"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
