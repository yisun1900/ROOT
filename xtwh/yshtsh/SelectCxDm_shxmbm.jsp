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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">查询预算审核项目</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Dm_shxmbmCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">审核项目大类</div>              </td>
              <td width="31%"> 
                <select name="dm_ysshxmbm_shxmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select shxmdlbm,shxmdlmc from dm_ysshxmdlbm order by shxmdlbm","");
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right">审核项目小类</div>              </td>
              <td width="32%"> 
                <select name="dm_ysshxmbm_shxmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select shxmxlbm,shxmxlmc from dm_ysshxmxlbm order by shxmdlbm,shxmxlbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">审核项目编码</div>              </td>
              <td width="31%"> 
                <input type="text" name="dm_ysshxmbm_shxmbm" size="20" maxlength="4" >              </td>
              <td width="18%"> 
                <div align="right">扣分</div>              </td>
              <td width="32%"> 
                <input type="text" name="dm_ysshxmbm_kf" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">审核项目名称</td>
              <td colspan="3"> 
                <input type="text" name="dm_ysshxmbm_shxmmc" size="72" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">扣分规则</td>
              <td colspan="3"><input type="radio" name="kfgz" value="1">
                第2次审核开始扣分 <BR>
                <input type="radio" name="kfgz" value="2">
                每次都扣分 <BR>
                <input type="radio" name="kfgz" value="3">
                相同项目出现2次开始扣分 <BR>
                <input type="radio" name="kfgz" value="4">
                相同项目只扣1次分 </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
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
	if(!(isNumber(FormName.dm_ysshxmbm_kf, "扣分"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
