<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String) session.getAttribute("dwbh");
String yhjs=(String) session.getAttribute("yhjs");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="95%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr> 
    <td width="95%" height="353"> 
      <div align="center"> 
        <form method="post" action="Dm_thjlCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF">退货单位</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="thdw" style="FONT-SIZE:12px;WIDTH:152px">
                  <%
	if (yhjs.equals("02"))//02：分公司
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','1','2','3') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("00"))//00：总公司
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','1','2','3','4','8') order by dwbh","");
	}
	else if (yhjs.equals("01"))//01：专卖店
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"' ","");
	}
	else if (yhjs.equals("03"))//03：加盟商
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('4','8') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"' order by dwbh","");
	}
	else if (yhjs.equals("04"))//03：加盟商
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+dwbh+"' ","");
	}
%> 
                </select>
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">退货记录号</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="thjlh" size="20" maxlength="10" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFCC">退货日期 从</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="thrq" size="20" maxlength="10" onKeyUp="cpbmKey(selectform)">
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">到</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="thrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr>
              <td width="15%" bgcolor="#FFFFFF" align="right">会员编号</td>
              <td width="35%" bgcolor="#FFFFFF">
                <input type="text" name="khbh" size="20" maxlength="50" >
              </td>
              <td width="15%" bgcolor="#FFFFFF" align="right">客户类型</td>
              <td width="35%" bgcolor="#FFFFFF">
                <select name="khlx" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value="1">会员</option>
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">产品编码</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="cpbm" size="20" maxlength="13" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">退货金额</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="thj" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">退货原因</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="thyy" size="20" maxlength="100" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">退货类型</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="thbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <option value="0">本店退货</option>
                  <option value="1">异店换货</option>
                  <option value="2">异店退货</option>
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">品名编码</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="plbm" size="20" maxlength="5" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">品类编码</div>
              </td>
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
              <td width="15%" align="right" bgcolor="#FFFFFF">版库编号</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="bkbh" size="20" maxlength="11" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">产品类别</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="cplb" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"B+素金&A+镶嵌","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFCC">主石重量 从</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zszl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">到</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="zszl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF">配石重量 从</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="pszl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFFF">到</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="pszl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFCC">金重(克) 从</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="jlzl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">到</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="jlzl2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF"> 
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
              <td width="15%" align="right" bgcolor="#FFFFCC">标签价(元) 从</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="bqj" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right" bgcolor="#FFFFCC">到</td>
              <td width="35%" bgcolor="#FFFFCC"> 
                <input type="text" name="bqj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">实销价 从</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="sxj" size="20" maxlength="17" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">到</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="sxj2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">销售序号</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="ywxh" size="20" maxlength="10" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">退货操作人</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="czy" size="20" maxlength="16" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">销售单位</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="xsdw" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx","");
%> 
                </select>
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right"></div>
              </td>
              <td width="35%" bgcolor="#FFFFFF">&nbsp; </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">异店退货审核</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="shbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+不同意&1+同意&2+未审核&3+销售店已入库","");
%> 
                </select>
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">审核人</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="shr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">审核日期</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="text" name="shrq" size="20" maxlength="10" >
              </td>
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">是否结算</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="sfjs" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+未结算&1+结算","");
%> 
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="查询明细" onClick="f_cxmx(selectform)">
                <input type="button"  value="打印明细" onClick="f_dymx(selectform)" >
                <input type="button"  value="打印统计表" onClick="f_dytj(selectform)" >
                <input type="reset"  value="重输">
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
		FormName.thrq2.select();
	}
}
function f_cxmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.thrq)=="") {
		alert("请输入[退货日期]！");
		FormName.thrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq, "退货日期"))) {
		return false;
	}
	if(	javaTrim(FormName.thrq2)=="") {
		alert("请输入[退货日期]！");
		FormName.thrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq2, "退货日期"))) {
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
	if(!(isFloat(FormName.bqj, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.thj, "退货金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.shrq, "审核日期"))) {
		return false;
	}
	if(!(isNumber(FormName.sfjs, "是否结算"))) {
		return false;
	}
	FormName.action="Dm_thjlCxList.jsp";
	FormName.submit();
	return true;
}
function f_dymx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.thrq)=="") {
		alert("请输入[退货日期]！");
		FormName.thrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq, "退货日期"))) {
		return false;
	}
	if(	javaTrim(FormName.thrq2)=="") {
		alert("请输入[退货日期]！");
		FormName.thrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq2, "退货日期"))) {
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
	if(!(isFloat(FormName.bqj, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.thj, "退货金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.shrq, "审核日期"))) {
		return false;
	}
	if(!(isNumber(FormName.sfjs, "是否结算"))) {
		return false;
	}
	FormName.action="dythmx.jsp";
	FormName.submit();
	return true;
}
function f_dytj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.thrq)=="") {
		alert("请输入[退货日期]！");
		FormName.thrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq, "退货日期"))) {
		return false;
	}
	if(	javaTrim(FormName.thrq2)=="") {
		alert("请输入[退货日期]！");
		FormName.thrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.thrq2, "退货日期"))) {
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
	if(!(isFloat(FormName.bqj, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.bqj2, "标签价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj2, "实销价"))) {
		return false;
	}
	if(!(isFloat(FormName.thj, "退货金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.shrq, "审核日期"))) {
		return false;
	}
	if(!(isNumber(FormName.sfjs, "是否结算"))) {
		return false;
	}
	FormName.action="Dm_thjlTjbList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
