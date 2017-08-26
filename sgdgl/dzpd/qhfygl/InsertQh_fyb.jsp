<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertQh_fyb.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">登记部门</div>
              </td>
              <td width="35%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%

	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");

%>                </select>
              </td>
              <td width="15%"> 
                <div align="right">登记日期</div>
              </td>
              <td width="35%">
                <input type="text" name="sbrq" size="20" value=<%=cf.today()%>
 maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">种类</div>
              </td>
              <td width="35%">
                <select name="zl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fyzldm,fyzlmc from qh_qhfyzlb order by fyzldm","");
%>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">费用媒体</div>
              </td>
              <td width="35%"> 
                <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","");
%>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">投放时间（小时）</div>
              </td>
              <td width="35%">
                <input type="text" name="tfsj" value="" size="20" maxlength="9" >
              </td>
              <td width="15%"> 
                <div align="right">是否计划内</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="sfjhn"  value="Y">
                是 
                <input type="radio" name="sfjhn"  value="N">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">实际费用</div>
              </td>
              <td width="35%">
                <input type="text" name="sjfy" value="" size="20" maxlength="9" >
              </td>
              <td width="15%"> 
                <div align="right">合同费用</div>
              </td>
              <td width="35%"> 
                <input type="text" name="htfy" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">合同是否审批</div>
              </td>
              <td width="35%">
                <input type="radio" name="htsfsp"  value="Y">
                是 
                <input type="radio" name="htsfsp"  value="N">
                否 </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">备注</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"></textarea>
                <div align="right"></div>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[申报部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sbrq)=="") {
		alert("请输入[申报日期]！");
		FormName.sbrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sbrq, "申报日期"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfjhn)) {
		alert("请选择[是否计划内]！");
		FormName.sfjhn[0].focus();
		return false;
	}
	if(!(isFloat(FormName.tfsj, "投放时间"))) {
		return false;
	}
	if(!(isFloat(FormName.htfy, "合同费用"))) {
		return false;
	}
	if(!(isFloat(FormName.sjfy, "实际费用"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
