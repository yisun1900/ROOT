<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_zpjhWcList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘申请编号</td> 
  <td width="35%"> 
    <input type="text" name="zpsqbh" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">增补职务</td> 
  <td width="35%"> 
    <select name="zbzw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm","");
%>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘分公司</td> 
  <td width="35%"> 
    <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,sqbm,<%=dwstr%>)">
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
  <td align="right" width="15%">申请部门</td> 
  <td width="35%"> 
    <select name="sqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">增补员额</td> 
  <td width="35%"> 
    <input type="text" name="zprs" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">招聘费用</td> 
  <td width="35%"> 
    <input type="text" name="zpfy" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">增补理由</td> 
  <td width="35%"> 
    <select name="zbly" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+其他&1+缺员补充&2+扩大编制&3+储备人力","");
%>
    </select>
  </td>
  <td align="right" width="15%">增补其他</td> 
  <td width="35%"> 
    <input type="text" name="zbqt" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">希望到岗时间 从</td> 
  <td width="35%"><input type="text" name="xwdgsj" size="20" maxlength="10" ></td> 
  <td align="right" width="15%">希望到岗时间 到</td>    
  <td width="35%"> 
	<input type="text" name="xwdgsj2" size="20" maxlength="10" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">性别要求</td> 
  <td width="35%"> 
    <select name="xbyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+不限&1+男&2+女","");
%>
    </select>
  </td>
  <td align="right" width="15%">婚姻要求</td> 
  <td width="35%"> 
    <select name="hyyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+不限&1+已婚&2+未婚","");
%>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">年龄要求</td> 
  <td width="35%"> 
    <input type="text" name="nlyq" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">工作经验要求</td> 
  <td width="35%"> 
    <input type="text" name="gzjy" size="20" maxlength="50" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">学历要求</td> 
  <td width="35%"> 
    <select name="xl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+高中&1+大专&2+大学&3+硕士","");
%>
    </select>
  </td>
  <td align="right" width="15%">专业要求</td> 
  <td width="35%"> 
    <input type="text" name="zy" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">外语能力要求</td> 
  <td width="35%"> 
    <input type="text" name="wy" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">计算机能力要求</td> 
  <td width="35%"> 
    <input type="text" name="jsjnl" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">个性要求</td> 
  <td width="35%"> 
    <input type="text" name="gx" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">技能要求</td> 
  <td width="35%"> 
    <input type="text" name="jn" size="20" maxlength="50" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">其他要求</td> 
  <td width="35%"> 
    <input type="text" name="qt" size="20" maxlength="200" >
  </td>
  <td align="right" width="15%">招聘申请状态</td> 
  <td width="35%"> 
    <select name="sqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"04+开始招聘","");
%>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">补充人员工作内容</td> 
  <td width="35%"> 
	<input type="text" name="rygznr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间 从</td> 
  <td width="35%"> 
  	<input type="text" name="lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">录入时间 到</td> 
  <td width="35%"> 
	<input type="text" name="lrsj2" size="20" maxlength="10" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人分公司</td> 
  <td width="35%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
      </select>
  </td>
  <td align="right" width="15%">审批状态编码</td> 
  <td width="35%"> 
        <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm  order by ztbm","");
%>
    </select>
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.zprs, "增补员额"))) {
		return false;
	}
	if(!(isFloat(FormName.zpfy, "招聘费用"))) {
		return false;
	}
	if(!(isDatetime(FormName.xwdgsj, "希望到岗时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xwdgsj2, "希望到岗时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
