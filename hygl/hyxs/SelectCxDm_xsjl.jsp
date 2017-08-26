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
    <td width="93%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr> 
    <td width="93%" height="258"> 
      <div align="center"> 
        <form method="post" action="Dm_xsjlCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">单位编码</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12px;WIDTH:152px">
<%
	if (yhjs.equals("00"))//00：总公司
	{
//		out.println("<option value=''></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx not in('5','6') order by dwbh","");
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
              <td width="15%"> 
                <div align="right">是否结算</div>
              </td>
              <td width="35%"> 
                <select name="sfjs" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+未结算&1+结算","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">销售日期 从</td>
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
              <td width="15%"> 
                <div align="right">产品编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cpbm" size="20" maxlength="13" >
              </td>
              <td width="15%"> 
                <div align="right">交易方式</div>
              </td>
              <td width="35%"> 
                <select name="jyfs" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <option value="0">零售</option>
                  <option value="1">非现金</option>
                  <option value="2">内购</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">品名编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="plbm" size="20" maxlength="5" >
              </td>
              <td width="15%"> 
                <div align="right">品类编码</div>
              </td>
              <td width="35%"> 
                <select name="pmbm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
<%
	cf.selectItem(out,"select pmbm,pmmc from xt_pmbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">价位编码</td>
              <td width="35%">
                <select name="jwbm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
<%
	cf.selectItem(out,"select jwbm,jwmc  from xt_jwbm order by jwbm","");
%> 
                </select>
              </td>
              <td width="15%" align="right">销售部订单号</td>
              <td width="35%">
                <input type="text" name="xsbddbh" size="20" maxlength="11" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">版库编号</td>
              <td width="35%"> 
                <input type="text" name="bkbh" size="20" maxlength="11" >
              </td>
              <td width="15%" align="right">产品类别</td>
              <td width="35%"> 
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
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">金重(克) 从</td>
              <td width="35%"> 
                <input type="text" name="jlzl" size="20" maxlength="17" >
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%"> 
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
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
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
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">实际折扣率</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjzkl" size="20" maxlength="17" >
              </td>
              <td width="15%"> 
                <div align="right">最低折扣率</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zkl" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">水质分析卡号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">客户类型</div>
              </td>
              <td width="35%"> 
                <select name="khlx" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+一般客户&1+会员","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">销售员</div>
              </td>
              <td width="35%"> 
                <input type="text" name="czy" size="20" maxlength="16" >
              </td>
              <td width="15%"> 
                <div align="right">业务序号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ywxh" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">折扣超限</div>
              </td>
              <td width="35%"> 
                <select name="zkcx" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+未超限&1+超限","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">审核标志</div>
              </td>
              <td width="35%"> 
                <select name="shbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+未通过&1+通过&9+未审核","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">审核人</td>
              <td width="35%"> 
                <input type="text" name="shr" size="20" maxlength="16" >
              </td>
              <td width="15%" align="right">审核日期</td>
              <td width="35%"> 
                <input type="text" name="shrq" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="查询明细" onClick="f_mxb(selectform)">
                <input type="button"  value="打印明细" onClick="f_dymx(selectform)" >
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
	if(!(isFloat(FormName.zkl, "最低折扣率"))) {
		return false;
	}
	if(!(isFloat(FormName.sjzkl, "实际折扣率"))) {
		return false;
	}
	if(!(isDatetime(FormName.shrq, "审核日期"))) {
		return false;
	}
	if(!(isNumber(FormName.sfjs, "是否结算"))) {
		return false;
	}
	FormName.action="Dm_xsjlCxList.jsp";
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
	if(!(isFloat(FormName.zkl, "最低折扣率"))) {
		return false;
	}
	if(!(isFloat(FormName.sjzkl, "实际折扣率"))) {
		return false;
	}
	if(!(isDatetime(FormName.shrq, "审核日期"))) {
		return false;
	}
	if(!(isNumber(FormName.sfjs, "是否结算"))) {
		return false;
	}
	FormName.action="dyxsmx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
