<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String khbh=request.getParameter("khbh");
	String ssfgs=request.getParameter("ssfgs");
%>

<html>
<head>
<title>自定义</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertBj_khzcmxZdy.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>主材大类</td>
              <td width="33%"> 
			<select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(editform)">
				<option value=""></option>
				<%
				cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3')  order by cldlmc","");
			%>
			  </select>				</td>
              <td align="right"><font color="#FF0000">*</font>主材小类</td>
              <td><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <OPTION  value=""></OPTION>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>子品牌</td>
              <td width="33%"> 
				<select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" >
					<option value=""></option>
			   </select>				</td>
              <td width="17%" align="right"><font color="#FF0000">*</font>计量单位</td>
              <td width="33%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>主材名称</td>
              <td colspan="3"> 
                <input type="text" name="zcmc" value="" size="73" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">类别/系列</td>
              <td colspan="3"> 
                <input type="text" name="zclbbm" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">型号</td>
              <td colspan="3"> 
                <input type="text" name="xinghao" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">规格</td>
              <td colspan="3"> 
                <input type="text" name="gg" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>折前实销单价</td>
              <td width="33%"><input type="text" name="zqdj" size="17" maxlength="16"  onChange="f_jsjg(editform)">
元 </td>
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">折扣率</font></td>
              <td width="33%"><input type="text" name="dpzk" size="8" maxlength="9"  value="10" readonly>
                <b><font color="#0000FF">（>0且<=10）</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>折后实销单价</td>
              <td><input type="text" name="dj" size="17" maxlength="9"  value="" onChange="f_jsjg(editform)">
元</td>
              <td align="right"><font color="#FF0000">*</font>订货数量</td>
              <td><input type="text" name="sl" size="17" maxlength="16"  value="" onChange="f_jsjg(editform)" onKeyUp="keyGo(ycf)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF">颜色</td>
              <td width="33%"> 
                <input type="text" name="zcysbm" size="17" maxlength="50"  value="" onKeyUp="keyGo(zcpzwzbm)" ></td>
              <td width="17%" align="right"><font color="#FF0000">*</font>铺装位置</td>
              <td width="33%"> 
                <select name="zcpzwzbm" style="FONT-SIZE:12PX;WIDTH:132PX" >
                  <option value=""></option>
                  <%
				cf.selectItem(out,"select jgwzbm c1,jgwzbm c2 from bj_fjxx where khbh='"+khbh+"' order by xuhao","");
					%>
                </select></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">折前材料费</font></td>
              <td width="33%"><input type="text" name="zqje" size="17" maxlength="17"  value="" readonly>
元 </td>
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">折后材料费</font></td>
              <td width="33%"><input name="je" type="text" id="je"  value="" size="17" maxlength="17" readonly>
元 

			<input type="hidden" name="ycf"  value="0" >
			<input type="hidden" name="qtfy" value="W" >
			<input type="hidden" name="qtfyje" value="0" >

</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>手写合同原因</td>
              <td><select name="sxhtyy" style="FONT-SIZE:12PX;WIDTH:132PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select sxhtyy c1,sxhtyy c2 from jdm_sxhtyybm order by sxhtyybm","调换套餐外产品");
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="68" rows="2"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="hidden" name="ssfgs"  value="<%=ssfgs%>" >
                  <input type="hidden" name="sfycx"  value="N" >
                  <input type="hidden" name="sftjcp"  value="N" >
                  <input type="hidden" name="sftjp"  value="N" >
                  <input type="hidden" name="sfzp"  value="N" >
                  <input type="hidden" name="sftjp"  value="N" >
				  <input type="hidden" name="zsdj"  value="0" >
                  <input type="hidden" name="cxhdbz"  value="N" >
				  <input type="hidden" name="cxhdbl"  value="0" >
				  <input type="hidden" name="cxhdje"  value="0" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>              </td>
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
<%
	//启用Ajax
	cf.ajax(out);
