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
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">样板间--修改审批</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Ybj_ybjsbXgSpList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">所属分公司</td>
              <td width="33%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx='F2' order by ssfgs,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="18%" align="right">签约店面</td>
              <td width="32%"> 
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
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssfgs='"+ssfgs+"' order by dwbh","");
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
                <input type="text" name="ybj_ybjsb_khbh" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">合同号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">设计师</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">签约日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">计划开工日期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">实际开工日期</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">计划竣工日期</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">施工队</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='N' order by sgdmc","");
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
                <div align="right">申报人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ybj_ybjsb_sbr" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">录入人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" bgcolor="#FFFFFF" align="right">申报时间 从</td>
              <td width="33%"> 
                <input type="text" name="ybj_ybjsb_sbsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="ybj_ybjsb_sbsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" bgcolor="#FFFFFF" align="right">录入时间 从</td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">审核人</div>
              </td>
              <td width="33%">
                <input type="text" name="ybj_ybjsb_shr" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">审核结论</div>
              </td>
              <td width="32%">
                <select name="ybj_ybjsb_shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+合格&N+不合格","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">审核时间 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ybj_ybjsb_shsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%">
                <input type="text" name="ybj_ybjsb_shsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">审核说明</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ybj_ybjsb_shsm" size="20" maxlength="200" >
              </td>
              <td width="18%"> 
                <div align="right">处理状态</div>
              </td>
              <td width="32%"> 
                <select name="ybj_ybjsb_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="2">已审核</option>
                </select>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq, "计划开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "计划竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_ybjsb_sbsj, "申报时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_ybjsb_sbsj2, "申报时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_ybjsb_shsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_ybjsb_shsj2, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
