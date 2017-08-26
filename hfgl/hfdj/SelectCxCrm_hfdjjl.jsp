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
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
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

<form method="post" action="Crm_hfdjjlCxList.jsp" name="selectform">
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
              <td width="16%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="34%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
                <input type="text" name="crm_hfdjjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="16%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="16%"> 
                <div align="right">设计师</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">施工队</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_sgd" size="20" maxlength="5" >
              </td>
              <td width="16%"> 
                <div align="right">质检姓名</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">冻结编号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfdjjl_djbh" size="20" maxlength="9" >
              </td>
              <td width="16%"> 
                <div align="right">回访冻结标志</div>
              </td>
              <td width="34%"> 
                <select name="crm_hfdjjl_hfdjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+工程回访冻结&2+投诉报修回访冻结&3+全部冻结","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">冻结原因</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfdjjl_djyy" size="20" maxlength="200" >
              </td>
              <td width="16%"> 
                <div align="right">冻结时间</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_hfdjjl_djsj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">冻结人</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfdjjl_djr" size="20" maxlength="16" >
              </td>
              <td width="16%"> 
                <div align="right">计划解冻时间</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_hfdjjl_jhjdsj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">实际解冻时间</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfdjjl_sjjdsj" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">解冻人</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_hfdjjl_jdr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">工程回访日期</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfdjjl_hfrq" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">工程回访类型编码</div>
              </td>
              <td width="34%"> 
                <input type="text" name="crm_hfdjjl_hflxbm" size="20" maxlength="2" >
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
	if(!(isDatetime(FormName.crm_hfdjjl_djsj, "冻结时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfdjjl_jhjdsj, "计划解冻时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfdjjl_sjjdsj, "实际解冻时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfdjjl_hfrq, "工程回访日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
