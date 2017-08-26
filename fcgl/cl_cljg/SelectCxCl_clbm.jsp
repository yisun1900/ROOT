<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_clbmCxList.jsp" name="selectform">
<div align="center">材料价格维护</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
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
