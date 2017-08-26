<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");

%>


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

<form method="post" action="Crm_qyexgjlCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="19%"> 
    <div align="right">客户编号</div>  </td>
  <td width="35%"> 
    <input name="khbh" type="text" id="khbh" size="20" maxlength="20" >  </td>
  <td width="17%"> 
    <div align="right">客户姓名</div>  </td>
  <td width="35%"> 
    <input name="khxm" type="text" id="khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="19%"> 
    <div align="right">所属城区</div>  </td>
  <td width="35%"> 
    <select name="cqbm" id="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%>
    </select>  </td>
  <td width="17%"> 
    <div align="right">工程担当 </div>  </td>
  <td width="35%"><input name="zjxm" type="text" id="zjxm" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="19%"> 
    <div align="right">合同号</div>  </td>
  <td width="35%"> 
    <input name="hth" type="text" id="hth" size="20" maxlength="20" >  </td>
  <td width="17%"> 
    <div align="right">设计师</div>  </td>
  <td width="35%"> 
    <input name="sjs" type="text" id="sjs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="19%"> 
    <div align="right">应竣工日期</div>  </td>
  <td width="35%"> 
    <input name="jgrq" type="text" id="jgrq" size="20" maxlength="10" >  </td>
  <td width="17%"><div align="right">施工队</div></td>
  <td width="35%">
  
  <select name="sgd" id="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd order by sgdmc","");
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="19%"> 
    <div align="right">房屋地址</div>  </td>
  <td colspan="3"><input name="fwdz" type="text" id="fwdz" size="73" maxlength="100" > 
    <div align="right"></div>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="19%"> 
                <div align="right">分公司</div>              </td>
              <td width="35%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
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
              <td width="17%"> 
                <div align="right">签约店面</div>              </td>
              <td width="35%"> 
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
                </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="19%"> 
    <div align="right">修改前促销活动</div>  </td>
  <td width="35%">
  
  <select name="xgqcxhd" style="FONT-SIZE:12PX;WIDTH:152PX">
   
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select cxhdmc c1,cxhdmc||'(订金：'||dj||'￥)' c2 from jc_cxhd where jsbz='N'  order by fgsbh,cxhdbm","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select cxhdmc c1,cxhdmc||'(订金：'||dj||'￥)' c2 from jc_cxhd where jsbz='N' and fgsbh='"+ssfgs+"' order by cxhdbm","");
	}
%>
    </select></td>
  <td width="17%"><div align="right">修改后促销活动</div></td>
  <td width="35%">
  
  <select name="xghcxhd" style="FONT-SIZE:12PX;WIDTH:152PX">

<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select cxhdmc c1,cxhdmc||'(订金：'||dj||'￥)' c2 from jc_cxhd where jsbz='N'  order by fgsbh,cxhdbm","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select cxhdmc c1,cxhdmc||'(订金：'||dj||'￥)' c2 from jc_cxhd where jsbz='N' and fgsbh='"+ssfgs+"' order by cxhdbm","");
	}
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否删除</td>
  <td><input type="radio" name="scbz" value="N">否
      <input type="radio" name="scbz" value="Y">删除</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isDatetime(FormName.jgrq, "应竣工日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
