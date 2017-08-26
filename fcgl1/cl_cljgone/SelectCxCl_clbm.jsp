<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_clbmCxList.jsp" name="selectform">
<div align="center">材料价格－录入</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>分公司</td>
      <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
      </select></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">材料编码</td>
      <td width="32%"><input type="text" name="clbm" size="20" maxlength="20" ></td>
      <td align="right" width="18%">材料名称</td>
      <td width="32%"><input type="text" name="clmc" size="20" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        材料大类      </td>
      <td width="32%"> 
        <select name="cldlmc" style="FONT-SIZE:12px;WIDTH:152px">
          <option value=""></option>
          <%
				cf.selectItem(out,"select cldlmc c1,cldlmc c2 from cl_cldlbm order by cldlbm","");
				%> 
      </select>      </td>
      <td width="18%" align="right">材料规格 </td>
      <td width="32%"><input type="text" name="clgg" size="20" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">利润计算方式</td>
      <td width="32%"> 
        <select name="lrjsfs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">差价方式</option>
          <option value="2">百分比方式</option>
      </select>      </td>
      <td width="18%" align="right"> 
        计量单位      </td>
      <td width="32%"> 
        <select name="jldwmc" style="FONT-SIZE:12px;WIDTH:152px">
          <option value=""></option>
          <%
				cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
				%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">利润百分比 从</td>
      <td width="32%"> 
        <input type="text" name="lrbfb" size="20" maxlength="9" >
      % </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="lrbfb2" size="20" maxlength="9" >
      % </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">类型</td>
      <td width="32%"> 
        <input type="radio" name="lx" value="1">
        常用 
        <input type="radio" name="lx" value="2">
      非常用 </td>
      <td align="right" width="18%">维护人</td>
      <td width="32%">
        <input type="text" name="wxr" size="20" maxlength="20" value="">      </td>
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
	if(	javaTrim(FormName.fgs)=="") {
		alert("请选择[分公司]！");
		FormName.fgs.focus();
		return false;
	}

	if(!(isFloat(FormName.lrbfb, "利润百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.lrbfb2, "利润百分比"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
