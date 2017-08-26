<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String kfgssq=(String)session.getAttribute("kfgssq");
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
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_zxhfjlDmList.jsp" name="selectform">
<div align="center">客户回访反馈信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="17%">客户所属分公司</td>
      <td width="33%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
          <%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
        </select>
      </td>
      <td align="right" width="19%">咨询店面</td>
      <td width="31%"> 
        <select name="crm_zxkhxx_zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">客户编号</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_khbh" size="20" maxlength="7" >
      </td>
      <td align="right" width="19%">客户姓名</td>
      <td width="31%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">房屋地址</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="19%">联系方式</td>
      <td width="31%"> 
        <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">设计师</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_sjs" value="" >
      </td>
      <td align="right" width="19%">业务员</td>
      <td width="31%"> 
        <input type="text" name="ywy" value="" size="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">回访记录号</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_hfjlh" size="20" maxlength="9" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">量房标志</td>
      <td width="33%"><%
	cf.radioToken(out, "crm_zxhfjl_lfbz","N+未量房&Y+已量房","");
%> </td>
      <td align="right" width="19%">量房时间</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_lfsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">出平面图标志</td>
      <td width="33%"><%
	cf.radioToken(out, "crm_zxhfjl_ctbz","N+未出图&Y+已出图","");
%> </td>
      <td align="right" width="19%">出平面图时间</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_ctsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">要求更换店面</td>
      <td width="33%"><%
	cf.radioToken(out, "crm_zxhfjl_yqghdm","N+不要求&Y+要求更换","");
%> </td>
      <td align="right" width="19%">要求更换设计师</td>
      <td width="31%"><%
	cf.radioToken(out, "crm_zxhfjl_yqghsjs","N+不要求&Y+要求更换","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">设计师专业水平</td>
      <td width="33%"> 
        <select name="crm_zxhfjl_sjszysp" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='3' order by hfjgbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">设计师服务</td>
      <td width="31%"> 
        <select name="crm_zxhfjl_sjsfw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='4' order by hfjgbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">其它人员服务</td>
      <td width="33%"> 
        <select name="crm_zxhfjl_qtryfw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='5' order by hfjgbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">工程报价</td>
      <td width="31%"> 
        <select name="crm_zxhfjl_gcbj" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='6' order by hfjgbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">公司总体印象</td>
      <td width="33%"> 
        <select name="crm_zxhfjl_gsztyx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='7' order by hfjgbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">希望改进方面</td>
      <td width="31%"> 
        <select name="crm_zxhfjl_xwgjfm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='8' order by hfjgbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">是否继续回访</td>
      <td width="33%"><%
	cf.radioToken(out, "crm_zxhfjl_sfjxhf","Y+继续回访&N+回访结束","");
%> </td>
      <td align="right" width="19%">下次回访日期</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_xchfrq" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">回访时间 从</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_hfsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_hfsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">回访人</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_hfr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">是否提醒责任人</td>
      <td width="33%"> 
        <INPUT type="radio" name="crm_zxhfjl_clfs" value="1" checked>
        反馈相关部门</td>
      <td align="right" width="19%">反馈部门</td>
      <td width="31%"> 
        <select name="crm_zxhfjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">查看人</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_ckr" size="20" maxlength="16" >
      </td>
      <td align="right" width="19%">查看时间</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_cksj" size="20" maxlength="10" >
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
<%
	//启用Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.crm_zxkhxx_zxdm.length=1;

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
	strToSelect(selectform.crm_zxkhxx_zxdm,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_zxhfjl_lfsj, "量房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_ctsj, "出平面图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_xchfrq, "下次回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_hfsj, "回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_hfsj2, "回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_cksj, "查看时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
