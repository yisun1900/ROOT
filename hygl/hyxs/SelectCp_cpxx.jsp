<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String) session.getAttribute("dwbh");
String yhjs=(String) session.getAttribute("yhjs");
String tjxz=request.getParameter("tjxz");
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="94%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr> 
    <td width="94%" height="438"> 
      <div align="center"> 
        <form method="post" action="Cp_cpxxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">销售单位</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="szdw" style="FONT-SIZE:12px;WIDTH:152px">
<%
	if (yhjs.equals("00"))//00：总公司
	{
//		out.println("<option value=''></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','1','2','3','4','7','8') order by dwbh","");
	}
	else if (yhjs.equals("02"))//02：分公司
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('2','3') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("01"))//01：专卖店
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"' ","");
	}
	else if (yhjs.equals("03"))//03：加盟商
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('4','8') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("04"))//04：加盟专卖店
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">材质</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="jldm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yldm,ylmc from yl_jldmb","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">销售日期 从</td>
              <td width="35%"> 
                <input type="text" name="xsrq" size="20" maxlength="10"  onKeyUp="cpbmKey(selectform)">
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%"> 
                <input type="text" name="xsrq2" size="20" maxlength="10" >
                <input type="hidden" name="tjxz" value="<%=tjxz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">工厂编号</td>
              <td>
                <select name="dwbh" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='5' order by dwbh","");
%>
                </select>
              </td>
              <td align="right">货物类型</td>
              <td>
                <select name="gkbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <option value="0">正常货</option>
                  <option value="1">改款货</option>
                  <option value="2">代销货</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">实销价 从</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sxj" size="20" maxlength="17" >
              </td>
              <td width="15%"> 
                <div align="right">到</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sxj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">产品编码</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="cpbm" size="20" maxlength="13"  onKeyUp="singleAdd(selectform)">
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">证书编号</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="zsh" size="20" maxlength="16" >
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">版库编号</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="bkbh" size="20" maxlength="11" >
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">工厂款号</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="gckh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">品名(5位)</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="plbm" size="20" maxlength="5" >
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">品类</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="pmbm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select pmbm,pmmc from xt_pmbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">产品类别</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="cplb" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <option value="A">镶嵌类</option>
                  <option value="B">素金类</option>
                </select>
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">货品类型</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="hplx" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bkdlbm,bkdlmc from xt_bkdlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right">入库批号</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="rkph" size="20" maxlength="16" >
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">版库分类编码</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="bkflbm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bkflbm,bkflmc from xt_bkflbm order by bkflbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC" align="right">子圈号 从</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zqh" size="20" maxlength="10" >
              </td>
              <td width="15%" bgcolor="#FFFFCC" align="right">&nbsp;</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zqh2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">总重量(克) 从</td>
              <td width="35%"> 
                <input type="text" name="zzl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%"> 
                <input type="text" name="zzl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">金重(克) 从</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="jlzl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">到</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="jlzl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC">主石重量 从</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zszl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">到</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zszl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">配石重量 从</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="pszl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">到</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="pszl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">零售价(元) 从</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="lsj" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF"> 
                <div align="right">到</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="lsj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC">标签价(元) 从</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="bqj" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">到</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="bqj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">入库日期 从</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="rkrq" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">到</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="rkrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">生产日期 从</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="yrkrq" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">到</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="yrkrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <p>
                  <input type="button"  value="查询明细" onClick="f_mxb(selectform)">
                  <input type="button"  value="打印明细" onClick="f_dymx(selectform)" >
                  <input type="reset"  value="重输">
                </p>
                <p>
                  <input type="button"  value="品类统计" onClick="f_pltjb(selectform)" name="button21">
				  <input type="button"  value="品名价位统计" onClick="f_pmjwtjb(selectform)" name="button22">
                  <input type="button"  value="品名统计" onClick="f_pmtjb(selectform)" name="button3" >
                  <input type="button"  value="价位统计" onClick="f_jwtjb(selectform)" name="button2" >
                  <input type="button"  value="款号统计表" onClick="f_khtjb(selectform)" name="button" >
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
function cpbmKey(FormName)
{
//	alert(event.keyCode);
	if (event.keyCode==13)	
	{
		FormName.xsrq2.select();
	}
}
function f_mxb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "销售日期"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "零售价"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "零售价"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "子圈号"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "子圈号"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "标签价"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "生产日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "生产日期"))) {
		return false;
	}
	FormName.action="Cp_cpxxList.jsp";
	FormName.submit();
	return true;
}

function f_dymx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "销售日期"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "零售价"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "零售价"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "子圈号"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "子圈号"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "标签价"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "生产日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "生产日期"))) {
		return false;
	}
	FormName.action="Cp_cpxxDyList.jsp";
	FormName.submit();
	return true;
}
function f_pltjb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "销售日期"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "零售价"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "零售价"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "子圈号"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "子圈号"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "标签价"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "生产日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "生产日期"))) {
		return false;
	}
	FormName.action="pltjb.jsp";
	FormName.submit();
	return true;
}
function f_pmjwtjb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "销售日期"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "零售价"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "零售价"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "子圈号"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "子圈号"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "标签价"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "生产日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "生产日期"))) {
		return false;
	}
	FormName.action="pmjwtjb.jsp";
	FormName.submit();
	return true;
}

function f_pmtjb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "销售日期"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "零售价"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "零售价"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "子圈号"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "子圈号"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "标签价"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "生产日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "生产日期"))) {
		return false;
	}
	FormName.action="pmtjb.jsp";
	FormName.submit();
	return true;
}

function f_khtjb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "销售日期"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "零售价"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "零售价"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "子圈号"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "子圈号"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "标签价"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "生产日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "生产日期"))) {
		return false;
	}
	FormName.action="khtjb.jsp";
	FormName.submit();
	return true;
}

function f_jwtjb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsrq)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "销售日期"))) {
		return false;
	}
	if(	javaTrim(FormName.xsrq2)=="") {
		alert("请输入[销售日期]！");
		FormName.xsrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "销售日期"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zzl2, "总重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.jlzl2, "金料重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.zszl2, "主石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.pszl2, "配石重量"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj, "零售价"))) {
		return false;
	}
	if(!(isFloat(FormName.lsj2, "零售价"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh, "子圈号"))) {
		return false;
	}
	if(!(isNumber(FormName.zqh2, "子圈号"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "标签价"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rkrq2, "入库日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq, "生产日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.yrkrq2, "生产日期"))) {
		return false;
	}
	FormName.action="jwtjb.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
