<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
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
      <div align="center">收集成款－修改</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Cw_khfkjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                客户编号              </td>
              <td width="32%"> 
              <input type="text" name="cw_khfkjl_khbh" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"> 
                合同号              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                客户姓名              </td>
              <td width="32%"> 
              <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >              </td>
              <td width="18%" align="right"> 
                客户姓名              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_khxm2" size="12" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">房屋地址</td>
              <td width="32%"> 
              <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
              <td width="18%" align="right">收款序号</td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_fkxh" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                结算记录号              </td>
              <td width="32%"> 
              <input type="text" name="cw_khfkjl_jsjlh" size="20" maxlength="9" >              </td>
              <td width="18%" align="right"> 
                收据编号              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_sjbh" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">收款金额</td>
              <td> 
                <input type="text" name="cw_khfkjl_fkje" size="20" maxlength="17" >              </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">收款类型</td>
              <td colspan="3"> 
                <INPUT type="radio" name="fklxbm" value="23">
                主材款                 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">收款品牌</td>
              <td><select name="gysbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
<%
		cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx order by ppmc","");
%>
			  </select></td>
              <td align="right">收款品牌</td>
              <td><input type="text" name="gysbh2" size="20" maxlength="50" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">收款时间 从</td>
              <td width="32%"> 
              <input type="text" name="cw_khfkjl_sksj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_sksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                收款人              </td>
              <td width="32%"> 
              <input type="text" name="cw_khfkjl_skr" size="20" maxlength="20" >              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                录入单位              </td>
              <td width="32%"> 
                <select name="cw_khfkjl_lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1") || yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
              </select>              </td>
              <td width="18%" align="right"> 
                录入人              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_lrr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                录入时间              </td>
              <td width="32%"> 
              <input type="text" name="cw_khfkjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"> 
                支付方式              </td>
              <td width="32%"> 
                <select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                是否需审核              </td>
              <td width="32%"> 
                <select name="skdd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">不需审核</option>
              </select>              </td>
              <td width="18%" align="right"> 
                转帐款项              </td>
              <td width="32%"> 
                <select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">删除标志</td>
              <td width="32%"> 
                <select name="scbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="N">未删除</option>
              </select>              </td>
              <td width="18%" align="right">是否已导出凭证</td>
              <td width="32%"> 
                <input type="radio" name="czlx" value="1" checked>
                没有导出 </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
