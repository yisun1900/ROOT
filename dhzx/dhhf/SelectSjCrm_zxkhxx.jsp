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
String dwbh=(String)session.getAttribute("dwbh");
String sjsbh=(String)session.getAttribute("sjsbh");
String ygbh=(String)session.getAttribute("ygbh");
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String kfgssq=(String)session.getAttribute("kfgssq");
String sjs=yhmc;
if (!zwbm.equals("04"))//家装设计师
{
	sjs="";
}
String khjl=yhmc;
if (!zwbm.equals("03"))
{
	khjl="";
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%" align="center"> 
      <div align="center">随机回访客户</td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_zxkhxxSjList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center">
              <td colspan="4"><input type="button"  value="查询" onClick="f_do(selectform)">
                  <input type="reset"  value="重输">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"> 
                客户所属分公司              </td>
              <td width="33%" bgcolor="#FFFFCC"> 
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
              <td width="17%" align="right"> 
                咨询店面              </td>
              <td width="33%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td width="17%" align="right"> 
                客户编号              </td>
              <td width="33%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >              </td>
              <td width="17%" align="right">客户经理</td>
              <td width="33%"><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                录入时间 从              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right"> 
                到              </td>
              <td width="33%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">客户姓名</font></b></td>
              <td width="33%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >              </td>
              <td width="17%" align="right"> 
                客户姓名              </td>
              <td width="33%"> 
                <input type="text" name="khxm2" size="10" maxlength="50" >
              （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">联系方式</font></b></td>
              <td width="33%"> 
                <input type="text" name="lxfs" size="20" maxlength="50" >              </td>
              <td width="17%" align="right">联系方式</td>
              <td width="33%"> 
                <input type="text" name="lxfs2" size="10" maxlength="50" >
              （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">房屋地址</font></b></td>
              <td width="33%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" >              </td>
              <td width="17%" align="right">房屋地址</td>
              <td width="33%"> 
                <input type="text" name="fwdz2" size="10" maxlength="100" >
              （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">业务员部门</td>
              <td bgcolor="#FFFFCC"><select name="ywybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
				//19：业务员；24：市场部组长；25：市场部经理；26：市场部总监
				if (zwbm.equals("19") || zwbm.equals("24") || zwbm.equals("25"))
				{
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh",dwbh);
				}
				else{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwflbm='07' and ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");//07：市场部
				}
		%>
              </select></td>
              <td align="right" bgcolor="#FFFFCC">业务员所属小组</td>
              <td bgcolor="#FFFFCC"><select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <%
				//19：业务员；24：市场部组长；25：市场部经理；26：市场部总监
				if (zwbm.equals("19"))
				{
					out.println("<option value=\"\"></option>");
				}
				else if (zwbm.equals("24"))
				{
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"' order by dwbh",sjsbh);
				}
				else if (zwbm.equals("25"))
				{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and ssdw='"+dwbh+"' and dwlx='F4' and cxbz='N' order by dwbh","");
				}
				else{
					out.println("<option value=\"\"></option>");
					cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx='F4' and cxbz='N' order by dwbh","");
				}
		%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">业务员</td>
              <td bgcolor="#FFFFCC"><select name="ywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <%
				//19：业务员；24：市场部组长；25：市场部经理；26：市场部总监
				if (zwbm.equals("19"))
				{
					out.println("<option value=\""+yhmc+"\">"+yhmc+"</option>");
				}
				else if (zwbm.equals("24"))
				{
					out.println("<option value=\"\"></option>");
					String ywysql="";
					ywysql =" select yhmc c1,yhmc c2";
					ywysql+=" from sq_yhxx ";
					ywysql+=" where dwbh='"+dwbh+"' and sjsbh='"+sjsbh+"'";
					ywysql+=" and sq_yhxx.zwbm in('19','24','25','26') and sq_yhxx.sfzszg in('Y','N') ";
					ywysql+=" ORDER BY yhmc";

					cf.selectItem(out,ywysql,"");
				}
				else if (zwbm.equals("25"))
				{
					out.println("<option value=\"\"></option>");
					String ywysql="";
					ywysql =" select yhmc c1,yhmc c2";
					ywysql+=" from sq_yhxx ";
					ywysql+=" where dwbh='"+dwbh+"'";
					ywysql+=" and sq_yhxx.zwbm in('19','24','25','26') and sq_yhxx.sfzszg in('Y','N') ";
					ywysql+=" ORDER BY yhmc";

					cf.selectItem(out,ywysql,"");
				}
				else{
					out.println("<option value=\"\"></option>");
					String ywysql="";
					ywysql =" select yhmc c1,yhmc c2";
					ywysql+=" from sq_yhxx ";
					ywysql+=" where ssfgs='"+ssfgs+"'";
					ywysql+=" and sq_yhxx.zwbm in('19','24','25','26') and sq_yhxx.sfzszg in('Y','N') ";
					ywysql+=" ORDER BY yhmc";

					cf.selectItem(out,ywysql,"");
				}
