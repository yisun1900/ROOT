<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">录入品牌供应商</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertSq_gysxx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>所属地区</td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="changeDq(insertform)">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
                </select>
              </td>
              <td rowspan="5"> 
                <div align="right"><font color="#FF0000">*</font>所属分公司</div>
              </td>
              <td rowspan="5"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','『撤销』') from sq_dwxx where dwlx='F0' order by cxbz,dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font>供应商类别</div>
              </td>
              <td width="31%"> 
                <select name="gyslb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">木门</option>
                  <option value="2">橱柜</option>
                  <option value="3">家具</option>
                  <option value="4">主材</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">主材小类</td>
              <td width="31%"> 
                <select name="zclb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm order by zcxlmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right"><font color="#FF0000">*</font>品牌名称</td>
              <td width="31%">
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ppbm,ppmc from sq_ppxx order by ppmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">财务代码</td>
              <td width="31%">
                <input type="text" name="cwdm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>品牌供应商名称</td>
              <td colspan="3"> 
                <input type="text" name="gysmc" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>供应商名称</td>
              <td colspan="3"> 
                <select name="gysbm" style="FONT-SIZE:12PX;WIDTH:512PX">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>是否有优惠</td>
              <td width="31%"> 
                <input type="radio" name="sfyyh" value="N">
                否 
                <input type="radio" name="sfyyh" value="Y">
                是 </td>
              <td width="18%" align="right">每日安装户数限制</td>
              <td width="32%"> 
                <input type="text" name="mrazhs" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">优惠开始时间</td>
              <td width="31%"> 
                <input type="text" name="yhkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">优惠截至时间</td>
              <td width="32%"> 
                <input type="text" name="yhjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">优惠内容</td>
              <td colspan="3"> 
                <textarea name="yhnr" cols="70" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="70" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
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

function changeDq(FormName)
{
	FormName.gysbm.length=1;

	if(	javaTrim(FormName.dqbm)=="") {
		return false;
	}

	var sql="select gysbm,gys||'（'||dqmc||'）' c2 from sq_gysbm,dm_dqbm where sq_gysbm.dqbm=dm_dqbm.dqbm and sq_gysbm.dqbm='"+FormName.dqbm.value+"' order by gys";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
//	alert(ajaxRetStr);
	strToSelect(insertform.gysbm,ajaxRetStr);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gyslb)=="") {
		alert("请选择[供应商类别]！");
		FormName.gyslb.focus();
		return false;
	}
	if (FormName.gyslb.value=="4")
	{
		if(	javaTrim(FormName.zclb)=="") {
			alert("请选择[主材类别]！");
			FormName.zclb.focus();
			return false;
		}
	}
	else{
		FormName.zclb.value="";
	}

	if(	javaTrim(FormName.ppbm)=="") {
		alert("请选择[品牌名称]！");
		FormName.ppbm.focus();
		return false;
	}

	if(	javaTrim(FormName.gysmc)=="") {
		alert("请输入[品牌供应商名称]！");
		FormName.gysmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请选择[供应商名称]！");
		FormName.gysbm.focus();
		return false;
	}


	if(!(isNumber(FormName.mrazhs, "每日安装户数限制"))) {
		return false;
	}


	if(	!radioChecked(FormName.sfyyh)) {
		alert("请选择[是否有优惠]！");
		FormName.sfyyh[0].focus();
		return false;
	}
	if (FormName.sfyyh[1].checked)
	{
		if(	javaTrim(FormName.yhkssj)=="") {
			alert("请输入[优惠开始时间]！");
			FormName.yhkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhkssj, "优惠开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.yhjzsj)=="") {
			alert("请输入[优惠截至时间]！");
			FormName.yhjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhjzsj, "优惠截至时间"))) {
			return false;
		}
		if (FormName.yhkssj.value>FormName.yhjzsj.value)
		{
			alert("[优惠开始时间]不能大于[优惠截至时间]！");
			FormName.yhjzsj.select();
			return false;
		}
		if(	javaTrim(FormName.yhnr)=="") {
			alert("请输入[优惠内容]！");
			FormName.yhnr.focus();
			return false;
		}
	}
	else{
		FormName.yhkssj.value="";
		FormName.yhjzsj.value="";
		FormName.yhnr.value="";
	}

	if(	!selectChecked(FormName.ssfgs)) {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	FormName.submit();

	return true;
}

//-->
</SCRIPT>
