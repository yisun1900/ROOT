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
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_gyshtxx.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>合同编号</td> 
  <td width="32%"> 
    <input type="text" name="htbh" value="" size="20" maxlength="50" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>所属地区</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
	%> 
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供应商名称</td> 
  <td colspan="3"> 
    <input type="text" name="gysmc" value="" size="73" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>供应商地址</td>
  <td colspan="3"><input type="text" name="gysdz" value="" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供应商负责人</td> 
  <td width="32%"> 
    <input type="text" name="gysfzr" value="" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">供应商传真</td> 
  <td width="32%"><input type="text" name="gyscz" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供应商电话</td> 
  <td colspan="3"><input type="text" name="gysdh" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>合同开始时间</td> 
  <td width="32%"><input type="text" name="kssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>合同结束时间</td> 
  <td width="32%"><input type="text" name="jssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>    </td>
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
	if(	javaTrim(FormName.htbh)=="") {
		alert("请输入[合同编号]！");
		FormName.htbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("请输入[供应商名称]！");
		FormName.gysmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gysdz)=="") {
		alert("请输入[供应商地址]！");
		FormName.gysdz.focus();
		return false;
	}
	if(	javaTrim(FormName.gysfzr)=="") {
		alert("请输入[供应商负责人]！");
		FormName.gysfzr.focus();
		return false;
	}
	if(	javaTrim(FormName.gysdh)=="") {
		alert("请输入[供应商电话]！");
		FormName.gysdh.focus();
		return false;
	}
	if(	javaTrim(FormName.kssj)=="") {
		alert("请输入[合同开始时间]！");
		FormName.kssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kssj, "合同开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("请输入[合同结束时间]！");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "合同结束时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
