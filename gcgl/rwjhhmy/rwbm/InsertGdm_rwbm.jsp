<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>录入任务编码</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {color: #FF0000}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">录入任务编码</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>任务编码(4位)</td>
  <td><input type="text" name="rwbm" size="20" maxlength="4"  value="" ></td>
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>任务分类</td>
  <td><select name="rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwflbm,rwflmc from gdm_rwflbm order by rwflbm","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">*</span>任务名称</td> 
  <td colspan="3"><input type="text" name="rwmc" size="73" maxlength="100"  value="" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>任务对象</td>
  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "rwdx","1+客户&2+施工队&3+供应商&4+设计师&5+质检","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>是否涉及验收项</td>
  <td><%
	cf.radioToken(out, "sfsjysxm","Y+是&N+否","");
%></td>
  <td align="right" bgcolor="#FFFFFF">验收项目</td>
  <td bgcolor="#FFFFFF"><select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where ysxmflbm='05' order by gcysxmbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>是否涉及主材项目</td>
  <td bgcolor="#FFFFFF"><%
	cf.radioToken(out, "sfsjzcxm","Y+是&N+否","");
%></td>
  <td align="right" bgcolor="#FFFFFF">涉及主材大类</td>
  <td bgcolor="#FFFFFF"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb='1' order by cldlmc","");
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">涉及主材节点</td>
  <td>
  <select name="sjzcjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  <%
	cf.selectToken(out,"03+测量通知&05+已测量& 25+复尺通知&26+复尺&09+合同已完成&11+合同已确认&13+工厂已接收&15+确定送货时间&17+已通知送货&19+送货安装完成 ","");
%>
  </select></td>
  <td align="right" bgcolor="#FFFFFF">报警级别</td>
  <td bgcolor="#FFFFFF"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from gdm_bjjbbm order by bjjbbm","");
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">*</span>报警时间</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "bjsj","1+事前报警&2+事后提醒&3+事前事后都提醒&9+不报警","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">事前报警天数</td> 
  <td width="32%"> 
    <input type="text" name="sqbjts" size="20" maxlength="8"  value="" >  </td>
  <td align="right" width="18%">事后报警天数</td> 
  <td width="32%"><input type="text" name="shbjts" size="20" maxlength="8"  value="" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">目事前报警内容</td>
  <td colspan="3"><textarea name="sqbjnr" cols="72" rows="2"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">事后报警内容</td>
  <td colspan="3"><textarea name="shbjnr" cols="72" rows="2"></textarea></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>是否影响后续工期</td>
  <td><%
	cf.radioToken(out, "sfyxhxgq","Y+是&N+否","");
%></td>
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>重点监控任务</td>
  <td bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zdjkrw","Y+重点监控&N+非重点监控","");
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>任务序号</td>
  <td><input name="rwxh" type="text" value="" size="10" maxlength="8" ></td>
  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td bgcolor="#FFFFFF">&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">任务备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>      </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	  <input type="button" onClick="f_do1(insertform)"  value="任务逻辑关系" name="ljgx" disabled>
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.rwflbm)=="") {
		alert("请选择[任务分类]！");
		FormName.rwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwbm)=="") {
		alert("请输入[任务编码]！");
		FormName.rwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwmc)=="") {
		alert("请输入[任务名称]！");
		FormName.rwmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.rwdx)) {
		alert("请选择[任务对象]！");
		FormName.rwdx[0].focus();
		return false;
	}


	if(	!radioChecked(FormName.sfsjysxm)) {
		alert("请选择[是否涉及验收项]！");
		FormName.sfsjysxm[0].focus();
		return false;
	}
	if (FormName.sfsjysxm[0].checked)
	{
		if(	javaTrim(FormName.gcysxmbm)=="") {
			alert("请输入[验收项目]！");
			FormName.gcysxmbm.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.gcysxmbm)!="") {
			alert("不能输入[验收项目]！");
			FormName.gcysxmbm.focus();
			return false;
		}
	}


	if(	!radioChecked(FormName.sfsjzcxm)) {
		alert("请选择[是否涉及主材项目]！");
		FormName.sfsjzcxm[0].focus();
		return false;
	}
	if (FormName.sfsjzcxm[0].checked)
	{
		if(	javaTrim(FormName.zcdlbm)=="") {
			alert("请输入[涉及主材大类]！");
			FormName.zcdlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.sjzcjd)=="") {
			alert("请输入[涉及主材节点]！");
			FormName.sjzcjd.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.zcdlbm)!="") {
			alert("不能输入[涉及主材大类]！");
			FormName.zcdlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.sjzcjd)!="") {
			alert("不能输入[涉及主材节点]！");
			FormName.sjzcjd.focus();
			return false;
		}
	}
	if(	!radioChecked(FormName.bjsj)) {
		alert("请选择[报警时间]！");
		FormName.bjsj[0].focus();
		return false;
	}
	if(!(isNumber(FormName.sqbjts, "事前报警天数"))) {
		return false;
	}
	if(!(isNumber(FormName.shbjts, "事后报警天数"))) {
		return false;
	}
	if (FormName.bjsj[0].checked )
	{
		if(	javaTrim(FormName.sqbjts)=="") {
			alert("请输入[事前报警天数]！");
			FormName.sqbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)=="") {
			alert("请输入[事前报警内容]！");
			FormName.sqbjnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjts)!="") {
			alert("[事后报警天数]应为空！");
			FormName.shbjts.select();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)!="") {
			alert("[事后报警内容]应为空！");
			FormName.shbjnr.select();
			return false;
		}
	}
	else if (FormName.bjsj[1].checked )
	{
		if(	javaTrim(FormName.shbjts)=="") {
			alert("请输入[事后报警天数]！");
			FormName.shbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)=="") {
			alert("请输入[事后报警内容]！");
			FormName.shbjnr.focus();
			return false;
		}
		if(	javaTrim(FormName.sqbjts)!="") {
			alert("[事前报警天数]应为空！");
			FormName.sqbjts.select();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)!="") {
			alert("[事前报警内容]应为空！");
			FormName.sqbjnr.select();
			return false;
		}
	}
	else if ( FormName.bjsj[2].checked)
	{
		if(	javaTrim(FormName.sqbjts)=="") {
			alert("请输入[事前报警天数]！");
			FormName.sqbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)=="") {
			alert("请输入[事前报警内容]！");
			FormName.sqbjnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjts)=="") {
			alert("请输入[事后报警天数]！");
			FormName.shbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)=="") {
			alert("请输入[事后报警内容]！");
			FormName.shbjnr.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.sqbjts)!="") {
			alert("[事前报警天数]应为空！");
			FormName.sqbjts.select();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)!="") {
			alert("[事前报警内容]应为空！");
			FormName.sqbjnr.select();
			return false;
		}
		if(	javaTrim(FormName.shbjts)!="") {
			alert("[事后报警天数]应为空！");
			FormName.shbjts.select();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)!="") {
			alert("[事后报警内容]应为空！");
			FormName.shbjnr.select();
			return false;
		}
	}

	if(	!radioChecked(FormName.sfyxhxgq)) {
		alert("请选择[是否影响后续工期]！");
		FormName.sfyxhxgq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zdjkrw)) {
		alert("请选择[重点监控任务]！");
		FormName.zdjkrw[0].focus();
		return false;
	}
	if(	javaTrim(FormName.rwxh)=="") {
		alert("请输入[任务序号]！");
		FormName.rwxh.focus();
		return false;
	}
	if(!(isFloat(FormName.rwxh, "任务序号"))) {
		return false;
	}

	FormName.action="SaveInsertGdm_rwbm.jsp";
	FormName.submit();
	FormName.ljgx.disabled=false;
	return true;
}

function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.rwbm)=="") {
		alert("请输入[任务编码]！");
		FormName.rwbm.focus();
		return false;
	}

	FormName.action="InsertGdm_rwljgx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
