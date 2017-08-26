<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by ssdw,dwbh");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Cw_khfkjlCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%"> 
                <div align="right">分公司</div>
              </td>
              <td width="33%"> 
                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,cw_khfkjl_lrdw,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>
              </td>
              <td width="18%"> 
                <div align="right">录入单位</div>
              </td>
              <td width="32%"> 
                <select name="cw_khfkjl_lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">客户类型</td>
              <td width="33%"> 
                <select name="khlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">咨询客户</option>
                  <option value="2">家装客户</option>
                  <option value="4">非家装客户</option>
                </select>
              </td>
              <td width="18%" align="right">收款单位</td>
              <td width="32%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">合同号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="18%"> 
                <div align="right">收款序号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_fkxh" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">结算记录号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_jsjlh" size="20" maxlength="9" >
              </td>
              <td width="18%"> 
                <div align="right">收据编号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_sjbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">收款类型</div>
              </td>
              <td width="33%"> 
                <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm  order by fklxbm","");
%>
                </select>
              </td>
              <td width="18%"> 
                <div align="right">收款金额</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_fkje" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" bgcolor="#FFFFFF" align="right">支付方式</td>
              <td width="33%"> 
                <select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm","");
%>
                </select>
              </td>
              <td width="18%" align="right">转帐款项</td>
              <td width="32%"> 
                <select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">收款时间 从</td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_sksj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_sksj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">收款人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_skr" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">交款人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_jkr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">录入人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_lrr" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">删除标志</div>
              </td>
              <td width="32%"> 
                <select name="scbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未删除</option>
                  <option value="Y">已删除</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_lrsj" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">是否需审核</div>
              </td>
              <td width="33%"> 
                <select name="skdd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">不需审核</option>
                  <option value="2">需审核</option>
                </select>
              </td>
              <td width="18%"> 
                <div align="right">审核标志</div>
              </td>
              <td width="32%"> 
                <select name="dsksjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">否</option>
                  <option value="Y">是</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFCCFF"> 
              <td width="17%"> 
                <div align="right">科目</div>
              </td>
              <td width="33%">
                <input type="text" name="kmdm" size="20" maxlength="80" >
              </td>
              <td width="18%"> 
                <div align="right">凭证字</div>
              </td>
              <td width="32%"> 
                <select name="pzz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="记">记</option>
                  <option value="记">材</option>
                  <option value="记">W</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFCCFF">
              <td width="17%">
                <div align="right">凭证号</div>
              </td>
              <td width="33%">
                <input type="text" name="pzh" size="20" maxlength="20" >
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询客户付款记录" onClick="f_do(selectform)">
                <input type="button"  value="导出符合条件付款记录" onClick="f_do2(selectform)" name="button">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.cw_khfkjl_fkxh, "收款序号"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_khfkjl_fkje, "收款金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_sksj, "收款时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_sksj2, "收款时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_lrsj, "录入时间"))) {
		return false;
	}
	FormName.action="Cw_khfkjlCxList.jsp"
	FormName.submit();
	return true;
}
function f_do2(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.cw_khfkjl_fkxh, "收款序号"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_khfkjl_fkje, "收款金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_sksj, "收款时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_sksj2, "收款时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_lrsj, "录入时间"))) {
		return false;
	}
		if(	javaTrim(FormName.kmdm)=="") {
		alert("请输入[科目代码]！");
		FormName.kmdm.focus();
		return false;
	}

	FormName.action="EnterExp.jsp"
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

