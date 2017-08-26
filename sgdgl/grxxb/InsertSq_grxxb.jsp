<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {color: #FF0000}
.STYLE1 {color: #CC0000}
-->
</style>
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">工人登记表</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span>所属分公司</td>
      <td>
	  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
%>
      </select>
	  
	  </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">施工队</td>
      <td width="35%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeSgd(insertform)">
          <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sgdmc","");
	}
%> 
        </select>      </td>
      <td align="right" width="15%">班长</td>
      <td width="35%"> 
        <select name="bzmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>姓名</td>
      <td width="35%"> 
        <input type="text" name="xm" value="" size="20" maxlength="20" >      </td>
      <td align="right" width="15%"><span class="STYLE2">*</span>性别</td>
      <td width="35%"> 
        <input type="radio" name="xb"  value="男">
        男 
        <input type="radio" name="xb"  value="女">
        女 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>籍贯</td>
      <td width="35%"> 
        <input type="text" name="jg" value="" size="20" maxlength="50" >      </td>
      <td align="right" width="15%"><span class="STYLE2">*</span>出生日期</td>
      <td width="35%"> 
        <input type="text" name="csrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>工种</td>
      <td colspan="3"> 
        <input type="radio" name="gz"  value="木工">
        木工 
        <input type="radio" name="gz"  value="水电工">
        水电工 
        <input type="radio" name="gz"  value="油漆工">
        油漆工 
        <input type="radio" name="gz"  value="瓦工">
        瓦工
        <input type="radio" name="gz"  value="杂工">
        杂工 </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span>入职时间</td>
      <td><input type="text" name="rzsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
      <td align="right"><span class="STYLE2">*</span>类型</td>
      <td><input type="radio" name="lx"  value="临时">
临时
  <input type="radio" name="lx"  value="长期">
长期</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span>银行卡</td>
      <td><input type="text" name="yhk" value="" size="20" maxlength="50" ></td>
      <td align="right">是否签订劳务派遣合同</td>
      <td><input type="radio" name="sfqdlwpqht"  value="Y">
      是
        <input type="radio" name="sfqdlwpqht"  value="N" checked>
        否</td>
    </tr>
    <tr bgcolor="#FFFFFF">
	 <td align="right">是否通过考试</td>
      <td><input type="radio" name="sfkstg"  value="Y">
      是
        <input type="radio" name="sfkstg"  value="N" checked>
        否</td>
      <td align="right">上岗证编号</td>
      <td><input name="sgzbh" type="text" id="sgzbh" value="" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">等级</td>
      <td width="35%"> 
        <input type="text" name="dj" value="" size="20" maxlength="10" >      </td>
      <td align="right" width="15%"><span class="STYLE2">*</span>身份证号</td>
      <td width="35%"><input type="text" name="sfzh" value="" size="20" maxlength="18" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><span class="STYLE2">*</span>电话</td>
      <td colspan="3"><input type="text" name="dh" value="" size="73" maxlength="50" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">住址</td>
      <td colspan="3"> 
        <input type="text" name="zz" value="" size="73" maxlength="50" >      </td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">紧急联系人</td>
      <td bgcolor="#FFFFFF"><input type="text" name="jjlxr" value="" size="20" maxlength="20" >      </td>
      <td align="right" bgcolor="#FFFFFF">联系人电话</td>
      <td bgcolor="#FFFFFF"><input type="text" name="jjlxrdh" value="" size="20" maxlength="20" >      </td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">紧急联系人地址</td>
      <td colspan="3" bgcolor="#FFFFFF"><input name="jjlxrdz" type="text" id="jjlxrdz" value="" size="73" maxlength="50" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">培训说明</td>
      <td colspan="3"> 
        <textarea name="pxsm" cols="71" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">     
		<input type="button" name="sczp" onClick="f_sczp(insertform)"  value="上传照片" disabled>
        <input type="button" name="ck" onClick="f_ck(insertform)"  value="查看照片" disabled>
<P>
		<A HREF="工人.xls"><B>点击右键另存为，下载Excel模板</B></A>&nbsp;&nbsp;&nbsp;
		<input  type="button" onClick="LoadExc(insertform)"  value="导入-Excel">
		<input  type="button" onClick="exp(insertform)"  value="导出-Excel">
		
		</td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//启用Ajax
	cf.ajax(out);
%>

function changeSgd(FormName) 
{
	FormName.bzmc.length=1;

	if (FormName.sgd.value=="")
	{
		return;
	}


	var sql;
	sql="select bzmc c1,bzmc c2 from sq_bzxx where sgd='"+FormName.sgd.value+"' and tdbz in('Y','N') order by bzmc";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.bzmc,ajaxRetStr);
}

function f_sczp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("请输入[姓名]！");
		FormName.xm.focus();
		return false;
	}

	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		var urlStr="loadWj.jsp?ssfgs="+FormName.ssfgs.value+"&xm="+FormName.xm.value;
		window.open(urlStr);
	}
	else
	{
		var urlStr="loadPhoto.jsp?ssfgs="+FormName.ssfgs.value+"&xm="+FormName.xm.value;
		window.open(urlStr);
	}
}


function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("请输入[姓名]！");
		FormName.xm.focus();
		return false;
	}

	var urlStr="viewPhoto.jsp?ssfgs="+FormName.ssfgs.value+"&xm="+FormName.xm.value;
	window.open(urlStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}

/*
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.bzmc)=="") {
		alert("请选择[班长]！");
		FormName.bzmc.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.xm)=="") {
		alert("请输入[姓名]！");
		FormName.xm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jg)=="") {
		alert("请输入[籍贯]！");
		FormName.jg.focus();
		return false;
	}
	if(	javaTrim(FormName.csrq)=="") {
		alert("请输入[出生日期]！");
		FormName.csrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.csrq, "出生日期"))) {
		return false;
	}
	if(	!radioChecked(FormName.gz)) {
		alert("请选择[工种]！");
		FormName.gz[0].focus();
		return false;
	}
	if(	javaTrim(FormName.rzsj)=="") {
		alert("请输入[入职时间]！");
		FormName.rzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "入职时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sfzh)=="") {
		alert("请输入[身份证]！");
		FormName.sfzh.focus();
		return false;
	}
	if(FormName.sfzh.value.length!=15 && FormName.sfzh.value.length!=18) 
	{
		alert("[身份证]错误！只能是15位或18位");
		FormName.sfzh.focus();
		return false;
	}
	if(	javaTrim(FormName.yhk)=="") {
		alert("请输入[银行卡]！");
		FormName.yhk.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("请输入[电话]！");
		FormName.dh.focus();
		return false;
	}
	/*if(	javaTrim(FormName.jjlxr)=="") {
		alert("请选择[紧急联系人]！");
		FormName.jjlxr.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxrdh)=="") {
		alert("请选择[紧急联系人电话]！");
		FormName.jjlxrdh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlxrdz)=="") {
		alert("请选择[紧急联系人地址]！");
		FormName.jjlxrdz.focus();
		return false;
	}*/

	FormName.action="SaveInsertSq_grxxb.jsp";
	FormName.submit();
	FormName.sczp.disabled=false;
	FormName.ck.disabled=false;
	return true;
}

function LoadExc(FormName)//参数FormName:Form的名称
{

	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}

function exp(FormName)//参数FormName:Form的名称
{

	FormName.action="exp.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
