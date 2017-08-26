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
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khwtclgzList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khwtclgz_khbh" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">合同号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">客户姓名</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="18%" align="right">联系方式</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="74" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td width="18%"> 
                <div align="right">设计师</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">签约日期 从</td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">施工队</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssfgs='"+ssfgs+"' order by sgdmc","");
	}
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">质检</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">问题编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khwtclgz_wtbh" size="20" maxlength="9" >
              </td>
              <td width="18%"> 
                <div align="right">问题分类</div>
              </td>
              <td width="32%"> 
                <select name="crm_khwtclgz_wtflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wtflbm,wtflmc from dm_wtflbm order by wtflbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">要求解决时间 从</td>
              <td width="33%"> 
                <input type="text" name="crm_khwtclgz_yqjjsj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_khwtclgz_yqjjsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客服受理人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khwtclgz_slr" size="20" maxlength="20" >
                <BR>
              </td>
              <td width="18%"> 
                <div align="right">录入部门</div>
              </td>
              <td width="32%"> 
                <select name="crm_khwtclgz_slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客服受理时间 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khwtclgz_slsj" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khwtclgz_slsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">处理状态</div>
              </td>
              <td width="33%"> 
                <select name="crm_khwtclgz_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">未处理</option>
                </select>
              </td>
              <td width="18%"> 
                <div align="right">处理人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khwtclgz_clr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">处理开始时间</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khwtclgz_clkssj" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">处理结束时间</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khwtclgz_cljssj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
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
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khwtclgz_yqjjsj, "要求解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khwtclgz_yqjjsj2, "要求解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khwtclgz_slsj, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khwtclgz_slsj2, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khwtclgz_clkssj, "处理开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khwtclgz_cljssj, "处理结束时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
