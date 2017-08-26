<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入自购主材</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
-->
</style>
</head>
<%
String khbh=request.getParameter("khbh");
String khxm=cf.executeQuery("select khxm from crm_zxkhxx where khbh='"+khbh+"'");
%>

<body bgcolor="#ffffff"  style='FONT-SIZE: 12px;' >
<form method="post" action="" name="editform" >
<center>录入自购主材（<%=khxm%>）</center>
<table border="0" width="100%" cellspacing="1" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="22%">主材名称</td>
	<td  width="35%">规格/型号/品牌</td>
	<td  width="9%">计量单位</td>
	<td  width="9%">单价</td>
	<td  width="9%">数量</td>
	<td  width="12%"><span class="STYLE1">金额</span></td>
</tr>

<tr bgcolor="#E8E8FF"  align="center"> 
	<td>1</td>
	<td> 
		<input type="text" name="zcmc" value="" size="28" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[0])">
	</td>
	<td> 
		<input type="text" name="bz" value="" size="46" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[0])">
	</td>
	<td>
		<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(dj[0])">
		  <option value=""></option>
		<%
			cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
		%>
		</select>
	</td>
	<td>
		<input type="text" name="dj" value="" size="10" maxlength="15" onChange="f_jsjg(editform,0)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[0])">
	</td>
	<td>
		<input type="text" name="sl" value="" size="10" maxlength="15" onChange="f_jsjg(editform,0)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[1])">
	</td>
	<td>
		<input type="text" name="je" value="" size="13" maxlength="15" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">
	</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center"> 
	<td>2</td>
	<td> 
		<input type="text" name="zcmc" value="" size="28" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[1])">
	</td>
	<td> 
		<input type="text" name="bz" value="" size="46" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[1])">
	</td>
	<td>
		<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(dj[1])">
		  <option value=""></option>
		<%
			cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
		%>
		</select>
	</td>
	<td>
		<input type="text" name="dj" value="" size="10" maxlength="15" onChange="f_jsjg(editform,1)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[1])">
	</td>
	<td>
		<input type="text" name="sl" value="" size="10" maxlength="15" onChange="f_jsjg(editform,1)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[2])">
	</td>
	<td>
		<input type="text" name="je" value="" size="13" maxlength="15" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">
	</td>
</tr>
<tr bgcolor="#E8E8FF"  align="center"> 
	<td>3</td>
	<td> 
		<input type="text" name="zcmc" value="" size="28" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[2])">
	</td>
	<td> 
		<input type="text" name="bz" value="" size="46" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[2])">
	</td>
	<td>
		<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(dj[2])">
		  <option value=""></option>
		<%
			cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
		%>
		</select>
	</td>
	<td>
		<input type="text" name="dj" value="" size="10" maxlength="15" onChange="f_jsjg(editform,2)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[2])">
	</td>
	<td>
		<input type="text" name="sl" value="" size="10" maxlength="15" onChange="f_jsjg(editform,2)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[3])">
	</td>
	<td>
		<input type="text" name="je" value="" size="13" maxlength="15" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">
	</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center"> 
	<td>4</td>
	<td> 
		<input type="text" name="zcmc" value="" size="28" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[3])">
	</td>
	<td> 
		<input type="text" name="bz" value="" size="46" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[3])">
	</td>
	<td>
		<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(dj[3])">
		  <option value=""></option>
		<%
			cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
		%>
		</select>
	</td>
	<td>
		<input type="text" name="dj" value="" size="10" maxlength="15" onChange="f_jsjg(editform,3)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[3])">
	</td>
	<td>
		<input type="text" name="sl" value="" size="10" maxlength="15" onChange="f_jsjg(editform,3)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[4])">
	</td>
	<td>
		<input type="text" name="je" value="" size="13" maxlength="15" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">
	</td>
</tr>
<tr bgcolor="#E8E8FF"  align="center"> 
	<td>5</td>
	<td> 
		<input type="text" name="zcmc" value="" size="28" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[4])">
	</td>
	<td> 
		<input type="text" name="bz" value="" size="46" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[4])">
	</td>
	<td>
		<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(dj[4])">
		  <option value=""></option>
		<%
			cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
		%>
		</select>
	</td>
	<td>
		<input type="text" name="dj" value="" size="10" maxlength="15" onChange="f_jsjg(editform,4)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[4])">
	</td>
	<td>
		<input type="text" name="sl" value="" size="10" maxlength="15" onChange="f_jsjg(editform,4)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[5])">
	</td>
	<td>
		<input type="text" name="je" value="" size="13" maxlength="15" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">
	</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center"> 
	<td>6</td>
	<td> 
		<input type="text" name="zcmc" value="" size="28" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[5])">
	</td>
	<td> 
		<input type="text" name="bz" value="" size="46" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[5])">
	</td>
	<td>
		<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(dj[5])">
		  <option value=""></option>
		<%
			cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
		%>
		</select>
	</td>
	<td>
		<input type="text" name="dj" value="" size="10" maxlength="15" onChange="f_jsjg(editform,5)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[5])">
	</td>
	<td>
		<input type="text" name="sl" value="" size="10" maxlength="15" onChange="f_jsjg(editform,5)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[6])">
	</td>
	<td>
		<input type="text" name="je" value="" size="13" maxlength="15" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">
	</td>
</tr>

