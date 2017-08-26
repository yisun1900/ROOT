<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>工程回访统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">工程回访统计表</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">分公司</td>
      <td width="58%" height="39"> 
        <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">签约店面</td>
      <td width="58%" height="39"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
    <tr> 
      <td align="right" width="42%" height="39">回访时间 从</td>
      <td width="58%" height="39"> 
        <input type="text" name="sjfw" size="20" maxlength="10"  value="<%=cf.firstDay()%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">到</td>
      <td width="58%" height="40"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.lastDay()%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="37">回访类型</td>
      <td width="58%" height="37"> 
        <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="37">显示风格</td>
      <td width="58%" height="37"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="186" colspan="2"> 
        <p> 
          <input type="button"  value="设计师综合统计" onClick="f_do(selectform,'sjs')">
          <input type="button"  value="回访满意度明细" onClick="f_do(selectform,'sjsmx')">
          <input type="button"  value="回访满意度统计" onClick="f_do(selectform,'sjstj')">
        </p>
        <p> 
          <input type="button"  value="质检员综合统计" onClick="f_do(selectform,'zj')">
          <input type="button"  value="回访满意度明细" onClick="f_do(selectform,'zjmx')">
          <input type="button"  value="回访满意度统计" onClick="f_do(selectform,'zjtj')">
        </p>
        <p> 
          <input type="button"  value="施工队综合统计" onClick="f_do(selectform,'sgd')">
          <input type="button"  value="回访满意度明细" onClick="f_do(selectform,'sgdmx')">
          <input type="button"  value="回访满意度统计" onClick="f_do(selectform,'sgdtj')">
        </p>
        <p> 
          <input type="button"  value="综合统计" onClick="f_do(selectform,'zh')">
          <input type="button"  value="回访明细（全部）" onClick="f_do(selectform,'mx')">
          <input type="button"  value="回访明细（问题）" onClick="f_do(selectform,'zhmx')">
        </p>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "时间范围 "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围 "))) {
		return false;
	}

/*	
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("请选择[回访类型 ]！");
		FormName.hflxbm.focus();
		return false;
	}
*/

	if (lx=='sjs')
	{
		FormName.action="SjsTjb.jsp";
	}
	else if (lx=='sjsmx')
	{
		FormName.action="SjsMx.jsp";
	}
	else if (lx=='sjstj')
	{
		FormName.action="SjsMxTj.jsp";
	}
	else if (lx=='zj')
	{
		FormName.action="ZjyTjb.jsp";
	}
	else if (lx=='zjmx')
	{
		FormName.action="ZjyMx.jsp";
	}
	else if (lx=='zjtj')
	{
		FormName.action="ZjyMxTj.jsp";
	}
	else if (lx=='sgd')
	{
		FormName.action="SgdTjb.jsp";
	}
	else if (lx=='sgdmx')
	{
		FormName.action="SgdMx.jsp";
	}
	else if (lx=='sgdtj')
	{
		FormName.action="SgdMxTj.jsp";
	}
	else if (lx=='zh')
	{
		FormName.action="ZhTjb.jsp";
	}
	else if (lx=='zhmx')
	{
		FormName.action="ZhTjbMx.jsp";
	}
	else if (lx=='mx')
	{
		FormName.action="Crm_hfjlDyList.jsp";
	}
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
