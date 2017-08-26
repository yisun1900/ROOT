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
.STYLE1 {color: #0000CC}
-->
</style>
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
String dwbh=(String)session.getAttribute("dwbh");

String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String dqbm=(String)session.getAttribute("dqbm");
String zwbm=(String)session.getAttribute("zwbm");
String ywyssxz=cf.fillNull(cf.executeQuery("select sjsbh from sq_yhxx where yhdlm='"+yhdlm+"'"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Crm_scbkhgzjlList.jsp" name="selectform">
<div align="center">客户回访－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">所属分公司</td>
    <td bgcolor="#FFFFCC"><select name="crm_scbkhxx_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		%>
      </select>    </td>
    <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
    <td bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3 STYLE1"><strong>客户姓名</strong></span></td>
    <td><input type="text" name="crm_scbkhxx_khxm" size="20" maxlength="50" ></td>
    <td align="right">客户姓名</td>
    <td><input type="text" name="crm_scbkhxx_khxm2" size="14" maxlength="50" >
      （模糊查询）</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3 STYLE1"><strong>联系方式</strong></span></td>
    <td><input type="text" name="crm_scbkhxx_lxfs" size="20" maxlength="50" ></td>
    <td align="right">联系方式</td>
    <td><input type="text" name="crm_scbkhxx_lxfs2" size="14" maxlength="50" >
      （模糊查询）</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3 STYLE1"><strong>房屋地址</strong></span></td>
    <td><input type="text" name="crm_scbkhxx_fwdz" size="20" maxlength="100" >    </td>
    <td align="right">房屋地址</td>
    <td><input type="text" name="crm_scbkhxx_fwdz2" size="14" maxlength="100" >
      （模糊查询）</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">状态</td>
    <td colspan="3"><INPUT type="radio" name="crm_scbkhxx_zt" value="1">
      跟踪
      <INPUT type="radio" name="crm_scbkhxx_zt" value="6">
      准备失败
      <INPUT type="radio" name="crm_scbkhxx_zt" value="2">
      失败
      <INPUT type="radio" name="crm_scbkhxx_zt" value="5">
      准备移交
      <INPUT type="radio" name="crm_scbkhxx_zt" value="3">
      移交
      <INPUT type="radio" name="crm_scbkhxx_zt" value="4">
      已接收
      <INPUT type="radio" name="crm_scbkhxx_zt" value="7">
      移交过期 </td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>业务员部门</strong></td>
    <td><select name="ywybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh",dwbh);
%>
    </select></td>
    <td align="right"><strong>业务员所属小组</strong></td>
    <td><select name="crm_scbkhxx_ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"' order by dwbh",ywyssxz);
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>市场部客户编号</strong></td>
    <td><input type="text" name="crm_scbkhxx_scbkhbh" size="20" maxlength="20" ></td>
    <td align="right"><strong>业务员</strong></td>
  <td>
  <select name="crm_scbkhxx_ywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
      <%
		out.println("<option value=\"\"></option>");
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.sjsbh='"+ywyssxz+"' ";

		sql+=" ORDER BY c1";

		cf.selectItem(out,sql,"");
%>
    </select>	
  </td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right">回访间隔 从 </td>
    <td><input name="hfjg" type="text"   value="" size="20" maxlength="10"></td>
    <td align="right">到</td>
    <td><input name="hfjg2" type="text" value="" size="20" maxlength="10"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">最近跟踪时间 从</td>
    <td><input type="text" name="crm_scbkhxx_zjgzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right">到</td>
    <td><input type="text" name="crm_scbkhxx_zjgzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">小区类型</td>
    <td><select name="crm_scbkhxx_xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
    </select></td>
    <td align="right">客户资源性质</td>
    <td><select name="crm_scbkhxx_khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxz","");
%>
    </select></td>
  </tr>
  
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF">回访信息</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">记录号</td>
  <td><input type="text" name="crm_scbkhgzjl_jlh" size="20" maxlength="10" ></td>
  <td align="right">客户意向</td>
  <td><select name="sckhyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option  value=""></option>
    <%
	cf.selectItem(out,"select sckhyxbm,sckhyxmc from dm_sckhyxbm order by sckhyxbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否需回访</td>
  <td><%
	cf.radioToken(out, "sfxhf","Y+需要&N+否","");
%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">下次回访时间</td>
  <td><input type="text" name="xchfsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="xchfsj2" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">预约客户到店时间</td>
  <td><input type="text" name="yyddsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="yyddsj2" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">录入人</td> 
  <td width="31%"> 
    <input type="text" name="crm_scbkhgzjl_lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"><select name="crm_scbkhgzjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">录入时间 从</td> 
  <td width="31%"><input type="text" name="crm_scbkhgzjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">到 </td>
  <td width="32%"><input type="text" name="crm_scbkhgzjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.yyddsj2, "预约到店时间"))) {
		return false;
	}
	if(!(isNumber(FormName.hfjg, "回访间隔 "))) {
		return false;
	}
	if(!(isNumber(FormName.hfjg2, "回访间隔 "))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_zjgzsj, "最近跟踪时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_zjgzsj2, "最近跟踪时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.xchfsj, "下次回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xchfsj2, "下次回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yyddsj, "预约到店时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yyddsj2, "预约到店时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj, "跟踪录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj2, "跟踪录入时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
