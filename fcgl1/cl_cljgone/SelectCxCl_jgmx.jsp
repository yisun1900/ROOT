<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_jgmxCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">分公司</td>
      <td width="31%"> 
        <select name="cl_jgmx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
		%> 
        </select>      </td>
      <td align="right" width="19%">材料编码</td>
      <td width="31%"> 
        <input type="text" name="cl_jgmx_clbm" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">材料名称</td>
      <td colspan="3"><input type="text" name="cl_clbm_clmc" size="73" maxlength="100" >      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right">材料规格</td>
      <td><input type="text" name="cl_clbm_clgg" size="20" maxlength="100" ></td>
      <td align="right">材料大类</td>
      <td><select name="cl_clbm_cldlmc" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from cl_cldlbm order by cldlbm","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">与厂家结算价</td>
      <td width="31%"><input type="text" name="cl_jgmx_cjjsj" size="20" maxlength="17" ></td>
      <td align="right" width="19%">工队价</td>
      <td width="31%"> 
        <input type="text" name="cl_jgmx_gdj" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">仓库名称</td>
      <td width="31%"> 
        <input type="text" name="cl_jgmx_ckmc" size="20" maxlength="50" >      </td>
      <td align="right" width="19%">是否入库</td>
      <td width="31%"> <%
	cf.radioToken(out, "cl_jgmx_sfrk","Y+是&N+否","");
%> </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">签约百分比</td>
      <td width="31%"> 
        <input type="text" name="cl_clbm_qybfb" size="20" maxlength="17" >      </td>
      <td align="right" width="19%">利润计算方式</td>
      <td width="31%"> <%
	cf.radioToken(out, "cl_clbm_lrjsfs","1+差价方式&2+百分比方式","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">利润百分比</td>
      <td width="31%"> 
        <input type="text" name="cl_clbm_lrbfb" size="20" maxlength="9" >      </td>
      <td align="right" width="19%">新价格是否更新</td>
      <td width="31%"><input type="radio" name="xjgsfgx" value="1">
未更新
  <input type="radio" name="xjgsfgx" value="2">
已更新 </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><b><font color="#0000CC">维护人</font></b></td>
      <td width="31%">
		<input type="text" name="wxr" size="20" maxlength="20" value="">
	  </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.cl_jgmx_cjjsj, "与厂家结算价"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_jgmx_gdj, "工队价"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_clbm_qybfb, "签约百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.cl_clbm_lrbfb, "利润百分比"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
