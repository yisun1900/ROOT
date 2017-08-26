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
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入报价标准项目</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>地区</td>
              <td width="33%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%> 
                </select>
              </td>
              <td align="right" width="18%"><font color="#FF0000">*</font>报价级别</td>
              <td width="32%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>项目大类</div>
              </td>
              <td width="33%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>项目小类</div>
              </td>
              <td width="32%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm order by xmdlbm,xmxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>项目编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="xmbh" value="" size="20" maxlength="16" >
              </td>
              <td width="18%"> 
                <div align="right">排序序号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="xh" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>项目名称</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" value="" size="74" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>计量单位</td>
              <td width="33%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%> 
                </select>
              </td>
              <td align="right" width="18%">饰面</td>
              <td width="32%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="17%">成本价</td>
              <td bgcolor="#E8E8FF" width="33%"> 
                <input type="text" name="cbenj" value="" size="20" maxlength="17" >
              </td>
              <td align="right" bgcolor="#E8E8FF" width="18%">施工队报价</td>
              <td bgcolor="#E8E8FF" width="32%"> 
                <input type="text" name="sgdbj" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="17%" height="22" align="right"> <font color="#FF0000">*</font>客户报价</td>
              <td width="33%"> 
                <input type="text" name="bj" value="" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">管理费百分比</div>
              </td>
              <td width="32%"> 
                <input type="text" name="glfbl" value="" size="8" maxlength="17" >
                % </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">主材名称</td>
              <td width="33%"> 
                <input type="text" name="zcmc" value="" size="20" maxlength="17" >
              </td>
              <td align="right" width="18%">主材规格</td>
              <td width="32%"> 
                <input type="text" name="zcgg" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">主材费</td>
              <td width="33%"> 
                <input type="text" name="zcf" value="" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">辅材费</div>
              </td>
              <td width="32%"> 
                <input type="text" name="clf" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">人工费</td>
              <td bgcolor="#CCCCFF" width="33%"> 
                <input type="text" name="rgf" value="" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">机械费</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jjf" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="17%" align="right">工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="72" rows="8"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right"><font color="#FF0000">*</font>是否必选项</td>
              <td width="33%"><%
	cf.radioToken(out, "sfbxx","1+必选&2+非必选&3+不可选","");
%></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>报价类型</td>
              <td width="33%"> 
                <select name="bjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">标准项目</option>
                </select>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>是否需要主材</td>
              <td width="32%"> 
                <input type="radio" name="sfxycl" value="1">
                需要 
                <input type="radio" name="sfxycl" value="2">
                不需要 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>录入人</td>
              <td width="33%"> 
                <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>录入时间</td>
              <td width="32%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="button" onClick="f_lr(insertform)"  value="录入工料分析" name="lr" disabled>
                  <input type="button" onClick="f_wh(insertform)"  value="维护工料分析" name="wh" disabled>
                  <input type="reset"  value="重输" name="reset">
                </p>
                <p> 
                  <input type="button" onClick="window.open('LoadData.jsp')"  value="导入电子报价">
                  <input type="button" onClick="window.open('LoadGlfx.jsp')"  value="导入工料分析" name="button">
                </p>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请输入[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请选择[项目小类]！");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjlx)=="") {
		alert("请选择[报价类型]！");
		FormName.bjlx.focus();
		return false;
	}
	
	if(!(isFloat(FormName.cbenj, "成本价"))) {
		return false;
	}
	if(!(isFloat(FormName.sgdbj, "施工队报价"))) {
		return false;
	}
	if(	javaTrim(FormName.bj)=="") {
		alert("请输入[客户报价]！");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "客户报价"))) {
		return false;
	}
	if(!(isFloat(FormName.glfbl, "管理费百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.zcf, "主材费"))) {
		return false;
	}
	if(!(isFloat(FormName.clf, "辅材费"))) {
		return false;
	}
	if(!(isFloat(FormName.rgf, "人工费"))) {
		return false;
	}
	if(!(isFloat(FormName.jjf, "机械费"))) {
		return false;
	}

	if(!(isInt(FormName.xh, "序号"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfbxx)) {
		alert("请选择[是否必选项]！");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请选择[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请选择[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfxycl)) {
		alert("请选择[是否需要主材]！");
		FormName.sfxycl[0].focus();
		return false;
	}

	FormName.action="SaveInsertBj_gzbjb.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.wh.disabled=false;
	return true;
}
function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请选择[项目小类]！");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}

	FormName.action="InsertBj_gzglfxb.jsp";
	FormName.submit();
	return true;
}

function f_wh(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请选择[项目小类]！");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}

	FormName.action="EditBj_gzglfxb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