%>
              </select></td>
              <td align="right" bgcolor="#FFFFCC">业务员</td>
              <td bgcolor="#FFFFCC"><input type="text" name="ywy1" value="" size="20" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">是否有业务员</td>
              <td width="33%"><input type="radio" name="sfyywy" value="Y">
                有业务员
                <input type="radio" name="sfyywy" value="N">
                无</td>
              <td width="17%" align="right">设计师</td>
              <td width="33%"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 上次回访时间 从 </td>
              <td><input type="text" name="zxhfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td align="right"> 到 </td>
              <td><input type="text" name="zxhfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">小区类型</td>
              <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
              </select></td>
              <td align="right">客户资源性质</td>
              <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">是否签单</td>
              <td><input type="radio" name="sfqd" value="1">
                未签单
                <input type="radio" name="sfqd" value="2">
                签单
                <input type="radio" name="sfqd" value="3">
                失败 </td>
              <td align="right">是否需回访</td>
              <td><input type="radio" name="sfxhf" value="Y" >
需回访
  <input type="radio" name="sfxhf" value="N" >
不需回访</td>
            </tr>
            
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">应回访日期 从</td>
              <td width="33%" bgcolor="#E8E8FF"> 
                <input type="text" name="hfrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="hfrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            
            
            <tr bgcolor="#FFFFCC">
              <td align="right">签设计合同时间 从</td>
              <td><input type="text" name="qsjhtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right">到</td>
              <td><input type="text" name="qsjhtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">签设计合同标志</td>
              <td bgcolor="#FFFFCC"><input type="radio" name="qsjhtbz" value="N">
未签
  <input type="radio" name="qsjhtbz" value="Y">
签合同</td>
              <td align="right" bgcolor="#E8E8FF">交量房订金标志</td>
              <td bgcolor="#E8E8FF"><input type="radio" name="lfdjbz" value="N">
未交订金
  <input type="radio" name="lfdjbz" value="Y">
已交订金
<input type="radio" name="lfdjbz" value="T">
退订金</td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">交量房订金时间 从</td>
              <td><input type="text" name="jlfdjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#E8E8FF">到</td>
              <td><input type="text" name="jlfdjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right">交活动订金时间 从</td>
              <td><input type="text" name="jhddjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right">到</td>
              <td><input type="text" name="jhddjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">是否交活动订金</td>
              <td bgcolor="#FFFFCC"><input type="radio" name="hddjbz" value="N">
未交
  <input type="radio" name="hddjbz" value="Y">
已交
<input type="radio" name="hddjbz" value="T">
退订金 </td>
              <td align="right" bgcolor="#E8E8FF">设计费标志</td>
              <td bgcolor="#E8E8FF"><input type="radio" name="sjfbz" value="N">
未交
  <input type="radio" name="sjfbz" value="Y">
已交
<input type="radio" name="sjfbz" value="T">
退设计费 </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">交设计费时间 从</td>
              <td><input type="text" name="jsjfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td align="right" bgcolor="#E8E8FF">到</td>
              <td><input type="text" name="jsjfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"> 出平面图时间 从 </td>
              <td><input name="ctsj" type="text" id="ctsj" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
              <td align="right"> 到 </td>
              <td><input name="ctsj2" type="text" id="ctsj2" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFCC">出平面图标志</td>
              <td bgcolor="#FFFFCC"><input type="radio" name="ctbz" value="N">
未出图
  <input type="radio" name="ctbz" value="Y">
已出图</td>
              <td align="right" bgcolor="#E8E8FF">量房标志</td>
              <td bgcolor="#E8E8FF"><input type="radio" name="lfbz" value="N">
未量房
<input type="radio" name="lfbz" value="Y">
已量房 </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"> 量房时间 从 </td>
              <td><input name="lfsj" type="text" id="lfsj" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
              <td align="right"> 到 </td>
              <td><input name="lfsj2" type="text" id="lfsj2" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 最近上门时间 从 </td>
              <td><input name="zjsmsj" type="text" id="zjsmsj" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
              <td align="right"> 到 </td>
              <td><input name="zjsmsj2" type="text" id="zjsmsj2" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> 预约上门时间 从 </td>
              <td><input name="xclfsj" type="text" id="xclfsj" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
              <td align="right"> 到 </td>
              <td><input name="xclfsj2" type="text" id="xclfsj2" onDblClick="JSCalendar(this)" size="20" maxlength="10">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
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

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.qsjhtsj, "签设计合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.qsjhtsj2, "签设计合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfrq, "应回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfrq2, "应回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jlfdjsj, "交量房订金时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jlfdjsj2, "交量房订金时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhddjsj, "交活动订金时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhddjsj2, "交活动订金时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsjfsj, "交设计费时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsjfsj2, "交设计费时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ctsj, "出平面图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ctsj2, "出平面图时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lfsj, "量房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lfsj2, "量房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zjsmsj, "最近上门时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zjsmsj2, "最近上门时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xclfsj, "预约上门时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xclfsj2, "预约上门时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zxhfsj, "上次回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.zxhfsj2, "上次回访时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
