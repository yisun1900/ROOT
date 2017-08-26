<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
      <div align="center">单位信息－录入</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
             <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset"  value="重输" name="reset">
                  <input type="button"  value="录入项目专员" onClick="f_lr(insertform)" name="lr" disabled>
                  <input type="button"  value="查看项目专员" onClick="f_ck(insertform)" name="ck" disabled>
                </p>              </td>
            </tr>
             <tr bgcolor="#CCCCFF">
               <td bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>单位编号（5位）</td>
               <td><input type="text" name="dwbh" value="" size="20" maxlength="5" onChange="changeDwbh(insertform)"></td>
               <td align="right"><font color="#CC0000">*</font>单位名称</td>
               <td><input type="text" name="dwmc" value="" size="20" maxlength="100" onChange="changeDwbh(insertform)"></td>
             </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>单位类型</td>
              <td width="32%"> 
                <select name="dwlx" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changelx(insertform)">
                  <option value=""></option>
                  <option value="A0">总部</option>
                  <option value="A1">总部各部门</option>
                  <option value="F0">分公司</option>
                  <option value="F1">分公司各部门</option>
                  <option value="F2">店面</option>
                  <option value="F3">设计小组</option>
                  <option value="F4">市场小组</option>
                  <option value="F5">其它小组</option>
             </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>单位分类</td>
              <td width="32%"> 
                <select name="dwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwflbm,dwflmc from dm_dwflbm order by dwflbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>所属地区</td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm","");
%> 
              </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>所属大区</td>
              <td width="32%">
                <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>所属分公司</td>
              <td width="32%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefgs(insertform)">
                  <option value=""></option>
              </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>上级单位</td>
              <td width="32%"> 
                <select name="ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>公司类型</td>
              <td bgcolor="#CCCCFF">
			  <input type="radio" name="sfjms" value="N" checked>直营公司
			  <input type="radio" name="sfjms" value="Y">加盟公司
			  <input type="radio" name="sfjms" value="Q">其它公司			  </td>
              <td align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>撤店标志</td>
              <td bgcolor="#CCCCFF"><select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value="N">未撤销</option>
                <option value="Y">已撤销</option>
              </select></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">编码</td>
              <td width="32%"> 
                <input type="text" name="bianma" value="" size="6" maxlength="2" >
                <font color="#FF0000"><strong>分公司必录</strong></font>(用于施工队编码)</td>
              <td width="18%" align="right">电话区号</td>
              <td width="32%"><input name="dhqh" type="text" value="" size="10" maxlength="10">
              <font color="#FF0000"><strong>分公司必须录入</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">店面形式</td>
              <td width="32%"> 
                <select name="dmxs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dmxs,dmxsmc from dm_dmxs order by dmxs","");
%> 
              </select>              </td>
              <td width="18%" align="right">标准人数</td>
              <td width="32%"> 
                <input type="text" name="bzrs" value="" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">所属方位</td>
              <td width="32%"> 
                <select name="ssfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssfw,ssfwmc from dm_ssfw order by ssfw","");
%> 
              </select>              </td>
              <td width="18%" align="right">单位级别</td>
              <td width="32%"> 
                <select name="dwjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwjb,dwjbmc from dm_dwjb order by dwjb","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">合同号前缀</td>
              <td colspan="3"> 
              <input type="text" name="hthqz" value="" size="20" maxlength="20" >
              <strong><font color="#FF0000">店面应录入【合同号前缀】，否则无法申请合同号</font></strong></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">单位地址</td>
              <td colspan="3"> 
                <input type="text" name="dwdz" value="" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">单位电话</td>
              <td colspan="3"> 
                <input type="text" name="dwdh" value="" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">客服电话</td>
              <td colspan="3"> 
                <input type="text" name="kfdh" size="72" maxlength="50"  value="" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">单位传真</td>
              <td width="32%"> 
              <input type="text" name="dwcz" value="" size="20" maxlength="50" >              </td>
              <td width="18%" align="right">序号</td>
              <td width="32%"><input name="xuhao" type="text" value="" size="20" maxlength="8" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">单位负责人</td>
              <td width="32%"> 
              <input type="text" name="dwfzr" value="" size="20" maxlength="20" >              </td>
              <td width="18%" align="right">单位EMail</td>
              <td width="32%"> 
                <input type="text" name="email" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right">开店时间</td>
              <td width="32%" bgcolor="#FFFFFF"> 
              <input type="text" name="kdsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" bgcolor="#FFFFFF" align="right">关店时间</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="text" name="gdsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">备注</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>              </td>
            </tr>
            
            
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset"  value="重输" name="reset">
                </p>              </td>
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
	cf.ajax(out);//启用AJAX
%>

var czlx;

function changeDwbh(FormName) 
{
	if (FormName.dwlx.value=="F0")
	{
		strToSelect(insertform.ssfgs,insertform.dwbh.value+"+"+insertform.dwmc.value);
		return;
	}
}

