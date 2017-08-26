<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>


<%
String kkbbz=(String)session.getAttribute("kkbbz");//可拷贝
String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
String khjl=yhmc;
if (!zwbm.equals("03"))
{
	khjl="";
}
String ysy=yhmc;
if (!zwbm.equals("20"))
{
	ysy="";
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF"  >

<form method="post" action="" name="selectform">
      <div align="center">咨询客户--查询</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="22%" align="right" bgcolor="#FFFFCC"> 
                所属分公司              </td>
              <td width="28%">
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
			  </select>              </td>
              <td width="22%" align="right"> 
                咨询店面              </td>
              <td width="28%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="sjsbhMark=0;sjsbh.length=1;">
		  <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
			}
			else if (kfgssq.equals("3"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%> 
              </select>              </td>
            </tr>
            

		  
	        <tr bgcolor="#FFFFFF">
	          <td align="right" bgcolor="#FFFFFF">设计师</td>
	          <td bgcolor="#FFFFFF"><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>></td>
	          <td align="right" bgcolor="#FFFFFF">业务员</td>
	          <td bgcolor="#FFFFFF"><input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" <% if (!ywy.equals("")) out.println("readonly");%>></td>
            </tr>
	
	<tr bgcolor="#FFFFFF">
	  <td align="right" bgcolor="#FFFFFF">客户经理</td>
	  <td bgcolor="#FFFFFF"><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
	  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
	  <td bgcolor="#FFFFFF">&nbsp;</td>
	  </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right" bgcolor="#FFFFFF">录入部门</td>
              <td width="28%" bgcolor="#FFFFFF"> 
                <select name="zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('zxdjbm')">
					<option value=""></option>
              </select>              </td>
              <td width="22%" align="right" bgcolor="#FFFFFF">信息录入人</td>
              <td width="28%" bgcolor="#FFFFFF"> 
              <input type="text" name="lrr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"> 毛信息录入时间 从 </td>
              <td bgcolor="#FFFFFF"><input type="text" name="mxxlrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#FFFFFF"> 到 </td>
              <td bgcolor="#FFFFFF"><input type="text" name="mxxlrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF">毛信息录入签单天数 从</td>
              <td bgcolor="#FFFFFF"><input name="mxxts" type="text" id="mxxts" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
              <td align="right" bgcolor="#FFFFFF">到</td>
              <td bgcolor="#FFFFFF"><input name="mxxts2" type="text" id="mxxts2" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="22%" align="right" bgcolor="#FFFFFF"> 
                咨询客户录入时间 从              </td>
              <td width="28%" bgcolor="#FFFFFF"> 
              <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="22%" align="right" bgcolor="#FFFFFF"> 
                到              </td>
              <td width="28%" bgcolor="#FFFFFF"> 
              <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF">咨询客户录入签单天数 从</td>
              <td bgcolor="#FFFFFF"><input name="zxts" type="text" id="zxts" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
              <td align="right" bgcolor="#FFFFFF">到</td>
              <td bgcolor="#FFFFFF"><input name="zxts2" type="text" id="zxts2" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFFF"> 签约日期 从 </td>
              <td bgcolor="#FFFFFF"><input type="text" name="qyrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#FFFFFF"> 到 </td>
              <td bgcolor="#FFFFFF"><input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" >显示风格</td>
              <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
                网页
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;每页显示数量
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)" >
                <input type="reset"  value="重输" name="reset">
                <input type="button"  value="客户统计" onClick="f_tj(selectform)" >              </td>
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
	//启用Ajax
	cf.ajax(out);
%>


function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}


	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}


function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.zxdm,ajaxRetStr);
}


function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.mxxlrsj, "毛信息录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.mxxlrsj2, "毛信息录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "咨询客户录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "咨询客户录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "签约日期"))) {
		return false;
	}

	if(!(isNumber(FormName.mxxts, "毛信息录入签单天数"))) {
		return false;
	}
	if(!(isNumber(FormName.mxxts2, "毛信息录入签单天数"))) {
		return false;
	}
	if(!(isNumber(FormName.zxts, "咨询客户录入签单天数"))) {
		return false;
	}
	if(!(isNumber(FormName.zxts2, "咨询客户录入签单天数"))) {
		return false;
	}

	FormName.action="Crm_zxkhxxCxList.jsp";
	FormName.submit();
	return true;
}


function f_tj(FormName,lx)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.mxxlrsj, "毛信息录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.mxxlrsj2, "毛信息录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "咨询客户录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "咨询客户录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "签约日期"))) {
		return false;
	}

	if(!(isNumber(FormName.mxxts, "毛信息录入签单天数"))) {
		return false;
	}
	if(!(isNumber(FormName.mxxts2, "毛信息录入签单天数"))) {
		return false;
	}
	if(!(isNumber(FormName.zxts, "咨询客户录入签单天数"))) {
		return false;
	}
	if(!(isNumber(FormName.zxts2, "咨询客户录入签单天数"))) {
		return false;
	}

	FormName.action="Crm_zxkhxxTjList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
