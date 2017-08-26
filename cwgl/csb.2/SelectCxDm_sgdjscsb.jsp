<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_sgdjscsbCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">分公司</td> 
  <td width="32%"> 
    <select name="dm_sgdjscsb_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    </select>  </td>
  <td align="right" width="18%">拨付次数</td> 
  <td width="32%"> 
    <select name="dm_sgdjscsb_bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">第一次</option>
    <option value="2">第二次</option>
    <option value="3">第三次</option>
    <option value="4">第四次</option>
    <option value="5">第五次</option>
    <option value="6">第六次</option>
    <option value="7">第七次</option>
    <option value="8">第八次</option>
    <option value="9">第九次</option>
    <option value="10">第十次</option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">拨付基数</td> 
  <td width="32%"> 
    <input type="radio" name="bfjs"  value="1">工程费
	<BR>
    <input type="radio" name="bfjs"  value="2">工程费＋其它费
	<BR>
    <input type="radio" name="bfjs"  value="3">实收款总额
	<BR>
    <input type="radio" name="bfjs"  value="4">一期款
	<BR>
    <input type="radio" name="bfjs"  value="5">二期款
	<BR>
    <input type="radio" name="bfjs"  value="6">三期款
	<BR>
    <input type="radio" name="bfjs"  value="7">工程基础报价
	<BR>
    <input type="radio" name="bfjs"  value="8">工程基础报价＋其它费基础报价
	<BR>
    <input type="radio" name="bfjs"  value="9">工程施工成本价
	<BR>
    <input type="radio" name="bfjs"  value="A">工程施工成本价＋其它费施工成本
	<BR>
    <input type="radio" name="bfjs"  value="B">工程成本价  
	<BR>
    <input type="radio" name="bfjs"  value="C">工程成本价＋其它费成本  </td>
  <td align="right" width="18%">拨付比例</td> 
  <td width="32%"> 
    <input type="text" name="dm_sgdjscsb_bfbl" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">水电路结算方式</td>
  <td>
	<input type="radio" name="sdljsfs"  value="1">统一比例结算
	<BR>
	<input type="radio" name="sdljsfs"  value="2">独立比例结算
	<BR>
	<input type="radio" name="sdljsfs"  value="3">手工录入结算金额
	<BR>
	<input type="radio" name="sdljsfs"  value="9">不结算
  </td>
  <td align="right">水电路拨付比例</td>
  <td><input type="text" name="dm_sgdjscsb_sdlbfbl" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣质保金</td> 
  <td width="32%">
	<input type="radio" name="sfkzbj"  value="Y">扣质保金比例不可改
	<BR>
	<input type="radio" name="sfkzbj"  value="M">扣质保金比例可改
	<BR>
	<input type="radio" name="sfkzbj"  value="N">不扣质保金
  </td>
  <td align="right" width="18%">扣质保金基数</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "dm_sgdjscsb_kzbjjs","1+结算基数&2+结算总额","");
%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣材料款</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "dm_sgdjscsb_sfkclk","Y+是&N+否","");
%>  </td>
  <td align="right" width="18%">是否扣工地用品</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "dm_sgdjscsb_sfkgdyp","Y+是&N+否","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否扣已付工费</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "dm_sgdjscsb_sfkyfgf","Y+是&N+否","");
%>  </td>
  <td align="right" width="18%">是否完工结算</td> 
  <td width="32%"><%
	cf.radioToken(out, "dm_sgdjscsb_sfwgjs","Y+是&N+否","");
%></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isNumber(FormName.dm_sgdjscsb_bfcs, "拨付次数"))) {
		return false;
	}
	if(!(isFloat(FormName.dm_sgdjscsb_bfbl, "拨付比例"))) {
		return false;
	}
	if(!(isFloat(FormName.dm_sgdjscsb_sdlbfbl, "水电路拨付比例"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