function changelx(FormName) 
{
	FormName.ssdw.length=1;
	FormName.ssfgs.length=1;

	if(	javaTrim(FormName.dwlx)=="") 
	{
		return false;
	}

	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		FormName.dwlx.value="";
		return false;
	}

	if(!(isUpperCase(FormName.dwbh, "单位编号"))) {
		FormName.dwlx.value="";
		return false;
	}

	if (FormName.dwbh.value.length!=5)
	{
		alert("错误！[单位编号]长度应为5位大写！");
		FormName.dwbh.focus();
		FormName.dwlx.value="";
		return false;
	}

	if(	javaTrim(FormName.dwmc)=="") {
		alert("请输入[单位名称]！");
		FormName.dwmc.focus();
		FormName.dwlx.value="";
		return false;
	}

	czlx=1;

	var sql;

	if (FormName.dwlx.value=="A0")//A0:总部; A1:总部部门; F0:分公司；F1:分公司部门；F2：分公司店面；F3：部门小组
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="A1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="F0")
	{
		strToSelect(insertform.ssfgs,insertform.dwbh.value+"+"+insertform.dwmc.value);
		return;
	}
	else
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0') and cxbz='N'  order by dwbh";
	}


	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);

	openAjax(actionStr);
}

function changefgs(FormName) 
{
	if(	javaTrim(FormName.dwlx)=="") 
	{
		alert("请选择[单位类型]！");
		FormName.dwlx.focus();
		return false;
	}

	FormName.ssdw.length=1;

	if(	javaTrim(FormName.ssfgs)=="") 
	{
		return false;
	}



	czlx=2;

	var sql;

	if (FormName.dwlx.value=="A0")//A0:总部; A1:总部部门; F0:分公司；F1:分公司部门；F2：分公司店面；F3：部门小组
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="A1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="F0")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="F1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='"+FormName.ssfgs.value+"' order by dwbh";
	}
	else if (FormName.dwlx.value=="F2")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='"+FormName.ssfgs.value+"' order by dwbh";
	}
	else if (FormName.dwlx.value=="F3" || FormName.dwlx.value=="F4" || FormName.dwlx.value=="F5")
	{
		sql="select dwbh,dwmc from sq_dwxx where ssfgs='"+FormName.ssfgs.value+"' and dwlx in('F1','F2') and cxbz='N'  order by dwlx,dwbh";
	}



	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);

	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
//	alert(ajaxRetStr);
	if (czlx==1)
	{
		strToSelect(insertform.ssfgs,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToSelect(insertform.ssdw,ajaxRetStr);
	}

}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}

	if(!(isUpperCase(FormName.dwbh, "单位编号"))) {
		return false;
	}

	if (FormName.dwbh.value.length!=5)
	{
		alert("错误！[单位编号]长度应为5位大写！");
		FormName.dwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.dwmc)=="") {
		alert("请输入[单位名称]！");
		FormName.dwmc.focus();
		return false;
	}

	if(	javaTrim(FormName.dwlx)=="") {
		alert("请选择[单位类型]！");
		FormName.dwlx.focus();
		return false;
	}
	if(	javaTrim(FormName.dwflbm)=="") {
		alert("请选择[单位分类]！");
		FormName.dwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ssdw)=="") {
		alert("请选择[上级单位]！");
		FormName.ssdw.focus();
		return false;
	}
	if(	javaTrim(FormName.ssdqbm)=="") {
		alert("请选择[所属大区]！");
		FormName.ssdqbm.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfjms)) {
		alert("请选择[公司类型]！");
		FormName.sfjms[0].focus();
		return false;
	}

	if(!(isNumber(FormName.bzrs, "标准人数"))) {
		return false;
	}
	if(!(isDatetime(FormName.kdsj, "开店时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdsj, "关店时间"))) {
		return false;
	}


	if (FormName.dwlx.value=="F0")//分公司
	{
		if(	javaTrim(FormName.dhqh)=="") {
			alert("请输入[电话区号]！");
			FormName.dhqh.focus();
			return false;
		}
		if(!(isNumber(FormName.dhqh, "电话区号"))) {
			return false;
		}
		if(	javaTrim(FormName.bianma)=="") {
			alert("请选择[编码]！");
			FormName.bianma.focus();
			return false;
		}
		if (FormName.bianma.value.length!=2)
		{
			alert("错误！[编码]长度应为2位大写字母！");
			FormName.bianma.focus();
			return false;
		}
	}

	if(!(isInt(FormName.xuhao, "序号"))) {
		return false;
	}

	
	
	FormName.action="SaveInsertSq_dwxx.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;


	return true;
}
function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="InsertSq_xmzy.jsp";
	FormName.submit();
	return true;
}


function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="Sq_xmzyList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
