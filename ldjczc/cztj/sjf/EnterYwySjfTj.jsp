<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>月报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%


String dwbh=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面


String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");//08:家居顾问;10:项目专员;12:家居设计师;18:木门测量师


String nian=request.getParameter("nian");
String yue=request.getParameter("yue");

%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">业务员设计费统计</div>      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">分公司</td>
      <td width="58%" height="39">
		<select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
		</select>		</td>
    </tr>
    <tr>
      <td align="right" height="39">市场部</td>
      <td height="39"><select name="ywybm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeScb(selectform)">
        <option value=""></option>
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwflbm='07' and dwlx!='F4' and cxbz='N' order by dwbh","");
	%>
      </select></td>
    </tr>
    <tr>
      <td align="right" height="39">市场部小组</td>
      <td height="39"><select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <option value=""></option>
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+dwbh+"' and dwlx='F4' and cxbz='N' order by dwbh","");
%>
      </select></td>
    </tr>
    
    <tr> 
      <td align="right" width="42%" height="39">业务员</td>
      <td width="58%" height="39"> <%
	if (zwbm.equals("19"))//19:业务员
	{
		%> 
        <input type="text" name="ywy" maxlength="20" size="20" value="<%=yhmc%>" readonly>
        <%
	}
	else{
		%> 
        <input type="text" name="ywy" maxlength="20" size="20">
        <%
	}
 %> </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">统计时间 从</td>
      <td width="58%" height="39"> 
        <input type="text" name="sjfw" size="20" maxlength="10" value='<%=cf.firstDay(nian,yue)%>' onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">到</td>
      <td width="58%" height="40"> 
        <input type="text" name="sjfw2" size="20" maxlength="10" value='<%=cf.lastDay(nian,yue)%>' onDblClick="JSCalendar(this)">      </td>
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
      <td height="71" colspan="2"> 
        <input type="button"  value="开始统计" onClick="f_do(selectform)" name="jzcz">
        <input type="reset"  value="重输">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>

var fieldName="";

function changeFgs(FormName) 
{
	FormName.ywybm.length=1;
	FormName.ywyssxz.length=1;


	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="scb";

	var sql;
	sql="select sq_dwxx.dwbh,sq_dwxx.dwmc from sq_yhxx,sq_sqfgs,sq_dwxx where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_yhxx.dwbh=sq_dwxx.dwbh and sq_sqfgs.ssfgs='"+FormName.fgs.value+"' and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
	sql+=" UNION  ";
	sql+=" select sq_dwxx.dwbh,sq_dwxx.dwmc from sq_yhxx,sq_sqbm,sq_dwxx where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_yhxx.dwbh=sq_dwxx.dwbh and sq_sqbm.ssfgs='"+FormName.fgs.value+"' and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
	sql+=" ORDER BY dwbh ";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeScb(FormName) 
{
	FormName.ywyssxz.length=1;

	if (FormName.ywybm.value=="")
	{
		return;
	}

	fieldName="scbxz";

	var sql;
	sql="select dwbh,dwmc from sq_dwxx where ssdw='"+FormName.ywybm.value+"' and dwlx='F4' and cxbz='N' order by dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="scb")
	{
		strToSelect(selectform.ywybm,ajaxRetStr);
	}
	else if (fieldName=="scbxz")
	{
		strToSelect(selectform.ywyssxz,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgs)=="") {
		alert("请输入[分公司]！");
		FormName.fgs.focus();
		return false;
	}
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

	FormName.action="YwySjfTj.jsp";
	FormName.submit();
	FormName.jzcz.disabled=true;
	return true;
}


//-->
</SCRIPT>
