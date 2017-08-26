<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
String sgph=cf.GB2Uni(request.getParameter("sgph"));

%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_gysdd.jsp" name="insertform">
<div align="center">申购单转为供应商订单</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font>下单公司</td> 
  <td width="32%">
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
  </select></td>
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">申购批号</font></td> 
  <td width="32%"><input type="text" name="sgph" value="<%=sgph%>" size="20" maxlength="13" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font>采购类别</td> 
  <td width="32%"><input name="cglb" type="radio"  value="J" checked>
    集团采购</td>
  <td align="right" width="18%"><font color="#CC0000">*</font>材料类别</td> 
  <td width="32%"><input name="cllb" type="radio"  value="1" checked>
    辅材 </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font>配送方式</td> 
  <td width="32%"><input type="radio" name="psfs"  value="1">
    配送
      <input type="radio" name="psfs"  value="2">
      自取
      <input type="radio" name="psfs"  value="3">
      其他 </td>
  <td align="right" width="18%">要求到货时间</td> 
  <td width="32%"><input type="text" name="yqdhsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><span class="STYLE2 STYLE1"><font color="#0000CC">录入人</font></span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#CC0000">*</font><span class="STYLE1"><font color="#0000CC">录入时间</font></span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right"><font color="#CC0000">*</font>是否直接入库申购单位</td>
  <td><input name="sfrksgdw" type="radio"  value="Y" >入库申购单位
  <input name="sfrksgdw" type="radio"  value="N" >否  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[下单公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sgph)=="") {
		alert("请输入[申购批号]！");
		FormName.sgph.focus();
		return false;
	}
	if(	javaTrim(FormName.cglb)=="") {
		alert("请输入[采购类别]！");
		FormName.cglb.focus();
		return false;
	}
	if(	javaTrim(FormName.cllb)=="") {
		alert("请输入[材料类别]！");
		FormName.cllb.focus();
		return false;
	}
	if(	!radioChecked(FormName.psfs)) {
		alert("请选择[配送方式]！");
		FormName.psfs[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yqdhsj, "要求到货时间"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfrksgdw)) {
		alert("请选择[是否直接入库申购单位]！");
		FormName.sfrksgdw[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
