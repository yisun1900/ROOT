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
	String sql=null;
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">处理随机回访问题－修改</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right"> 
                分公司              </td>
              <td width="30%"> 
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx in('F1','F2') and cxbz='N' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_hfjl_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>              </td>
              <td width="19%" align="right"> 
                反馈部门              </td>
              <td width="31%"> 
                <select name="crm_hfjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else if (yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2') and cxbz='N' and ssdw='"+ssfgs+"' ";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
		cf.selectItem(out,sql,"");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx  where dwbh='"+dwbh+"' ","");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                回访记录号              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_hfjlh" size="20" maxlength="9" >              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                客户编号              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_khbh" size="20" maxlength="20" >              </td>
              <td width="19%" align="right"> 
                客户姓名              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                房屋地址              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
              <td width="19%" align="right"> 
                联系方式              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="50" >              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                处理方式              </td>
              <td width="30%"> 
                <select name="crm_hfjl_clfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">反馈相关部门</option>
                </select>              </td>
              <td width="19%" align="right"> 
                回访部门              </td>
              <td width="31%"> 
                <select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1')";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";

		out.println("<option value=\"\"></option>");

		cf.selectItem(out,sql,"");

	}
	else
	{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1') and ssdw='"+ssfgs+"'";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";

		out.println("<option value=\"\"></option>");
		cf.selectItem(out,sql,"");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">处理状态</td>
              <td width="30%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="Y">相关部门已处理</option>
                </select>              </td>
              <td width="19%" align="right">回访人</td>
              <td width="31%"><input type="text" name="crm_hfjl_hfr" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                回访时间 从              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_hfsj" size="20" maxlength="10" >              </td>
              <td width="19%" align="right"> 
                到              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_hfsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="修改" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
            </tr>
        </table>
</form>

	  
	  
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
	if(!(isDatetime(FormName.crm_hfjl_hfsj, "回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_hfsj2, "回访时间"))) {
		return false;
	}
	FormName.action="Crm_hfjlXgClList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
