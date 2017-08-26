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
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' ");
if (yhmc==null)
{
	yhmc="";
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">巡检工地计划</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Kp_xjgdjhList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_khxx_dwbh,"+dwstr+");\">");
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
              <td width="18%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="32%"> 
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
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="kp_xjgdjh_khbh" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">合同号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">房屋地址</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="72" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">设计师</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">工程担当</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">施工队</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd order by sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssdw='"+ssfgs+"' order by sgdmc","");
	}
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">班长</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">计划编号</td>
              <td width="31%"> 
                <input type="text" name="kp_xjgdjh_jhbh" size="20" maxlength="9" >
              </td>
              <td width="18%" align="right">审核标志</td>
              <td width="32%"> 
                <select name="kp_xjgdjh_shbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"N+未审核&Y+已审核","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">巡检人</div>
              </td>
              <td width="31%"> 
                <input type="text" name="kp_xjgdjh_xjr" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">巡检类型</div>
              </td>
              <td width="32%"> 
                <select name="kp_xjgdjh_xjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">常规巡检</option>
                  <option value="2">临时巡检</option>
                  <option value="3">其它</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">计划巡检时间 从</td>
              <td width="31%"> 
                <input type="text" name="kp_xjgdjh_jhxjsj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="kp_xjgdjh_jhxjsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入人 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="kp_xjgdjh_lrr" size="20" maxlength="20" value="<%=yhdlm%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="kp_xjgdjh_lrr2" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入时间</div>
              </td>
              <td width="31%"> 
                <input type="text" name="kp_xjgdjh_lrsj" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">计划完成标志</div>
              </td>
              <td width="32%"> 
                <select name="kp_xjgdjh_wcbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">设置计划</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">未完成计划原因</div>
              </td>
              <td width="31%"> 
                <select name="kp_xjgdjh_wwcyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wwcyybm,wwcyy from kdm_wwcyybm order by wwcyybm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"></div>
              </td>
              <td width="32%">&nbsp; </td>
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
	if(!(isDatetime(FormName.kp_xjgdjh_jhxjsj, "计划巡检时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_xjgdjh_jhxjsj2, "计划巡检时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_xjgdjh_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
