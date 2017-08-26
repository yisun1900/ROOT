<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>凭证导出</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">凭证导出</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">分公司</div>
              </td>
              <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="19%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
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
              <td width="18%" align="right">客户类型</td>
              <td width="32%"> 
                <select name="khlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">咨询客户</option>
                  <option value="2">家装客户</option>
                  <option value="4">非家装客户</option>
                </select>
              </td>
              <td width="19%" align="right">收款单位</td>
              <td width="31%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">合同号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">收款序号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="cw_khfkjl_fkxh" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="68" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">结算记录号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_jsjlh" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">收据编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="cw_khfkjl_sjbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">收款金额</td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_fkje" size="20" maxlength="17" >
              </td>
              <td align="right" width="19%">收款类型</td>
              <td width="31%"> 
                <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where pzfl='2' order by fklxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">收款类型</td>
              <td colspan="3"> 
                <input type="radio" name="pplx" value="21" >
                木门 
                <input type="radio" name="pplx" value="22" >
                橱柜 
                <input type="radio" name="pplx" value="23" >
                主材 
                <input type="radio" name="pplx" value="24" >
                家具 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">主材类别</td>
              <td width="32%"> 
                <select name="zclb" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlbm,zcdlmc from jdm_zcdlbm order by zcdlbm","");
%> 
                </select>
              </td>
              <td align="right" width="19%">收款品牌</td>
              <td width="31%"> 
                <input type="text" name="gysbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">支付方式</td>
              <td width="32%"> 
                <select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right">转帐款项</td>
              <td width="31%"> 
                <select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">收款人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_skr" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">交款人</div>
              </td>
              <td width="31%"> 
                <input type="text" name="cw_khfkjl_jkr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">录入人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_lrr" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">录入单位</div>
              </td>
              <td width="31%"> 
                <select name="cw_khfkjl_lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">是否需审核</div>
              </td>
              <td width="32%"> 
                <input type="radio" name="skdd" value="1">
                财务收款 
                <input type="radio" name="skdd" value="2">
                非财务代收款 </td>
              <td width="19%"> 
                <div align="right">审核标志</div>
              </td>
              <td width="31%"> 
                <input type="radio" name="dsksjbz" value="N">
                否 
                <input type="radio" name="dsksjbz" value="Y">
                是 </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right">查询结果排序</td>
              <td width="32%"> 
                <select name="pxzd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="fkxh">收款序号</option>
                  <option value="hth">合同号</option>
                  <option value="khxm">客户姓名</option>
                  <option value="khlx">客户类型</option>
                  <option value="dwmc">收款单位</option>
                  <option value="sksj">收款时间</option>
                  <option value="fklxbm">收款类型</option>
                  <option value="zffsmc">支付方式</option>
                </select>
              </td>
              <td width="19%" align="right">每页显示数量</td>
              <td width="31%"> 
                <input type="text" name="myxssl" size="20" maxlength="13" value="30">
                &nbsp;&nbsp; </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="cw_khfkjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right" bgcolor="#CCFFFF">收款时间 从</td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_sksj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="cw_khfkjl_sksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right" bgcolor="#CCFFFF">审核人</td>
              <td width="32%"> 
                <input type="text" name="sjr" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right" bgcolor="#CCFFFF">审核时间 从</td>
              <td width="32%"> 
                <input type="text" name="sjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="sjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right" bgcolor="#CCFFFF">是否已导出凭证</td>
              <td width="32%"> 
                <input type="radio" name="czlx" value="1" checked>
                没有导出 
                <input type="radio" name="czlx" value="2">
                已导出 </td>
              <td width="19%" align="right">删除标志</td>
              <td width="31%"> 
                <input type="radio" name="scbz" value="N" checked>
                未删除 </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right" bgcolor="#CCFFFF">收款类型</td>
              <td colspan="3"> 
                <input type="radio" name="pzfl" value="1" checked>
                收集成款（现金） 
                <input type="radio" name="pzfl" value="2" >
                收集成款（非现金） 
                <input type="radio" name="pzfl" value="3" >
                转入、转出集成款</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="导出凭证" onClick="f_do(selectform,'dc')" name="button">
                <input type="button"  value="查询收款信息" onClick="f_do(selectform,'cx')">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
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
	if(!(isDatetime(FormName.cw_khfkjl_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsj2, "审核时间"))) {
		return false;
	}

	if (lx=='cx')
	{
		FormName.action="Cw_khfkjlCxList.jsp";
	}
	else{
		FormName.action="ExpPz.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
