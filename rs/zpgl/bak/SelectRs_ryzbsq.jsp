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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_ryzbsqList.jsp" name="selectform">
<div align="center">查询人员增补</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">申请编号</td> 
  <td width="35%"> 
    <input type="text" name="sqbh" size="20" maxlength="8" >
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
  <td align="right" width="15%">申报分公司</td> 
    <td width="35%"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
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
    </select></td>
    <td align="right" width="15%">申请部门</td> 
    <td width="35%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="15%">增补理由</td> 
  <td width="35%"> 
    <select name="zbly" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="setText(this)">
    <option value=""></option>
<%
	cf.selectToken(out,"1+缺员补充&2+扩大编制&3+储备人力&4+其他","");
%>
    </select>
  </td>
    <td align="right" width="15%">增补其他</td> 
  <td width="35%"> 
    <input type="text" name="zbqt" size="20" maxlength="20"  disabled="ture">
    选<span class="STYLE1">其他</span>可填写  </td>
</tr>
<tr bgcolor="#FFFFFF">

	  <td align="right" width="15%">增补员额</td> 
  <td width="35%"> 
    <input type="text" name="zbye" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">申请状态</td> 
  <td width="35%"> 
    <select name="jhzt" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value="1">录入完成</option>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">希望到岗时间 从 </td> 
  <td width="35%"> 
    <input type="text" name="xwdgsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
    <td align="right" width="15%">希望到岗时间 到 </td> 
  <td width="35%"> 
    <input type="text" name="xwdgsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">性别</td> 
  <td width="35%"> 
    <select name="xb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+不限制&1+男&2+女","");
%>
    </select>
  </td>
  <td align="right" width="15%">婚姻</td> 
  <td width="35%"> 
    <select name="hy" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+不限制&1+已婚&2+未婚","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">年龄</td> 
  <td width="35%"> 
    <input type="text" name="nl" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">学历</td> 
  <td width="35%"> 
    <select name="xl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+高中&1+大专&2+大学&3+硕士","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">专业</td> 
  <td width="35%"> 
    <input type="text" name="zy" size="20" maxlength="40" >
  </td>
  <td align="right" width="15%">外语</td> 
  <td width="35%"> 
    <input type="text" name="wy" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计算机能力</td> 
  <td width="35%"> 
    <input type="text" name="jsjjn" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">工作经验</td> 
  <td width="35%"> 
    <input type="text" name="gzjy" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">个性</td> 
  <td width="35%"> 
    <input type="text" name="gx" size="20" maxlength="60" >
  </td>
  <td align="right" width="15%">技能</td> 
  <td width="35%"> 
    <input type="text" name="jn" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">其他</td> 
  <td width="35%"> 
    <input type="text" name="qt" size="20" maxlength="200" >
  </td>
  <td>&nbsp;</td><td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>
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
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间 从 </td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
    <td align="right" width="15%">录入时间 到</td> 
  <td width="35%"> 
    <input type="text" name="lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function setText(obj)
{
	var valsel = obj.value;
	var textid = document.getElementById("zbqt");
	if(valsel != "4")
	 textid.disabled = true;
	else
	 textid.disabled = false;
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.zbye, "增补员额"))) {
		return false;
	}
	if(!(isDatetime(FormName.xwdgsj, "希望到岗时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