<tr bgcolor="#E8E8FF"  align="center"> 
	<td>7</td>
	<td> 
		<input type="text" name="zcmc" value="" size="28" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[6])">
	</td>
	<td> 
		<input type="text" name="bz" value="" size="46" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[6])">
	</td>
	<td>
		<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(dj[6])">
		  <option value=""></option>
		<%
			cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
		%>
		</select>
	</td>
	<td>
		<input type="text" name="dj" value="" size="10" maxlength="15" onChange="f_jsjg(editform,6)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[6])">
	</td>
	<td>
		<input type="text" name="sl" value="" size="10" maxlength="15" onChange="f_jsjg(editform,6)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[7])">
	</td>
	<td>
		<input type="text" name="je" value="" size="13" maxlength="15" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">
	</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center"> 
	<td>8</td>
	<td> 
		<input type="text" name="zcmc" value="" size="28" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[7])">
	</td>
	<td> 
		<input type="text" name="bz" value="" size="46" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[7])">
	</td>
	<td>
		<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(dj[7])">
		  <option value=""></option>
		<%
			cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
		%>
		</select>
	</td>
	<td>
		<input type="text" name="dj" value="" size="10" maxlength="15" onChange="f_jsjg(editform,7)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[7])">
	</td>
	<td>
		<input type="text" name="sl" value="" size="10" maxlength="15" onChange="f_jsjg(editform,7)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[8])">
	</td>
	<td>
		<input type="text" name="je" value="" size="13" maxlength="15" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">
	</td>
</tr>

<tr bgcolor="#E8E8FF"  align="center"> 
	<td>9</td>
	<td> 
		<input type="text" name="zcmc" value="" size="28" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[8])">
	</td>
	<td> 
		<input type="text" name="bz" value="" size="46" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[8])">
	</td>
	<td>
		<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(dj[8])">
		  <option value=""></option>
		<%
			cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
		%>
		</select>
	</td>
	<td>
		<input type="text" name="dj" value="" size="10" maxlength="15" onChange="f_jsjg(editform,8)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[8])">
	</td>
	<td>
		<input type="text" name="sl" value="" size="10" maxlength="15" onChange="f_jsjg(editform,8)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[9])">
	</td>
	<td>
		<input type="text" name="je" value="" size="13" maxlength="15" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">
	</td>
</tr>
<tr bgcolor="#FFFFFF"  align="center"> 
	<td>10</td>
	<td> 
		<input type="text" name="zcmc" value="" size="28" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(bz[9])">
	</td>
	<td> 
		<input type="text" name="bz" value="" size="46" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyTo(jldwbm[9])">
	</td>
	<td>
		<select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:72PX" onKeyUp="keyGo(dj[9])">
		  <option value=""></option>
		<%
			cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
		%>
		</select>
	</td>
	<td>
		<input type="text" name="dj" value="" size="10" maxlength="15" onChange="f_jsjg(editform,9)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[9])">
	</td>
	<td>
		<input type="text" name="sl" value="" size="10" maxlength="15" onChange="f_jsjg(editform,9)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[0])">
	</td>
	<td>
		<input type="text" name="je" value="" size="13" maxlength="15" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">
	</td>
</tr>


<tr bgcolor="#CCCCCC"> 
  <td colspan="7" > 
	<div align="center"> 
		<input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
	</div>
  </td>
</tr>
</table>
</form>

</body>
</html>




<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_jsjg(FormName,row)//参数FormName:Form的名称
{
	var je=FormName.dj[row].value*FormName.sl[row].value;
	je=round(je,2);
	FormName.je[row].value=je;
}

function f_do(FormName)//参数FormName:Form的名称
{
	for (var i=0;i<10;i++ )
	{
		f_jsjg(FormName,i);

		if(	javaTrim(FormName.zcmc[i])=="") 
		{
			continue;
		}
		if(	javaTrim(FormName.bz[i])=="") {
			alert("序号["+(i+1)+"]出错！请输入[规格/型号/品牌]！");
			FormName.bz[i].focus();
			return false;
		}
		if(	javaTrim(FormName.jldwbm[i])=="") {
			alert("序号["+(i+1)+"]出错！请输入[计量单位]！");
			FormName.jldwbm[i].focus();
			return false;
		}

		if(	javaTrim(FormName.dj[i])=="") {
			alert("序号["+(i+1)+"]出错！请输入[单价]！");
			FormName.dj[i].focus();
			return false;
		}
		if(!(isFloat(FormName.dj[i], "单价"))) {
			return false;
		}

		if(	javaTrim(FormName.sl[i])=="") {
			alert("序号["+(i+1)+"]出错！请输入[订货数量]！");
			FormName.sl[i].focus();
			return false;
		}
		if(!(isFloat(FormName.sl[i], "订货数量"))) {
			return false;
		}
		if (parseFloat(FormName.sl[i].value)<=0)
		{
			alert("序号["+(i+1)+"]出错！[订货数量]不能<=0！");
			FormName.sl[i].select();
			return false;
		}

		if(	javaTrim(FormName.je[i])=="") {
			alert("序号["+(i+1)+"]出错！请输入[金额]！");
			FormName.je[i].focus();
			return false;
		}
		if(!(isFloat(FormName.je[i], "金额"))) {
			return false;
		}
	}

	FormName.action="SaveLrzgzc.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>


