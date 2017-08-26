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
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_impjdpzCxList.jsp" name="selectform">
  <div align="center">凭证－导入查询</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">分公司</td>
      <td width="31%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      <td align="right" width="19%">签约店面</td>
      <td width="31%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
      <td width="19%" align="right">合同号</td>
      <td width="31%"> 
        <input type="text" name="hth" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">
      </td>
      <td width="19%" align="right">客户编号</td>
      <td width="31%"> 
        <input type="text" name="khbh" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right">客户姓名</div>
      </td>
      <td width="31%"> 
        <input type="text" name="khxm" size="20" maxlength="50" onKeyUp="keyGo(lxfs)">
      </td>
      <td width="19%"> 
        <div align="right">联系方式</div>
      </td>
      <td width="31%"> 
        <input type="text" name="lxfs" size="20" maxlength="50"  onKeyUp="keyGo(fwdz)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right">房屋地址</div>
      </td>
      <td colspan="3"> 
        <input type="text" name="fwdz" size="73" maxlength="100" onKeyUp="keyGo(butt)" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">序号</td>
      <td width="31%"> 
        <input type="text" name="xuhao" size="20" maxlength="8" >
      </td>
      <td align="right" width="19%">凭证日期</td>
      <td width="31%"> 
        <input type="text" name="fdate" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">业务日期</td>
      <td width="31%"> 
        <input type="text" name="ftransdate" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">会计期间</td>
      <td width="31%"> 
        <input type="text" name="fperiod" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">凭证字</td>
      <td width="31%"> 
        <input type="text" name="fgroup" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">凭证号</td>
      <td width="31%"> 
        <input type="text" name="fnum" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">分录号</td>
      <td width="31%"> 
        <input type="text" name="fentryid" size="20" maxlength="8" >
      </td>
      <td align="right" width="19%">凭证摘要</td>
      <td width="31%"> 
        <input type="text" name="fexp" size="20" maxlength="254" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">科目号</td>
      <td width="31%"> 
        <input type="text" name="facctid" size="20" maxlength="40" >
      </td>
      <td align="right" width="19%">项目所属类别1</td>
      <td width="31%"> 
        <input type="text" name="fclsname1" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目ID1</td>
      <td width="31%"> 
        <input type="text" name="fobjid1" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">项目名称1</td>
      <td width="31%"> 
        <input type="text" name="fobjname1" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目所属类别2</td>
      <td width="31%"> 
        <input type="text" name="fclsname2" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">项目ID2</td>
      <td width="31%"> 
        <input type="text" name="fobjid2" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目名称2</td>
      <td width="31%"> 
        <input type="text" name="fobjname2" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">项目所属类别3</td>
      <td width="31%"> 
        <input type="text" name="fclsname3" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目ID3</td>
      <td width="31%"> 
        <input type="text" name="fobjid3" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">项目名称3</td>
      <td width="31%"> 
        <input type="text" name="fobjname3" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目所属类别4</td>
      <td width="31%"> 
        <input type="text" name="fclsname4" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">项目ID4</td>
      <td width="31%"> 
        <input type="text" name="fobjid4" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目名称4</td>
      <td width="31%"> 
        <input type="text" name="fobjname4" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">项目所属类别5</td>
      <td width="31%"> 
        <input type="text" name="fclsname5" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目ID5</td>
      <td width="31%"> 
        <input type="text" name="fobjid5" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">项目名称5</td>
      <td width="31%"> 
        <input type="text" name="fobjname5" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目所属类别6</td>
      <td width="31%"> 
        <input type="text" name="fclsname6" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">项目ID6</td>
      <td width="31%"> 
        <input type="text" name="fobjid6" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目名称6</td>
      <td width="31%"> 
        <input type="text" name="fobjname6" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">项目所属类别7</td>
      <td width="31%"> 
        <input type="text" name="fclsname7" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目ID7</td>
      <td width="31%"> 
        <input type="text" name="fobjid7" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">项目名称7</td>
      <td width="31%"> 
        <input type="text" name="fobjname7" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目所属类别8</td>
      <td width="31%"> 
        <input type="text" name="fclsname8" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">项目ID8</td>
      <td width="31%"> 
        <input type="text" name="fobjid8" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">项目名称8</td>
      <td width="31%"> 
        <input type="text" name="fobjname8" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">业务编号</td>
      <td width="31%"> 
        <input type="text" name="ftransid" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">币种</td>
      <td width="31%"> 
        <input type="text" name="fcyid" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">汇率</td>
      <td width="31%"> 
        <input type="text" name="fexchrate" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">借贷标志</td>
      <td width="31%"> 
        <input type="text" name="fdc" size="20" maxlength="1" >
      </td>
      <td align="right" width="19%">原币金额</td>
      <td width="31%"> 
        <input type="text" name="ffcyamt" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">数量</td>
      <td width="31%"> 
        <input type="text" name="fqty" size="20" maxlength="17" >
      </td>
      <td align="right" width="19%">单价</td>
      <td width="31%"> 
        <input type="text" name="fprice" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">借方发生额</td>
      <td width="31%"> 
        <input type="text" name="fdebit" size="20" maxlength="17" >
      </td>
      <td align="right" width="19%">贷方发生额</td>
      <td width="31%"> 
        <input type="text" name="fcredit" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">结算方式名称</td>
      <td width="31%"> 
        <input type="text" name="fsettlcode" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">结算号</td>
      <td width="31%"> 
        <input type="text" name="fsettleno" size="20" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">制单人</td>
      <td width="31%"> 
        <input type="text" name="fprepare" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">未使用1</td>
      <td width="31%"> 
        <input type="text" name="fpay" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">未使用2</td>
      <td width="31%"> 
        <input type="text" name="fcash" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">过账人</td>
      <td width="31%"> 
        <input type="text" name="fposter" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">审核人</td>
      <td width="31%"> 
        <input type="text" name="fchecker" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">附件张数</td>
      <td width="31%"> 
        <input type="text" name="fattchment" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">过账标记</td>
      <td width="31%"> 
        <input type="text" name="fposted" size="20" maxlength="1" >
      </td>
      <td align="right" width="19%">机制凭证模块标识</td>
      <td width="31%"> 
        <input type="text" name="fmodule" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">删除标记</td>
      <td width="31%"> 
        <input type="text" name="fdeleted" size="20" maxlength="1" >
      </td>
      <td align="right" width="19%">凭证序号</td>
      <td width="31%"> 
        <input type="text" name="fserialno" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">单位</td>
      <td width="31%"> 
        <input type="text" name="funitname" size="20" maxlength="80" >
      </td>
      <td align="right" width="19%">参考信息</td>
      <td width="31%"> 
        <input type="text" name="freference" size="20" maxlength="80" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">是否已指定现金流量</td>
      <td width="31%"> 
        <input type="text" name="fcashflow" size="20" maxlength="8" >
      </td>
      <td align="right" width="19%">导入时间</td>
      <td width="31%"> 
        <input type="text" name="drsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">导入人</td>
      <td width="31%"> 
        <input type="text" name="drr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">备注</td>
      <td width="31%"> 
        <input type="text" name="bz" size="20" maxlength="200" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">删除标志</td>
      <td width="31%"> 
        <INPUT type="radio" name="scbz" value="N">
        未删除 
        <INPUT type="radio" name="scbz" value="Y">
        已删除 </td>
      <td align="right" width="19%">删除人</td>
      <td width="31%"> 
        <input type="text" name="scr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">删除时间</td>
      <td width="31%"> 
        <input type="text" name="scsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">&nbsp; </td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
      </td>
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
	if(!(isNumber(FormName.xuhao, "序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.fdate, "凭证日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.ftransdate, "业务日期"))) {
		return false;
	}
	if(!(isNumber(FormName.fperiod, "会计期间"))) {
		return false;
	}
	if(!(isNumber(FormName.fnum, "凭证号"))) {
		return false;
	}
	if(!(isNumber(FormName.fentryid, "分录号"))) {
		return false;
	}
	if(!(isFloat(FormName.fexchrate, "汇率"))) {
		return false;
	}
	if(!(isFloat(FormName.ffcyamt, "原币金额"))) {
		return false;
	}
	if(!(isFloat(FormName.fqty, "数量"))) {
		return false;
	}
	if(!(isFloat(FormName.fprice, "单价"))) {
		return false;
	}
	if(!(isFloat(FormName.fdebit, "借方发生额"))) {
		return false;
	}
	if(!(isFloat(FormName.fcredit, "贷方发生额"))) {
		return false;
	}
	if(!(isNumber(FormName.fattchment, "附件张数"))) {
		return false;
	}
	if(!(isNumber(FormName.fserialno, "凭证序号"))) {
		return false;
	}
	if(!(isNumber(FormName.fcashflow, "是否已指定现金流量"))) {
		return false;
	}
	if(!(isDatetime(FormName.drsj, "导入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.scsj, "删除时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