%>


var fieldName="";
function changeDl(FormName)
{
	FormName.zcxlbm.length=1;
	FormName.ppmc.length=1;

	if (FormName.zcdlbm.value=="")
	{
		return;
	}

	fieldName="ppmc";

	var sql;
	sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs='<%=ssfgs%>' and jxc_ppxx.cldl='"+FormName.zcdlbm.value+"' order by jxc_ppxx.ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

}

function getXl(FormName)
{
	if (FormName.zcdlbm.value=="")
	{
		return;
	}

	fieldName="xl";

	var sql;
	sql="select clxlmc from jxc_clxlbm where cldlmc='"+FormName.zcdlbm.value+"' order by clxlmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(codeSQL(actionStr));
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="ppmc")
	{
		strToItem2(editform.ppmc,ajaxRetStr);
		getXl(editform);
	}
	else if (fieldName=="xl")
	{
		strToItem2(editform.zcxlbm,ajaxRetStr);
	}
}



function f_jsjg(FormName)//参数FormName:Form的名称
{
	var dpzk=10;
	if (parseFloat(FormName.zqdj.value)!=0)
	{
		dpzk=FormName.dj.value*10.0/FormName.zqdj.value;
	}	
	dpzk=round(dpzk,2);
	FormName.dpzk.value=dpzk;

	var zqje=FormName.zqdj.value*FormName.sl.value;
	zqje=round(zqje,2);
	FormName.zqje.value=zqje;

	var je=FormName.dj.value*FormName.sl.value;
	je=round(je,2);
	FormName.je.value=je;

	var cxhdje=FormName.je.value*FormName.cxhdbl.value/100;
	cxhdje=round(cxhdje,2);
	FormName.cxhdje.value=cxhdje;
}
function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("请选择[主材小类]！");
		FormName.zcxlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[子品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcmc)=="") {
		alert("请输入[主材名称]！");
		FormName.zcmc.focus();
		return false;
	}


	if(	javaTrim(FormName.zqdj)=="") {
		alert("请输入[折前实销单价]！");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "折前实销单价"))) {
		return false;
	}

	if(	javaTrim(FormName.dpzk)=="") {
		alert("请输入[折扣率]！");
		FormName.dpzk.focus();
		return false;
	}
	if(!(isFloat(FormName.dpzk, "折扣率"))) {
		return false;
	}
	if (FormName.dpzk.value<0 || FormName.dpzk.value>10)
	{
		alert("错误！[折扣率]应该在0和10之间！");
		FormName.dpzk.select();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[折后实销单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "折后实销单价"))) {
		return false;
	}
/*
	if (FormName.dj.value=="0")
	{
		alert("[折后实销单价]不能为0！");
		FormName.dj.select();
		return false;
	}
*/

	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[订货数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "订货数量"))) {
		return false;
	}
/*
	if (parseFloat(FormName.sl.value)<=0)
	{
		alert("[订货数量]不能<=0！");
		FormName.sl.select();
		return false;
	}
*/

	if(	javaTrim(FormName.zqje)=="") {
		alert("请输入[折前材料费]！");
		FormName.zqje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqje, "折前材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("请输入[折后材料费]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "折后材料费"))) {
		return false;
	}

	if(	javaTrim(FormName.ycf)=="") {
		alert("请输入[远程费]！");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "远程费"))) {
		return false;
	}

	if(	javaTrim(FormName.qtfyje)=="") {
		alert("请输入[其它费金额]！");
		FormName.qtfyje.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfyje, "其它费金额"))) {
		return false;
	}

	if(	javaTrim(FormName.zcpzwzbm)=="") {
		alert("请输入[铺装位置]！");
		FormName.zcpzwzbm.focus();
		return false;
	}



	if(	javaTrim(FormName.sxhtyy)=="") {
		alert("请输入[手写合同原因]！");
		FormName.sxhtyy.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
