<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
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
-->
</style>
</head>
<%
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>型材门名称</td>
      <td width="32%"> 
      <input type="text" name="xcmmc" value="" size="20" maxlength="50" >      </td>
      <td align="right" width="18%">安装位置</td>
      <td width="32%"> 
        <select name="azwz" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select bgmazwzmc c1,bgmazwzmc c2 from jdm_bgmazwzbm order by bgmazwzmc","");
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>型材门类型</td>
      <td><select name="xcmlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getBklxxh(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xcmlxbm,xcmlxmc from jdm_xcmlxbm order by xcmlxbm","");
%>
      </select></td>
      <td align="right">边框颜色</td>
      <td><select name="bkys" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
	cf.selectItem(out,"select bgmbkysmc c1,bgmbkysmc c2 from jdm_bgmbkysbm order by bgmbkysmc","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><B>
      <div id="bklxxhTxt"></div></B></td>
      <td colspan="3"> 
        <select name="bklxxh" style="FONT-SIZE:12PX;WIDTH:620PX" onChange="getMbcl(insertform)">
          <option value=""></option>
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">装饰线条</td>
      <td colspan="3"><input type="text" name="zsxt" value="" size="86" maxlength="50" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">产品说明</td>
      <td colspan="3"><textarea name="bjbz" cols="85" rows="2" readonly></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#FF0000">*</font>总高度</td>
      <td width="32%"> 
        <input type="text" name="gd" value="" size="10" maxlength="8" onChange="f_wdzje(insertform)">
      mm </td>
      <td width="18%" align="right"><font color="#FF0000">*</font>总宽度</td>
      <td width="32%"> 
        <input type="text" name="kd" value="" size="10" maxlength="8" onChange="f_wdzje(insertform)">
      mm </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><b><font color="#0000CC">总面积</font></b></td>
      <td width="32%"><input name="zmj" type="text" value="" size="9" maxlength="8" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
      <td colspan="2"><b><font color="#990000">注意：[面板1面积]+[面板2面积]应等于[总面积]</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#FF0000">*</font>其它收费</td>
      <td width="32%"> 
      <input type="text" name="qtsf" value="0" size="20" maxlength="17" onChange="f_wdzje(insertform)">      </td>
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000FF">总价</font></td>
      <td width="32%"> 
      <input type="text" name="zj" value="" size="20" maxlength="17" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="85" rows="2"></textarea>      </td>
    </tr>
  </table>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center" bgcolor="#E8E8FF">
      <td width="5%" ><strong>面板</strong></td>
      <td width="27%" ><B>
      <div id="mbclTxt"></div></B></td>
      <td width="27%">芯板配置</td>
      <td width="8%"><strong><font color="#FF0000">*</font><font color="#0000FF">平米单价</font></strong></td>
      <td width="8%"><strong><font color="#FF0000">*</font><font color="#0000FF">延米单价</font></strong></td>
      <td width="8%"><strong><font color="#FF0000">*</font>高度(mm)</strong></td>
      <td width="8%"><strong><font color="#FF0000">*</font>宽度(mm)</strong></td>
      <td width="9%"><strong><font color="#0000FF">面积(㎡)</font></strong></td>
    </tr>
    <tr align="center" bgcolor="#FFFFFF"> 
      <td>面板一</td>
      <td><select name="mbcl1" style="FONT-SIZE:12PX;WIDTH:240PX" onChange="getXbpz1(insertform)">
        <option value=""></option>
      </select></td>
      <td><select name="xbpz1" style="FONT-SIZE:12PX;WIDTH:240PX"  onChange="getDj1(insertform)">
        <option value=""></option>
      </select></td>
      <td><input type="text" name="pmdj1" value="" size="8" maxlength="17" readonly></td>
      <td><input type="text" name="ymdj1" value="" size="8" maxlength="17" readonly></td>
      <td><input type="text" name="gd1" value="" size="8" maxlength="8" onChange="f_wdzje(insertform)"></td>
      <td><input type="text" name="kd1" value="" size="8" maxlength="8" onChange="f_wdzje(insertform)"></td>
      <td>
		<input name="mj1" type="text" value="" size="9" maxlength="9" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">	  </td>
    </tr>
    <tr align="center" bgcolor="#FFFFFF"> 
      <td>面板二</td>
      <td><select name="mbcl2" style="FONT-SIZE:12PX;WIDTH:240PX" onChange="getXbpz2(insertform)">
        <option value=""></option>
      </select></td>
      <td><select name="xbpz2" style="FONT-SIZE:12PX;WIDTH:240PX" onChange="getDj2(insertform)">
        <option value=""></option>
      </select></td>
      <td><input type="text" name="pmdj2" value="" size="8" maxlength="17" readonly></td>
      <td><input type="text" name="ymdj2" value="" size="8" maxlength="17" readonly></td>
      <td><input type="text" name="gd2" value="" size="8" maxlength="8" onChange="f_wdzje(insertform)"></td>
      <td><input type="text" name="kd2" value="" size="8" maxlength="8" onChange="f_wdzje(insertform)"></td>
      <td>
		<input name="mj2" type="text" value="" size="9" maxlength="8" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">	  </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr> 
      <td colspan="4" align="center"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
          <input type="button" name="copybj" value="Excel拷贝型材门" onClick="f_copy(insertform)">
        <input type="reset"  value="重输" name="reset">
        <input type="hidden" name="xcmbm1" value="">
        <input type="hidden" name="xcmbm2" value="">
        <input type="hidden" name="jjfs1" value="">
        <input type="hidden" name="jjfs2" value="">
        <input type="hidden" name="ddbh" value="<%=ddbh%>">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function addItem(f1,text,value)
{
	var op1=document.createElement("OPTION");
	op1.text=text;
	op1.value=value;
	f1.add(op1);
}

function getBklxxh(FormName)
{
	FormName.pmdj1.value="";
	FormName.ymdj1.value="";
	FormName.pmdj2.value="";
	FormName.ymdj2.value="";
	FormName.bklxxh.length=1;
	FormName.mbcl1.length=1;
	FormName.mbcl2.length=1;

	FormName.xbpz1.length=0;
	addItem(FormName.xbpz1,"","")
	FormName.xbpz2.length=0;
	addItem(FormName.xbpz2,"","")

	if(	javaTrim(FormName.xcmlxbm)=="") {
		return false;
	}

	if (FormName.xcmlxbm.value=="01")
	{
		document.getElementById('bklxxhTxt').innerHTML="";
		txtNode=document.createTextNode("**边框型号");
		document.getElementById('bklxxhTxt').appendChild(txtNode);

		document.getElementById('mbclTxt').innerHTML="";
		txtNode=document.createTextNode("**材料");
		document.getElementById('mbclTxt').appendChild(txtNode);
	}
	else if (FormName.xcmlxbm.value=="02")
	{
		document.getElementById('bklxxhTxt').innerHTML="";
		txtNode=document.createTextNode("**刀型");
		document.getElementById('bklxxhTxt').appendChild(txtNode);

		document.getElementById('mbclTxt').innerHTML="";
		txtNode=document.createTextNode("**花色");
		document.getElementById('mbclTxt').appendChild(txtNode);
	}
	else if (FormName.xcmlxbm.value=="03")
	{
		document.getElementById('bklxxhTxt').innerHTML="";
		txtNode=document.createTextNode("**刀型");
		document.getElementById('bklxxhTxt').appendChild(txtNode);

		document.getElementById('mbclTxt').innerHTML="";
		txtNode=document.createTextNode("**花色");
		document.getElementById('mbclTxt').appendChild(txtNode);
	}
	else if (FormName.xcmlxbm.value=="04")
	{
		document.getElementById('bklxxhTxt').innerHTML="";
		txtNode=document.createTextNode("**门型");
		document.getElementById('bklxxhTxt').appendChild(txtNode);

		document.getElementById('mbclTxt').innerHTML="";
		txtNode=document.createTextNode("**材料");
		document.getElementById('mbclTxt').appendChild(txtNode);
	}

	var str="Jc_jjxcmmxCx.jsp?xcmlxbm="+escape(escape(FormName.xcmlxbm.value))+"&lx=1";
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getMbcl(FormName)
{
	FormName.pmdj1.value="";
	FormName.ymdj1.value="";
	FormName.pmdj2.value="";
	FormName.ymdj2.value="";

	FormName.mbcl1.length=1;
	FormName.mbcl2.length=1;

	FormName.xbpz1.length=0;
	addItem(FormName.xbpz1,"","")
	FormName.xbpz2.length=0;
	addItem(FormName.xbpz2,"","")

	if(	javaTrim(FormName.xcmlxbm)=="") {
		return false;
	}
	if(	javaTrim(FormName.bklxxh)=="") {
		return false;
	}

	var str="Jc_jjxcmmxCx.jsp?xcmlxbm="+escape(escape(FormName.xcmlxbm.value))+"&bklxxh="+escape(escape(FormName.bklxxh.value))+"&lx=2";
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getXbpz1(FormName)
{
	FormName.pmdj1.value="";
	FormName.ymdj1.value="";

	FormName.xbpz1.length=0;
	addItem(FormName.xbpz1,"","")

	if(	javaTrim(FormName.xcmlxbm)=="") {
		return false;
	}
	if(	javaTrim(FormName.bklxxh)=="") {
		return false;
	}
	if(	javaTrim(FormName.mbcl1)=="") {
		return false;
	}

	var str="Jc_jjxcmmxCx.jsp?xcmlxbm="+escape(escape(FormName.xcmlxbm.value))+"&bklxxh="+escape(escape(FormName.bklxxh.value))+"&mbcl1="+escape(escape(FormName.mbcl1.value))+"&lx=3";
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getXbpz2(FormName)
{
	FormName.pmdj2.value="";
	FormName.ymdj2.value="";

	FormName.xbpz2.length=0;
	addItem(FormName.xbpz2,"","")

	if(	javaTrim(FormName.xcmlxbm)=="") {
		return false;
	}
	if(	javaTrim(FormName.bklxxh)=="") {
		return false;
	}
	if(	javaTrim(FormName.mbcl2)=="") {
		return false;
	}

	var str="Jc_jjxcmmxCx.jsp?xcmlxbm="+escape(escape(FormName.xcmlxbm.value))+"&bklxxh="+escape(escape(FormName.bklxxh.value))+"&mbcl2="+escape(escape(FormName.mbcl2.value))+"&lx=4";
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getDj1(FormName)
{
	FormName.pmdj1.value="";
	FormName.ymdj1.value="";

	if(	javaTrim(FormName.xcmlxbm)=="") {
		return false;
	}
	if(	javaTrim(FormName.bklxxh)=="") {
		return false;
	}
	if(	javaTrim(FormName.mbcl1)=="") {
		return false;
	}
	if(	javaTrim(FormName.xbpz1)=="") {
		return false;
	}


	var str="Jc_jjxcmmxCx.jsp?xcmlxbm="+escape(escape(FormName.xcmlxbm.value))+"&bklxxh="+escape(escape(FormName.bklxxh.value))+"&mbcl1="+escape(escape(FormName.mbcl1.value))+"&xbpz1="+escape(escape(FormName.xbpz1.value))+"&lx=5";
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getDj2(FormName)
{
	FormName.pmdj2.value="";
	FormName.ymdj2.value="";

	if(	javaTrim(FormName.xcmlxbm)=="") {
		return false;
	}
	if(	javaTrim(FormName.bklxxh)=="") {
		return false;
	}
	if(	javaTrim(FormName.mbcl2)=="") {
		return false;
	}
	if(	javaTrim(FormName.xbpz2)=="") {
		return false;
	}


	var str="Jc_jjxcmmxCx.jsp?xcmlxbm="+escape(escape(FormName.xcmlxbm.value))+"&bklxxh="+escape(escape(FormName.bklxxh.value))+"&mbcl2="+escape(escape(FormName.mbcl2.value))+"&xbpz2="+escape(escape(FormName.xbpz2.value))+"&lx=6";
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_wdzje(FormName)//参数FormName:Form的名称
{
	var mj1=FormName.gd1.value/1000.0*FormName.kd1.value/1000.0;
	var mj2=FormName.gd2.value/1000.0*FormName.kd2.value/1000.0;
	var zmj=FormName.gd.value/1000.0*FormName.kd.value/1000.0;


	mj1=round(mj1,6);
	mj2=round(mj2,6);
	zmj=round(zmj,6);

	FormName.mj1.value=mj1;
	FormName.mj2.value=mj2;
	FormName.zmj.value=zmj;

	var je1=0;
	var je2=0;

	if (FormName.jjfs1.value=="1")//1：平米单价；2：平米单价＋封边延米单价
	{
		je1=mj1*FormName.pmdj1.value;
	}
	else{
		var zc=(FormName.gd1.value/1000.0+FormName.kd1.value/1000.0)*2;
		je1=mj1*FormName.pmdj1.value+zc*FormName.ymdj1.value;
	}

	if (FormName.jjfs2.value=="1")//1：平米单价；2：平米单价＋封边延米单价
	{
		je2=mj2*FormName.pmdj2.value;
	}
	else{
		var zc=(FormName.gd2.value/1000.0+FormName.kd2.value/1000.0)*2;
		je2=mj2*FormName.pmdj2.value+zc*FormName.ymdj2.value;
	}

	var je=0;
	je=je1+je2+FormName.qtsf.value*1.0;
	je=round(je,2);
	FormName.zj.value=je;
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xcmmc)=="") {
		alert("请输入[型材门名称]！");
		FormName.xcmmc.focus();
		return false;
	}

	if(	javaTrim(FormName.xcmlxbm)=="") {
		alert("请选择[型材门类型]！");
		FormName.xcmlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bklxxh)=="") {
		alert("请输入[边框型号、刀型、门型]！");
		FormName.bklxxh.focus();
		return false;
	}

	if(	javaTrim(FormName.gd)=="") {
		alert("请输入[总高度]！");
		FormName.gd.focus();
		return false;
	}
	if(!(isNumber(FormName.gd, "总高度"))) {
		return false;
	}
	if(	javaTrim(FormName.kd)=="") {
		alert("请输入[总宽度]！");
		FormName.kd.focus();
		return false;
	}
	if(!(isNumber(FormName.kd, "总宽度"))) {
		return false;
	}

	if(FormName.zmj.value=="" || FormName.zmj.value=="0") {
		alert("[总面积]不能为0！");
		FormName.zmj.focus();
		return false;
	}

	if(FormName.mbcl1.value=="") {
		alert("请输入[面板1材料/花色]！");
		FormName.mbcl1.focus();
		return false;
	}
	if(	javaTrim(FormName.pmdj1)=="") {
		alert("请输入[面板1平米单价]！");
		FormName.pmdj1.focus();
		return false;
	}
	if(!(isFloat(FormName.pmdj1, "面板1平米单价"))) {
		return false;
	}
	if(	javaTrim(FormName.ymdj1)=="") {
		alert("请输入[面板1延米单价]！");
		FormName.ymdj1.focus();
		return false;
	}
	if(!(isFloat(FormName.ymdj1, "面板1延米单价"))) {
		return false;
	}

	if(FormName.pmdj1.value=="" || FormName.pmdj1.value=="0") {
		alert("[面板1平米单价]不能为0！");
		FormName.pmdj1.focus();
		return false;
	}

	if(	javaTrim(FormName.gd1)=="") {
		alert("请输入[面板1高度]！");
		FormName.gd1.focus();
		return false;
	}
	if(!(isNumber(FormName.gd1, "面板1高度"))) {
		return false;
	}

	if(	javaTrim(FormName.kd1)=="") {
		alert("请输入[面板1宽度]！");
		FormName.kd1.focus();
		return false;
	}
	if(!(isNumber(FormName.kd1, "面板1宽度"))) {
		return false;
	}

	if(FormName.mj1.value=="" || FormName.mj1.value=="0") {
		alert("[面板1面积]不能为0！");
		FormName.mj1.focus();
		return false;
	}


	if(FormName.mbcl2.value!="") 
	{
		if(FormName.pmdj2.value=="" || FormName.pmdj2.value=="0") {
			alert("[面板2平米单价]不能为0！");
			FormName.pmdj2.focus();
			return false;
		}
	}


	if (FormName.jjfs1.value=="1")//1：平米单价；2：平米单价＋封边延米单价
	{
		if (parseFloat(FormName.pmdj1.value)==0)
		{
			alert("错误！[面板一平米单价]不能为0");
			FormName.pmdj1.focus();
			return false;
		}

		if (parseFloat(FormName.ymdj1.value)!=0)
		{
			alert("错误！[面板一延米单价]应该为0");
			FormName.ymdj1.focus();
			return false;
		}
	}
	else if (FormName.jjfs1.value=="2")//1：平米单价；2：平米单价＋封边延米单价
	{
		if (parseFloat(FormName.pmdj1.value)==0)
		{
			alert("错误！[面板一平米单价]不能为0");
			FormName.pmdj1.focus();
			return false;
		}

		if (parseFloat(FormName.ymdj1.value)==0)
		{
			alert("错误！[面板一延米单价]不能为0");
			FormName.ymdj1.focus();
			return false;
		}
	}

	if (FormName.jjfs2.value=="1")//1：平米单价；2：平米单价＋封边延米单价
	{
		if (parseFloat(FormName.pmdj2.value)==0)
		{
			alert("错误！[面板二平米单价]不能为0");
			FormName.pmdj2.focus();
			return false;
		}

		if (parseFloat(FormName.ymdj2.value)!=0)
		{
			alert("错误！[面板二延米单价]应该为0");
			FormName.ymdj2.focus();
			return false;
		}
	}
	else if (FormName.jjfs2.value=="2")//1：平米单价；2：平米单价＋封边延米单价
	{
		if (parseFloat(FormName.pmdj2.value)==0)
		{
			alert("错误！[面板二平米单价]不能为0");
			FormName.pmdj2.focus();
			return false;
		}

		if (parseFloat(FormName.ymdj2.value)==0)
		{
			alert("错误！[面板二延米单价]不能为0");
			FormName.ymdj2.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.qtsf)=="") {
		alert("请输入[其它收费]！");
		FormName.qtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtsf, "其它收费"))) {
		return false;
	}

	if(	javaTrim(FormName.zj)=="") {
		alert("请输入[总价]！");
		FormName.zj.focus();
		return false;
	}
	if(!(isFloat(FormName.zj, "总价"))) {
		return false;
	}
	if (FormName.zj.value=="0")
	{
		alert("错误！[总价]不能为0");
		FormName.zj.focus();
		return false;
	}

	f_wdzje(FormName);

	var mj1=FormName.gd1.value/1000.0*FormName.kd1.value/1000.0;
	var mj2=FormName.gd2.value/1000.0*FormName.kd2.value/1000.0;
	var zmj=FormName.gd.value/1000.0*FormName.kd.value/1000.0;

	if (FormName.mbcl1.value!="" && FormName.mbcl2.value!="")
	{
		if (zmj==mj1)
		{
			alert("错误！有两种材料,[面板1]面积不能等于总面积！");
			FormName.gd1.focus();
			return false;
		}
		if (zmj==mj2)
		{
			alert("错误！有两种材料,[面板2]面积不能等于总面积！");
			FormName.gd2.focus();
			return false;
		}
	}

	//检查总面积
	if (round(zmj,6)!=round(mj1+mj2,6))
	{
		alert("错误！[面板1面积]+[面板2面积]="+round(mj1+mj2,6)+"，不等于[总面积]＝"+round(zmj,6)+"！");
		FormName.gd1.focus();
		return false;
	}

	if (FormName.mbcl2.value=="")
	{
		FormName.gd2.value="";
		FormName.kd2.value="";

		if (zmj!=mj1)
		{
			alert("错误！因[面板面板2]为空，所以[面板1]面积应等于总面积！");
			FormName.gd1.focus();
			return false;
		}
	}

	FormName.action="SaveInsertJc_jjxcmmx.jsp";
	FormName.submit();
	return true;
}



function f_copy(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="EnetrExcelCopyXcm.jsp";
	FormName.submit();
	return true;
}




//-->
</SCRIPT>
