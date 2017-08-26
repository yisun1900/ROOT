<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String) session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String zgsbh=(String)session.getAttribute("zgsbh");
if (yhjs.equals("00"))//00：总公司
{
	dwbh=zgsbh;
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="95%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr> 
    <td width="95%" height="64"> 
      <div align="center"> 
        <form method="post" action="Dm_thjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">退货记录号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="thjlh" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">产品编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cpbm" size="20" maxlength="13" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">退货单位</div>
              </td>
              <td width="35%"> 
                <select name="thdw" style="FONT-SIZE:12px;WIDTH:152px">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">退货金额</div>
              </td>
              <td width="35%"> 
                <input type="text" name="thj" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">退货原因</div>
              </td>
              <td width="35%"> 
                <input type="text" name="thyy" size="20" maxlength="100" >
              </td>
              <td width="15%"> 
                <div align="right">退货类型</div>
              </td>
              <td width="35%"> 
                <select name="thbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <option value="0">本店退货</option>
                  <option value="1">异店换货</option>
                  <option value="2">异店退货</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">退货日期 从</div>
              </td>
              <td width="35%"> 
                <input type="text" name="thrq" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">到</div>
              </td>
              <td width="35%">
                <input type="text" name="thrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">会员编号</td>
              <td width="35%">
                <input type="text" name="khbh" size="20" maxlength="50" >
              </td>
              <td width="15%" align="right">客户类型</td>
              <td width="35%">
                <select name="khlx" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value="1">会员</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">销售业务序号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ywxh" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">销售单位</div>
              </td>
              <td width="35%"> 
                <select name="xsdw" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">实销价</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sxj" size="20" maxlength="17" >
              </td>
              <td width="15%"> 
                <div align="right">操作员</div>
              </td>
              <td width="35%">
                <input type="text" name="czy" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">异店退货审核标志</div>
              </td>
              <td width="35%"> 
                <select name="shbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value="2">未审核</option>
                  <option value="0">未通过</option>
                  <option value="1">通过</option>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">审核人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="shr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">审核日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="shrq" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">是否结算</div>
              </td>
              <td width="35%"> 
                <select name="sfjs" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value="0">未结算</option>
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="查询" onClick="submit_onclick(selectform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
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
function submit_onclick(FormName)//参数FormName:Form的名称
{
	if(!(isFloat(FormName.thj, "退货金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.thrq, "退货日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.thrq2, "退货日期"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "实销价"))) {
		return false;
	}
	if(!(isDatetime(FormName.shrq, "审核日期"))) {
		return false;
	}
	if(!(isNumber(FormName.sfjs, "是否结算"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
