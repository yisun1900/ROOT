<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String lrr=(String)session.getAttribute("yhmc");
	String lrbm=(String)session.getAttribute("dwbh");

	String dqbm=request.getParameter("dqbm");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 
        <p>请录入数据</p>
        <p>注意：在维护木门价格时，需维护三个价格：整樘门单价、双口门套每米单价、单口门套每米单价</p>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>木门型号</div>
              </td>
              <td width="30%"> 
                <select name="mmxh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmxh c1,mmxh||'('||dqmc||')' c2 from jc_mmxhb,dm_dqbm where jc_mmxhb.dqbm=dm_dqbm.dqbm(+) and jc_mmxhb.dqbm='"+dqbm+"' order by jc_mmxhb.dqbm,mmxh","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right"></div>
              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>材质</td>
              <td colspan="3"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:515PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>墙厚价格区间</div>
              </td>
              <td width="30%"> 
                <select name="qhjgqjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select qhjgqjbm,qhjgqj from jdm_qhjgqj where mmdglxbm='01' order by qhjgqjbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font>整樘门单价</div>
              </td>
              <td width="31%"> 
                <input type="text" name="ztmdj" size="20" maxlength="17" onKeyUp="keyGo(mtjg)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#0000CC">单门扇价格</font></td>
              <td width="30%"> 
                <input type="text" name="dmsjg" value="0" size="20" maxlength="17" onKeyUp="keyGo(dmtjg)" readonly>
              </td>
              <td width="19%" align="right"><font color="#0000CC">单门套价格</font></td>
              <td width="31%"> 
                <input type="text" name="dmtjg" value="0" size="20" maxlength="17" onKeyUp="keyGo(mtjg)" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>双口门套每米单价</td>
              <td width="30%"> 
                <input type="text" name="mtjg" size="20" maxlength="17" onKeyUp="keyGo(dkmtjg)">
              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>单口门套每米单价</td>
              <td width="31%"> 
                <input type="text" name="dkmtjg" size="20" maxlength="17" onKeyUp="keyGo(zmmjg)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>子母门加价率</td>
              <td width="30%"> 
                <input type="text" name="zmmjg" value="1.67" size="20" maxlength="17" onKeyUp="keyGo(zdmjjl)">
              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>折叠门加价率</td>
              <td width="31%"> 
                <input type="text" name="zdmjjl" value="1.2" size="20" maxlength="17" onKeyUp="keyGo(yksmjjl)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>哑口松木集成材加价率</td>
              <td width="30%"> 
                <input type="text" name="yksmjjl" value="1.1" size="20" maxlength="17" onKeyUp="keyGo(bz)">
              </td>
              <td width="19%" align="right"><font color="#0000CC">艺术玻璃加价率</font></td>
              <td width="31%"> 
                <input type="text" name="ysbljjl" value="1" size="20" maxlength="17" onKeyUp="keyGo(bz)" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">推拉门每平米单价</font></td>
              <td width="30%"> 
                <input type="text" name="tlmpmdj" value="0" size="20" maxlength="17" readonly>
              </td>
              <td width="19%">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入人</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入时间</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">录入部门</font></td>
              <td width="30%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>
              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC">所属地区</font></td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" rows="3" cols="70"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="button"  value="导出--木门报价" onClick="f_dc(insertform)">
                <input type="button"  value="导入--木门报价" onClick="f_dr(insertform)">
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
	if(	javaTrim(FormName.mmxh)=="") {
		alert("请选择[木门型号]！");
		FormName.mmxh.focus();
		return false;
	}
	if(	javaTrim(FormName.ysbm)=="") {
		alert("请选择[材质");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.qhjgqjbm)=="") {
		alert("请选择[墙厚价格区间]！");
		FormName.qhjgqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ztmdj)=="") {
		alert("请输入[整樘门单价]！");
		FormName.ztmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.ztmdj, "整樘门单价"))) {
		return false;
	}

	if (parseFloat(FormName.ztmdj.value)==0)
	{
		alert("[整樘门单价]不能为0！");
		FormName.ztmdj.select();
		return false;
	}

	if(	javaTrim(FormName.dmsjg)=="") {
		alert("请输入[单门扇价格]！");
		FormName.dmsjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dmsjg, "单门扇价格"))) {
		return false;
	}
	if(	javaTrim(FormName.dmtjg)=="") {
		alert("请输入[单门套价格]！");
		FormName.dmtjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dmtjg, "单门套价格"))) {
		return false;
	}
	if(	javaTrim(FormName.mtjg)=="") {
		alert("请输入[双口门套每米单价]！");
		FormName.mtjg.focus();
		return false;
	}
	if(!(isFloat(FormName.mtjg, "双口门套每米单价"))) {
		return false;
	}

	if (parseFloat(FormName.mtjg.value)==0)
	{
		alert("[双口门套每米单价]不能为0！");
		FormName.mtjg.select();
		return false;
	}

	if(	javaTrim(FormName.dkmtjg)=="") {
		alert("请输入[单口门套每米单价]！");
		FormName.dkmtjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dkmtjg, "单口门套每米单价"))) {
		return false;
	}

	if (parseFloat(FormName.dkmtjg.value)==0)
	{
		alert("[单口门套每米单价]不能为0！");
		FormName.dkmtjg.select();
		return false;
	}

	if(	javaTrim(FormName.zmmjg)=="") {
		alert("请输入[子母门加价率]！");
		FormName.zmmjg.focus();
		return false;
	}
	if(!(isFloat(FormName.zmmjg, "子母门加价率"))) {
		return false;
	}

	if (parseFloat(FormName.zmmjg.value)==0)
	{
		alert("[子母门加价率]不能为0！");
		FormName.zmmjg.select();
		return false;
	}

	if(	javaTrim(FormName.zdmjjl)=="") {
		alert("请输入[折叠门加价率]！");
		FormName.zdmjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.zdmjjl, "折叠门加价率"))) {
		return false;
	}

	if (parseFloat(FormName.zdmjjl.value)==0)
	{
		alert("[折叠门加价率]不能为0！");
		FormName.zdmjjl.select();
		return false;
	}

	if(	javaTrim(FormName.yksmjjl)=="") {
		alert("请输入[哑口松木集成材加价率]！");
		FormName.yksmjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.yksmjjl, "哑口松木集成材加价率"))) {
		return false;
	}

	if (parseFloat(FormName.yksmjjl.value)==0)
	{
		alert("[哑口松木集成材加价率]不能为0！");
		FormName.yksmjjl.select();
		return false;
	}

	if(	javaTrim(FormName.ysbljjl)=="") {
		alert("请输入[艺术玻璃加价率]！");
		FormName.ysbljjl.focus();
		return false;
	}
	if(!(isFloat(FormName.ysbljjl, "艺术玻璃加价率"))) {
		return false;
	}

	if(	javaTrim(FormName.tlmpmdj)=="") {
		alert("请输入[推拉门每平米单价]！");
		FormName.tlmpmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.tlmpmdj, "推拉门每平米单价"))) {
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="SaveInsertJc_mmbjb.jsp";
	FormName.submit();
	return true;
}

function f_dr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ChooseDate.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ExpMmbj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

