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

<form method="post" action="Jc_cgjgbCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">橱柜编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jc_cgjgb_cgbm" size="20" maxlength="5" >
              </td>
              <td width="15%"> 
                <div align="right">橱柜名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jc_cgjgb_cgmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">门板</div>
              </td>
              <td width="35%"> 
                <select name="jc_cgjgb_mbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mbbm,mbmc from jdm_mbbm order by mbbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">门板封边</div>
              </td>
              <td width="35%"> 
                <select name="jc_cgjgb_mbfbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mbfbbm,mbfbmc from jdm_mbfbbm order by mbfbbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">箱体</div>
              </td>
              <td width="35%"> 
                <select name="jc_cgjgb_xtbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xtbm,xtmc from jdm_xtbm order by xtbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">拉手</div>
              </td>
              <td width="35%"> 
                <select name="jc_cgjgb_lsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select lsbm,lsmc from jdm_lsbm order by lsbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">踢脚板</div>
              </td>
              <td width="35%"> 
                <select name="jc_cgjgb_tjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tjbbm,tjbmc from jdm_tjbbm order by tjbbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">抽屉</div>
              </td>
              <td width="35%"> 
                <select name="jc_cgjgb_ctbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ctbm,ctmc from jdm_ctbm order by ctbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">铰链</div>
              </td>
              <td width="35%"> 
                <select name="jc_cgjgb_jlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jlbm,jlmc from jdm_jlbm order by jlbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">装饰门板单价</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jc_cgjgb_zsmbdj" size="20" maxlength="9" >
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
	if(!(isFloat(FormName.jc_cgjgb_zsmbdj, "装饰门板单价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
