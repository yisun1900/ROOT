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
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Hy_khxxbCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">水质分析卡号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_khxxb_hykh" size="20" maxlength="10" >
              </td>
              <td width="14%"> 
                <div align="right">卡的类别</div>
              </td>
              <td width="34%"> 
                <select name="hy_khxxb_kdlb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否已发卡</div>
              </td>
              <td width="33%"> 
                <select name="hy_khxxb_sfyfk" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"N+未发卡&Y+已发卡","");
%> 
                </select>
              </td>
              <td width="14%"> 
                <div align="right">收卡单位</div>
              </td>
              <td width="34%"> 
                <select name="hy_khxxb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">发卡日期 从</td>
              <td width="33%"> 
                <input type="text" name="hy_khxxb_fkrq" size="20" maxlength="10" >
              </td>
              <td width="14%" align="right">到</td>
              <td width="34%">
                <input type="text" name="hy_khxxb_fkrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">发卡人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_khxxb_fkr" size="20" maxlength="16" >
              </td>
              <td width="14%"> 
                <div align="right"></div>
              </td>
              <td width="34%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否已使用</div>
              </td>
              <td width="33%"> 
                <select name="hy_khxxb_sfysy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未使用</option>
                  <option value="Y">已使用</option>
                </select>
              </td>
              <td width="14%"> 
                <div align="right">会员编号</div>
              </td>
              <td width="34%"> 
                <input type="text" name="hy_khxxb_hybh" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">卡的使用日期 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="hy_khxxb_syrq" size="20" maxlength="10" >
              </td>
              <td width="14%"> 
                <div align="right">到</div>
              </td>
              <td width="34%"> 
                <input type="text" name="hy_khxxb_syrq2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.hy_khxxb_fkrq, "发卡日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_khxxb_fkrq2, "发卡日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_khxxb_syrq, "卡的使用日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_khxxb_syrq2, "卡的使用日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
